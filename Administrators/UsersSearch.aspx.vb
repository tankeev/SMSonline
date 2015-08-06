
Partial Class ManageUsers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdate.Click
        Try

            If Not GridviewUsers.Rows.Count = 0 Then

                For Each MarkRow As GridViewRow In GridviewUsers.Rows

                    Dim UserID As Guid = GridviewUsers.DataKeys(MarkRow.RowIndex).Value
                    Dim DropDownListSchoolCodes As DropDownList = CType(MarkRow.FindControl("DropDownListSchoolCodes"), DropDownList)

                    Dim CheckBoxA As CheckBox = CType(MarkRow.FindControl("CheckBoxA"), CheckBox)
                    Dim CheckBoxL As CheckBox = CType(MarkRow.FindControl("CheckBoxL"), CheckBox)

                    SqlDataSourceUserList.UpdateParameters.Clear()
                    SqlDataSourceUserList.UpdateParameters.Add("UserID", UserID.ToString)
                    SqlDataSourceUserList.UpdateParameters.Add("SchoolCode", DropDownListSchoolCodes.SelectedValue)

                    SqlDataSourceUserList.UpdateParameters.Add("IsApproved", CheckBoxA.Checked)
                    SqlDataSourceUserList.UpdateParameters.Add("IsLockedOut", CheckBoxL.Checked)

                    SqlDataSourceUserList.Update()

                    Dim MembershipUser As MembershipUser = Membership.GetUser(UserID)

                    Dim UserProfile As ProfileCommon = Profile.GetProfile(MembershipUser.UserName)

                    Dim Code As Integer = 0

                    If Not DropDownListSchoolCodes.SelectedValue = "" Then
                        Code = DropDownListSchoolCodes.SelectedValue
                    End If

                    UserProfile.SchoolCode = Code

                    UserProfile.Save()

                Next

                LabelStatus.Text = "Updated Successfully!"

            End If

            GridviewUsers.DataBind()

        Catch ex As Exception

            LabelStatus.Text = ex.Message

        End Try
    End Sub

    Protected Sub GridviewUsers_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridviewUsers.RowCommand

        If (e.CommandName = "DeleteUser") Then

            Dim index As Integer = Convert.ToInt32(e.CommandArgument)

            Dim row As GridViewRow = GridviewUsers.Rows(index)

            Dim LabelUserName As Label = row.FindControl("LabelUserName")

            If Not Membership.GetUser(LabelUserName.Text) Is Nothing Then

                Try

                    Membership.DeleteUser(LabelUserName.Text, True)

                    GridviewUsers.DataBind()

                    LabelStatus.Text = "User Deleted!"

                Catch ex As Exception

                    LabelStatus.Text = ex.Message

                End Try

            End If

        End If

    End Sub

End Class
