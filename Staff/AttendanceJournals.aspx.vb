Imports System.Collections.Generic

Partial Class Attendance_Checklist
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.IsInRole("Staff") Then
            Response.Redirect("~/Warning.aspx")
        End If
    End Sub
End Class
