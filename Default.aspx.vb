Imports System.Web.Configuration

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Roles.IsUserInRole("Administrator") Then
            Response.Redirect("~/Administrators/Default.aspx")

        ElseIf Roles.IsUserInRole("Principal") Then
            Response.Redirect("~/Principals/Default.aspx")

        ElseIf Roles.IsUserInRole("Coordinator") Then
            Response.Redirect("~/Coordinators/Default.aspx")

        ElseIf Roles.IsUserInRole("CoordinatorSD") Then
            Response.Redirect("~/CoordinatorsSD/Default.aspx")

        ElseIf Roles.IsUserInRole("Secretary") Then
            Response.Redirect("~/Secretary/Default.aspx")

        ElseIf Roles.IsUserInRole("SecretarySD") Then
            Response.Redirect("~/SecretarySD/Default.aspx")

        ElseIf Roles.IsUserInRole("SecretarySMP") Then
            Response.Redirect("~/SecretarySMP/Default.aspx")

        ElseIf Roles.IsUserInRole("SecretarySMA") Then
            Response.Redirect("~/SecretarySMA/Default.aspx")

        ElseIf Roles.IsUserInRole("Staff") Then
            Response.Redirect("~/Staff/Default.aspx")

        ElseIf Roles.IsUserInRole("StaffSD") Then
            Response.Redirect("~/StaffSD/Default.aspx")

        ElseIf Roles.IsUserInRole("Parent") Then
            Response.Redirect("~/Parents/Default.aspx")

        ElseIf Roles.IsUserInRole("Student") Then
            Response.Redirect("~/Students/Default.aspx")

        ElseIf Roles.IsUserInRole("StudentSD") Then
            Response.Redirect("~/StudentsSD/Default.aspx")
        Else
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub
End Class
