Imports System.Configuration.Provider

Partial Class Account_ChangePassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserID") Is Nothing Then
            Response.Redirect("Default.aspx")
        End If
    End Sub

    Protected Sub TextBoxCurrentEmail_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TextBoxCurrentEmail.Load
        Dim user As MembershipUser = Membership.GetUser()

        TextBoxCurrentEmail.Text = user.Email
    End Sub

    Protected Sub ButtonUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdate.Click

        If IsValid Then

            Dim user As MembershipUser = Membership.GetUser()

            If user IsNot Nothing AndAlso TextBoxEMail.Text <> user.Email Then

                user.Email = TextBoxEMail.Text

                Try

                    Membership.UpdateUser(user)

                    LabelStatus.Text = "Your email address was successfully changed."

                    Response.Redirect("~/Profile/ChangeEMailSuccess.aspx")

                Catch generatedExceptionName As ProviderException

                    LabelStatus.Text = "A user with that email address already exists. Your address was not changed."

                End Try

            End If
        End If

    End Sub


End Class
