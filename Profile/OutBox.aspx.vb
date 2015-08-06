
Partial Class About
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

        If Session("UserID") Is Nothing Then
            Response.Redirect("Default.aspx")
        End If

        If GridViewOutBox.Rows.Count < 1 Then
            FormViewOutBox.Visible = False
        Else
            FormViewOutBox.Visible = True
        End If

    End Sub
    

End Class
