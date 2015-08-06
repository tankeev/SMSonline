Partial Class General_Test_Scores
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Coordinator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub DropDownListGeneralTests_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListGeneralTests.DataBound
        If DropDownListGeneralTests.Items.Count > 0 Then
            'GridViewGeneralTestsStudents.DataBind()
        End If
    End Sub

    Protected Sub GridViewGeneralTestsStudents_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewGeneralTestsStudents.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim DataListGeneralTestsQuestions As DataList = e.Row.FindControl("DataListGeneralTestsQuestions")
            DataListGeneralTestsQuestions.DataBind()

            Dim DataListGeneralTestsQuestionsSE As DataList = e.Row.FindControl("DataListGeneralTestsQuestionsSE")
            DataListGeneralTestsQuestionsSE.DataBind()

            Dim LabelNoScores As Label = DirectCast(e.Row.FindControl("LabelNoScores"), Label)

            If DataListGeneralTestsQuestionsSE.Items.Count = 0 Then
                LabelNoScores.Visible = True
            End If

            Dim LabelNoEssay As Label = DirectCast(e.Row.FindControl("LabelNoEssay"), Label)
            Dim ButtonUpdateScores As Button = DirectCast(e.Row.FindControl("ButtonUpdateScores"), Button)

            If DataListGeneralTestsQuestions.Items.Count = 0 Then
                LabelNoEssay.Visible = True
                ButtonUpdateScores.Visible = False
            End If

        End If
    End Sub

    Protected Sub ButtonUpdateScores_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Try

            Dim ButtonUpdateScores As Button = DirectCast(sender, Button)

            Dim GridViewGeneralTestsStudentsRow As GridViewRow = ButtonUpdateScores.NamingContainer

            Dim SqlDataSourceGeneralTestsQuestionsSE As SqlDataSource = GridViewGeneralTestsStudentsRow.FindControl("SqlDataSourceGeneralTestsQuestionsSE")
            Dim DataListGeneralTestsQuestions As DataList = GridViewGeneralTestsStudentsRow.FindControl("DataListGeneralTestsQuestions")
            Dim HiddenFieldStudentID As HiddenField = GridViewGeneralTestsStudentsRow.FindControl("HiddenFieldStudentID")

            For Each QuestionDataItem As DataListItem In DataListGeneralTestsQuestions.Items

                Dim LabelQuestionNo As Label = QuestionDataItem.FindControl("LabelQuestionNo")
                Dim TextBoxScore As TextBox = QuestionDataItem.FindControl("TextBoxScore")

                SqlDataSourceGeneralTestsQuestionsSE.InsertParameters.Clear()
                SqlDataSourceGeneralTestsQuestionsSE.InsertParameters.Add("GeneralTestID", DropDownListGeneralTests.SelectedValue)
                SqlDataSourceGeneralTestsQuestionsSE.InsertParameters.Add("GeneralTestQuestionNo", LabelQuestionNo.Text)
                SqlDataSourceGeneralTestsQuestionsSE.InsertParameters.Add("StudentID", HiddenFieldStudentID.Value)
                SqlDataSourceGeneralTestsQuestionsSE.InsertParameters.Add("Score", TextBoxScore.Text)
                SqlDataSourceGeneralTestsQuestionsSE.InsertParameters.Add("AddedBy", Session("UserID").ToString)

                SqlDataSourceGeneralTestsQuestionsSE.Insert()
            Next

            DataListGeneralTestsQuestions.DataBind()

            LabelCheck.Text = "Done!"

        Catch ex As Exception
            LabelCheck.Text = ex.Message
        End Try

    End Sub

    Protected Sub RadioButtonListCourses_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonListCourses.SelectedIndexChanged
        GridViewGeneralTestsStudents.DataBind()
    End Sub
End Class
