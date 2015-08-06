
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Parent") Then
            Response.Redirect("~/Warning.aspx")
        End If

        Dim UserID As String = Membership.GetUser().ProviderUserKey.ToString()

        Session("UserID") = UserID

    End Sub
End Class
