
Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub LoginForm_LoginError(ByVal sender As Object, ByVal e As System.EventArgs) Handles LoginForm.LoginError
        'Display the failure message in a client-side alert box
        ClientScript.RegisterStartupScript(Me.GetType(), "LoginError", _
                    String.Format("alert('{0}');", LoginForm.FailureText.Replace("'", "\'")), True)
    End Sub

    Protected Sub LoginButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            Dim myRecaptcha As Recaptcha.RecaptchaControl = LoginForm.FindControl("RECAPTCHA")
            Dim CustomValidator As CustomValidator = LoginForm.FindControl("CustomValidatorRECAPTCHA")
            myRecaptcha.Validate()
            If myRecaptcha.IsValid = True Then
                CustomValidator.IsValid = True
            Else
                CustomValidator.IsValid = False
            End If

        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub

    Protected Sub LoginForm_LoggingIn(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.LoginCancelEventArgs) Handles LoginForm.LoggingIn
        Try

            'Check to see if the current user exists
            If Membership.GetUser(LoginForm.UserName) IsNot Nothing Then
                'Check to see if the user is currently locked out
                If Membership.GetUser(LoginForm.UserName).IsLockedOut Then
                    'Get the last lockout  date from the user
                    Dim lastLockout As DateTime = Membership.GetUser(LoginForm.UserName).LastLockoutDate
                    'Calculate the time the user should be unlocked
                    Dim unlockDate As DateTime = lastLockout.AddMinutes(Membership.PasswordAttemptWindow)

                    'Check to see if it is time to unlock the user
                    If DateTime.Now > unlockDate Then
                        Membership.GetUser(LoginForm.UserName).UnlockUser()
                    Else
                        LabelStatus.Text = "Sorry, Your Account is disabled, try in 15 minutes!"
                    End If
                End If
            End If

        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub
End Class
