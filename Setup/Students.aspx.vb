
Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub FormViewStudents_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewStudents.ItemUpdated

        If e.Exception Is Nothing Then

            If e.AffectedRows > 0 Then
                'Record Inserted Successfully.
                LabelStatus.Text = "Updated Successfully!"
            Else
                LabelStatus.Text = "An error occurred during the insert operation."
            End If
        Else
            LabelStatus.Text = e.Exception.Message
            e.ExceptionHandled = True
        End If

    End Sub

    Protected Sub GridViewStudents_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewStudents.SelectedIndexChanged
        LabelStatus.Text = ""
    End Sub
End Class
