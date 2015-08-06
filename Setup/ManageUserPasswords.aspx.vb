
Partial Class ManageUsers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonCheckStatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonCheckStatus.Click
        Try

            'Check to see if the current user exists
            If Membership.GetUser(Trim(TextBoxLockedUser.Text)) IsNot Nothing Then
                'Check to see if the user is currently locked out
                If Membership.GetUser(Trim(TextBoxLockedUser.Text)).IsLockedOut Then

                    'Get the last lockout  date from the user
                    Dim lastLockout As DateTime = Membership.GetUser(Trim(TextBoxLockedUser.Text)).LastLockoutDate

                    LabelStatusUser.Text = "User Is LOCKED OUT! Date: " & lastLockout.ToString

                    'Calculate the time the user should be unlocked
                    'Dim unlockDate As DateTime = lastLockout.AddMinutes(Membership.PasswordAttemptWindow)

                    'Check to see if it is time to unlock the user
                    'If DateTime.Now > unlockDate Then
                    '    Membership.GetUser(LoginForm.UserName).UnlockUser()
                    'End If
                    'ButtonUnlockUser.Visible = True
                Else
                    LabelStatusUser.Text = "User Is Not Locked Out!"

                End If
            End If

        Catch ex As Exception
            LabelStatusUser.Text = ex.Message
        End Try
    End Sub

    Protected Sub ButtonUnlockUser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUnlockUser.Click
        Try
            Dim mu As MembershipUser = Membership.GetUser(TextBoxLockedUser.Text)
            mu.UnlockUser()
            Membership.UpdateUser(mu)

            LabelStatusUser.Text = "Done Successfully!"

        Catch ex As Exception
            LabelStatusUser.Text = ex.Message
        End Try
    End Sub

    Protected Sub ButtonChangePassword_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonChangePassword.Click
        Try
            Dim newPassword As String
            Dim mu As MembershipUser = Membership.GetUser(Trim(TextBoxPasswordUser.Text), False)

            newPassword = mu.ResetPassword()
            mu.ChangePassword(newPassword, Trim(TextBoxPassword.Text))

            LabelStatusPassword.Text = "Done Successfully!"

        Catch ex As Exception
            LabelStatusPassword.Text = ex.Message
        End Try
    End Sub

    Protected Sub ButtonProfile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonProfile.Click
        Try

            Dim UserProfile As ProfileCommon = Profile.GetProfile(Membership.GetUser(TextBoxProfileUser.Text).ToString)
            UserProfile.SchoolCode = DropDownListSchoolCodes.SelectedValue
            UserProfile.Save()

            LabelStatusSchoolCode.Text = "Done Successfully!"

        Catch ex As Exception
            LabelStatusSchoolCode.Text = ex.Message
        End Try
    End Sub
End Class
