Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Data

Partial Class NewUserAccount
    Inherits System.Web.UI.Page

    Dim LastAddedID As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub


    Protected Sub GridViewAssignmentsQuestions_PageIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAssignmentsQuestions.PageIndexChanged
        If GridViewAssignmentsQuestions.Rows.Count > 0 Then
            GridViewAssignmentsQuestions.DataBind()
        End If
    End Sub

    Protected Sub GridViewAssignmentsQuestions_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        Try

            If e.CommandName = "Forward" Then
                Dim Index As Integer = e.CommandArgument
                GridViewAssignmentsQuestions.PageIndex = Index + 1
                GridViewAssignmentsQuestions.DataBind()

            ElseIf e.CommandName = "Backward" Then
                Dim Index As Integer = e.CommandArgument
                GridViewAssignmentsQuestions.PageIndex = Index - 1
                GridViewAssignmentsQuestions.DataBind()

            End If

        Catch ex As Exception
            LabelStatus.Text = "Sorry, No Question Found!"
        End Try
    End Sub

    Protected Sub GridViewAssignmentsQuestions_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewAssignmentsQuestions.RowDataBound

        Dim row As GridViewRow = e.Row

        ' Make sure we aren't in header/footer rows
        If row.DataItem Is Nothing Then
            Return
        End If

        Dim HiddenFieldQuestionTypeID As HiddenField = DirectCast(row.FindControl("HiddenFieldQuestionTypeID"), HiddenField)

        If HiddenFieldQuestionTypeID.Value = 1 Then
            Dim GridViewResponsesEditMC As GridView = DirectCast(row.FindControl("GridViewResponsesEditMC"), GridView)
            GridViewResponsesEditMC.DataBind()
            GridViewResponsesEditMC.Visible = True

        ElseIf HiddenFieldQuestionTypeID.Value = 2 Then
            Dim FormViewResponsesEditTF As FormView = DirectCast(row.FindControl("FormViewResponsesEditTF"), FormView)
            FormViewResponsesEditTF.Visible = True

        ElseIf HiddenFieldQuestionTypeID.Value = 3 Then
            Dim FormViewResponsesEditSA As FormView = DirectCast(row.FindControl("FormViewResponsesEditSA"), FormView)
            FormViewResponsesEditSA.Visible = True
        End If

        Dim AssignmentsQuestionID As Integer = Convert.ToInt32(GridViewAssignmentsQuestions.DataKeys(row.RowIndex).Value)
        Dim LabelQuestionStatus As Label = row.FindControl("LabelQuestionStatus")
        Dim ButtonUpdateChanges As Button = row.FindControl("ButtonUpdateChanges")
        Dim Flag As Boolean = False

        'Multiple Choice Data
        Dim conStringMC As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
        Dim dadMC As New SqlDataAdapter("SELECT AssignmentsUserID FROM tbl_AssignmentsResponsesMC WHERE (AssignmentsQuestionID = '" & AssignmentsQuestionID & "') AND (UserID='" & Convert.ToString(Session("UserID")) & "')", conStringMC)
        Dim dtblMC As New DataTable()
        dadMC.Fill(dtblMC)

        If dtblMC.Rows.Count > 0 Then
            Flag = True
        End If

        'True False Data
        Dim conStringTF As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
        Dim dadTF As New SqlDataAdapter("SELECT AssignmentsUserID FROM tbl_AssignmentsResponsesTF WHERE (AssignmentsQuestionID = '" & AssignmentsQuestionID & "') AND (UserID='" & Convert.ToString(Session("UserID")) & "')", conStringTF)
        Dim dtblTF As New DataTable()
        dadTF.Fill(dtblTF)

        If dtblTF.Rows.Count > 0 Then
            Flag = True
        End If

        'Short Answer Data
        Dim conStringSA As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
        Dim dadSA As New SqlDataAdapter("SELECT AssignmentsUserID FROM tbl_AssignmentsResponsesSA WHERE (AssignmentsQuestionID = '" & AssignmentsQuestionID & "') AND (UserID='" & Convert.ToString(Session("UserID")) & "')", conStringSA)
        Dim dtblSA As New DataTable()
        dadSA.Fill(dtblSA)

        If dtblSA.Rows.Count > 0 Then
            Flag = True
        End If

        If Flag = True Then
            LabelQuestionStatus.Text = "YOU HAVE ALREADY ANSWERED THIS QUESTION!"
            ButtonUpdateChanges.Visible = False
        Else
            ButtonUpdateChanges.Visible = True
            LabelQuestionStatus.Text = ""
        End If

    End Sub

    Protected Sub GridViewAssignments_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridViewAssignments.RowCommand

        If e.CommandName = "Select" Then

            PanelIntroduction.Visible = True
            PanelQuiz.Visible = False

        End If
    End Sub

    Protected Sub ButtonStart_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonStart.Click
        PanelIntroduction.Visible = False
        PanelQuiz.Visible = True
    End Sub

    Protected Sub ButtonUpdateChanges_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim ButtonUpdateChanges As Button = DirectCast(sender, Button)
        Dim CurrentGridviewRow As GridViewRow = ButtonUpdateChanges.NamingContainer
        Dim AssignmentsQuestionID As Integer = Convert.ToInt32(GridViewAssignmentsQuestions.DataKeys(CurrentGridviewRow.RowIndex).Value)
        Dim StudentResponseID As Integer = 0
        Dim LabelQuestionStatus As Label = CurrentGridviewRow.FindControl("LabelQuestionStatus")
        Dim HiddenFieldQuestionTypeID As HiddenField = CurrentGridviewRow.FindControl("HiddenFieldQuestionTypeID")

        If HiddenFieldQuestionTypeID.Value = 1 Then

            Dim GridViewResponsesEditMC As GridView = CurrentGridviewRow.FindControl("GridViewResponsesEditMC")

            'Multiple Choice Data
            Dim conStringMC As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
            Dim dadMC As New SqlDataAdapter("SELECT ResponseID FROM tbl_AssignmentsQuestionsResponsesMC WHERE (AssignmentsQuestionID = '" & AssignmentsQuestionID & "') AND isAnswer='True'", conStringMC)
            Dim dtblMC As New DataTable()
            dadMC.Fill(dtblMC)

            Dim isRightMC As Boolean = False

            For Each GridViewResponsesEditMCRow As GridViewRow In GridViewResponsesEditMC.Rows
                Dim RadioButtonResponse As RadioButton = CType(GridViewResponsesEditMCRow.FindControl("RadioButtonResponse"), RadioButton)
                Dim LabelResponseID As Label = CType(GridViewResponsesEditMCRow.FindControl("LabelResponseID"), Label)
                If RadioButtonResponse.Checked Then
                    StudentResponseID = LabelResponseID.Text
                    Exit For
                End If
            Next

            Dim SqlDataSourceAssignmentsQuestionsResponsesMC As SqlDataSource = CurrentGridviewRow.FindControl("SqlDataSourceAssignmentsQuestionsResponsesMC")

            SqlDataSourceAssignmentsQuestionsResponsesMC.InsertParameters.Clear()
            SqlDataSourceAssignmentsQuestionsResponsesMC.InsertParameters.Add("AssignmentsQuestionID", AssignmentsQuestionID)
            SqlDataSourceAssignmentsQuestionsResponsesMC.InsertParameters.Add("TeacherResponseID", StudentResponseID)
            SqlDataSourceAssignmentsQuestionsResponsesMC.InsertParameters.Add("TeacherID", Session("UserID").ToString)

            If dtblMC.Rows.Item(0).Item("ResponseID") = StudentResponseID Then
                isRightMC = True
            End If

            SqlDataSourceAssignmentsQuestionsResponsesMC.InsertParameters.Add("isRight", isRightMC)
            SqlDataSourceAssignmentsQuestionsResponsesMC.Insert()

            LabelQuestionStatus.Text = "Your Answer has been saved."

        ElseIf HiddenFieldQuestionTypeID.Value = 2 Then

            Dim FormViewResponsesEditTF As FormView = CurrentGridviewRow.FindControl("FormViewResponsesEditTF")
            Dim RadioButtonListTrueFalseResponse As RadioButtonList = FormViewResponsesEditTF.FindControl("RadioButtonListTrueFalseResponse")
            Dim SqlDataSourceAssignmentsQuestionsResponsesTF As SqlDataSource = CurrentGridviewRow.FindControl("SqlDataSourceAssignmentsQuestionsResponsesTF")

            'True False Data
            Dim conStringTF As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
            Dim dadTF As New SqlDataAdapter("SELECT Answer FROM tbl_AssignmentsQuestionsResponsesTF WHERE (AssignmentsQuestionID = '" & AssignmentsQuestionID & "')", conStringTF)
            Dim dtblTF As New DataTable()
            dadTF.Fill(dtblTF)

            Dim isRightTF As Boolean = False

            SqlDataSourceAssignmentsQuestionsResponsesTF.InsertParameters.Clear()
            SqlDataSourceAssignmentsQuestionsResponsesTF.InsertParameters.Add("AssignmentsQuestionID", AssignmentsQuestionID)
            SqlDataSourceAssignmentsQuestionsResponsesTF.InsertParameters.Add("TeacherResponse", RadioButtonListTrueFalseResponse.SelectedValue)
            SqlDataSourceAssignmentsQuestionsResponsesTF.InsertParameters.Add("TeacherID", Session("UserID").ToString)

            If dtblTF.Rows.Item(0).Item("Answer") = RadioButtonListTrueFalseResponse.SelectedValue Then
                isRightTF = True
            End If

            SqlDataSourceAssignmentsQuestionsResponsesTF.InsertParameters.Add("isRight", isRightTF)
            SqlDataSourceAssignmentsQuestionsResponsesTF.Insert()

            LabelQuestionStatus.Text = "Your Answer has been saved."

        ElseIf HiddenFieldQuestionTypeID.Value = 3 Then

            Dim FormViewResponsesEditSA As FormView = CurrentGridviewRow.FindControl("FormViewResponsesEditSA")
            Dim TextBoxShortAnswerResponse As TextBox = FormViewResponsesEditSA.FindControl("TextBoxShortAnswerResponse")

            Dim SqlDataSourceAssignmentsQuestionsResponsesSA As SqlDataSource = CurrentGridviewRow.FindControl("SqlDataSourceAssignmentsQuestionsResponsesSA")

            Dim isRightSA As Boolean = False

            SqlDataSourceAssignmentsQuestionsResponsesSA.InsertParameters.Clear()
            SqlDataSourceAssignmentsQuestionsResponsesSA.InsertParameters.Add("AssignmentsQuestionID", AssignmentsQuestionID)
            SqlDataSourceAssignmentsQuestionsResponsesSA.InsertParameters.Add("TeacherResponse", TextBoxShortAnswerResponse.Text)
            SqlDataSourceAssignmentsQuestionsResponsesSA.InsertParameters.Add("TeacherID", Session("UserID").ToString)
            SqlDataSourceAssignmentsQuestionsResponsesSA.InsertParameters.Add("isRight", isRightSA)
            SqlDataSourceAssignmentsQuestionsResponsesSA.Insert()

            LabelQuestionStatus.Text = "Your Answer has been saved."

        End If

    End Sub


    Protected Sub GridViewAssignments_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAssignments.SelectedIndexChanged
        LabelStatus.Text = ""
    End Sub

End Class
