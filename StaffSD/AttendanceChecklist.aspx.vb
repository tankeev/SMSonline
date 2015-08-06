Partial Class Attendance_Checklist
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("StaffSD") Then
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

            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")
            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")

            If DropDownListStaff.SelectedValue = Nothing Or DropDownListCourses.SelectedValue = Nothing Or Trim(TextBoxNotes.Text) = "" Then

                WebMessageBoxAttendance.Show("Please Check Section Register Data!", "Error")

                TextBoxNotes.BorderColor = Drawing.Color.Aqua
                TextBoxNotes.BorderStyle = BorderStyle.Solid
                TextBoxNotes.BorderWidth = 3

                TextBoxNotes.Focus()

            Else

                If GridViewStudents.Rows.Count > 0 Then

                    Dim PeriodChecked As Boolean = False

                    For Each CheckBoxListPeriodsItem As ListItem In CheckBoxListPeriods.Items

                        If CheckBoxListPeriodsItem.Selected = True Then

                            PeriodChecked = True

                            For Each MarkRow As GridViewRow In GridViewStudents.Rows

                                Dim StudentID As Guid = GridViewStudents.DataKeys(MarkRow.RowIndex).Value
                                Dim DropDownListAttendanceTypes As DropDownList = DirectCast(MarkRow.FindControl("DropDownListAttendanceTypes"), DropDownList)
                                Dim TextBoxNotes As TextBox = DirectCast(MarkRow.FindControl("TextBoxNotes"), TextBox)

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
                                SqlDataSourceAttendance.UpdateParameters.Add("Notes", TextBoxNotes.Text)
                                SqlDataSourceAttendance.Update()

                            Next

                            SqlDataSourceClassRegister.UpdateParameters.Clear()
                            SqlDataSourceClassRegister.UpdateParameters.Add("AcademicTermID", DropDownListAcademicTermsMaster.SelectedValue)
                            SqlDataSourceClassRegister.UpdateParameters.Add("StaffID", DropDownListStaff.SelectedValue.ToString)
                            SqlDataSourceClassRegister.UpdateParameters.Add("ReportedBy", Session("UserID").ToString)
                            SqlDataSourceClassRegister.UpdateParameters.Add("SectionCatalogID", RadioButtonListSections.SelectedValue)
                            SqlDataSourceClassRegister.UpdateParameters.Add("Title", DropDownListCourses.SelectedValue)
                            SqlDataSourceClassRegister.UpdateParameters.Add("Notes", TextBoxNotes.Text)
                            SqlDataSourceClassRegister.UpdateParameters.Add("Date", CalendarAttendanceDate.SelectedDate)
                            SqlDataSourceClassRegister.UpdateParameters.Add("Period", CheckBoxListPeriodsItem.Value)
                            SqlDataSourceClassRegister.UpdateParameters.Add("Status", 1)
                            SqlDataSourceClassRegister.Update()

                        End If

                    Next

                    If PeriodChecked = False Then

                        WebMessageBoxAttendance.Show("Please Select Period(s) from the Menu!", "Error")

                        CheckBoxListPeriods.BorderColor = Drawing.Color.Aqua
                        CheckBoxListPeriods.BorderStyle = BorderStyle.Solid
                        CheckBoxListPeriods.BorderWidth = 3

                        CheckBoxListPeriods.Focus()

                    Else

                        WebMessageBoxAttendance.Show("Attendance Records saved successfully!", "Success")

                    End If

                Else

                    WebMessageBoxAttendance.Show("Please Select a Section from the Menu.", "Error")

                End If

            End If

        Catch ex As Exception

            WebMessageBoxAttendance.Show("Sorry, The Following Error Occured: " & ex.ToString, "Error")

        End Try
    End Sub

    Protected Sub CalendarAttendanceDate_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CalendarAttendanceDate.SelectionChanged
        LabelStatus.Text = ""
        GridViewAttendanceLeaves.DataBind()
    End Sub

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
            PanelAttendance.Visible = True
            PanelEmpty.Visible = False
        Else
            PanelEmpty.Visible = True
            PanelAttendance.Visible = False
        End If
    End Sub

    Protected Sub GridViewAttendanceLeaves_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewAttendanceLeaves.RowDataBound

        Try
            Dim ATID As Label
            Dim LB As Label
            Dim CR As Label
            Dim index As Integer = -1

            'ASAGIYA DOGRU TARAMA
            For Each Row As GridViewRow In GridViewAttendanceLeaves.Rows

                'SAGA DOGRU TARAMA
                For Cell As Integer = 0 To Row.Cells.Count - 1

                    'HER HUCREDEKI CONTROLLER ARANIYOR
                    For Each ctrl As Control In Row.Cells(Cell).Controls

                        For m As Integer = 1 To 9

                            LB = DirectCast(Row.FindControl("LabelP" & m), Label)

                            'ARADIGIMIZI BULDUYSAK ADRESI ALIYORUZ
                            If ctrl.ID = LB.ID Then
                                index = Cell

                                For Each GRow As GridViewRow In GridViewAttendanceTypes.Rows

                                    ATID = DirectCast(GRow.FindControl("LabelATID"), Label)
                                    CR = DirectCast(GRow.FindControl("LabelCR"), Label)

                                    If LB.Text = ATID.Text Then

                                        Row.Cells(index).BackColor = System.Drawing.ColorTranslator.FromHtml(CR.Text)

                                        Exit For

                                    ElseIf LB.Text = "0" Then

                                        'DD.Visible = True

                                    End If

                                Next

                                Exit For

                            End If
                        Next
                    Next
                Next
            Next

        Catch ex As Exception
            WebMessageBoxAttendance.Show("Sorry, The Following Error Occured: " & ex.ToString, "Error")
        End Try

    End Sub

End Class
