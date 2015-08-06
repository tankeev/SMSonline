Imports System.Web.Configuration
Imports System.Data.SqlClient
Imports System.Data

Partial Class UserList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Secretary") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub GridViewStudents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewStudents.DataBound
        Dim ATID As Label
        'Dim LB As Label
        Dim CR As Label
        Dim DD As DropDownList
        Dim index As Integer = -1

        'ASAGIYA DOGRU TARAMA
        For Each Row As GridViewRow In GridViewStudents.Rows

            'SAGA DOGRU TARAMA
            For Cell As Integer = 0 To Row.Cells.Count - 1

                'HER HUCREDEKI CONTROLLER ARANIYOR
                For Each ctrl As Control In Row.Cells(Cell).Controls

                    For m As Integer = 1 To 9

                        'LB = DirectCast(Row.FindControl("LabelP" & m), Label)
                        DD = DirectCast(Row.FindControl("DDLP" & m), DropDownList)

                        'ARADIGIMIZI BULDUYSAK ADRESI ALIYORUZ
                        If ctrl.ID = DD.ID Then
                            index = Cell

                            For Each GRow As GridViewRow In GridViewAttendanceTypes.Rows

                                ATID = DirectCast(GRow.FindControl("LabelATID"), Label)
                                CR = DirectCast(GRow.FindControl("LabelCR"), Label)

                                If DD.SelectedValue = ATID.Text Then

                                    Row.Cells(index).BackColor = System.Drawing.ColorTranslator.FromHtml(CR.Text)

                                    Exit For

                                ElseIf DD.SelectedValue = "" Then

                                    'DD.Visible = True

                                End If

                            Next

                            Exit For

                        End If
                    Next
                Next
            Next
        Next
    End Sub

    Protected Sub CalendarAttendanceDate_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles CalendarAttendanceDate.PreRender
        If Not IsPostBack Then
            Dim myzone As TimeZone = TimeZone.CurrentTimeZone
            Dim localDateTime As DateTime = myzone.ToLocalTime(DateTime.Now)
            Dim uiversalDateTime As DateTime = myzone.ToUniversalTime(DateTime.Now)

            CalendarAttendanceDate.SelectedDate = uiversalDateTime.Date
        End If
    End Sub

    Protected Sub ButtonUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdate.Click
        Try

            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            For Each MarkRow As GridViewRow In GridViewStudents.Rows

                Dim StudentID As Label = MarkRow.FindControl("LabelStudentID")

                For m As Integer = 1 To 9

                    Dim DD As DropDownList = DirectCast(MarkRow.FindControl("DDLP" & m), DropDownList)

                    If Not DD.SelectedValue = "" Then

                        SqlDataSourceStudents.UpdateParameters.Clear()
                        SqlDataSourceStudents.UpdateParameters.Add("AttendanceTypeID", DD.SelectedValue)
                        SqlDataSourceStudents.UpdateParameters.Add("Date", CalendarAttendanceDate.SelectedDate)
                        SqlDataSourceStudents.UpdateParameters.Add("StudentID", StudentID.Text)
                        SqlDataSourceStudents.UpdateParameters.Add("Period", m)
                        SqlDataSourceStudents.UpdateParameters.Add("AcademicTermID", DropDownListAcademicTermsMaster.SelectedValue)
                        SqlDataSourceStudents.UpdateParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
                        SqlDataSourceStudents.UpdateParameters.Add("SavedOn", DateTime.Today.ToString())
                        SqlDataSourceStudents.UpdateParameters.Add("SavedAt", DateTime.Now.ToString())
                        SqlDataSourceStudents.UpdateParameters.Add("SavedBy", Session("UserID").ToString)
                        SqlDataSourceStudents.Update()

                    End If
                Next
            Next

            LabelStatus.Text = "Updated Successfully!"

        Catch ex As Exception
            LabelStatus.Text = "Sorry, The Following Error Occured: " & ex.ToString
        End Try
    End Sub

    Private Sub DropDownListChanged(ByVal DD As DropDownList)
        Try

            Dim DDGrid As DropDownList

            For Each Row As GridViewRow In GridViewStudents.Rows
                DDGrid = DirectCast(Row.FindControl(DD.ID), DropDownList)
                DDGrid.SelectedValue = DD.SelectedValue
            Next

        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub

    Protected Sub DropDownListP1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLP1.SelectedIndexChanged
        DropDownListChanged(DDLP1)
    End Sub
    Protected Sub DropDownListP2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLP2.SelectedIndexChanged
        DropDownListChanged(DDLP2)
    End Sub
    Protected Sub DropDownListP3_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLP3.SelectedIndexChanged
        DropDownListChanged(DDLP3)
    End Sub
    Protected Sub DropDownListP4_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLP4.SelectedIndexChanged
        DropDownListChanged(DDLP4)
    End Sub
    Protected Sub DropDownListP5_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLP5.SelectedIndexChanged
        DropDownListChanged(DDLP5)
    End Sub
    Protected Sub DropDownListP6_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLP6.SelectedIndexChanged
        DropDownListChanged(DDLP6)
    End Sub
    Protected Sub DropDownListP7_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLP7.SelectedIndexChanged
        DropDownListChanged(DDLP7)
    End Sub
    Protected Sub DropDownListP8_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLP8.SelectedIndexChanged
        DropDownListChanged(DDLP8)
    End Sub
    Protected Sub DropDownListP9_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLP9.SelectedIndexChanged
        DropDownListChanged(DDLP9)
    End Sub

    Protected Sub ButtonInsertAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonInsertAll.Click
        Try

            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            If Not RadioButtonListSections.SelectedValue = Nothing Then

                Dim conStringStudentList As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
                Dim dadStudentList As New SqlDataAdapter("SELECT StudentID FROM tbl_Students where SchoolCode=" & DropDownListSchoolCodesMaster.SelectedValue & " and CurrentSectionID=" & RadioButtonListSections.SelectedValue & " ", conStringStudentList)
                Dim dtblStudentList As New DataTable()
                dadStudentList.Fill(dtblStudentList)

                If Not dtblStudentList.Rows.Count = 0 Then

                    For Each Row As DataRow In dtblStudentList.Rows

                        Dim StudentID As Guid = Row.Item("StudentID")

                        For m As Integer = 1 To 9

                            SqlDataSourceStudents.InsertParameters.Clear()
                            SqlDataSourceStudents.InsertParameters.Add("AttendanceTypeID", DropDownListATAll.SelectedValue)
                            SqlDataSourceStudents.InsertParameters.Add("Date", CalendarAttendanceDate.SelectedDate)
                            SqlDataSourceStudents.InsertParameters.Add("StudentID", StudentID.ToString)
                            SqlDataSourceStudents.InsertParameters.Add("Period", m)
                            SqlDataSourceStudents.InsertParameters.Add("AcademicTermID", DropDownListAcademicTermsMaster.SelectedValue)
                            SqlDataSourceStudents.InsertParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
                            SqlDataSourceStudents.InsertParameters.Add("SavedOn", DateTime.Today.ToString())
                            SqlDataSourceStudents.InsertParameters.Add("SavedAt", DateTime.Now.ToString())
                            SqlDataSourceStudents.InsertParameters.Add("SavedBy", Session("UserID").ToString)
                            SqlDataSourceStudents.Insert()

                        Next

                    Next

                Else

                    LabelStatusInsertAll.Text = "Sorry, No Student Found."

                End If

                LabelStatus.Text = "Inserted Successfully!"

            Else

                LabelStatusInsertAll.Text = "Select A Section Please!"

            End If

        Catch ex As Exception
            LabelStatusInsertAll.Text = ex.Message
        End Try
    End Sub

    Protected Sub CalendarAttendanceDate_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CalendarAttendanceDate.SelectionChanged
        LabelStatusInsertAll.Text = ""
    End Sub

    Protected Sub ButtonInsertAllRecords_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonInsertAllRecords.Click
        If RadioButtonListSections.SelectedValue = Nothing Then
            WebMessageBoxAttendance.Show("Please Select a Section First!", "Warning")
        Else
            MPInsertAll.Show()
        End If
    End Sub

    Protected Sub ButtonShowRecords_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonShowRecords.Click

        If RadioButtonListSections.SelectedValue = Nothing Then
            WebMessageBoxAttendance.Show("Please Select a Section First!", "Warning")
        Else
            GridViewStudents.DataBind()
            PanelAttendance.Visible = True
            PanelStatus.Visible = False
        End If
    End Sub
End Class
