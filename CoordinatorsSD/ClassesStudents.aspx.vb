
Partial Class UserList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("CoordinatorSD") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub RadioButtonListSections_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonListSections.DataBound
        If RadioButtonListSections.Items.Count <> 0 Then
            RadioButtonListSections.SelectedIndex = 0
            GridViewStudents.DataBind()
        End If
    End Sub

    Protected Sub GridViewStudents_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridViewStudents.RowUpdating
        e.NewValues("CurrentSectionID") = DirectCast(GridViewStudents.Rows(e.RowIndex).FindControl("DropDownListSections"), DropDownList).SelectedValue

    End Sub
End Class
