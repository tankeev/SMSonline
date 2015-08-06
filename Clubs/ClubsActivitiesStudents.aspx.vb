Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub CheckBoxListStudents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxListStudents.DataBound
        If CheckBoxListStudents.Items.Count > 0 Then

            Dim dv As New System.Data.DataView
            Dim dt As New System.Data.DataTable

            dv = SqlDataSourceClubsActivitiesStudents.Select(DataSourceSelectArguments.Empty)
            dt = dv.ToTable()

            For Each item As ListItem In CheckBoxListStudents.Items
                For Each dr As Data.DataRow In dt.Rows
                    If item.Value = dr.Item(0).ToString Then
                        item.Selected = True
                    End If
                Next
            Next

        End If
    End Sub

    Protected Sub ButtonUpdateAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAll.Click
        Try

            For Each listItem As ListItem In CheckBoxListStudents.Items
                If listItem.Selected = True Then

                    SqlDataSourceClubsActivitiesStudents.InsertParameters.Item("ClubActivityID").DefaultValue = DropDownListClubsActivities.SelectedValue
                    SqlDataSourceClubsActivitiesStudents.InsertParameters.Item("StudentID").DefaultValue = listItem.Value
                    SqlDataSourceClubsActivitiesStudents.Insert()
                Else

                    SqlDataSourceClubsActivitiesStudents.DeleteParameters.Item("ClubActivityID").DefaultValue = DropDownListClubsActivities.SelectedValue
                    SqlDataSourceClubsActivitiesStudents.DeleteParameters.Item("StudentID").DefaultValue = listItem.Value
                    SqlDataSourceClubsActivitiesStudents.Delete()
                End If
            Next

            LabelStatus.Text = "Updated Successfully!"

        Catch ex As Exception
            LabelStatus.Text = "Sorry, The Following Error Occured: " & ex.ToString
        End Try
    End Sub


    Protected Sub RadioButtonListSections_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonListSections.SelectedIndexChanged
        LabelStatus.Text = ""
        CheckBoxCheckAll.Checked = False
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

    Protected Sub DropDownListClubsActivities_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListClubsActivities.SelectedIndexChanged
        RadioButtonListSections.DataBind()
        CheckBoxListStudents.DataBind()
    End Sub
End Class
