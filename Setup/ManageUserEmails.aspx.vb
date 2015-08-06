
Partial Class ManageUsers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdate.Click

        Try

            For Each MarkRow As GridViewRow In GridViewUsers.Rows

                Dim TextBoxEmail As TextBox = MarkRow.FindControl("TextBoxEmail")
                Dim LabelUsername As Label = MarkRow.FindControl("LabelUsername")

                Dim RowUser As MembershipUser

                RowUser = Membership.GetUser(LabelUsername.Text)

                RowUser.Email = Trim(TextBoxEmail.Text)

                Membership.UpdateUser(RowUser)

            Next

            LabelStatus.Text = "Emails have been updated successfully!"

        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try

    End Sub

End Class
