
Partial Class UserList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub GridViewStudents_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridViewClassesTeachers.RowUpdating
        e.NewValues("StaffID") = DirectCast(GridViewClassesTeachers.Rows(e.RowIndex).FindControl("DropDownListStaff"), DropDownList).SelectedValue
    End Sub

    Protected Sub GridViewUpdateEventHandler(ByVal sender As [Object], ByVal e As GridViewUpdatedEventArgs)
        If e.Exception IsNot Nothing Then
            'etc
            LabelTotal.Text = "Unable to update"

        Else
            LabelTotal.Text = "Data has been updated Successfully!"
        End If
    End Sub

End Class
