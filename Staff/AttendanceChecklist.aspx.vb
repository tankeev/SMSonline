Partial Class Attendance_Checklist
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.IsInRole("Staff") Then
            Response.Redirect("~/Warning.aspx")
        End If
    End Sub

    Protected Sub RadioButtonImageLoad(ByVal sender As Object)
        Dim gv As GridView = DirectCast(sender, GridView)
        For Each gvr As GridViewRow In gv.Rows
            Dim ImageButtonRadio As ImageButton = gvr.FindControl("ImageButtonRadio")
            If gvr.RowIndex <> gv.SelectedIndex Then
                ImageButtonRadio.ImageUrl = "~/Staff/Images/radiobutton.png"
            Else
                ImageButtonRadio.ImageUrl = "~/Staff/Images/radiobuttonchecked.png"
            End If
        Next
    End Sub

    Protected Sub GridViewSections_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewSections.SelectedIndexChanged
        RadioButtonImageLoad(GridViewSections)
    End Sub

    Protected Sub CalendarAttendanceDate_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles CalendarAttendanceDate.PreRender
        If Not IsPostBack Then

            Dim myzone As TimeZone = TimeZone.CurrentTimeZone
            Dim localDateTime As DateTime = myzone.ToLocalTime(DateTime.Now)
            Dim uiversalDateTime As DateTime = myzone.ToUniversalTime(DateTime.Now)

            CalendarAttendanceDate.SelectedDate = uiversalDateTime.Date

        End If
    End Sub

    Protected Sub CalendarAttendanceDate_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CalendarAttendanceDate.SelectionChanged
        GridViewAttendanceLeaves.DataBind()
    End Sub

    Protected Sub GridViewAttendanceLeaves_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAttendanceLeaves.DataBound
        If GridViewAttendanceLeaves.Rows.Count > 0 Then
            PanelAttendanceLeaves.Visible = True
        Else
            PanelAttendanceLeaves.Visible = False
        End If
    End Sub

    Protected Sub GridViewStudents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewStudents.DataBound
        If GridViewStudents.Rows.Count > 0 Then
            ButtonAddAttendance.Visible = True
        Else
            ButtonAddAttendance.Visible = False
        End If
    End Sub

    Protected Sub GridViewAttendanceLeaves_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewAttendanceLeaves.RowDataBound

        Try
            Dim ATID As Label
            Dim LB As Label
            Dim CR As Label
            Dim DD As DropDownList
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

    Protected Sub ButtonAddAttendance_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddAttendance.Click
        Try

            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")
            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")

            If GridViewStudents.Rows.Count > 0 Then

                For Each CheckBoxListPeriodsItem As ListItem In CheckBoxListPeriods.Items

                    If CheckBoxListPeriodsItem.Selected = True Then

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
                        SqlDataSourceClassRegister.UpdateParameters.Add("StaffID", Session("UserID").ToString)
                        SqlDataSourceClassRegister.UpdateParameters.Add("ReportedBy", Session("UserID").ToString)
                        SqlDataSourceClassRegister.UpdateParameters.Add("SectionCatalogID", GridViewSections.SelectedDataKey.Values("SectionCatalogID"))
                        SqlDataSourceClassRegister.UpdateParameters.Add("Title", GridViewSections.SelectedDataKey.Values("CourseCategory"))
                        SqlDataSourceClassRegister.UpdateParameters.Add("Notes", TextBoxNotes.Text)
                        SqlDataSourceClassRegister.UpdateParameters.Add("Date", CalendarAttendanceDate.SelectedDate)
                        SqlDataSourceClassRegister.UpdateParameters.Add("Period", CheckBoxListPeriodsItem.Value)
                        SqlDataSourceClassRegister.UpdateParameters.Add("Status", 1)
                        SqlDataSourceClassRegister.Update()

                    End If

                Next

            End If

            WebMessageBoxAttendance.Show("Attendance Records saved successfully!", "Success")

        Catch ex As Exception

            WebMessageBoxAttendance.Show("Sorry, The Following Error Occured: " & ex.ToString, "Error")

        End Try
    End Sub
End Class
