
Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Coordinator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ListBoxSections_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxTeachers.DataBound
        If ListBoxTeachers.Items.Count > 0 Then
            ListBoxTeachers.SelectedIndex = 0
        End If
    End Sub

    Protected Sub ButtonUpdateAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAllMarks.Click
        Try

            For Each MarkRow As GridViewRow In GridViewAssessmentsMarks.Rows

                Dim MarkID As Integer = Convert.ToInt32(GridViewAssessmentsMarks.DataKeys(MarkRow.RowIndex).Value)
                Dim MarkTextBox As TextBox = CType(MarkRow.FindControl("TextBoxInput"), TextBox)
                Dim CheckBoxExcused As CheckBox = CType(MarkRow.FindControl("CheckBoxExcused"), CheckBox)

                SqlDataSourceAssessmentsMarks.UpdateParameters.Clear()
                SqlDataSourceAssessmentsMarks.UpdateParameters.Add("AssessmentMarkID", MarkID)
                SqlDataSourceAssessmentsMarks.UpdateParameters.Add("AssessmentMark", MarkTextBox.Text)
                SqlDataSourceAssessmentsMarks.UpdateParameters.Add("Excused", CheckBoxExcused.Checked)
                SqlDataSourceAssessmentsMarks.Update()

            Next
            WebMessageBoxAssessments.Show("Updated Successfully!", "Success")
        Catch ex As Exception
            WebMessageBoxAssessments.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub

End Class
