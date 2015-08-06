
Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub FormViewGeneralTestsQuestions_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewGeneralTestsQuestions.ItemInserted
        If e.Exception Is Nothing Then
            If e.AffectedRows > 0 Then
                'Record Inserted Successfully.

                'GridViewSchools.DataBind()

                LabelStatus.Text = "Added Successfully!"
            Else

                LabelStatus.Text = "An error occurred during the insert operation."
                e.KeepInInsertMode = True
            End If
        Else

            LabelStatus.Text = e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInInsertMode = True
        End If
    End Sub

    Protected Sub ButtonUpdateAnswers_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAnswers.Click
        For Each GridViewRow As GridViewRow In GridViewAssessmentsQuestions.Rows

            Dim AssessmentsStudentsAnswerID As Integer = Convert.ToInt32(GridViewAssessmentsQuestions.DataKeys(GridViewRow.RowIndex).Value)
            Dim DropDownListAnswer As DropDownList = GridViewRow.FindControl("DropDownListAnswer")

            SqlDataSourceAssessmentsQuestions.UpdateParameters.Clear()

            SqlDataSourceAssessmentsQuestions.UpdateParameters.Add("AssessmentsStudentsAnswerID", AssessmentsStudentsAnswerID)
            SqlDataSourceAssessmentsQuestions.UpdateParameters.Add("StudentAnswer", DropDownListAnswer.SelectedValue)

            SqlDataSourceAssessmentsQuestions.Update()

        Next

        LabelStatus.Text = "Done!"

        GridViewAssessmentsQuestions.DataBind()

    End Sub
End Class
