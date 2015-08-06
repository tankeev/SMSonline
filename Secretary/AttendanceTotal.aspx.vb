Imports System.Collections.Generic

Partial Class Attendance_Checklist
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Secretary") Then
            Response.Redirect("~/Warning.aspx")
        End If

        If Not IsPostBack Then
            Dim dt As DateTime = Date.Today
            TextBoxFinishDate_CalendarExtender.SelectedDate = dt
            dt = dt.AddDays(-7)
            TextBoxStartDate_CalendarExtender.SelectedDate = dt
        End If

        If IsPostBack Then
            TextBoxStartDate_CalendarExtender.SelectedDate = DateTime.ParseExact(TextBoxStartDate.Text, TextBoxStartDate_CalendarExtender.Format, Nothing)
            TextBoxFinishDate_CalendarExtender.SelectedDate = DateTime.ParseExact(TextBoxFinishDate.Text, TextBoxFinishDate_CalendarExtender.Format, Nothing)
        End If

    End Sub

    Protected Sub ButtonShow_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonShow.Click
        GridViewAttendanceTotal.DataBind()
    End Sub

    Protected Sub GridViewAttendanceTotal_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewAttendanceTotal.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim GridViewAttendance As GridView = e.Row.FindControl("GridViewAttendance")

            GridViewAttendance.DataBind()

        End If
    End Sub
End Class
