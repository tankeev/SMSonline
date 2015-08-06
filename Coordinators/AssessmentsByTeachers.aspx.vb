Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Coordinator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ListBoxSections_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxTeachers.DataBound
        If ListBoxTeachers.Items.Count > 0 Then
            ListBoxTeachers.SelectedIndex = 0
        End If
        GridViewAssessments.DataBind()
    End Sub

    Protected Sub GridViewAssessments_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridViewAssessments.RowUpdating
        Try

            Dim GridViewAssessmentsRow As GridViewRow = DirectCast(GridViewAssessments.Rows(e.RowIndex), GridViewRow)
            Dim DropDownListAssessmentType As DropDownList = GridViewAssessmentsRow.FindControl("DropDownListAssessmentType")

            e.NewValues("CourseSectionAssessmentTypeID") = DropDownListAssessmentType.SelectedValue

        Catch ex As Exception
            WebMessageBoxAssessments.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub

    Protected Sub ButtonUpdateAllAssessments_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAll.Click
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

            WebMessageBoxAssessments.Show("Assessments updated successfully!", "Success")

        Catch ex As Exception
            WebMessageBoxAssessments.Show("An Error Occured: " & ex.Message.ToString, "Error")
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
