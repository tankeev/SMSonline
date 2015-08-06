
Partial Class Assessment_Marks
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ListBoxCourses_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxCourses.DataBound

        If ListBoxCourses.Items.Count <> 0 Then
            ListBoxCourses.SelectedIndex = 0

            GridViewAssessments.DataBind()
            GridViewAssessmentsMarks.DataBind()

        End If
    End Sub

    Protected Sub ListBoxCourses_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxCourses.SelectedIndexChanged

        GridViewAssessments.DataBind()
        GridViewAssessmentsMarks.DataBind()

        LabelStatus.Text = ""

    End Sub

    Protected Sub ButtonUpdateAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAll.Click
        Try

            For Each MarkRow As GridViewRow In GridViewAssessmentsMarks.Rows

                Dim MarkID As Integer = Convert.ToInt32(GridViewAssessmentsMarks.DataKeys(MarkRow.RowIndex).Value)
                Dim MarkTextBox As TextBox = CType(MarkRow.FindControl("TextBoxInput"), TextBox)


                SqlDataSourceAssessmentsMarks.UpdateParameters.Clear()
                SqlDataSourceAssessmentsMarks.UpdateParameters.Add("AssessmentMarkID", MarkID)
                SqlDataSourceAssessmentsMarks.UpdateParameters.Add("AssessmentMark", MarkTextBox.Text)
                SqlDataSourceAssessmentsMarks.Update()

            Next
            LabelStatus.Text = "Updated Successfully!"
        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub

End Class

