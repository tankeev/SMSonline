
Partial Class About
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

        If Session("UserID") Is Nothing Then
            Response.Redirect("Default.aspx")
        End If

    End Sub
    

End Class
