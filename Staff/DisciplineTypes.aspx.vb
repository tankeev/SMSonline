Partial Class Attendance_Checklist
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.IsInRole("Staff") Then
            Response.Redirect("~/Warning.aspx")
        End If
    End Sub

    Protected Sub CalendarAttendanceDate_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles CalendarDisciplineDate.PreRender
        If Not IsPostBack Then
            Dim myzone As TimeZone = TimeZone.CurrentTimeZone
            Dim localDateTime As DateTime = myzone.ToLocalTime(DateTime.Now)
            Dim uiversalDateTime As DateTime = myzone.ToUniversalTime(DateTime.Now)

            CalendarDisciplineDate.SelectedDate = uiversalDateTime.Date
        End If
    End Sub

    Protected Sub ButtonUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdate.Click
        Try
            For Each MarkRow As GridViewRow In GridViewDiscipline.Rows

                Dim DisciplineTypeID As Integer = Convert.ToInt32(GridViewDiscipline.DataKeys(MarkRow.RowIndex).Value)
                Dim DisciplineType As TextBox = CType(MarkRow.FindControl("TextBoxDisciplineType"), TextBox)
                Dim LocalName As TextBox = CType(MarkRow.FindControl("TextBoxLocalName"), TextBox)
                Dim DisciplinePoint As TextBox = CType(MarkRow.FindControl("TextBoxPoint"), TextBox)
                Dim PointType As CheckBox = CType(MarkRow.FindControl("CheckBoxBonus"), CheckBox)

                SqlDataSourceDisciplineTypes.UpdateParameters.Clear()
                SqlDataSourceDisciplineTypes.UpdateParameters.Add("DisciplineTypeID", DisciplineTypeID)
                SqlDataSourceDisciplineTypes.UpdateParameters.Add("DisciplineType", DisciplineType.Text)
                SqlDataSourceDisciplineTypes.UpdateParameters.Add("DisciplineTypeLocalName", LocalName.Text)
                SqlDataSourceDisciplineTypes.UpdateParameters.Add("DisciplinePoint", DisciplinePoint.Text)
                SqlDataSourceDisciplineTypes.UpdateParameters.Add("PointType", PointType.Checked)
                SqlDataSourceDisciplineTypes.Update()

            Next
            LabelStatusUpdate.Text = "Updated Successfully!"

            GridViewDiscipline.DataBind()

        Catch ex As Exception
            LabelStatusUpdate.Text = ex.Message
        End Try
    End Sub

    Protected Sub FormViewDiscipline_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewDiscipline.ItemInserted
        If e.Exception Is Nothing Then
            If e.AffectedRows > 0 Then

                LabelStatusInsert.Text = "Added Successfully!"
            Else

                LabelStatusInsert.Text = "An error occurred during the insert operation."
                e.KeepInInsertMode = True

                GridViewDiscipline.DataBind()
            End If
        Else

            LabelStatusInsert.Text = e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInInsertMode = True
        End If
    End Sub


End Class
