Imports System.Collections.Generic

Partial Class Attendance_Checklist
    Inherits System.Web.UI.Page

    Public Shared DaysList As New List(Of DateTime)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("StaffSD") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub CalendarAttendance_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles CalendarAttendance.DayRender

        If Not IsPostBack Then
            'Dim myzone As TimeZone = TimeZone.CurrentTimeZone
            'Dim localDateTime As DateTime = myzone.ToLocalTime(DateTime.Now)
            'Dim uiversalDateTime As DateTime = myzone.ToUniversalTime(DateTime.Now)

            'CalendarAttendance.SelectedDate = uiversalDateTime.Date

            'GridViewAttendanceJurnal.DataBind()
        End If

    End Sub

End Class
