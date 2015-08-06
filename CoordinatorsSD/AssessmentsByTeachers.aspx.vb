
Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("CoordinatorSD") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ListBoxSections_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxTeachers.DataBound
        If ListBoxTeachers.Items.Count > 0 Then
            ListBoxTeachers.SelectedIndex = 0
        End If

        GridViewAssessments.DataBind()

    End Sub


    Protected Sub GridViewAssessments_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAssessments.DataBound
        If GridViewAssessments.Rows.Count > 0 Then
            GridViewAssessments.SelectedIndex = 0
        End If

        GridViewAssessmentsMarks.DataBind()
    End Sub

    Protected Sub GridViewAssessments_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridViewAssessments.RowUpdating
        e.NewValues("CourseSectionAssessmentTypeID") = DirectCast(DirectCast(sender, GridView).FindControl("DropDownListAssessmentType"), DropDownList).SelectedValue
    End Sub

    Protected Sub ButtonUpdateAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAll.Click
        Try

            For Each MarkRow As GridViewRow In GridViewAssessments.Rows

                Dim AssessmentID As Integer = GridViewAssessments.DataKeys(MarkRow.RowIndex).Value
                Dim DropDownListAssessmentType As DropDownList = DirectCast(MarkRow.FindControl("DropDownListAssessmentType"), DropDownList)
                Dim CheckBoxIsLocked As CheckBox = DirectCast(MarkRow.FindControl("CheckBoxIsLocked"), CheckBox)

                SqlDataSourceAssessments.UpdateParameters.Clear()
                SqlDataSourceAssessments.UpdateParameters.Add("CourseSectionAssessmentTypeID", DropDownListAssessmentType.SelectedValue)
                SqlDataSourceAssessments.UpdateParameters.Add("IsLocked", CheckBoxIsLocked.Checked)
                SqlDataSourceAssessments.UpdateParameters.Add("AssessmentID", AssessmentID)

                SqlDataSourceAssessments.Update()

            Next

            LabelStatus.Text = "Updated Successfully!"

        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub

    Protected Sub CheckBoxAll(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim CheckBoxAll As CheckBox = DirectCast(sender, CheckBox)

        If CheckBoxAll.Checked Then

            For Each GridViewAssessmentsRows As GridViewRow In GridViewAssessments.Rows

                Dim CheckBoxIsLocked As CheckBox = GridViewAssessmentsRows.FindControl("CheckBoxIsLocked")
                CheckBoxIsLocked.Checked = True

            Next

        Else

            For Each GridViewAssessmentsRows As GridViewRow In GridViewAssessments.Rows

                Dim CheckBoxIsLocked As CheckBox = GridViewAssessmentsRows.FindControl("CheckBoxIsLocked")
                CheckBoxIsLocked.Checked = False

            Next

        End If

    End Sub
End Class
