
Partial Class UserList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub FormViewSchools_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewSchools.ItemInserted
        If e.Exception Is Nothing Then
            If e.AffectedRows = 1 Then
                'Record Inserted Successfully.

                'GridViewSchools.DataBind()

                LabelStatus.Text = "School Added Successfully!"
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


End Class
