Imports System.Collections.ObjectModel

Partial Class Academic_Terms
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub DropDownListTimeZones_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListTimeZones.PreRender
        lblLocalTime.Text = Date.Now.ToString()
        Dim tzi As ReadOnlyCollection(Of TimeZoneInfo)
        tzi = TimeZoneInfo.GetSystemTimeZones()
        For Each timeZone As TimeZoneInfo In tzi
            DropDownListTimeZones.Items.Add(New ListItem(timeZone.DisplayName, timeZone.Id))
        Next timeZone
    End Sub

    Protected Sub DropDownListTimeZones_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListTimeZones.SelectedIndexChanged
        If DropDownListTimeZones.SelectedIndex > 0 Then
            Dim dt As Date = Date.Now
            lblTimeZone.Text = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(dt, TimeZoneInfo.Local.Id, DropDownListTimeZones.SelectedValue).ToString()
        End If
    End Sub


End Class
