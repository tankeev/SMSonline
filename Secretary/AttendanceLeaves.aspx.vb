Imports System.Collections.Generic

Partial Class Attendance_Checklist
    Inherits System.Web.UI.Page

    Public Shared DaysList As New List(Of DateTime)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Secretary") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub CalendarAttendance_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles CalendarAttendance.DayRender

        If e.Day.IsSelected = True Then
            DaysList.Add(e.Day.[Date])
        End If

        Session("SelectedDates") = DaysList

    End Sub

    Protected Sub CalendarAttendance_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CalendarAttendance.SelectionChanged

        LabelStatus.Text = ""

        If Session("SelectedDates") IsNot Nothing Then

            Dim newList As List(Of DateTime) = DirectCast(Session("SelectedDates"), List(Of DateTime))

            For Each dt As DateTime In newList

                CalendarAttendance.SelectedDates.Add(dt)

            Next

            DaysList.Clear()

        End If
    End Sub

    Protected Sub ButtonUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdate.Click

        Try

            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            If GridViewStudents.Rows.Count > 0 Then

                Dim StudentID As Guid
                Dim DDL As DropDownList
                Dim TBD As TextBox

                If Not CalendarAttendance.SelectedDates.Count = 0 Then

                    For Each dt As DateTime In CalendarAttendance.SelectedDates

                        Dim Counter As Integer = 0
                        Dim Period As Integer = 0

                        For Each MarkRow As GridViewRow In GridViewStudents.Rows

                            If MarkRow.RowType = DataControlRowType.DataRow Then



                                StudentID = GridViewStudents.DataKeys(MarkRow.RowIndex).Value

                                DDL = DirectCast(MarkRow.FindControl("DropDownListAttendanceTypes"), DropDownList)

                                TBD = DirectCast(MarkRow.FindControl("TextBoxDetails"), TextBox)

                                If Not DDL.SelectedValue = "" Then

                                    Counter += 1

                                    SqlDataSourceAttendanceLeaves.InsertParameters.Clear()

                                    SqlDataSourceAttendanceLeaves.InsertParameters.Add("AcademicTermID", DropDownListAcademicTermsMaster.SelectedValue)
                                    SqlDataSourceAttendanceLeaves.InsertParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
                                    SqlDataSourceAttendanceLeaves.InsertParameters.Add("StudentID", StudentID.ToString)
                                    SqlDataSourceAttendanceLeaves.InsertParameters.Add("Date", dt)
                                    SqlDataSourceAttendanceLeaves.InsertParameters.Add("SavedBy", Session("UserID").ToString)
                                    SqlDataSourceAttendanceLeaves.InsertParameters.Add("Details", TBD.Text)

                                    If CheckBoxListPeriods.Items(0).Selected Then
                                        SqlDataSourceAttendanceLeaves.InsertParameters.Add("Period1", DDL.SelectedValue)
                                        Period += 1
                                    Else
                                        SqlDataSourceAttendanceLeaves.InsertParameters.Add("Period1", "0")
                                    End If
                                    If CheckBoxListPeriods.Items(1).Selected Then
                                        SqlDataSourceAttendanceLeaves.InsertParameters.Add("Period2", DDL.SelectedValue)
                                        Period += 1
                                    Else
                                        SqlDataSourceAttendanceLeaves.InsertParameters.Add("Period2", "0")
                                    End If
                                    If CheckBoxListPeriods.Items(2).Selected Then
                                        SqlDataSourceAttendanceLeaves.InsertParameters.Add("Period3", DDL.SelectedValue)
                                        Period += 1
                                    Else
                                        SqlDataSourceAttendanceLeaves.InsertParameters.Add("Period3", "0")
                                    End If
                                    If CheckBoxListPeriods.Items(3).Selected Then
                                        SqlDataSourceAttendanceLeaves.InsertParameters.Add("Period4", DDL.SelectedValue)
                                        Period += 1
                                    Else
                                        SqlDataSourceAttendanceLeaves.InsertParameters.Add("Period4", "0")
                                    End If
                                    If CheckBoxListPeriods.Items(4).Selected Then
                                        SqlDataSourceAttendanceLeaves.InsertParameters.Add("Period5", DDL.SelectedValue)
                                        Period += 1
                                    Else
                                        SqlDataSourceAttendanceLeaves.InsertParameters.Add("Period5", "0")
                                    End If
                                    If CheckBoxListPeriods.Items(5).Selected Then
                                        SqlDataSourceAttendanceLeaves.InsertParameters.Add("Period6", DDL.SelectedValue)
                                        Period += 1
                                    Else
                                        SqlDataSourceAttendanceLeaves.InsertParameters.Add("Period6", "0")
                                    End If
                                    If CheckBoxListPeriods.Items(6).Selected Then
                                        SqlDataSourceAttendanceLeaves.InsertParameters.Add("Period7", DDL.SelectedValue)
                                        Period += 1
                                    Else
                                        SqlDataSourceAttendanceLeaves.InsertParameters.Add("Period7", "0")
                                    End If
                                    If CheckBoxListPeriods.Items(7).Selected Then
                                        SqlDataSourceAttendanceLeaves.InsertParameters.Add("Period8", DDL.SelectedValue)
                                        Period += 1
                                    Else
                                        SqlDataSourceAttendanceLeaves.InsertParameters.Add("Period8", "0")
                                    End If
                                    If CheckBoxListPeriods.Items(8).Selected Then
                                        SqlDataSourceAttendanceLeaves.InsertParameters.Add("Period9", DDL.SelectedValue)
                                        Period += 1
                                    Else
                                        SqlDataSourceAttendanceLeaves.InsertParameters.Add("Period9", "0")
                                    End If

                                    SqlDataSourceAttendanceLeaves.Insert()

                                End If

                            End If
                        Next

                        If Not Counter = 0 Then

                            If Not Period = 0 Then
                                LabelStatus.Text = "Added Successfully!"
                            Else
                                LabelStatus.Text = "There is No Period Selected on the List!"
                            End If

                        Else
                            LabelStatus.Text = "There is No Student Selected on the List!"
                        End If

                    Next

                Else
                    LabelStatus.Text = "Please Select Date(s) from the Calendar from  the Menu Left!"
                End If

            Else
                LabelStatus.Text = "Please Select Section from the Menu Left."
            End If



        Catch ex As Exception
            LabelStatus.Text = "Sorry, The Following Error Occured: " & ex.Message
        End Try

    End Sub

    Protected Sub ButtonClearDates_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonClearDates.Click

        CalendarAttendance.SelectedDates.Clear()
        Session("SelectedDates").clear()

    End Sub

    Protected Sub RadioButtonListSections_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonListSections.SelectedIndexChanged
        LabelStatus.Text = ""
    End Sub

End Class
