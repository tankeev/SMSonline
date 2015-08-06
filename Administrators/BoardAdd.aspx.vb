Partial Class RoleManager
    Inherits System.Web.UI.Page

    Private LastInsertID As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub SqlDataSourceAnnouncements_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSourceAnnouncements.Inserted
        'Read the value of the @NewProductID OUTPUT parameter
        LastInsertID = Convert.ToInt32(e.Command.Parameters("@NewID").Value)
    End Sub

    Protected Sub ButtonSend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSend.Click

        Try

            Dim User As MembershipUser = Membership.GetUser()
            Dim UserID As String = User.ProviderUserKey.ToString()

            SqlDataSourceAnnouncements.InsertParameters("Message").DefaultValue = FreeTextBox.Text
            SqlDataSourceAnnouncements.InsertParameters("Title").DefaultValue = TextBoxTitle.Text
            SqlDataSourceAnnouncements.InsertParameters("Date").DefaultValue = DateTime.Now.Date.ToString("yyyyMMdd")
            SqlDataSourceAnnouncements.InsertParameters("Publish").DefaultValue = CheckBoxAddPublish.Checked
            SqlDataSourceAnnouncements.InsertParameters("AddedBy").DefaultValue = UserID
            SqlDataSourceAnnouncements.InsertParameters("Order").DefaultValue = 0
            SqlDataSourceAnnouncements.Insert()

            For Each item As ListItem In CheckBoxListRoles.Items
                If item.Selected Then
                    SqlDataSourceAnnouncementsRoles.InsertParameters.Clear()
                    SqlDataSourceAnnouncementsRoles.InsertParameters.Add("AnnouncementID", LastInsertID)
                    SqlDataSourceAnnouncementsRoles.InsertParameters.Add("RoleID", item.Value)
                    SqlDataSourceAnnouncementsRoles.Insert()
                End If
            Next

            For Each item As ListItem In CheckBoxListSchools.Items
                If item.Selected Then
                    SqlDataSourceAnnouncementsSchools.InsertParameters.Clear()
                    SqlDataSourceAnnouncementsSchools.InsertParameters.Add("AnnouncementID", LastInsertID)
                    SqlDataSourceAnnouncementsSchools.InsertParameters.Add("SchoolCode", item.Value)
                    SqlDataSourceAnnouncementsSchools.Insert()
                End If
            Next

            LabelAddStatus.Text = "Added Successfully!"
        Catch ex As Exception
            LabelAddStatus.Text = ex.Message
        End Try
    End Sub

    Protected Sub CheckBoxRoles_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxRoles.CheckedChanged

        If CheckBoxRoles.Checked = True Then

            For Each item As ListItem In CheckBoxListRoles.Items
                item.Selected = True
            Next

        Else

            For Each item As ListItem In CheckBoxListRoles.Items
                item.Selected = False
            Next

        End If

    End Sub

    Protected Sub CheckBoxSchools_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxSchools.CheckedChanged

        If CheckBoxSchools.Checked = True Then

            For Each item As ListItem In CheckBoxListSchools.Items
                item.Selected = True
            Next

        Else

            For Each item As ListItem In CheckBoxListSchools.Items
                item.Selected = False
            Next

        End If

    End Sub
End Class
