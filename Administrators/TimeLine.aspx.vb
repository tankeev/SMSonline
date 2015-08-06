Imports System.Data
Imports System.Web.Configuration
Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page

    Private LastAddedID As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub GridViewDashBoard_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewDashBoard.RowDataBound

        Dim row As GridViewRow = e.Row
        Dim strSort As String = String.Empty

        ' Make sure we aren't in header/footer rows
        If row.DataItem Is Nothing Then
            Return
        End If

        Dim GridViewReply As GridView = DirectCast(row.FindControl("GridViewReply"), GridView)

        Dim HiddenFieldToday As HiddenField = DirectCast(row.FindControl("HiddenFieldToday"), HiddenField)

        GridViewReply.DataBind()

        HiddenFieldToday.Value = Date.UtcNow

    End Sub

    Protected Sub SqlDataSourceDashBoard_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSourceDashBoard.Inserted
        'Read the value of the @NewProductID OUTPUT parameter
        LastAddedID = Convert.ToInt32(e.Command.Parameters("@LastAddedID").Value)
    End Sub

    Protected Sub ButtonDashBoard_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonDashBoard.Click

        Try

            SqlDataSourceDashBoard.InsertParameters.Item("SenderID").DefaultValue = Session("UserID")
            SqlDataSourceDashBoard.InsertParameters.Item("Message").DefaultValue = MessageTextBoxTopic.Text
            SqlDataSourceDashBoard.InsertParameters.Item("Liked").DefaultValue = 0
            SqlDataSourceDashBoard.InsertParameters.Item("Date").DefaultValue = Date.UtcNow
            SqlDataSourceDashBoard.InsertParameters.Item("Show").DefaultValue = 1
            SqlDataSourceDashBoard.Insert()

            SqlDataSourceDashBoardWall.InsertParameters.Item("ReceiverID").DefaultValue = Session("UserID")
            SqlDataSourceDashBoardWall.InsertParameters.Item("DashBoardID").DefaultValue = LastAddedID

            SqlDataSourceDashBoardWall.Insert()

            For Each GridViewGroupsRow As GridViewRow In GridViewGroups.Rows

                Dim LabelGroupID As Label = GridViewGroupsRow.FindControl("LabelGID")
                Dim CheckBoxUserGroup As CheckBox = GridViewGroupsRow.FindControl("CheckBoxUserGroup")

                If CheckBoxUserGroup.Checked Then

                    'GroupUsers
                    Dim conStringGroupUsers As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
                    Dim dadGroupUsers As New SqlDataAdapter("SELECT DashBoardUserID FROM tbl_DashBoardGroupsUsers Where DashBoardGroupID=" & LabelGroupID.Text, conStringGroupUsers)
                    Dim dtblGroupUsers As New DataTable()
                    dadGroupUsers.Fill(dtblGroupUsers)

                    For Each DataRowGroupUsers As DataRow In dtblGroupUsers.Rows

                        SqlDataSourceDashBoardWall.InsertParameters.Item("ReceiverID").DefaultValue = Convert.ToString(DataRowGroupUsers.Item("DashBoardUserID"))
                        SqlDataSourceDashBoardWall.InsertParameters.Item("DashBoardID").DefaultValue = LastAddedID

                        SqlDataSourceDashBoardWall.Insert()

                    Next

                End If

            Next

        Catch ex As Exception
            LabelTopicStatus.Text = "Error:" + ex.Message
        End Try

    End Sub

    Protected Sub ButtonAddGroup_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddGroup.Click
        Try

            If Not Trim(DashBoardGroupNameTextBox.Text) = "" Then

                SqlDataSourceDashBoardGroups.InsertParameters.Item("DashBoardGroupOwnerID").DefaultValue = Session("UserID")
                SqlDataSourceDashBoardGroups.InsertParameters.Item("DashBoardGroupName").DefaultValue = DashBoardGroupNameTextBox.Text

                SqlDataSourceDashBoardGroups.Insert()

                LabelStatusGroups.Text = "Group Has Been Added!"

            Else

                LabelStatusGroups.Text = "Write a Group Name!"

            End If

            Dim TotalRows As Integer = 0

            If GridViewGroups.Rows.Count > 0 Then
                TotalRows = GridViewGroups.Rows.Count
            End If

            MPAddGroup.Show()

            GridViewGroups.SelectedIndex = TotalRows
            PanelGroupUsers.Visible = True
        Catch ex As Exception
            LabelStatus.Text = "Error:" + ex.Message
        End Try
    End Sub

    Protected Sub ButtonAddUser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddUser.Click

        If Not (DropDownListGroups.SelectedValue = Nothing) Then

            For Each ListUser As ListItem In CheckBoxListTeachers.Items

                If ListUser.Selected Then
                    Try

                        Dim SelectedRow As GridViewRow = GridViewGroups.Rows(GridViewGroups.SelectedIndex)

                        If Not SelectedRow Is Nothing Then

                            SqlDataSourceDashBoardGroupsUsersStaff.InsertParameters.Item("DashBoardUserID").DefaultValue = ListUser.Value
                            SqlDataSourceDashBoardGroupsUsersStaff.InsertParameters.Item("DashBoardGroupID").DefaultValue = DropDownListGroups.SelectedValue

                            SqlDataSourceDashBoardGroupsUsersStaff.Insert()

                        Else

                            LabelStatus.Text = "No Group is Selected!"

                        End If

                    Catch ex As Exception
                        LabelStatus.Text = "Error:" + ex.Message
                    End Try

                End If
            Next

            For Each ListUser As ListItem In CheckBoxListStudents.Items

                If ListUser.Selected Then
                    Try
                        Dim SelectedRow As GridViewRow = GridViewGroups.Rows(GridViewGroups.SelectedIndex)

                        If Not SelectedRow Is Nothing Then

                            SqlDataSourceDashBoardGroupsUsersStudents.InsertParameters.Item("DashBoardUserID").DefaultValue = ListUser.Value
                            SqlDataSourceDashBoardGroupsUsersStudents.InsertParameters.Item("DashBoardGroupID").DefaultValue = DropDownListGroups.SelectedValue

                            SqlDataSourceDashBoardGroupsUsersStudents.Insert()

                        Else

                            LabelStatus.Text = "No Group is Selected!"

                        End If

                    Catch ex As Exception
                        LabelStatus.Text = "Error:" + ex.Message
                    End Try

                End If
            Next

            For Each listItem As ListItem In CheckBoxListStudents.Items
                listItem.Selected = False
            Next
            For Each listItem As ListItem In CheckBoxListTeachers.Items
                listItem.Selected = False
            Next

            CheckBoxCheckAll.Checked = False

        End If

    End Sub

    Protected Sub GridViewGroups_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewGroups.SelectedIndexChanged
        PanelGroupUsers.Visible = True
    End Sub

    Protected Sub DropDownListSections_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSections.SelectedIndexChanged, DropDownListSections.DataBound
        CheckBoxListStudents.DataBind()
        MPAddGroupUser.Show()
    End Sub

    Protected Sub DropDownListGroups_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListGroups.SelectedIndexChanged, DropDownListGroups.DataBound
        CheckBoxListTeachers.DataBind()
        CheckBoxListStudents.DataBind()
        MPAddGroupUser.Show()
    End Sub

    Protected Sub CheckBoxCheckAll_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxCheckAll.CheckedChanged
        Try

            If CheckBoxCheckAll.Checked Then
                For Each listItem As ListItem In CheckBoxListStudents.Items
                    listItem.Selected = True
                Next
            Else
                For Each listItem As ListItem In CheckBoxListStudents.Items
                    listItem.Selected = False
                Next
            End If

            MPAddGroupUser.Show()

        Catch ex As Exception
            LabelStatus.Text = "Error:" + ex.Message
        End Try
    End Sub

    Protected Sub CheckBoxListStudents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxListStudents.DataBound

        If CheckBoxListStudents.Items.Count > 0 Then

            Dim dv As New System.Data.DataView
            Dim dt As New System.Data.DataTable

            If Not SqlDataSourceUsersinGroups.Select(DataSourceSelectArguments.Empty) Is Nothing Then

                dv = SqlDataSourceUsersinGroups.Select(DataSourceSelectArguments.Empty)
                dt = dv.ToTable()

                For Each item As ListItem In CheckBoxListStudents.Items
                    For Each dr As Data.DataRow In dt.Rows
                        If item.Value = dr.Item(0).ToString Then
                            item.Selected = True
                        End If
                    Next
                Next
            End If

        End If

    End Sub

    Protected Sub CheckBoxListTeachers_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxListTeachers.DataBound

        If CheckBoxListTeachers.Items.Count > 0 Then

            Dim dv As New System.Data.DataView
            Dim dt As New System.Data.DataTable

            If Not SqlDataSourceUsersinGroups.Select(DataSourceSelectArguments.Empty) Is Nothing Then

                dv = SqlDataSourceUsersinGroups.Select(DataSourceSelectArguments.Empty)
                dt = dv.ToTable()

                For Each item As ListItem In CheckBoxListTeachers.Items
                    For Each dr As Data.DataRow In dt.Rows
                        If item.Value = dr.Item(0).ToString Then
                            item.Selected = True
                        End If
                    Next
                Next

            End If

        End If

    End Sub

    Protected Sub DropDownListSchoolCodes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSchoolCodes.SelectedIndexChanged
        CheckBoxListTeachers.DataBind()
        CheckBoxListStudents.DataBind()
        MPAddGroupUser.Show()
    End Sub
End Class
