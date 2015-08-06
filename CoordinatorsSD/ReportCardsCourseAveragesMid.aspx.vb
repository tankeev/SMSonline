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

    Protected Sub GridViewAcademicTerms_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewAcademicTerms.RowDataBound
        If GridViewAcademicTerms.Rows.Count > 0 Then
            GridViewAcademicTerms.SelectedIndex = 0
            RadioButtonImageLoad(GridViewAcademicTerms)
        End If
    End Sub

    Protected Sub GridViewAcademicTerms_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAcademicTerms.SelectedIndexChanged
        RadioButtonImageLoad(GridViewAcademicTerms)
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

    Protected Sub GridViewMidTermStudents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewMidTermStudents.DataBound

        Try

            Dim QuizSum As Integer = 0
            Dim HomeworkSum As Integer = 0
            Dim MidTermSum As Integer = 0
            Dim ReportSum As Integer = 0
            Dim PracticeSum As Integer = 0

            If GridViewMidTermStudents.Rows.Count > 0 Then

                For Each GridViewStudentsRow As GridViewRow In GridViewMidTermStudents.Rows

                    If GridViewStudentsRow.RowType = DataControlRowType.DataRow Then

                        Dim LabelQuiz As Label = GridViewStudentsRow.FindControl("LabelQuiz")
                        Dim LabelHomework As Label = GridViewStudentsRow.FindControl("LabelHomework")
                        Dim LabelMidTerm As Label = GridViewStudentsRow.FindControl("LabelMidTerm")

                        Dim TextBoxAverage As TextBox = GridViewStudentsRow.FindControl("TextBoxAverage")
                        Dim TextBoxPractice As TextBox = GridViewStudentsRow.FindControl("TextBoxPractice")

                        QuizSum += Convert.ToDecimal(LabelQuiz.Text)
                        HomeworkSum += Convert.ToDecimal(LabelHomework.Text)
                        MidTermSum += Convert.ToDecimal(LabelMidTerm.Text)

                        ReportSum += Convert.ToDecimal(TextBoxAverage.Text)
                        PracticeSum += Convert.ToDecimal(TextBoxPractice.Text)

                    End If

                Next

                Dim LabelQuizAverage As Label = GridViewMidTermStudents.FooterRow.FindControl("LabelQuizAverage")
                Dim LabelHomeworkAverage As Label = GridViewMidTermStudents.FooterRow.FindControl("LabelHomeworkAverage")
                Dim LabelMidTermAverage As Label = GridViewMidTermStudents.FooterRow.FindControl("LabelMidTermAverage")
                Dim LabelReportAverage As Label = GridViewMidTermStudents.FooterRow.FindControl("LabelReportAverage")
                Dim LabelPracticeAverage As Label = GridViewMidTermStudents.FooterRow.FindControl("LabelPracticeAverage")

                LabelQuizAverage.Text = Math.Round((QuizSum / GridViewMidTermStudents.Rows.Count), 2, MidpointRounding.AwayFromZero).ToString()
                LabelHomeworkAverage.Text = Math.Round((HomeworkSum / GridViewMidTermStudents.Rows.Count), 2, MidpointRounding.AwayFromZero).ToString()
                LabelMidTermAverage.Text = Math.Round((MidTermSum / GridViewMidTermStudents.Rows.Count), 2, MidpointRounding.AwayFromZero).ToString()
                LabelReportAverage.Text = Math.Round((ReportSum / GridViewMidTermStudents.Rows.Count), 2, MidpointRounding.AwayFromZero).ToString()
                LabelPracticeAverage.Text = Math.Round((PracticeSum / GridViewMidTermStudents.Rows.Count), 2, MidpointRounding.AwayFromZero).ToString()

            End If

        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured: " & ex.Message, "Error")
        End Try

    End Sub

    Protected Sub GridViewStudents_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewMidTermStudents.RowDataBound
        Try

            If e.Row.RowType = DataControlRowType.DataRow Then

                Dim GridViewMidTermStudentsRow As GridViewRow = e.Row

                Dim LabelQuiz As Label = GridViewMidTermStudentsRow.FindControl("LabelQuiz")
                Dim LabelHomework As Label = GridViewMidTermStudentsRow.FindControl("LabelHomework")
                Dim LabelMidTerm As Label = GridViewMidTermStudentsRow.FindControl("LabelMidTerm")
                Dim TextBoxAverage As TextBox = GridViewMidTermStudentsRow.FindControl("TextBoxAverage")
                Dim TextBoxPractice As TextBox = GridViewMidTermStudentsRow.FindControl("TextBoxPractice")

                'SectionCatalogID
                Dim conStringGroupUsers As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
                Dim dadGroupUsers As New SqlDataAdapter("SELECT SectionGroup FROM tbl_SectionCatalog WHERE  SectionCatalogID=" & RadioButtonListSections.SelectedValue, conStringGroupUsers)
                Dim dtblGroupUsers As New DataTable()
                dadGroupUsers.Fill(dtblGroupUsers)

                'Grade 1
                If dtblGroupUsers.Rows.Item(0).Item("SectionGroup") = 1 Then
                    TextBoxAverage.Text = Math.Round((Integer.Parse(LabelQuiz.Text) * 0.6 + Integer.Parse(LabelHomework.Text) * 0.4), 0, MidpointRounding.AwayFromZero)
                Else
                    TextBoxAverage.Text = Math.Round(((Integer.Parse(LabelQuiz.Text) * 0.25 + Integer.Parse(LabelHomework.Text) * 0.2 + Integer.Parse(LabelMidTerm.Text) * 0.25) / 70) * 100, 0, MidpointRounding.AwayFromZero)
                End If

                If TextBoxAverage.Text < 75 Then
                    GridViewMidTermStudentsRow.Cells(5).BackColor = Drawing.Color.Red
                Else
                    GridViewMidTermStudentsRow.Cells(5).BackColor = Drawing.Color.Green
                End If

                If TextBoxPractice.Text < 75 Then
                    GridViewMidTermStudentsRow.Cells(6).BackColor = Drawing.Color.Red
                Else
                    GridViewMidTermStudentsRow.Cells(6).BackColor = Drawing.Color.Green
                End If

                Dim FormViewIsReady As FormView = GridViewMidTermStudentsRow.FindControl("FormViewIsReady")
                FormViewIsReady.DataBind()
            End If

        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured: " & ex.Message, "Error")
        End Try
    End Sub

    Protected Sub ButtonMidTermSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonMidTermSave.Click
        Try

            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            If RadioButtonListMidTermLocker.SelectedValue = 1 Then

                For Each GridViewStudentsRow As GridViewRow In GridViewMidTermStudents.Rows

                    Dim LabelSID As Label = GridViewStudentsRow.FindControl("LabelSID")
                    Dim TextBoxPractice As TextBox = GridViewStudentsRow.FindControl("TextBoxPractice")
                    Dim TextBoxAverage As TextBox = GridViewStudentsRow.FindControl("TextBoxAverage")

                    SqlDataSourceReportMidTermAverages.InsertParameters.Clear()

                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("AcademicTermID", GridViewAcademicTerms.SelectedDataKey.Values("AcademicTermID"))
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("AcademicSemesterID", GridViewAcademicTerms.SelectedDataKey.Values("AcademicSemesterID"))
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("CourseSectionID", GridViewCourses.SelectedDataKey.Values("CourseSectionID"))
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("CourseCatalogID", GridViewCourses.SelectedDataKey.Values("CourseCatalogID"))
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("ReportTypeID", 1)
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("StudentID", LabelSID.Text)
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("CurrentSectionID", RadioButtonListSections.SelectedValue)
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("CourseGroupingID", GridViewCourses.SelectedDataKey.Values("CourseGroupingID"))
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("Average", TextBoxAverage.Text)
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("Practice", TextBoxPractice.Text)
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("AddedBy", Session("UserID").ToString)
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("AddedDate", Date.UtcNow)
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("ApprovedByTeacher", 1)

                    SqlDataSourceReportMidTermAverages.Insert()

                Next

                GridViewMidTermStudents.DataBind()

            ElseIf RadioButtonListMidTermLocker.SelectedValue = 2 Then

                For Each GridViewStudentsRow As GridViewRow In GridViewMidTermStudents.Rows

                    Dim LabelSID As Label = GridViewStudentsRow.FindControl("LabelSID")
                    Dim TextBoxAverage As TextBox = GridViewStudentsRow.FindControl("TextBoxAverage")

                    SqlDataSourceReportMidTermAverages.DeleteParameters.Clear()

                    SqlDataSourceReportMidTermAverages.DeleteParameters.Add("AcademicTermID", GridViewAcademicTerms.SelectedDataKey.Values("AcademicTermID"))
                    SqlDataSourceReportMidTermAverages.DeleteParameters.Add("CourseCatalogID", GridViewCourses.SelectedDataKey.Values("CourseCatalogID"))
                    SqlDataSourceReportMidTermAverages.DeleteParameters.Add("StudentID", LabelSID.Text)

                    SqlDataSourceReportMidTermAverages.Delete()

                Next
                GridViewMidTermStudents.DataBind()
            End If

            WebMessageBoxCourseAverages.Show("Records saved successfully!", "Success")

        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured: " & ex.Message, "Error")
        End Try
    End Sub


End Class
