Partial Class RoleManager

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub GridViewAnnouncements_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAnnouncements.SelectedIndexChanged

        Try

            Dim GridviewAnnouncementsRow As GridViewRow = DirectCast(GridViewAnnouncements.SelectedRow, GridViewRow)

            Dim CheckBoxListRoles As CheckBoxList = GridviewAnnouncementsRow.FindControl("CheckBoxListRoles")
            Dim CheckBoxListSchools As CheckBoxList = GridviewAnnouncementsRow.FindControl("CheckBoxListSchools")

            Dim SqlDataSourceAnnouncementsRoles As SqlDataSource = GridviewAnnouncementsRow.FindControl("SqlDataSourceAnnouncementsRoles")
            Dim SqlDataSourceAnnouncementsSchools As SqlDataSource = GridviewAnnouncementsRow.FindControl("SqlDataSourceAnnouncementsSchools")

            Dim HiddenFieldAnnouncementID As HiddenField = GridviewAnnouncementsRow.FindControl("HiddenFieldAnnouncementID")

            CheckBoxListRoles.DataBind()

            Dim dv As New System.Data.DataView
            Dim dt As New System.Data.DataTable

            dv = SqlDataSourceAnnouncementsRoles.Select(DataSourceSelectArguments.Empty)
            dt = dv.ToTable()

            For Each item As ListItem In CheckBoxListRoles.Items
                For Each dr As Data.DataRow In dt.Rows
                    If item.Value = dr.Item(0).ToString Then
                        item.Selected = True
                    End If
                Next
            Next

            CheckBoxListSchools.DataBind()

            Dim dvs As New System.Data.DataView
            Dim dts As New System.Data.DataTable

            dvs = SqlDataSourceAnnouncementsSchools.Select(DataSourceSelectArguments.Empty)
            dts = dvs.ToTable()

            For Each item As ListItem In CheckBoxListSchools.Items
                For Each drs As Data.DataRow In dts.Rows
                    If item.Value = drs.Item(0).ToString Then
                        item.Selected = True
                    End If
                Next
            Next

        Catch ex As Exception
            LabelStatusAnnouncement.Text = ex.Message
        End Try

    End Sub

    Protected Sub ButtonUpdateRoles_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Try
            Dim ButtonUpdateRoles As Button = DirectCast(sender, Button)
            Dim GridviewAnnouncementsRow As GridViewRow = DirectCast(ButtonUpdateRoles.NamingContainer, GridViewRow)

            Dim CheckBoxListRoles As CheckBoxList = GridviewAnnouncementsRow.FindControl("CheckBoxListRoles")
            Dim CheckBoxListSchools As CheckBoxList = GridviewAnnouncementsRow.FindControl("CheckBoxListSchools")

            Dim SqlDataSourceAnnouncementsRoles As SqlDataSource = GridviewAnnouncementsRow.FindControl("SqlDataSourceAnnouncementsRoles")
            Dim SqlDataSourceAnnouncementsSchools As SqlDataSource = GridviewAnnouncementsRow.FindControl("SqlDataSourceAnnouncementsSchools")

            Dim HiddenFieldAnnouncementID As HiddenField = GridviewAnnouncementsRow.FindControl("HiddenFieldAnnouncementID")

            For Each item As ListItem In CheckBoxListRoles.Items
                If item.Selected = True Then
                    SqlDataSourceAnnouncementsRoles.UpdateParameters.Clear()
                    SqlDataSourceAnnouncementsRoles.UpdateParameters.Add("AnnouncementID", HiddenFieldAnnouncementID.Value)
                    SqlDataSourceAnnouncementsRoles.UpdateParameters.Add("RoleID", item.Value)
                    SqlDataSourceAnnouncementsRoles.Update()
                ElseIf item.Selected = False Then
                    SqlDataSourceAnnouncementsRoles.DeleteParameters.Clear()
                    SqlDataSourceAnnouncementsRoles.DeleteParameters.Add("AnnouncementID", HiddenFieldAnnouncementID.Value)
                    SqlDataSourceAnnouncementsRoles.DeleteParameters.Add("RoleID", item.Value)
                    SqlDataSourceAnnouncementsRoles.Delete()
                End If
            Next

            For Each item As ListItem In CheckBoxListSchools.Items
                If item.Selected = True Then
                    SqlDataSourceAnnouncementsSchools.UpdateParameters.Clear()
                    SqlDataSourceAnnouncementsSchools.UpdateParameters.Add("AnnouncementID", HiddenFieldAnnouncementID.Value)
                    SqlDataSourceAnnouncementsSchools.UpdateParameters.Add("SchoolCode", item.Value)
                    SqlDataSourceAnnouncementsSchools.Update()
                ElseIf item.Selected = False Then
                    SqlDataSourceAnnouncementsSchools.DeleteParameters.Clear()
                    SqlDataSourceAnnouncementsSchools.DeleteParameters.Add("AnnouncementID", HiddenFieldAnnouncementID.Value)
                    SqlDataSourceAnnouncementsSchools.DeleteParameters.Add("SchoolCode", item.Value)
                    SqlDataSourceAnnouncementsSchools.Delete()
                End If
            Next

            LabelStatusAnnouncement.Text = "Modules Updated Successfully!"
        Catch ex As Exception
            LabelStatusAnnouncement.Text = ex.Message
        End Try
    End Sub

    Protected Sub FormViewAnnouncements_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs)
        'Use the Exception property to determine whether an exception
        'occurred during the update operation.

        If e.Exception Is Nothing Then

            If e.AffectedRows = 1 Then
                'Record Inserted Successfully.
                LabelStatusAnnouncement.Text = "Updated Successfully!"
            Else
                LabelStatusAnnouncement.Text = "An error occurred during the insert operation."
            End If
        Else
            LabelStatusAnnouncement.Text = e.Exception.Message
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub CheckBoxPublish_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            Dim CheckBoxPublish As CheckBox = DirectCast(sender, CheckBox)
            Dim GridviewAnnouncementsRow As GridViewRow = DirectCast(CheckBoxPublish.NamingContainer, GridViewRow)
            Dim HiddenFieldAnnouncementID As HiddenField = GridviewAnnouncementsRow.FindControl("HiddenFieldPublishAnnouncementID")

            SqlDataSourceGridViewAnnouncements.UpdateParameters.Clear()
            SqlDataSourceGridViewAnnouncements.UpdateParameters.Add("AnnouncementID", HiddenFieldAnnouncementID.Value)
            SqlDataSourceGridViewAnnouncements.UpdateParameters.Add("Publish", CheckBoxPublish.Checked)
            SqlDataSourceGridViewAnnouncements.UpdateParameters.Add("Order", 0)
            SqlDataSourceGridViewAnnouncements.Update()
        Catch ex As Exception
            LabelStatusAnnouncement.Text = ex.Message
        End Try
    End Sub
End Class
