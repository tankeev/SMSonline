Imports System.Data.SqlClient

Partial Class NewUserAccount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserID") Is Nothing Then
            Response.Redirect("Default.aspx")
        End If

        If Not (User.IsInRole("SurveyAdmin") Or User.IsInRole("Surveyor")) Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

End Class
