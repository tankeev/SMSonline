Partial Class Attendance_Checklist
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub CalendarAttendanceDate_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles CalendarAttendanceDate.PreRender
        If Not IsPostBack Then

            Dim myzone As TimeZone = TimeZone.CurrentTimeZone
            Dim localDateTime As DateTime = myzone.ToLocalTime(DateTime.Now)
            Dim uiversalDateTime As DateTime = myzone.ToUniversalTime(DateTime.Now)

            CalendarAttendanceDate.SelectedDate = uiversalDateTime.Date
        End If
    End Sub

    Protected Sub ButtonAddAttendance_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddAttendance.Click
        Try

            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            For Each CheckBoxListPeriodsItem As ListItem In CheckBoxListPeriods.Items

                If CheckBoxListPeriodsItem.Selected = True Then

                    For Each MarkRow As GridViewRow In GridViewStudents.Rows

                        Dim StudentID As Guid = GridViewStudents.DataKeys(MarkRow.RowIndex).Value
                        Dim DropDownListAttendanceTypes As DropDownList = DirectCast(MarkRow.FindControl("DropDownListAttendanceTypes"), DropDownList)

                        'YENI ATTENDANCE KAYITLARI EKLENIYOR.
                        SqlDataSourceAttendance.UpdateParameters.Clear()
                        SqlDataSourceAttendance.UpdateParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
                        SqlDataSourceAttendance.UpdateParameters.Add("Date", CalendarAttendanceDate.SelectedDate)
                        SqlDataSourceAttendance.UpdateParameters.Add("StudentID", StudentID.ToString)
                        SqlDataSourceAttendance.UpdateParameters.Add("AcademicTermID", DropDownListAcademicTermsMaster.SelectedValue)
                        SqlDataSourceAttendance.UpdateParameters.Add("Period", CheckBoxListPeriodsItem.Value)
                        SqlDataSourceAttendance.UpdateParameters.Add("AttendanceTypeID", DropDownListAttendanceTypes.SelectedValue)
                        SqlDataSourceAttendance.UpdateParameters.Add("SavedOn", DateTime.Today.ToString())
                        SqlDataSourceAttendance.UpdateParameters.Add("SavedAt", DateTime.Now.ToString())
                        SqlDataSourceAttendance.UpdateParameters.Add("SavedBy", Session("UserID").ToString)
                        SqlDataSourceAttendance.Update()

                    Next

                    SqlDataSourceClassRegister.UpdateParameters.Clear()
                    SqlDataSourceClassRegister.UpdateParameters.Add("AcademicTermID", DropDownListAcademicTermsMaster.SelectedValue.ToString)
                    SqlDataSourceClassRegister.UpdateParameters.Add("StaffID", DropDownListStaff.SelectedValue.ToString)
                    SqlDataSourceClassRegister.UpdateParameters.Add("ReportedBy", Session("UserID").ToString)
                    SqlDataSourceClassRegister.UpdateParameters.Add("SectionCatalogID", RadioButtonListSections.SelectedValue)
                    SqlDataSourceClassRegister.UpdateParameters.Add("Title", TextBoxTitle.Text)
                    SqlDataSourceClassRegister.UpdateParameters.Add("Notes", TextBoxNotes.Text)
                    SqlDataSourceClassRegister.UpdateParameters.Add("Date", CalendarAttendanceDate.SelectedDate)
                    SqlDataSourceClassRegister.UpdateParameters.Add("Period", CheckBoxListPeriodsItem.Value)
                    SqlDataSourceClassRegister.UpdateParameters.Add("Status", 1)
                    SqlDataSourceClassRegister.Update()

                End If

            Next

            LabelStatus.Text = "Added Successfully!"

        Catch ex As Exception
            LabelStatus.Text = "Sorry, The Following Error Occured: " & ex.ToString
        End Try
    End Sub

    Protected Sub CalendarAttendanceDate_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CalendarAttendanceDate.SelectionChanged
        LabelStatus.Text = ""
    End Sub

    'Protected Sub DropDownListSchoolCodes_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSchoolCodes.DataBound
    '    If DropDownListSchoolCodes.Items.Count <> 0 Then
    '        DropDownListStaff.DataBind()
    '    End If
    'End Sub

    Protected Sub RadioButtonListSections_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonListSections.SelectedIndexChanged, RadioButtonListRegulator.SelectedIndexChanged

        If RadioButtonListRegulator.SelectedValue = 1 Then

            GridViewStudents.DataSource = SqlDataSourceStudents

        ElseIf RadioButtonListRegulator.SelectedValue = 2 Then

            GridViewStudents.DataSource = SqlDataSourceStudentsEng

        ElseIf RadioButtonListRegulator.SelectedValue = 3 Then

            GridViewStudents.DataSource = SqlDataSourceStudentsTur

        End If

        GridViewStudents.DataBind()

    End Sub

    Protected Sub GridViewStudents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewStudents.DataBound
        If GridViewStudents.Rows.Count > 0 Then
            PanelEmpty.Visible = False
        Else
            PanelEmpty.Visible = True
        End If
    End Sub
End Class
