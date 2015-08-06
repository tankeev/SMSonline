Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Data

Partial Class AssignmentChecklist
    Inherits System.Web.UI.Page

    Private LastAddedID As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Page_PreLoad(ByVal sender As Object, ByVal e As EventArgs) Handles Me.PreLoad

        Dim TBkeys As List(Of String) = Request.Form.AllKeys.Where(Function(key) key.Contains("TextBoxMultipleChoiceResponse")).ToList()
        Dim i As Integer = 1
        For Each key As String In TBkeys
            Me.CreateTextBox("TextBoxMultipleChoiceResponse" & i)
            i += 1
        Next

        Dim RBkeys As List(Of String) = Request.Form.AllKeys.Where(Function(key) key.Contains("RadioButtonIsAnswer")).ToList()
        Dim t As Integer = 1
        For Each key As String In RBkeys
            Me.CreateRadioButton("RadioButtonIsAnswer" & t)
            t += 1
        Next

    End Sub

    Protected Sub AddTextBox(ByVal sender As Object, ByVal e As EventArgs)
        Dim index As Integer = PanelMultipleChoice.Controls.OfType(Of TextBox)().ToList().Count + 1
        Me.CreateTextBox("TextBoxMultipleChoiceResponse" & index)
    End Sub

    Private Sub CreateTextBox(ByVal id As String)

        Dim ltbefore As New Literal()
        ltbefore.Text = " <table width=""100%""><tr><td width=""25""></td><td>"
        PanelMultipleChoice.Controls.Add(ltbefore)

        Dim txt As New TextBox()
        txt.ID = id
        txt.Width = 460
        txt.Height = 50
        txt.TextMode = TextBoxMode.MultiLine

        PanelMultipleChoice.Controls.Add(txt)

        Dim ltmiddle As New Literal()
        ltmiddle.Text = " </td><td width=""25""></td></tr><tr><td></td><td>"
        PanelMultipleChoice.Controls.Add(ltmiddle)

        Dim RBindex As Integer = PanelMultipleChoice.Controls.OfType(Of RadioButton)().ToList().Count + 1
        Me.CreateRadioButton("RadioButtonIsAnswer" & RBindex)

    End Sub

    Private Sub CreateRadioButton(ByVal id As String)

        Dim rb As New RadioButton
        rb.ID = id
        rb.GroupName = "MultipleChoice"
        rb.Text = "Is Correct Answer?"

        PanelMultipleChoice.Controls.Add(rb)

        Dim ltafter As New Literal()
        ltafter.Text = "</td><td></td></tr></table>"
        PanelMultipleChoice.Controls.Add(ltafter)

    End Sub

    Protected Sub ButtonAddAssignment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddAssignment.Click
        Try

            SqlDataSourceAssignments.InsertParameters.Clear()
            SqlDataSourceAssignments.InsertParameters.Add("StaffID", Session("UserID"))
            SqlDataSourceAssignments.InsertParameters.Add("AssignmentDetails", TextBoxDescription.Text)
            SqlDataSourceAssignments.InsertParameters.Add("DateAdded", Date.UtcNow)
            SqlDataSourceAssignments.InsertParameters.Add("DateDeadline", Date.UtcNow)
            SqlDataSourceAssignments.InsertParameters.Add("AcademicTermID", DropDownListAcademicTerms.SelectedValue)
            SqlDataSourceAssignments.InsertParameters.Add("SchoolCode", 0)
            SqlDataSourceAssignments.InsertParameters.Add("isActive", 1)


            'Roles
            Dim conStringRole As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
            Dim dadRole As New SqlDataAdapter("SELECT RoleID FROM aspnet_Roles Where RoleName='Staff'", conStringRole)
            Dim dtblRole As New DataTable()
            dadRole.Fill(dtblRole)


            SqlDataSourceAssignments.InsertParameters.Add("RoleID", Convert.ToString(dtblRole.Rows(0).Item("RoleID")))
            SqlDataSourceAssignments.Insert()

            PanelAssignmentQuestions.Visible = False

            LabelStatus.Text = "Assignment Added Successfully!"

            TextBoxDescription.Text = ""
            TextBoxDeadline.Text = ""

        Catch ex As Exception
            LabelStatusAssignments.Text = "Error:" + ex.Message
        End Try

    End Sub

    Protected Sub GridViewAssignments_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAssignments.DataBound
        If GridViewAssignments.Rows.Count > 0 Then
            GridViewAssignments.SelectedIndex = 0
            GridViewAssignmentsQuestions.DataBind()
        End If
    End Sub

    Protected Sub GridViewAssignments_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridViewAssignments.RowDeleted
        LabelStatus.Text = ""
    End Sub

    Protected Sub GridViewAssignments_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAssignments.SelectedIndexChanged
        LabelStatus.Text = ""
        PanelAssignmentQuestions.Visible = True
        PanelNewQuestion.Visible = False
    End Sub

    Protected Sub DropDownListQuestionTypes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListQuestionTypes.SelectedIndexChanged
        If DropDownListQuestionTypes.SelectedValue = 1 Then
            PanelMultipleChoice.Visible = True
            PanelTrueFalse.Visible = False
            PanelShortAnswer.Visible = False
        ElseIf DropDownListQuestionTypes.SelectedValue = 2 Then
            PanelMultipleChoice.Visible = False
            PanelTrueFalse.Visible = True
            PanelShortAnswer.Visible = False
        ElseIf DropDownListQuestionTypes.SelectedValue = 3 Then
            PanelMultipleChoice.Visible = False
            PanelTrueFalse.Visible = False
            PanelShortAnswer.Visible = True
        End If
        LabelStatus.Text = ""
    End Sub

    Protected Sub SqlDataSourceAssignmentsQuestions_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSourceAssignmentsQuestions.Inserted
        LastAddedID = Convert.ToInt32(e.Command.Parameters("@LastAddedID").Value)
    End Sub

    Protected Sub ButtonNewQuestion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonNewQuestion.Click

        TextBoxNewQuestion.Text = ""
        TextBoxNewQuestionNo.Text = ""
        TextBoxNewQuestionPoint.Text = ""
        TextBoxShortAnswerResponse.Text = ""
        LabelStatus.Text = ""

        If GridViewAssignments.SelectedValue Is Nothing Then
            LabelStatus.Text = "Please Select an Assignment First!"
        Else

            PanelAssignmentQuestions.Visible = False

            If PanelNewQuestion.Visible = False Then
                PanelNewQuestion.Visible = True
            ElseIf PanelNewQuestion.Visible = True Then
                PanelNewQuestion.Visible = False
            End If
        End If

    End Sub

    Protected Sub ButtonSend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSend.Click
        Try

            SqlDataSourceAssignmentsQuestions.InsertParameters.Item("QuestionTypeID").DefaultValue = DropDownListQuestionTypes.SelectedValue
            SqlDataSourceAssignmentsQuestions.InsertParameters.Item("Question").DefaultValue = TextBoxNewQuestion.Text
            SqlDataSourceAssignmentsQuestions.InsertParameters.Item("QuestionNo").DefaultValue = TextBoxNewQuestionNo.Text
            SqlDataSourceAssignmentsQuestions.InsertParameters.Item("QuestionPoint").DefaultValue = TextBoxNewQuestionPoint.Text
            SqlDataSourceAssignmentsQuestions.InsertParameters.Item("AssignmentID").DefaultValue = GridViewAssignments.SelectedValue

            SqlDataSourceAssignmentsQuestions.Insert()

            If DropDownListQuestionTypes.SelectedValue = 1 Then

                Dim ListOfTextBoxes As List(Of TextBox) = PanelMultipleChoice.Controls.OfType(Of TextBox).ToList
                Dim ListOfRadioButtons As List(Of RadioButton) = PanelMultipleChoice.Controls.OfType(Of RadioButton).ToList

                For i = 0 To ListOfTextBoxes.Count - 1

                    SqlDataSourceAssignmentsNewQuestionsResponsesMC.InsertParameters.Clear()
                    SqlDataSourceAssignmentsNewQuestionsResponsesMC.InsertParameters.Add("AssignmentsQuestionID", LastAddedID)
                    SqlDataSourceAssignmentsNewQuestionsResponsesMC.InsertParameters.Add("Response", ListOfTextBoxes(i).Text)
                    SqlDataSourceAssignmentsNewQuestionsResponsesMC.InsertParameters.Add("IsAnswer", ListOfRadioButtons(i).Checked)
                    SqlDataSourceAssignmentsNewQuestionsResponsesMC.Insert()

                Next

            ElseIf DropDownListQuestionTypes.SelectedValue = 2 Then

                SqlDataSourceAssignmentsNewQuestionsResponsesTF.InsertParameters.Clear()
                SqlDataSourceAssignmentsNewQuestionsResponsesTF.InsertParameters.Add("AssignmentsQuestionID", LastAddedID)
                SqlDataSourceAssignmentsNewQuestionsResponsesTF.InsertParameters.Add("Answer", RadioButtonListTrueFalseResponse.SelectedValue)
                SqlDataSourceAssignmentsNewQuestionsResponsesTF.Insert()

            ElseIf DropDownListQuestionTypes.SelectedValue = 3 Then

                SqlDataSourceAssignmentsNewQuestionsResponsesSA.InsertParameters.Clear()
                SqlDataSourceAssignmentsNewQuestionsResponsesSA.InsertParameters.Add("AssignmentsQuestionID", LastAddedID)
                SqlDataSourceAssignmentsNewQuestionsResponsesSA.InsertParameters.Add("Answer", TextBoxShortAnswerResponse.Text)
                SqlDataSourceAssignmentsNewQuestionsResponsesSA.Insert()

            End If

            LabelStatus.Text = "Question Has Been Added Successfully!"

            PanelNewQuestion.Visible = False
            GridViewAssignments.DataBind()
            GridViewAssignmentsQuestions.DataBind()

        Catch ex As Exception
            LabelStatus.Text = "Error:" + ex.Message
        End Try
    End Sub

    Protected Sub GridViewAssignmentsQuestions_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewAssignmentsQuestions.RowDataBound
        Try

            Dim row As GridViewRow = e.Row

            ' Make sure we aren't in header/footer rows
            If row.DataItem Is Nothing Then
                Return
            End If

            Dim GridViewResponsesEditMC As GridView = DirectCast(row.FindControl("GridViewResponsesEditMC"), GridView)
            GridViewResponsesEditMC.DataBind()

            Dim FormViewResponsesEditTF As FormView = DirectCast(row.FindControl("FormViewResponsesEditTF"), FormView)
            FormViewResponsesEditTF.DataBind()

            Dim FormViewResponsesEditSA As FormView = DirectCast(row.FindControl("FormViewResponsesEditSA"), FormView)
            FormViewResponsesEditSA.DataBind()

        Catch ex As Exception

        End Try

    End Sub

    Protected Sub ButtonUpdateChanges_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim ButtonUpdateChanges As Button = DirectCast(sender, Button)
        Dim CurrentGridviewRow As GridViewRow = ButtonUpdateChanges.NamingContainer
        Dim AssignmentsQuestionID As Integer = Convert.ToInt32(GridViewAssignmentsQuestions.DataKeys(CurrentGridviewRow.RowIndex).Value)
        Dim TextBoxQuestion As TextBox = CurrentGridviewRow.FindControl("TextBoxQuestion")
        Dim TextBoxQuestionNo As TextBox = CurrentGridviewRow.FindControl("TextBoxQuestionNo")
        Dim TextBoxQuestionPoint As TextBox = CurrentGridviewRow.FindControl("TextBoxQuestionPoint")

        Try

            SqlDataSourceAssignmentsQuestions.UpdateParameters.Item("AssignmentsQuestionID").DefaultValue = AssignmentsQuestionID
            SqlDataSourceAssignmentsQuestions.UpdateParameters.Item("Question").DefaultValue = TextBoxQuestion.Text
            SqlDataSourceAssignmentsQuestions.UpdateParameters.Item("QuestionNo").DefaultValue = TextBoxQuestionNo.Text
            SqlDataSourceAssignmentsQuestions.UpdateParameters.Item("QuestionPoint").DefaultValue = TextBoxQuestionPoint.Text
            SqlDataSourceAssignmentsQuestions.Update()

            Dim HiddenFieldQuestionTypeID As HiddenField = CurrentGridviewRow.FindControl("HiddenFieldQuestionTypeID")

            If HiddenFieldQuestionTypeID.Value = 1 Then

                Dim GridViewResponsesEditMC As GridView = CurrentGridviewRow.FindControl("GridViewResponsesEditMC")
                Dim SqlDataSourceAssignmentsQuestionsResponsesMC As SqlDataSource = CurrentGridviewRow.FindControl("SqlDataSourceAssignmentsQuestionsResponsesMC")

                For Each GridViewResponsesEditMCRow As GridViewRow In GridViewResponsesEditMC.Rows

                    Dim TextBoxResponseMC As TextBox = CType(GridViewResponsesEditMCRow.FindControl("TextBoxResponse"), TextBox)
                    Dim RadioButtonResponseMC As RadioButton = CType(GridViewResponsesEditMCRow.FindControl("RadioButtonResponse"), RadioButton)
                    Dim ResponseIDMC As Integer = Convert.ToInt32(GridViewResponsesEditMC.DataKeys(GridViewResponsesEditMCRow.RowIndex).Value)

                    SqlDataSourceAssignmentsQuestionsResponsesMC.UpdateParameters.Clear()
                    SqlDataSourceAssignmentsQuestionsResponsesMC.UpdateParameters.Add("ResponseID", ResponseIDMC)
                    SqlDataSourceAssignmentsQuestionsResponsesMC.UpdateParameters.Add("IsAnswer", RadioButtonResponseMC.Checked)
                    SqlDataSourceAssignmentsQuestionsResponsesMC.UpdateParameters.Add("Response", TextBoxResponseMC.Text)
                    SqlDataSourceAssignmentsQuestionsResponsesMC.Update()

                Next

            ElseIf HiddenFieldQuestionTypeID.Value = 2 Then

                Dim FormViewResponsesEditTF As FormView = CurrentGridviewRow.FindControl("FormViewResponsesEditTF")
                Dim RadioButtonListTrueFalseResponseTF As RadioButtonList = FormViewResponsesEditTF.FindControl("RadioButtonListTrueFalseResponse")
                Dim ResponseIDTF As HiddenField = FormViewResponsesEditTF.FindControl("HiddenFieldResponseID")
                Dim SqlDataSourceAssignmentsQuestionsResponsesTF As SqlDataSource = CurrentGridviewRow.FindControl("SqlDataSourceAssignmentsQuestionsResponsesTF")

                SqlDataSourceAssignmentsQuestionsResponsesTF.UpdateParameters.Clear()
                SqlDataSourceAssignmentsQuestionsResponsesTF.UpdateParameters.Add("ResponseID", ResponseIDTF.Value)
                SqlDataSourceAssignmentsQuestionsResponsesTF.UpdateParameters.Add("Answer", RadioButtonListTrueFalseResponseTF.SelectedValue)
                SqlDataSourceAssignmentsQuestionsResponsesTF.Update()

            ElseIf HiddenFieldQuestionTypeID.Value = 3 Then

                Dim FormViewResponsesEditSA As FormView = CurrentGridviewRow.FindControl("FormViewResponsesEditSA")
                Dim TextBoxShortAnswerResponseSA As TextBox = CType(FormViewResponsesEditSA.FindControl("TextBoxShortAnswerResponse"), TextBox)
                Dim ResponseIDSA As HiddenField = FormViewResponsesEditSA.FindControl("HiddenFieldResponseID")
                Dim SqlDataSourceAssignmentsQuestionsResponsesSA As SqlDataSource = CurrentGridviewRow.FindControl("SqlDataSourceAssignmentsQuestionsResponsesSA")

                SqlDataSourceAssignmentsQuestionsResponsesSA.UpdateParameters.Clear()
                SqlDataSourceAssignmentsQuestionsResponsesSA.UpdateParameters.Add("ResponseID", ResponseIDSA.Value)
                SqlDataSourceAssignmentsQuestionsResponsesSA.UpdateParameters.Add("Answer", TextBoxShortAnswerResponseSA.Text)
                SqlDataSourceAssignmentsQuestionsResponsesSA.Update()

            End If

            LabelStatus.Text = "Question Updated Successfully!"

        Catch ex As Exception
            LabelStatus.Text = "Error:" + ex.Message
        End Try
    End Sub

    Protected Sub DropDownListAcademicTerms_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListAcademicTerms.DataBound
        GridViewAssignments.DataBind()
    End Sub

End Class
