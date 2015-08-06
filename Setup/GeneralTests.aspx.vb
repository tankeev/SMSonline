
Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub FormViewGeneralTests_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewGeneralTests.ItemInserted
        If e.Exception Is Nothing Then
            If e.AffectedRows > 0 Then
                'Record Inserted Successfully.
                LabelStatus.Text = "Added Successfully!"
            Else

                LabelStatus.Text = "An error occurred during the insert operation."
                e.KeepInInsertMode = True
            End If
        Else

            LabelStatus.Text = e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInInsertMode = True
        End If
    End Sub

    Protected Sub FormViewGeneralTestsQuestions_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewGeneralTestsQuestions.ItemInserted
        If e.Exception Is Nothing Then
            If e.AffectedRows > 0 Then
                'Record Inserted Successfully.
                LabelStatus.Text = "Added Successfully!"
            Else

                LabelStatus.Text = "An error occurred during the insert operation."
                e.KeepInInsertMode = True
            End If
        Else

            LabelStatus.Text = e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInInsertMode = True
        End If
    End Sub

    Protected Sub ButtonUpdateAnswers_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAnswers.Click
        For Each GridViewRow As GridViewRow In GridViewGeneralTestQuestions.Rows

            Dim GeneralTestsQuestionID As Integer = Convert.ToInt32(GridViewGeneralTestQuestions.DataKeys(GridViewRow.RowIndex).Value)
            Dim DropDownListGeneralTests As DropDownList = GridViewRow.FindControl("DropDownListGeneralTests")
            Dim DropDownListCourses As DropDownList = GridViewRow.FindControl("DropDownListCourses")
            Dim DropDownListAnswer As DropDownList = GridViewRow.FindControl("DropDownListAnswer")
            Dim LabelQuestionNo As Label = GridViewRow.FindControl("LabelQuestionNo")
            Dim CheckBoxPublish As CheckBox = GridViewRow.FindControl("CheckBoxPublish")
            Dim TextBoxType As TextBox = GridViewRow.FindControl("TextBoxType")

            SqlDataSourceGeneralTestsQuestions.UpdateParameters.Clear()

            SqlDataSourceGeneralTestsQuestions.UpdateParameters.Add("GeneralTestQuestionID", GeneralTestsQuestionID)
            SqlDataSourceGeneralTestsQuestions.UpdateParameters.Add("GeneralTestID", DropDownListGeneralTests.SelectedValue)
            SqlDataSourceGeneralTestsQuestions.UpdateParameters.Add("CourseCatalogID", DropDownListCourses.SelectedValue)
            SqlDataSourceGeneralTestsQuestions.UpdateParameters.Add("GeneralTestQuestionAnswer", DropDownListAnswer.SelectedValue)
            SqlDataSourceGeneralTestsQuestions.UpdateParameters.Add("GeneralTestQuestionNo", LabelQuestionNo.Text)
            SqlDataSourceGeneralTestsQuestions.UpdateParameters.Add("GeneralTestQuestionType", TextBoxType.Text)
            SqlDataSourceGeneralTestsQuestions.UpdateParameters.Add("Publish", CheckBoxPublish.Checked)
            SqlDataSourceGeneralTestsQuestions.Update()

        Next

        LabelStatus.Text = "Done!"

        GridViewGeneralTestQuestions.DataBind()

    End Sub

    Protected Sub ButtonUpdateCodes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateCodes.Click
        Try

            For Each GridViewRow As GridViewRow In GridViewGeneralTestCodes.Rows

                Dim GeneralTestID As Integer = Convert.ToInt32(GridViewGeneralTestCodes.DataKeys(GridViewRow.RowIndex).Value)
                Dim TextBoxAID As TextBox = GridViewRow.FindControl("TextBoxAID")
                Dim TextBoxCodeID As TextBox = GridViewRow.FindControl("TextBoxCodeID")
                Dim TextBoxCodeName As TextBox = GridViewRow.FindControl("TextBoxCodeName")
                Dim TextBoxGroupID As TextBox = GridViewRow.FindControl("TextBoxGroupID")
                Dim TextBoxGroupName As TextBox = GridViewRow.FindControl("TextBoxGroupName")

                SqlDataSourceGeneralTestsCodes.UpdateParameters.Clear()

                SqlDataSourceGeneralTestsCodes.UpdateParameters.Add("GeneralTestID", GeneralTestID)
                SqlDataSourceGeneralTestsCodes.UpdateParameters.Add("AcademicTermID", TextBoxAID.Text)
                SqlDataSourceGeneralTestsCodes.UpdateParameters.Add("GeneralTestCodeID", TextBoxCodeID.Text)
                SqlDataSourceGeneralTestsCodes.UpdateParameters.Add("GeneralTestCodeName", TextBoxCodeName.Text)
                SqlDataSourceGeneralTestsCodes.UpdateParameters.Add("GeneralTestGroupID", TextBoxGroupID.Text)
                SqlDataSourceGeneralTestsCodes.UpdateParameters.Add("GeneralTestGroupName", TextBoxGroupName.Text)
                SqlDataSourceGeneralTestsCodes.Update()

            Next

            LabelStatusCodes.Text = "Done!"

            GridViewGeneralTestCodes.DataBind()
            GridViewGeneralTestsSettings.DataBind()
        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub

    Protected Sub ButtonUpdateSettings_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateSettings.Click
        Try

            For Each GridViewRow As GridViewRow In GridViewGeneralTestsSettings.Rows

                Dim GeneralTestID As Integer = Convert.ToInt32(GridViewGeneralTestsSettings.DataKeys(GridViewRow.RowIndex).Value)
                Dim TextBoxGroupID As TextBox = GridViewRow.FindControl("TextBoxGroupID")
                Dim TextBoxGroupName As TextBox = GridViewRow.FindControl("TextBoxGroupName")
                Dim TextBoxTestName As TextBox = GridViewRow.FindControl("TextBoxTestName")
                Dim TextBoxTestDate As TextBox = GridViewRow.FindControl("TextBoxTestDate")

                SqlDataSourceGeneralTestsSettings.UpdateParameters.Clear()

                SqlDataSourceGeneralTestsSettings.UpdateParameters.Add("GeneralTestID", GeneralTestID)
                SqlDataSourceGeneralTestsSettings.UpdateParameters.Add("GeneralTestName", TextBoxTestName.Text)
                SqlDataSourceGeneralTestsSettings.UpdateParameters.Add("GeneralTestDate", TextBoxTestDate.Text)
                SqlDataSourceGeneralTestsSettings.UpdateParameters.Add("GeneralTestGroupID", TextBoxGroupID.Text)
                SqlDataSourceGeneralTestsSettings.UpdateParameters.Add("GeneralTestGroupName", TextBoxGroupName.Text)
                SqlDataSourceGeneralTestsSettings.Update()

            Next

            LabelStatusSettings.Text = "Done!"

            GridViewGeneralTestsSettings.DataBind()
            GridViewGeneralTestCodes.DataBind()
        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub

    Protected Sub DropDownListAcademicTerms_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListAcademicTerms.SelectedIndexChanged
        LabelStatusSettings.Text = ""
        LabelStatusCodes.Text = ""
    End Sub
End Class
