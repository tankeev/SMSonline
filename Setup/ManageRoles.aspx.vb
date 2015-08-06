
Partial Class ManageRoles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonNewRole_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonNewRole.Click

        Dim newRoleName As String = TextBoxNewRole.Text.Trim()

        If Not Roles.RoleExists(newRoleName) Then
            ' Create the role
            Roles.CreateRole(newRoleName)
        End If

        TextBoxNewRole.Text = String.Empty

        GridViewRoles.DataBind()
        CheckBoxListRoles.DataBind()
    End Sub

    Protected Sub GridViewRoles_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridViewRoles.RowDeleting
        ' Get the RoleNameLabel
        Dim RoleNameLabel As Label = TryCast(GridViewRoles.Rows(e.RowIndex).FindControl("RoleNameLabel"), Label)

        ' Delete the role
        Try

            Roles.DeleteRole(RoleNameLabel.Text, True)

        Catch ex As Exception

            LabelStatus.Text = ex.Message

        End Try

        GridViewRoles.DataBind()
        CheckBoxListRoles.DataBind()

    End Sub

    Protected Sub GridviewUsers_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridviewUsers.SelectedIndexChanged
        Try

            CheckBoxListRoles.DataBind()

            Dim dv As New System.Data.DataView
            Dim dt As New System.Data.DataTable

            dv = SqlDataSourceRolesEdit.Select(DataSourceSelectArguments.Empty)
            dt = dv.ToTable()

            For Each item As ListItem In CheckBoxListRoles.Items

                For Each dr As Data.DataRow In dt.Rows

                    If item.Value = dr.Item(1).ToString Then
                        item.Selected = True
                    End If

                Next
            Next

        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub

    Protected Sub UpdateRoles_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpdateRoles.Click
        Try
            For Each item As ListItem In CheckBoxListRoles.Items
                If item.Selected = True Then
                    SqlDataSourceRolesEdit.UpdateParameters.Clear()
                    SqlDataSourceRolesEdit.UpdateParameters.Add("UserID", GridviewUsers.SelectedValue.ToString)
                    SqlDataSourceRolesEdit.UpdateParameters.Add("RoleID", item.Value)
                    SqlDataSourceRolesEdit.Update()
                ElseIf item.Selected = False Then
                    SqlDataSourceRolesEdit.DeleteParameters.Clear()
                    SqlDataSourceRolesEdit.DeleteParameters.Add("UserID", GridviewUsers.SelectedValue.ToString)
                    SqlDataSourceRolesEdit.DeleteParameters.Add("RoleID", item.Value)
                    SqlDataSourceRolesEdit.Delete()
                End If
            Next
            LabelStatus.Text = "Roles Updated Successfully!"
        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub


End Class
