Imports System.Web.Configuration
Imports System.Data.SqlClient
Imports System.Data

Partial Class UserList
    Inherits System.Web.UI.Page

    Protected Sub CalendarAttendanceDate_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles CalendarAttendanceDate.PreRender
        If Not IsPostBack Then
            CalendarAttendanceDate.SelectedDate = DateAndTime.Today
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserID") Is Nothing Then
            Response.Redirect("Default.aspx")
        End If

        If Not User.IsInRole("Trainee") Then
            Response.Redirect("~/Warning.aspx")
        End If

        If Not IsPostBack Then
            DropDownListAcademicTerms.SelectedValue = Session("AcademicTermID")
        End If

    End Sub
End Class
