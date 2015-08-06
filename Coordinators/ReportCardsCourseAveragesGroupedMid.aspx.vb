Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration

Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.IsInRole("Coordinator") Then
            Response.Redirect("~/Warning.aspx")
        End If
    End Sub

    Protected Sub RadioButtonImageLoad(ByVal sender As Object)
        Dim gv As GridView = DirectCast(sender, GridView)
        For Each gvr As GridViewRow In gv.Rows
            Dim ImageButtonRadio As ImageButton = gvr.FindControl("ImageButtonRadio")
            If gvr.RowIndex <> gv.SelectedIndex Then
                ImageButtonRadio.ImageUrl = "~/Coordinators/Images/radiobutton.png"
            Else
                ImageButtonRadio.ImageUrl = "~/Coordinators/Images/radiobuttonchecked.png"
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

    Protected Sub GridViewStudents_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewStudents.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim SqlDataSourceAssessmentsStudentsGrouped As SqlDataSource = e.Row.FindControl("SqlDataSourceAssessmentsStudentsGrouped")
            SqlDataSourceAssessmentsStudentsGrouped.SelectParameters.Item("CourseGroupingID").DefaultValue = GridViewCourses.SelectedDataKey.Values("CourseGroupingID")

            Dim GridViewStudentsGrouped As GridView = e.Row.FindControl("GridViewStudentsGrouped")
            GridViewStudentsGrouped.DataBind()

            Dim SqlDataSourceIsReadyforReport As SqlDataSource = e.Row.FindControl("SqlDataSourceIsReadyforReport")
            SqlDataSourceIsReadyforReport.SelectParameters.Item("CourseGroupingID").DefaultValue = GridViewCourses.SelectedDataKey.Values("CourseGroupingID")

            Dim FormViewIsReady As FormView = e.Row.FindControl("FormViewIsReady")
            FormViewIsReady.DataBind()

        End If
    End Sub

    Protected Sub RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        Try

            If e.Row.RowType = DataControlRowType.DataRow Then

                Dim GridViewStudentsRow As GridViewRow = e.Row

                Dim LabelQuiz As Label = GridViewStudentsRow.FindControl("LabelQuiz")
                Dim LabelHomework As Label = GridViewStudentsRow.FindControl("LabelHomework")

                Dim LabelExam As Label = GridViewStudentsRow.FindControl("LabelExam")
                Dim LabelEvaluation As Label = GridViewStudentsRow.FindControl("LabelEvaluation")

                Dim TextBoxAverage As TextBox = GridViewStudentsRow.FindControl("TextBoxAverage")
                Dim TextBoxKnowledge As TextBox = GridViewStudentsRow.FindControl("TextBoxKnowledge")
                Dim TextBoxPractice As TextBox = GridViewStudentsRow.FindControl("TextBoxPractice")

                TextBoxAverage.Text = Math.Round(Integer.Parse(LabelExam.Text) * 0.3 + Integer.Parse(LabelQuiz.Text) * 0.25 + Integer.Parse(LabelHomework.Text) * 0.2 + Integer.Parse(LabelEvaluation.Text) * 0.25, 0)

                If TextBoxAverage.Text < 75 Then
                    GridViewStudentsRow.Cells(6).BackColor = Drawing.Color.Red
                Else
                    GridViewStudentsRow.Cells(6).BackColor = Drawing.Color.Green
                End If
                If TextBoxPractice.Text < 75 Then
                    GridViewStudentsRow.Cells(7).BackColor = Drawing.Color.Red
                Else
                    GridViewStudentsRow.Cells(7).BackColor = Drawing.Color.Green
                End If

            End If

        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured:" & ex.Message, "Error")
        End Try
    End Sub

    Protected Sub DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        Try

            Dim GridViewStudents As GridView = DirectCast(sender, GridView)

            If GridViewStudents.Rows.Count > 0 Then

                Dim TextBoxAverageFooter As TextBox = GridViewStudents.FooterRow.FindControl("TextBoxAverageFooter")
                Dim TextBoxPracticeFooter As TextBox = GridViewStudents.FooterRow.FindControl("TextBoxPracticeFooter")
                Dim SumAverage As Integer = 0
                Dim SumPractice As Integer = 0
                For Each GridViewStudentsRow As GridViewRow In GridViewStudents.Rows

                    If GridViewStudentsRow.RowType = DataControlRowType.DataRow Then

                        Dim TextBoxAverage As TextBox = GridViewStudentsRow.FindControl("TextBoxAverage")
                        Dim TextBoxPractice As TextBox = GridViewStudentsRow.FindControl("TextBoxPractice")

                        SumAverage += Convert.ToInt32(TextBoxAverage.Text)
                        SumPractice += Convert.ToInt32(TextBoxPractice.Text)
                    End If

                Next

                TextBoxAverageFooter.Text = Math.Round((SumAverage / GridViewStudents.Rows.Count), 0).ToString()
                TextBoxPracticeFooter.Text = Math.Round((SumPractice / GridViewStudents.Rows.Count), 0).ToString()
            End If

        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured:" & ex.Message, "Error")
        End Try
    End Sub

    Protected Sub ButtonSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSave.Click
        Try

            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")

            If RadioButtonListLocker.SelectedValue = 1 Then

                For Each GridViewStudentsMainRow As GridViewRow In GridViewStudents.Rows

                    If GridViewStudentsMainRow.RowType = DataControlRowType.DataRow Then

                        Dim GridViewStudentsGrouped As GridView = GridViewStudentsMainRow.FindControl("GridViewStudentsGrouped")
                        Dim HiddenFieldStudentID As HiddenField = GridViewStudentsMainRow.FindControl("HiddenFieldStudentID")
                        Dim TextBoxAverage As TextBox = GridViewStudentsGrouped.FooterRow.FindControl("TextBoxAverageFooter")
                        Dim TextBoxPractice As TextBox = GridViewStudentsGrouped.FooterRow.FindControl("TextBoxPracticeFooter")

                        SqlDataSourceReportMidTermAverages.InsertParameters.Clear()

                        SqlDataSourceReportMidTermAverages.InsertParameters.Add("AcademicSemesterID", GridViewAcademicTerms.SelectedDataKey.Values("AcademicSemesterID"))
                        SqlDataSourceReportMidTermAverages.InsertParameters.Add("AcademicTermID", GridViewAcademicTerms.SelectedDataKey.Values("AcademicTermID"))
                        SqlDataSourceReportMidTermAverages.InsertParameters.Add("CourseSectionID", GridViewCourses.SelectedDataKey.Values("CourseSectionID"))
                        SqlDataSourceReportMidTermAverages.InsertParameters.Add("CourseGroupingID", GridViewCourses.SelectedDataKey.Values("CourseGroupingID"))
                        SqlDataSourceReportMidTermAverages.InsertParameters.Add("CurrentSectionID", DropDownListSections.SelectedValue)
                        SqlDataSourceReportMidTermAverages.InsertParameters.Add("StudentID", HiddenFieldStudentID.Value)
                        SqlDataSourceReportMidTermAverages.InsertParameters.Add("Average", TextBoxAverage.Text)
                        SqlDataSourceReportMidTermAverages.InsertParameters.Add("Practice", TextBoxPractice.Text)
                        SqlDataSourceReportMidTermAverages.InsertParameters.Add("AddedBy", Session("UserID").ToString)
                        SqlDataSourceReportMidTermAverages.InsertParameters.Add("AddedDate", Date.UtcNow)
                        SqlDataSourceReportMidTermAverages.InsertParameters.Add("ApprovedByTeacher", 1)

                        SqlDataSourceReportMidTermAverages.Insert()

                    End If

                Next

                GridViewStudents.DataBind()

            ElseIf RadioButtonListLocker.SelectedValue = 2 Then

                For Each GridViewStudentsMainRow As GridViewRow In GridViewStudents.Rows

                    If GridViewStudentsMainRow.RowType = DataControlRowType.DataRow Then

                        Dim HiddenFieldStudentID As HiddenField = GridViewStudentsMainRow.FindControl("HiddenFieldStudentID")

                        SqlDataSourceReportMidTermAverages.DeleteParameters.Clear()

                        SqlDataSourceReportMidTermAverages.DeleteParameters.Add("AcademicTermID", GridViewAcademicTerms.SelectedValue)
                        SqlDataSourceReportMidTermAverages.DeleteParameters.Add("CourseGroupingID", GridViewCourses.SelectedDataKey.Values("CourseGroupingID"))
                        SqlDataSourceReportMidTermAverages.DeleteParameters.Add("StudentID", HiddenFieldStudentID.Value)

                        SqlDataSourceReportMidTermAverages.Delete()

                    End If
                Next

                GridViewStudents.DataBind()

            End If


        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured:" & ex.Message, "Error")
        End Try
    End Sub

End Class
