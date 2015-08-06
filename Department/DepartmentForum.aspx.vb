Imports System.Data.SqlClient

Partial Class NewUserAccount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserID") Is Nothing Then
            Response.Redirect("Default.aspx")
        End If

        If Not (User.IsInRole("Department") Or User.IsInRole("Staff")) Then
            Response.Redirect("~/Warning.aspx")
        End If

        If Not IsPostBack Then
            DropDownListAcademicTerms.SelectedValue = Session("AcademicTermID")
        End If

    End Sub

    Protected Sub GridViewDashBoard_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewDashBoard.RowDataBound

        Dim row As GridViewRow = e.Row
        Dim strSort As String = String.Empty

        ' Make sure we aren't in header/footer rows
        If row.DataItem Is Nothing Then
            Return
        End If

        Dim GridViewReply As GridView = DirectCast(row.FindControl("GridViewReply"), GridView)

        Dim HiddenFieldToday As HiddenField = DirectCast(row.FindControl("HiddenFieldToday"), HiddenField)

        GridViewReply.DataBind()

        HiddenFieldToday.Value = Date.UtcNow

    End Sub
End Class
