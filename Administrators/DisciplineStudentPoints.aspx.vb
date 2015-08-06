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
            If e.Row.RowType = DataControlRowType.DataRow Then
                Dim LabelBonus As Label = DirectCast(e.Row.FindControl("LabelBonus"), Label)
                Dim LabelDiscipline As Label = DirectCast(e.Row.FindControl("LabelDiscipline"), Label)
                Dim LabelPoint As Label = DirectCast(e.Row.FindControl("LabelTotal"), Label)

                If LabelBonus.Text = "" Then
                    LabelBonus.Text = 0
                End If

                If LabelDiscipline.Text = "" Then
                    LabelDiscipline.Text = 0
                End If

                LabelPoint.Text = 100 + Convert.ToInt32(LabelBonus.Text) - Convert.ToInt32(LabelDiscipline.Text)
            End If
        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub

End Class
