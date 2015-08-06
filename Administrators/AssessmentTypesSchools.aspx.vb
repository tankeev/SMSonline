
Partial Class AssessmentTypesSchools
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonAddAssessmentType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddAssessmentType.Click

        For Each listItem As ListItem In CheckBoxListCourseSections.Items
            If listItem.Selected = True Then
                Try
                    SqlDataSourceGridviewCourseSectionAssessmentTypes.InsertParameters.Item("CourseSectionID").DefaultValue = listItem.Value
                    SqlDataSourceGridviewCourseSectionAssessmentTypes.InsertParameters.Item("AssessmentTypeID").DefaultValue = DropDownListAssessmentTypes.SelectedValue
                    SqlDataSourceGridviewCourseSectionAssessmentTypes.InsertParameters.Item("Description").DefaultValue = TextBoxDescription.Text
                    SqlDataSourceGridviewCourseSectionAssessmentTypes.InsertParameters.Item("Percentage").DefaultValue = TextBoxPercentage.Text
                    SqlDataSourceGridviewCourseSectionAssessmentTypes.Insert()

                    LabelStatus.Text = "Inserted Successfully!"
                Catch ex As Exception
                    LabelStatus.Text = "Error:" + ex.Message
                End Try

            End If
        Next
    End Sub

    Protected Sub ListBoxCourses_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxCourses.DataBound
        If ListBoxCourses.Items.Count <> 0 Then
            ListBoxCourses.SelectedIndex = 0

            GridViewCourseSectionAssessmentTypes.DataBind()

            CheckBoxListCourseSections.DataBind()
        End If
    End Sub

    Protected Sub GridViewCourseSectionAssessmentTypes_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridViewCourseSectionAssessmentTypes.RowUpdating

        e.NewValues("AssessmentTypeID") = DirectCast(GridViewCourseSectionAssessmentTypes.Rows(e.RowIndex).FindControl("DropDownListAssessmentTypes"), DropDownList).SelectedValue

    End Sub

    Protected Sub CheckBoxCheckAll_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxCheckAll.CheckedChanged

        If CheckBoxCheckAll.Checked Then
            For Each listItem As ListItem In CheckBoxListCourseSections.Items
                listItem.Selected = True
            Next
        Else
            For Each listItem As ListItem In CheckBoxListCourseSections.Items
                listItem.Selected = False
            Next
        End If

    End Sub

    Protected Sub ListBoxCourses_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxCourses.SelectedIndexChanged
        CheckBoxCheckAll.Checked = False
        TextBoxDescription.Text = ""
        LabelStatus.Text = ""
    End Sub
End Class
