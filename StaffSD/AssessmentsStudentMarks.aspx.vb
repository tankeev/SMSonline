Partial Class Assessment_Marks
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.IsInRole("StaffSD") Then
            Response.Redirect("~/Warning.aspx")
        End If
    End Sub

    Protected Sub ListBoxCourses_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxCourses.DataBound

        If ListBoxCourses.Items.Count > 0 Then
            ListBoxCourses.SelectedIndex = 0
        End If

    End Sub

    Protected Sub GridViewAssessments_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewAssessments.RowDataBound
        Try

            Dim MarkRow As GridViewRow = e.Row

            If MarkRow.RowType = DataControlRowType.DataRow Then
                Dim ImageStatus As Image = CType(MarkRow.FindControl("ImageStatus"), Image)
                Dim HiddenFieldIsLocked As HiddenField = MarkRow.FindControl("HiddenFieldIsLocked")

                If HiddenFieldIsLocked.Value = True Then
                    ImageStatus.ImageUrl = "~/StaffSD/Images/assessment_lock.png"
                    ImageStatus.ToolTip = "Locked!"

                Else
                    ImageStatus.ImageUrl = "~/StaffSD/Images/assessment_unlocked.png"
                    ImageStatus.ToolTip = "UnLocked!"

                End If

            End If
        Catch ex As Exception
            WebMessageBoxMarks.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try

    End Sub

    Protected Sub GridViewAssessments_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAssessments.DataBound
        Try

            If GridViewAssessments.Rows.Count > 0 Then
                GridViewAssessments.SelectedIndex = 0
                Dim HiddenFieldIsLocked As HiddenField = CType(GridViewAssessments.SelectedRow.FindControl("HiddenFieldIsLocked"), HiddenField)
                If HiddenFieldIsLocked.Value = True Then
                    ImageLockStatus.ImageUrl = "~/Staff/Images/assessment_lock.png"
                    LabelLockStatus.Text = "Assessment is LOCKED. Scores can not be modified!"
                    PanelAssessmentMarks.Enabled = False
                    ButtonShowAddMissing.Enabled = False
                Else
                    ImageLockStatus.ImageUrl = "~/StaffSD/Images/assessment_unlocked.png"
                    LabelLockStatus.Text = "Assessment is NOT LOCKED. Scores can be modified!"
                    PanelAssessmentMarks.Enabled = True
                    ButtonShowAddMissing.Enabled = True
                End If
            Else
                ButtonShowAddMissing.Enabled = False
            End If

        Catch ex As Exception
            WebMessageBoxMarks.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub

    Protected Sub GridViewAssessments_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAssessments.SelectedIndexChanged
        Try

            Dim HiddenFieldIsLocked As HiddenField = CType(GridViewAssessments.SelectedRow.FindControl("HiddenFieldIsLocked"), HiddenField)
            If HiddenFieldIsLocked.Value = True Then
                ImageLockStatus.ImageUrl = "~/Staff/Images/assessment_lock.png"
                LabelLockStatus.Text = "Assessment is LOCKED. Scores can not be modified!"
                PanelAssessmentMarks.Enabled = False
                ButtonShowAddMissing.Enabled = False
            Else
                ImageLockStatus.ImageUrl = "~/Staff/Images/assessment_unlocked.png"
                LabelLockStatus.Text = "Assessment is NOT LOCKED. Scores can be modified!"
                PanelAssessmentMarks.Enabled = True
                ButtonShowAddMissing.Enabled = True
            End If

        Catch ex As Exception
            WebMessageBoxMarks.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try

    End Sub

    Protected Sub ButtonUpdateAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAll.Click
        Try

            For Each MarkRow As GridViewRow In GridViewAssessmentsMarks.Rows

                Dim MarkID As Integer = Convert.ToInt32(GridViewAssessmentsMarks.DataKeys(MarkRow.RowIndex).Value)
                Dim MarkTextBox As TextBox = CType(MarkRow.FindControl("TextBoxInput"), TextBox)
                Dim CheckBoxExcused As CheckBox = CType(MarkRow.FindControl("CheckBoxExcused"), CheckBox)

                SqlDataSourceAssessmentsMarks.UpdateParameters.Clear()
                SqlDataSourceAssessmentsMarks.UpdateParameters.Add("AssessmentMarkID", MarkID)
                SqlDataSourceAssessmentsMarks.UpdateParameters.Add("AssessmentMark", MarkTextBox.Text)
                SqlDataSourceAssessmentsMarks.UpdateParameters.Add("Excused", CheckBoxExcused.Checked)
                SqlDataSourceAssessmentsMarks.Update()

            Next
            WebMessageBoxMarks.Show("Updated Successfully!", "Success")
        Catch ex As Exception
            WebMessageBoxMarks.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try

    End Sub

    Protected Sub ButtonInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonInsert.Click
        Try
            SqlDataSourceAssessmentsMarks.InsertParameters.Clear()
            SqlDataSourceAssessmentsMarks.InsertParameters.Add("StudentID", DropDownListStudents.SelectedValue)
            SqlDataSourceAssessmentsMarks.InsertParameters.Add("AssessmentID", GridViewAssessments.SelectedValue)
            SqlDataSourceAssessmentsMarks.InsertParameters.Add("AssessmentMark", TextBoxMark.Text)
            SqlDataSourceAssessmentsMarks.InsertParameters.Add("Excused", 0)
            SqlDataSourceAssessmentsMarks.Insert()

            WebMessageBoxMarks.Show("Updated Successfully!", "Success")

        Catch ex As Exception
            WebMessageBoxMarks.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try

    End Sub

    Protected Sub DropDownListSections_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSections.DataBound
        DropDownListStudents.DataBind()
    End Sub

    Protected Sub CheckBoxExcused_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Try

            Dim CheckBoxExcused As CheckBox = sender
            Dim MarkRow As GridViewRow = CheckBoxExcused.NamingContainer
            Dim HiddenFieldIsLocked As HiddenField = MarkRow.FindControl("HiddenFieldIsLocked")
            Dim MarkTextBox As TextBox = CType(MarkRow.FindControl("TextBoxInput"), TextBox)

            If CheckBoxExcused.Checked = True Then
                MarkTextBox.Text = 0
                MarkTextBox.Enabled = False
            Else
                If HiddenFieldIsLocked.Value = True Then
                    MarkTextBox.Enabled = False
                Else

                    MarkTextBox.Enabled = True
                End If
            End If
        Catch ex As Exception
            WebMessageBoxMarks.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub

End Class

