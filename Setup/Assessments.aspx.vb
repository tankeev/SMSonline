
Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonAddAssessment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddAssessment.Click
        Try
            SqlDataSourceAssessments.InsertParameters.Item("CourseSectionAssessmentTypeID").DefaultValue = DropDownListAssessmentTypes.SelectedValue
            SqlDataSourceAssessments.InsertParameters.Item("Assessment").DefaultValue = TextBoxAssessment.Text
            SqlDataSourceAssessments.InsertParameters.Item("Date").DefaultValue = DateAndTime.Now.ToString("MM/dd/yyyy HH:mm:ss")
            SqlDataSourceAssessments.Insert()

            LabelStatus.Text = "Assessment Added Successfully!"

        Catch ex As Exception
            LabelStatus.Text = "Insert Assessment Error:" + ex.Message
        End Try
    End Sub


    Protected Sub SqlDataSourceAssessments_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSourceAssessments.Inserted
        Try
            SqlDataSourceCourseSectionStudents.FilterExpression = "CourseSectionID = '" & DropDownListCourseSections.SelectedValue & "'"

            Dim StudentData As New GridView
            StudentData.DataSource = SqlDataSourceCourseSectionStudents
            StudentData.DataBind()

            If Not StudentData.Rows.Count = 0 Then
                For Each StudentDataRow As GridViewRow In StudentData.Rows
                    SqlDataSourceCourseSectionStudents.InsertParameters.Clear()
                    SqlDataSourceCourseSectionStudents.InsertParameters.Add("StudentID", StudentDataRow.Cells(0).Text)
                    SqlDataSourceCourseSectionStudents.InsertParameters.Add("AssessmentID", e.Command.Parameters("@LastAddedID").Value)
                    SqlDataSourceCourseSectionStudents.InsertParameters.Add("AssessmentMark", 0)
                    SqlDataSourceCourseSectionStudents.Insert()
                Next
            End If

        Catch ex As Exception
            LabelStatus.Text = "Add Assessment to Students Error:" + ex.Message
        End Try
    End Sub


    Protected Sub ButtonUpdateAnswers_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAnswers.Click
        Try
            For Each GridViewRow As GridViewRow In GridViewAssessmentQuestions.Rows

                Dim AssessmentsQuestionID As Integer = Convert.ToInt32(GridViewAssessmentQuestions.DataKeys(GridViewRow.RowIndex).Value)
                Dim TextBoxAID As TextBox = GridViewRow.FindControl("TextBoxAID")
                Dim TextBoxNO As TextBox = GridViewRow.FindControl("TextBoxNO")
                Dim TextBoxAnswer As TextBox = GridViewRow.FindControl("TextBoxAnswer")
                Dim CheckBoxPublish As CheckBox = GridViewRow.FindControl("CheckBoxPublish")

                SqlDataSourceGridviewAssessmentQuestions.UpdateParameters.Clear()

                SqlDataSourceGridviewAssessmentQuestions.UpdateParameters.Add("AssessmentsQuestionID", AssessmentsQuestionID)
                SqlDataSourceGridviewAssessmentQuestions.UpdateParameters.Add("AssessmentID", TextBoxAID.Text)
                SqlDataSourceGridviewAssessmentQuestions.UpdateParameters.Add("AssessmentQuestionNo", TextBoxNO.Text)
                SqlDataSourceGridviewAssessmentQuestions.UpdateParameters.Add("AssessmentQuestionAnswer", TextBoxAnswer.Text)
                SqlDataSourceGridviewAssessmentQuestions.UpdateParameters.Add("Publish", CheckBoxPublish.Checked)

                SqlDataSourceGridviewAssessmentQuestions.Update()

            Next

            LabelStatus.Text = "Done!"

            GridViewAssessmentQuestions.DataBind()

        Catch ex As Exception
            LabelStatus.Text = "Update Error: " + ex.Message
        End Try
    End Sub

    Protected Sub DropDownListCourseSections_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListCourseSections.DataBound
        DropDownListAssessmentTypes.DataBind()
    End Sub
End Class
