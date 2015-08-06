
Partial Class Staff
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub GridViewSchools_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewSchools.RowDataBound
        Try


            Dim GridViewNumberofStaff As GridView = e.Row.FindControl("GridViewNumberofStaff")

            GridViewNumberofStaff.DataBind()

        Catch ex As Exception

        End Try
    End Sub
End Class
