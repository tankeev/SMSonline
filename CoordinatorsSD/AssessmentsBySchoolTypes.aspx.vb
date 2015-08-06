
Partial Class AssessmentTypesSchools
    Inherits System.Web.UI.Page

    Dim LabelTotalPercentage As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("CoordinatorSD") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonAddAssessmentType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddAssessmentType.Click
        Try

            For Each listItem As ListItem In CheckBoxListCourseSections.Items

                If listItem.Selected = True Then

                    SqlDataSourceGridviewCourseSectionAssessmentTypes.InsertParameters.Item("CourseSectionID").DefaultValue = listItem.Value
                    SqlDataSourceGridviewCourseSectionAssessmentTypes.InsertParameters.Item("AssessmentTypeID").DefaultValue = DropDownListAssessmentTypes.SelectedValue
                    SqlDataSourceGridviewCourseSectionAssessmentTypes.InsertParameters.Item("Description").DefaultValue = TextBoxDescription.Text
                    SqlDataSourceGridviewCourseSectionAssessmentTypes.InsertParameters.Item("Percentage").DefaultValue = TextBoxPercentage.Text
                    SqlDataSourceGridviewCourseSectionAssessmentTypes.Insert()

                    LabelStatus.Text = "Inserted Successfully!"

                End If

            Next

        Catch ex As Exception
            LabelStatus.Text = "Error:" + ex.Message
        End Try
    End Sub

    Protected Sub GridViewCourseSectionAssessmentTypes_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewCourseSectionAssessmentTypes.RowDataBound

        Try

            If e.Row.RowType = DataControlRowType.DataRow Then

                Dim LabelPercentage As Label = DirectCast(e.Row.FindControl("LabelPercentage"), Label)

                LabelTotalPercentage += Convert.ToInt32(LabelPercentage.Text)

            ElseIf e.Row.RowType = DataControlRowType.Footer Then

                Dim LabelPercentageFooter As Label = DirectCast(e.Row.FindControl("LabelPercentageFooter"), Label)

                LabelPercentageFooter.Text = LabelTotalPercentage

            End If

        Catch ex As Exception
            LabelStatus.Text = "Error:" + ex.Message
        End Try
    End Sub

    Protected Sub GridViewCourseSectionAssessmentTypes_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridViewCourseSectionAssessmentTypes.RowUpdating
        e.NewValues("AssessmentTypeID") = DirectCast(GridViewCourseSectionAssessmentTypes.Rows(e.RowIndex).FindControl("DropDownListAssessmentTypes"), DropDownList).SelectedValue
    End Sub

    Protected Sub ListBoxCourses_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxCourses.SelectedIndexChanged
        TextBoxDescription.Text = ""
        LabelStatus.Text = ""
        CheckBoxCheckAll.Checked = False

        PanelTypes.Visible = True
        PanelFilter.Enabled = True
        GridViewCourseSectionAssessmentTypes.DataBind()
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

    Protected Sub CheckBoxRemoveFilter_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxRemoveFilter.CheckedChanged, DropDownListSchoolSections.SelectedIndexChanged
        Try

            If CheckBoxRemoveFilter.Checked = False Then
                SqlDataSourceGridviewCourseSectionAssessmentTypes.FilterParameters.Clear()
                SqlDataSourceGridviewCourseSectionAssessmentTypes.FilterExpression = ""
            Else
                SqlDataSourceGridviewCourseSectionAssessmentTypes.FilterParameters.Clear()
                SqlDataSourceGridviewCourseSectionAssessmentTypes.FilterParameters.Add(New ControlParameter("SectionCatalogID", "DropDownListSchoolSections", "SelectedValue"))
                SqlDataSourceGridviewCourseSectionAssessmentTypes.FilterExpression = "SectionCatalogID={0}"
            End If

            SqlDataSourceGridviewCourseSectionAssessmentTypes.DataBind()
            GridViewCourseSectionAssessmentTypes.DataBind()

        Catch ex As Exception
            LabelStatus.Text = "Error:" + ex.Message
        End Try
    End Sub

    Protected Sub ButtonUpdateAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAll.Click
        Try

            For Each GridViewTypesRow As GridViewRow In GridViewCourseSectionAssessmentTypes.Rows

                Dim DropDownListAssessmentTypes As DropDownList = GridViewTypesRow.FindControl("DropDownListAssessmentTypes")
                Dim TextBoxDescription As TextBox = GridViewTypesRow.FindControl("TextBoxDescription")

                SqlDataSourceGridviewCourseSectionAssessmentTypes.UpdateParameters.Item("CourseSectionAssessmentTypeID").DefaultValue = GridViewCourseSectionAssessmentTypes.DataKeys(GridViewTypesRow.RowIndex).Value
                SqlDataSourceGridviewCourseSectionAssessmentTypes.UpdateParameters.Item("AssessmentTypeID").DefaultValue = DropDownListAssessmentTypes.SelectedValue
                SqlDataSourceGridviewCourseSectionAssessmentTypes.UpdateParameters.Item("Description").DefaultValue = TextBoxDescription.Text
                SqlDataSourceGridviewCourseSectionAssessmentTypes.Update()

            Next

            LabelStatus.Text = "Updated Successfully!"

        Catch ex As Exception
            LabelStatus.Text = "Error:" + ex.Message
        End Try
    End Sub
End Class
