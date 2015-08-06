
Partial Class UserList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub FormViewSchools_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewSchools.ItemUpdated

        ' Use the Exception property to determine whether an exception
        ' occurred during the update operation.

        If e.Exception Is Nothing Then

            If e.AffectedRows = 1 Then
                'Record Inserted Successfully.
                LabelStatus.Text = "Updated Successfully!"

                ListBoxSchools.DataBind()

            Else
                LabelStatus.Text = "An error occurred during the insert operation."
            End If
        Else
            LabelStatus.Text = e.Exception.Message
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub ListBoxSchools_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxSchools.DataBound
        If ListBoxSchools.Items.Count > 0 Then
            ListBoxSchools.SelectedIndex = 0
        End If

        FormViewSchools.DataBind()
    End Sub

    Protected Sub FormViewSchools_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormViewSchools.ItemUpdating
        e.NewValues("PrincipalID") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListUsers"), DropDownList).SelectedValue
    End Sub

    Protected Sub ListBoxSchools_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxSchools.SelectedIndexChanged
        LabelStatus.Text = ""
    End Sub
End Class
