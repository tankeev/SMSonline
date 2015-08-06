Partial Class Attendance_Checklist
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub CalendarAttendanceDate_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles CalendarDisciplineDate.PreRender
        If Not IsPostBack Then
            CalendarDisciplineDate.SelectedDate = DateAndTime.Today
        End If
    End Sub

    Protected Sub GridViewDiscipline_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewDiscipline.RowDataBound
        Try
            For Each row As GridViewRow In GridViewDiscipline.Rows
                Dim LabelPointType = DirectCast(row.FindControl("LabelPointType"), Label)
                Dim LabelPoint = DirectCast(row.FindControl("LabelPoint"), Label)
                Dim LabelSign = DirectCast(row.FindControl("LabelSign"), Label)
                If LabelPointType.Text = "False" Then
                    LabelSign.Text = "-"
                ElseIf LabelPointType.Text = "True" Then
                    LabelSign.Text = "+"
                Else
                End If
            Next
        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub
End Class
