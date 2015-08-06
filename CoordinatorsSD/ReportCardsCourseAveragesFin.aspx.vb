Imports System.Web.Configuration
Imports System.Data.SqlClient
Imports System.Data

Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.IsInRole("CoordinatorSD") Then
            Response.Redirect("~/Warning.aspx")
        End If
    End Sub

    Protected Sub RadioButtonImageLoad(ByVal sender As Object)
        Dim gv As GridView = DirectCast(sender, GridView)
        For Each gvr As GridViewRow In gv.Rows
            Dim ImageButtonRadio As ImageButton = gvr.FindControl("ImageButtonRadio")
            If gvr.RowIndex <> gv.SelectedIndex Then
                ImageButtonRadio.ImageUrl = "~/CoordinatorsSD/Images/radiobutton.png"
            Else
                ImageButtonRadio.ImageUrl = "~/CoordinatorsSD/Images/radiobuttonchecked.png"
            End If
        Next
    End Sub

    Protected Sub GridViewAcademicSemesters_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewAcademicSemesters.RowDataBound
        If GridViewAcademicSemesters.Rows.Count > 0 Then
            GridViewAcademicSemesters.SelectedIndex = 0
            RadioButtonImageLoad(GridViewAcademicSemesters)
        End If
    End Sub

    Protected Sub GridViewAcademicSemesters_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAcademicSemesters.SelectedIndexChanged
        RadioButtonImageLoad(GridViewAcademicSemesters)
    End Sub

    Protected Sub GridViewCourses_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewCourses.DataBound
        If GridViewCourses.Rows.Count > 0 Then
            GridViewCourses.SelectedIndex = 0
            RadioButtonImageLoad(GridViewCourses)
        Else
            GridViewCourses.SelectedIndex = -1
        End If
    End Sub

    Protected Sub GridViewCourses_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewCourses.SelectedIndexChanged
        RadioButtonImageLoad(GridViewCourses)
    End Sub

    Protected Sub GridViewFinalStudents_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewFinalStudents.RowDataBound
        Try

            If e.Row.RowType = DataControlRowType.DataRow Then

                Dim GridViewFinalStudentsRow As GridViewRow = e.Row

                Dim LabelQuiz As Label = GridViewFinalStudentsRow.FindControl("LabelQuiz")
                Dim LabelHomework As Label = GridViewFinalStudentsRow.FindControl("LabelHomework")
                Dim LabelMidTerm As Label = GridViewFinalStudentsRow.FindControl("LabelMidTerm")
                Dim LabelFinal As Label = GridViewFinalStudentsRow.FindControl("LabelFinal")
                Dim TextBoxAverage As TextBox = GridViewFinalStudentsRow.FindControl("TextBoxAverage")
                Dim TextBoxPractice As TextBox = GridViewFinalStudentsRow.FindControl("TextBoxPractice")

                'SectionCatalogID
                Dim conStringGroupUsers As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
                Dim dadGroupUsers As New SqlDataAdapter("SELECT SectionGroup FROM tbl_SectionCatalog WHERE  SectionCatalogID=" & RadioButtonListSections.SelectedValue, conStringGroupUsers)
                Dim dtblGroupUsers As New DataTable()
                dadGroupUsers.Fill(dtblGroupUsers)

                'Grade 1
                If dtblGroupUsers.Rows.Item(0).Item("SectionGroup") = 1 Then
                    TextBoxAverage.Text = Math.Round((Decimal.Parse(LabelQuiz.Text) * 0.6 + Decimal.Parse(LabelHomework.Text) * 0.4), 0, MidpointRounding.AwayFromZero)
                Else
                    TextBoxAverage.Text = Math.Round(Decimal.Parse(LabelQuiz.Text) * 0.25 + Decimal.Parse(LabelHomework.Text) * 0.2 + Decimal.Parse(LabelMidTerm.Text) * 0.25 + Decimal.Parse(LabelFinal.Text) * 0.3, 0, MidpointRounding.AwayFromZero)
                End If

                If TextBoxAverage.Text < 75 Then
                    GridViewFinalStudentsRow.Cells(6).BackColor = Drawing.Color.Red
                Else
                    GridViewFinalStudentsRow.Cells(6).BackColor = Drawing.Color.Green
                End If
                If TextBoxPractice.Text < 75 Then
                    GridViewFinalStudentsRow.Cells(7).BackColor = Drawing.Color.Red
                Else
                    GridViewFinalStudentsRow.Cells(7).BackColor = Drawing.Color.Green
                End If

                Dim FormViewIsReady As FormView = GridViewFinalStudentsRow.FindControl("FormViewIsReady")
                FormViewIsReady.DataBind()

            End If

        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured: 5" & ex.Message, "Error")
        End Try
    End Sub

    Protected Sub GridViewFinalStudents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewFinalStudents.DataBound

        Try

            If GridViewFinalStudents.Rows.Count > 0 Then

                Dim LabelAverageI As Label = GridViewFinalStudents.FooterRow.FindControl("LabelReport")
                Dim LabelAverageISum As Integer = 0

                Dim LabelAverageII As Label = GridViewFinalStudents.FooterRow.FindControl("LabelPractice")
                Dim LabelAverageIISum As Integer = 0

                For Each GridViewStudentsRow As GridViewRow In GridViewFinalStudents.Rows

                    If GridViewStudentsRow.RowType = DataControlRowType.DataRow Then

                        Dim TextBoxAverageI As TextBox = GridViewStudentsRow.FindControl("TextBoxAverage")
                        LabelAverageISum += Convert.ToInt32(TextBoxAverageI.Text)

                        Dim TextBoxAverageII As TextBox = GridViewStudentsRow.FindControl("TextBoxPractice")
                        LabelAverageIISum += Convert.ToInt32(TextBoxAverageII.Text)

                    End If

                Next

                LabelAverageI.Text = Math.Round((LabelAverageISum / GridViewFinalStudents.Rows.Count), 2, MidpointRounding.AwayFromZero).ToString
                LabelAverageII.Text = Math.Round((LabelAverageIISum / GridViewFinalStudents.Rows.Count), 2, MidpointRounding.AwayFromZero).ToString

            End If

        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured:" & ex.Message, "Error")
        End Try

    End Sub

    Protected Sub ButtonFinalSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonFinalSave.Click
        Try

            If RadioButtonListFinalLocker.SelectedValue = 1 Then

                Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

                For Each GridViewFinalStudentsRow As GridViewRow In GridViewFinalStudents.Rows

                    Dim LabelSID As Label = GridViewFinalStudentsRow.FindControl("LabelSID")
                    Dim TextBoxPractice As TextBox = GridViewFinalStudentsRow.FindControl("TextBoxPractice")
                    Dim TextBoxAverage As TextBox = GridViewFinalStudentsRow.FindControl("TextBoxAverage")

                    Dim DropDownListAttitude As DropDownList = GridViewFinalStudentsRow.FindControl("DropDownListAttitude")

                    SqlDataSourceReportFinalAverages.InsertParameters.Clear()
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("AcademicTermID", GridViewAcademicSemesters.SelectedDataKey.Values("AcademicTermID"))
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("AcademicSemesterID", GridViewAcademicSemesters.SelectedDataKey.Values("AcademicSemesterID"))
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("CourseCatalogID", GridViewCourses.SelectedDataKey.Values("CourseCatalogID"))
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("CourseSectionID", 0)
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("ReportTypeID", 2)
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("CurrentSectionID", RadioButtonListSections.SelectedValue)
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("CourseGroupingID", GridViewCourses.SelectedDataKey.Values("CourseGroupingID"))
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("StudentID", LabelSID.Text)
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("Average", TextBoxAverage.Text)
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("Practice", TextBoxPractice.Text)
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("AddedBy", Session("UserID").ToString)
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("AddedDate", Date.UtcNow)
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("ApprovedByTeacher", 1)

                    SqlDataSourceReportFinalAverages.Insert()

                    SqlDataSourceReportAttitude.InsertParameters.Clear()

                    SqlDataSourceReportAttitude.InsertParameters.Add("AcademicTermID", GridViewAcademicSemesters.SelectedDataKey.Values("AcademicTermID"))
                    SqlDataSourceReportAttitude.InsertParameters.Add("AcademicSemesterID", GridViewAcademicSemesters.SelectedDataKey.Values("AcademicSemesterID"))
                    SqlDataSourceReportAttitude.InsertParameters.Add("StudentID", LabelSID.Text)
                    SqlDataSourceReportAttitude.InsertParameters.Add("CourseSectionID", 0)
                    SqlDataSourceReportAttitude.InsertParameters.Add("ReportTypeID", 2)
                    SqlDataSourceReportAttitude.InsertParameters.Add("CurrentSectionID", GridViewCourses.SelectedDataKey.Values("SectionCatalogID"))
                    SqlDataSourceReportAttitude.InsertParameters.Add("CourseCatalogID", GridViewCourses.SelectedDataKey.Values("CourseCatalogID"))
                    SqlDataSourceReportAttitude.InsertParameters.Add("Attitude", DropDownListAttitude.SelectedValue)
                    SqlDataSourceReportAttitude.Insert()

                Next

                GridViewFinalStudents.DataBind()

            ElseIf RadioButtonListFinalLocker.SelectedValue = 2 Then

                For Each GridViewFinalStudentsRow As GridViewRow In GridViewFinalStudents.Rows

                    Dim LabelSID As Label = GridViewFinalStudentsRow.FindControl("LabelSID")
                    Dim TextBoxAverage As TextBox = GridViewFinalStudentsRow.FindControl("TextBoxAverage")

                    SqlDataSourceReportFinalAverages.DeleteParameters.Clear()

                    SqlDataSourceReportFinalAverages.DeleteParameters.Add("AcademicSemesterID", GridViewAcademicSemesters.SelectedDataKey.Values("AcademicSemesterID"))
                    SqlDataSourceReportFinalAverages.DeleteParameters.Add("CourseCatalogID", GridViewCourses.SelectedDataKey.Values("CourseCatalogID"))
                    SqlDataSourceReportFinalAverages.DeleteParameters.Add("ReportTypeID", 2)
                    SqlDataSourceReportFinalAverages.DeleteParameters.Add("StudentID", LabelSID.Text)

                    SqlDataSourceReportFinalAverages.Delete()

                Next
                GridViewFinalStudents.DataBind()
            End If

            WebMessageBoxCourseAverages.Show("Records saved successfully!", "Success")

        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured: 7" & ex.Message, "Error")
        End Try
    End Sub

    Protected Sub ImageButtonLocked_Clicked(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Try

            Dim ImageButtonUnlocked As ImageButton = DirectCast(sender, ImageButton)
            Dim FormViewIsReady As FormView = DirectCast(ImageButtonUnlocked.NamingContainer, FormView)
            Dim GridViewStudentsRow As GridViewRow = DirectCast(FormViewIsReady.NamingContainer, GridViewRow)

            Dim LabelSID As Label = GridViewStudentsRow.FindControl("LabelSID")
            Dim TextBoxAverage As TextBox = GridViewStudentsRow.FindControl("TextBoxAverage")

            SqlDataSourceReportFinalAverages.DeleteParameters.Clear()

            SqlDataSourceReportFinalAverages.DeleteParameters.Add("ReportTypeID", 2)
            SqlDataSourceReportFinalAverages.DeleteParameters.Add("CourseCatalogID", GridViewCourses.SelectedDataKey.Values("CourseCatalogID"))
            SqlDataSourceReportFinalAverages.DeleteParameters.Add("AcademicSemesterID", GridViewAcademicSemesters.SelectedDataKey.Values("AcademicSemesterID"))
            SqlDataSourceReportFinalAverages.DeleteParameters.Add("StudentID", LabelSID.Text)

            SqlDataSourceReportFinalAverages.Delete()

            GridViewFinalStudents.DataBind()

            WebMessageBoxCourseAverages.Show("Scores Have Been Unlocked Successfully!", "Success")

        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured:" & ex.Message, "Error")
        End Try

    End Sub

    Protected Sub ImageButtonUnlocked_Clicked(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Try

            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            Dim ImageButtonUnlocked As ImageButton = DirectCast(sender, ImageButton)
            Dim FormViewIsReady As FormView = DirectCast(ImageButtonUnlocked.NamingContainer, FormView)
            Dim GridViewStudentsRow As GridViewRow = DirectCast(FormViewIsReady.NamingContainer, GridViewRow)

            Dim LabelSID As Label = GridViewStudentsRow.FindControl("LabelSID")
            Dim TextBoxPractice As TextBox = GridViewStudentsRow.FindControl("TextBoxPractice")
            Dim TextBoxAverage As TextBox = GridViewStudentsRow.FindControl("TextBoxAverage")

            SqlDataSourceReportFinalAverages.InsertParameters.Clear()

            SqlDataSourceReportFinalAverages.InsertParameters.Add("AcademicTermID", GridViewAcademicSemesters.SelectedDataKey.Values("AcademicTermID"))
            SqlDataSourceReportFinalAverages.InsertParameters.Add("AcademicSemesterID", GridViewAcademicSemesters.SelectedDataKey.Values("AcademicSemesterID"))

            SqlDataSourceReportFinalAverages.InsertParameters.Add("CourseSectionID", 0)
            SqlDataSourceReportFinalAverages.InsertParameters.Add("CourseGroupingID", GridViewCourses.SelectedDataKey.Values("CourseGroupingID"))
            SqlDataSourceReportFinalAverages.InsertParameters.Add("CourseCatalogID", GridViewCourses.SelectedDataKey.Values("CourseCatalogID"))

            SqlDataSourceReportFinalAverages.InsertParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
            SqlDataSourceReportFinalAverages.InsertParameters.Add("CurrentSectionID", RadioButtonListSections.SelectedValue)

            SqlDataSourceReportFinalAverages.InsertParameters.Add("ReportTypeID", 2)
            SqlDataSourceReportFinalAverages.InsertParameters.Add("StudentID", LabelSID.Text)

            SqlDataSourceReportFinalAverages.InsertParameters.Add("Average", TextBoxAverage.Text)
            SqlDataSourceReportFinalAverages.InsertParameters.Add("Practice", TextBoxPractice.Text)

            SqlDataSourceReportFinalAverages.InsertParameters.Add("AddedBy", Session("UserID").ToString)
            SqlDataSourceReportFinalAverages.InsertParameters.Add("AddedDate", Date.UtcNow)
            SqlDataSourceReportFinalAverages.InsertParameters.Add("ApprovedByTeacher", 1)

            SqlDataSourceReportFinalAverages.Insert()

            GridViewFinalStudents.DataBind()

            WebMessageBoxCourseAverages.Show("Scores Have Been Locked Successfully!", "Success")

        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured:" & ex.Message, "Error")
        End Try

    End Sub
End Class
