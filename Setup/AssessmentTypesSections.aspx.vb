
Partial Class AssessmentTypes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonAddAssessmentType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddAssessmentType.Click
        Try
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

            CheckBoxCheckAll.Checked = False

        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub

    Protected Sub DropDownListCourses_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSections.SelectedIndexChanged
        LabelStatus.Text = ""
        LabelStatusAssessmentTypes.Text = ""
    End Sub

    Protected Sub ButtonUpdateAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAll.Click
        Try

            For Each MarkRow As GridViewRow In GridViewCourseSectionAssessmentTypes.Rows

                Dim MarkID As Integer = Convert.ToInt32(GridViewCourseSectionAssessmentTypes.DataKeys(MarkRow.RowIndex).Value)
                Dim DropDownListAssessmentTypes As DropDownList = CType(MarkRow.FindControl("DropDownListAssessmentTypes"), DropDownList)
                Dim TextBoxDescription As TextBox = CType(MarkRow.FindControl("TextBoxDescription"), TextBox)
                Dim TextBoxPercentage As TextBox = CType(MarkRow.FindControl("TextBoxPercentage"), TextBox)

                SqlDataSourceGridviewCourseSectionAssessmentTypes.UpdateParameters.Clear()
                SqlDataSourceGridviewCourseSectionAssessmentTypes.UpdateParameters.Add("CourseSectionAssessmentTypeID", MarkID)
                SqlDataSourceGridviewCourseSectionAssessmentTypes.UpdateParameters.Add("AssessmentTypeID", DropDownListAssessmentTypes.SelectedValue)
                SqlDataSourceGridviewCourseSectionAssessmentTypes.UpdateParameters.Add("Description", TextBoxDescription.Text)
                SqlDataSourceGridviewCourseSectionAssessmentTypes.UpdateParameters.Add("Percentage", TextBoxPercentage.Text)
                SqlDataSourceGridviewCourseSectionAssessmentTypes.Update()

            Next
            LabelStatusAssessmentTypes.Text = "Updated Successfully!"
        Catch ex As Exception
            LabelStatusAssessmentTypes.Text = ex.Message
        End Try
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
End Class
