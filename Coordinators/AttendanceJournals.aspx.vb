Imports System.Collections.Generic

Partial Class Attendance_Checklist
    Inherits System.Web.UI.Page

    Public Shared DaysList As New List(Of DateTime)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Coordinator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub CalendarAttendance_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles CalendarAttendance.DayRender

        If Not IsPostBack Then
            Dim myzone As TimeZone = TimeZone.CurrentTimeZone
            Dim localDateTime As DateTime = myzone.ToLocalTime(DateTime.Now)
            Dim uiversalDateTime As DateTime = myzone.ToUniversalTime(DateTime.Now)

            CalendarAttendance.SelectedDate = uiversalDateTime.Date

            GridViewAttendanceJurnal.DataBind()
        End If

    End Sub

    Protected Sub DataList_EditCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataListJurnal.ItemCommand

        Try

            Dim ID = DataListJurnal.DataKeys(e.Item.ItemIndex)

            If e.CommandName = "Edit" Then

                DataListJurnal.EditItemIndex = e.Item.ItemIndex

            ElseIf e.CommandName = "Cancel" Then

                DataListJurnal.EditItemIndex = -1

            ElseIf e.CommandName = "Delete" Then

                SqlDataSourceAttendanceJournalsDetails.DeleteParameters.Clear()
                SqlDataSourceAttendanceJournalsDetails.DeleteParameters.Add("RegisterID", ID)

                SqlDataSourceAttendanceJournalsDetails.Delete()

                LabelStatus.Text = "Deleted Successfully!"

            ElseIf e.CommandName = "Update" Then

                Dim DropDownListPeriods As DropDownList = CType(e.Item.FindControl("DropDownListPeriods"), DropDownList)
                Dim DateTextBox As TextBox = CType(e.Item.FindControl("DateTextBox"), TextBox)
                Dim TitleTextBox As TextBox = CType(e.Item.FindControl("TitleTextBox"), TextBox)
                Dim DropDownListTeachers As DropDownList = CType(e.Item.FindControl("DropDownListTeachers"), DropDownList)
                Dim NotesTextBox As TextBox = CType(e.Item.FindControl("NotesTextBox"), TextBox)

                SqlDataSourceAttendanceJournalsDetails.UpdateParameters.Clear()
                SqlDataSourceAttendanceJournalsDetails.UpdateParameters.Add("RegisterID", ID)
                SqlDataSourceAttendanceJournalsDetails.UpdateParameters.Add("StaffID", DropDownListTeachers.SelectedValue)
                SqlDataSourceAttendanceJournalsDetails.UpdateParameters.Add("Date", DateTextBox.Text)
                SqlDataSourceAttendanceJournalsDetails.UpdateParameters.Add("Period", DropDownListPeriods.SelectedValue)
                SqlDataSourceAttendanceJournalsDetails.UpdateParameters.Add("Title", TitleTextBox.Text)
                SqlDataSourceAttendanceJournalsDetails.UpdateParameters.Add("Notes", NotesTextBox.Text)

                SqlDataSourceAttendanceJournalsDetails.Update()
                DataListJurnal.EditItemIndex = -1

                LabelStatus.Text = "Updated Successfully!"

            End If

            DataListJurnal.DataBind()
            GridViewAttendanceJurnal.DataBind()


        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try


    End Sub

End Class
