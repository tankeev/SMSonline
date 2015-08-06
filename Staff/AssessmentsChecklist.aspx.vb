Imports System.Web.Configuration
Imports System.Data.SqlClient
Imports System.Data

Partial Class Assessment_Marks
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.IsInRole("Staff") Then
            Response.Redirect("~/Warning.aspx")
        End If
    End Sub

    Protected Sub DropDownListSections_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSections.DataBound
        DropDownListStudents.DataBind()
    End Sub

    Protected Sub GridViewAssessments_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewAssessments.RowDataBound
        Try
            Dim MarkRow As GridViewRow = e.Row

            If MarkRow.RowType = DataControlRowType.DataRow Then
                Dim ImageStatus As Image = CType(MarkRow.FindControl("ImageStatus"), Image)
                Dim HiddenFieldIsLocked As HiddenField = MarkRow.FindControl("HiddenFieldIsLocked")

                If HiddenFieldIsLocked.Value = True Then
                    ImageStatus.ImageUrl = "~/Staff/Images/assessment_lock.png"

                Else
                    ImageStatus.ImageUrl = "~/Staff/Images/assessment_unlocked.png"

                End If

            End If
        Catch ex As Exception
            WebMessageBoxAssessments.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try

    End Sub

    Protected Sub GridViewAssessments_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAssessments.DataBound
        Try

            If GridViewAssessments.Rows.Count = 0 Then
                ButtonUpdate.Visible = False
            Else
                ButtonUpdate.Visible = True
            End If

        Catch ex As Exception
            WebMessageBoxAssessments.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub

    Protected Sub ImageButtonAssessmentMarks_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Try

            Dim SenderImageButton As ImageButton = DirectCast(sender, ImageButton)
            Dim GridViewAssessmentsRow As GridViewRow = DirectCast(SenderImageButton.NamingContainer, GridViewRow)

            GridViewAssessments.SelectedIndex = GridViewAssessmentsRow.RowIndex

            Dim HiddenFieldIsLocked As HiddenField = CType(GridViewAssessments.SelectedRow.FindControl("HiddenFieldIsLocked"), HiddenField)
            If HiddenFieldIsLocked.Value = True Then
                ImageLockStatus.ImageUrl = "~/Staff/Images/assessment_lock.png"
                LabelLockStatus.Text = "Assessment is LOCKED. Scores can not be modified!"
                GridViewAssessmentsMarks.Enabled = False
                ButtonUpdateAll.Enabled = False
                'ButtonAddMissing.Enabled = False
            Else
                ImageLockStatus.ImageUrl = "~/Staff/Images/assessment_unlocked.png"
                LabelLockStatus.Text = "Assessment is NOT LOCKED. Scores can be modified!"
                GridViewAssessmentsMarks.Enabled = True
                ButtonUpdateAll.Enabled = True
                'ButtonAddMissing.Enabled = True
            End If

            MPAssessmentMarks.Show()

        Catch ex As Exception
            WebMessageBoxAssessments.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub

    Protected Sub ImageButtonClick_AssessmentDelete(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Try
            Dim ImageButtonDelete As ImageButton = DirectCast(sender, ImageButton)
            Dim GridViewAssessmentsRow As GridViewRow = DirectCast(ImageButtonDelete.NamingContainer, GridViewRow)

            Dim CheckBoxIsLocked As CheckBox = DirectCast(GridViewAssessmentsRow.FindControl("CheckBoxIsLocked"), CheckBox)
            Dim LabelAID As Label = DirectCast(GridViewAssessmentsRow.FindControl("LabelAID"), Label)

            If CheckBoxIsLocked.Checked = True Then
                WebMessageBoxAssessments.Show("Sorry, This Assessment Has Been Locked, Cannot Be Deleted!", "Warning")
            Else
                SqlDataSourceAssessments.DeleteParameters.Clear()
                SqlDataSourceAssessments.DeleteParameters.Add("AssessmentID", LabelAID.Text)

                SqlDataSourceAssessments.Delete()

                WebMessageBoxAssessments.Show("Assessment Has Been Successfully Deleted!", "Success")
            End If
        Catch ex As Exception
            WebMessageBoxAssessments.Show("An Error Occured: " & ex.Message.ToString, "Error")
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
            WebMessageBoxAssessments.Show("Updated Successfully!", "Success")
        Catch ex As Exception
            WebMessageBoxAssessments.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try

    End Sub

    Protected Sub ButtonUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdate.Click
        Try

            For Each GridViewRow As GridViewRow In GridViewAssessments.Rows

                Dim AssessmentID As Integer = Convert.ToInt32(GridViewAssessments.DataKeys(GridViewRow.RowIndex).Value)
                Dim GVDropDownListAssessmentTypes As DropDownList = GridViewRow.FindControl("DropDownListAssessmentTypes")
                Dim GVTextBoxAssessmentName As TextBox = GridViewRow.FindControl("TextBoxAssessmentName")

                SqlDataSourceAssessments.UpdateParameters.Clear()
                SqlDataSourceAssessments.UpdateParameters.Add("CourseSectionAssessmentTypeID", GVDropDownListAssessmentTypes.SelectedValue)
                SqlDataSourceAssessments.UpdateParameters.Add("Assessment", GVTextBoxAssessmentName.Text)
                SqlDataSourceAssessments.UpdateParameters.Add("AssessmentID", AssessmentID)

                SqlDataSourceAssessments.Update()

            Next

            GridViewAssessments.DataBind()

            WebMessageBoxAssessments.Show("Done! Records Have Been Successfully Updated", "Success")

        Catch ex As Exception
            WebMessageBoxAssessments.Show("An Error Occured: " & ex.Message.ToString, "Error")
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

            WebMessageBoxAssessments.Show("Updated Successfully!", "Success")

        Catch ex As Exception
            WebMessageBoxAssessments.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try

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
            WebMessageBoxAssessments.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub

    Protected Sub ButtonAddAssessment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddAssessment.Click
        Try
            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")

            Dim conStringSettings As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
            Dim dadSettings As New SqlDataAdapter("SELECT * FROM tbl_GlobalSettings ", conStringSettings)
            Dim dtblSettings As New DataTable()
            dadSettings.Fill(dtblSettings)

            If DropDownListAcademicTermsMaster.SelectedValue = dtblSettings.Rows.Item(0).Item("AcademicTermID") Then

                Dim Counter As Integer = 0
                For Each GridViewAssessmentTypesRow As GridViewRow In GridViewAssessmentTypes.Rows

                    If GridViewAssessmentTypesRow.RowType = DataControlRowType.DataRow Then

                        Dim CheckBoxAssessmentType As CheckBox = DirectCast(GridViewAssessmentTypesRow.FindControl("CheckBoxAssessmentType"), CheckBox)
                        Dim LabelCourseSectionAssessmentTypeID As Label = DirectCast(GridViewAssessmentTypesRow.FindControl("LabelCourseSectionAssessmentTypeID"), Label)
                        Dim LabelCourseSectionID As Label = DirectCast(GridViewAssessmentTypesRow.FindControl("LabelCourseSectionID"), Label)

                        If CheckBoxAssessmentType.Checked = True Then

                            Dim conString As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
                            Dim query As String = "INSERT INTO tbl_Assessments(CourseSectionAssessmentTypeID, Assessment, Date) VALUES (@CourseSectionAssessmentTypeID, @Assessment, @Date); Select Scope_Identity()"
                            Dim AssessmentID As Integer

                            Using conn As New SqlConnection(conString)
                                Using cmd As New SqlCommand(query, conn)

                                    cmd.Parameters.AddWithValue("@CourseSectionAssessmentTypeID", LabelCourseSectionAssessmentTypeID.Text)
                                    cmd.Parameters.AddWithValue("@Assessment", TextBoxAssessmentName.Text)

                                    Dim myzone As TimeZone = TimeZone.CurrentTimeZone
                                    Dim localDateTime As DateTime = myzone.ToLocalTime(DateTime.Now)
                                    Dim uiversalDateTime As DateTime = myzone.ToUniversalTime(DateTime.Now)

                                    cmd.Parameters.AddWithValue("@Date", uiversalDateTime.Date)
                                    conn.Open()
                                    AssessmentID = cmd.ExecuteScalar()
                                End Using
                            End Using

                            SqlDataSourceCourseSectionsStudents.FilterExpression = "CourseSectionID = '" & LabelCourseSectionID.Text & "'"
                            SqlDataSourceCourseSectionsStudents.DataBind()

                            Dim StudentData As New GridView
                            StudentData.DataSource = SqlDataSourceCourseSectionsStudents
                            StudentData.DataBind()

                            If Not StudentData.Rows.Count = 0 Then
                                For Each StudentDataRow As GridViewRow In StudentData.Rows
                                    SqlDataSourceCourseSectionsStudents.InsertParameters.Clear()
                                    SqlDataSourceCourseSectionsStudents.InsertParameters.Add("StudentID", StudentDataRow.Cells(1).Text)
                                    SqlDataSourceCourseSectionsStudents.InsertParameters.Add("AssessmentID", AssessmentID)
                                    SqlDataSourceCourseSectionsStudents.InsertParameters.Add("AssessmentMark", 0)
                                    SqlDataSourceCourseSectionsStudents.InsertParameters.Add("Excused", 0)
                                    SqlDataSourceCourseSectionsStudents.Insert()
                                Next
                            End If

                            SqlDataSourceCourseSectionsStudents.FilterExpression = ""
                            SqlDataSourceCourseSectionsStudents.DataBind()

                            Counter += 1
                        End If
                    End If
                Next

                GridViewAssessments.DataBind()

                If Counter > 0 Then
                    WebMessageBoxAssessments.Show("Assessment(s) added successfully!", "Success")
                Else
                    WebMessageBoxAssessments.Show("No Assessment Type Selected!", "Warning")
                End If

            Else
                WebMessageBoxAssessments.Show("Sorry, Cannot Add Assessment to previous Terms!", "Warning")

            End If

        Catch ex As Exception
            WebMessageBoxAssessments.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub

End Class

