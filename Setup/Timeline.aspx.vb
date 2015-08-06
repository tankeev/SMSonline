Imports System.Data.SqlClient
Imports System.Data

Partial Class CoursesAdd
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    
    Protected Sub GridViewDashBoard_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewDashBoard.RowDataBound
        Dim row As GridViewRow = e.Row
        Dim strSort As String = String.Empty

        ' Make sure we aren't in header/footer rows
        If row.DataItem Is Nothing Then
            Return
        End If

        Dim GridViewReply As GridView = DirectCast(row.FindControl("GridViewDashBoardComments"), GridView)

        GridViewReply.DataBind()


    End Sub
End Class
