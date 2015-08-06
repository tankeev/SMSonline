
Partial Class UserList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("CoordinatorSD") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub DropDownListSections_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSections.DataBound
        ListBoxCourses.DataBind()
    End Sub

    Protected Sub ListBoxCourgses_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxCourses.DataBound

        If ListBoxCourses.Items.Count > 0 Then

            PanelEmpty.Visible = False
            PanelStudents.Visible = True

            ListBoxCourses.SelectedIndex = 0

            CheckBoxListStudents.DataBind()

            If CheckBoxListStudents.Items.Count > 0 Then

                Dim dv As New System.Data.DataView
                Dim dt As New System.Data.DataTable

                dv = SqlDataSourceCourseStudents.Select(DataSourceSelectArguments.Empty)
                dt = dv.ToTable()

                For Each item As ListItem In CheckBoxListStudents.Items
                    For Each dr As Data.DataRow In dt.Rows
                        If item.Value = dr.Item(0).ToString Then
                            item.Selected = True
                        End If
                    Next
                Next

            End If

        Else

            PanelEmpty.Visible = True
            PanelStudents.Visible = False

        End If

    End Sub

    Protected Sub ListBoxCourses_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxCourses.SelectedIndexChanged

        CheckBoxCheckAll.Checked = False

        If ListBoxCourses.Items.Count > 0 Then

            PanelEmpty.Visible = False
            PanelStudents.Visible = True

            'ListBoxCourses.SelectedIndex = 0

            CheckBoxListStudents.DataBind()

            If CheckBoxListStudents.Items.Count > 0 Then

                Dim dv As New System.Data.DataView
                Dim dt As New System.Data.DataTable

                dv = SqlDataSourceCourseStudents.Select(DataSourceSelectArguments.Empty)
                dt = dv.ToTable()

                For Each item As ListItem In CheckBoxListStudents.Items
                    For Each dr As Data.DataRow In dt.Rows
                        If item.Value = dr.Item(0).ToString Then
                            item.Selected = True
                        End If
                    Next
                Next

            End If

        Else

            PanelEmpty.Visible = True
            PanelStudents.Visible = False

        End If

    End Sub

    Protected Sub ButtonUpdateCourseStudents_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateCourseStudents.Click
        Try
            For Each listItem As ListItem In CheckBoxListStudents.Items
                If listItem.Selected = True Then

                    SqlDataSourceCourseStudents.InsertParameters.Item("CourseSectionID").DefaultValue = ListBoxCourses.SelectedValue
                    SqlDataSourceCourseStudents.InsertParameters.Item("StudentID").DefaultValue = listItem.Value

                    SqlDataSourceCourseStudents.Insert()
                Else

                    SqlDataSourceCourseStudents.DeleteParameters.Item("CourseSectionID").DefaultValue = ListBoxCourses.SelectedValue
                    SqlDataSourceCourseStudents.DeleteParameters.Item("StudentID").DefaultValue = listItem.Value

                    SqlDataSourceCourseStudents.Delete()
                End If
            Next

            LabelStatus.Text = "Data Has Been Updated Successfully!"

        Catch ex As Exception
            LabelStatus.Text = "Insert Assessment Error:" + ex.Message
        End Try

    End Sub

    Protected Sub CheckBoxCheckAll_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxCheckAll.CheckedChanged

        If CheckBoxCheckAll.Checked Then

            For Each listItem As ListItem In CheckBoxListStudents.Items
                listItem.Selected = True

            Next

        Else

            For Each listItem As ListItem In CheckBoxListStudents.Items
                listItem.Selected = False
            Next

        End If

    End Sub

    Protected Sub DropDownListSections_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSections.SelectedIndexChanged
        LabelStatus.Text = ""
        ListBoxCourses.DataBind()
        CheckBoxCheckAll.Checked = False
    End Sub

End Class
