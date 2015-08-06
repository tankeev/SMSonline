Imports System.Data.SqlClient
Imports System.Web.Script.Serialization
Imports System.Web.Configuration
Imports System.Data

Partial Class NewUserAccount
    Inherits System.Web.UI.Page

    Private LastAddedID As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Student") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub GridViewAssignmentsQuestions_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridViewAssignmentsQuestions.PageIndexChanging
        PanelMC.Visible = False
        PanelTF.Visible = False
        PanelSA.Visible = False
        PanelYN.Visible = False
    End Sub

    Protected Sub GridViewAssignmentsQuestions_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridViewAssignmentsQuestions.RowCommand

      If e.CommandName = "Select" Then

            Dim index As Integer = Convert.ToInt32(e.CommandArgument)

            Dim GridviewSelectedRow As GridViewRow = GridViewAssignmentsQuestions.Rows(index)

            Dim AssignmentsQuestionID As Integer = DirectCast(GridviewSelectedRow.FindControl("HiddenFieldAssignmentQuestionID"), HiddenField).Value
            Dim QuestionTypeID As Integer = DirectCast(GridviewSelectedRow.FindControl("DropDownListQuestionTypes"), DropDownList).SelectedValue

            If QuestionTypeID = 1 Then

                GridViewResponsesEditMC.DataBind()
                PanelMC.Visible = True
                PanelTF.Visible = False
                PanelSA.Visible = False
                PanelYN.Visible = False

            ElseIf QuestionTypeID = 2 Then

                PanelMC.Visible = False
                PanelTF.Visible = True
                PanelSA.Visible = False
                PanelYN.Visible = False

            ElseIf QuestionTypeID = 3 Then

                PanelMC.Visible = False
                PanelTF.Visible = False
                PanelSA.Visible = True
                PanelYN.Visible = False

            ElseIf QuestionTypeID = 4 Then

                PanelMC.Visible = False
                PanelTF.Visible = False
                PanelSA.Visible = False
                PanelYN.Visible = True
            End If


        End If
    End Sub

    Protected Sub GridViewAssignmentsQuestions_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewAssignmentsQuestions.RowDataBound

        Dim row As GridViewRow = e.Row

        ' Make sure we aren't in header/footer rows
        If row.DataItem Is Nothing Then
            Return
        End If

        Dim Flag As Boolean = False

        'Multiple Choice Data
        Dim conStringMC As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
        Dim dadMC As New SqlDataAdapter("SELECT AssignmentsUserID FROM tbl_AssignmentsResponsesMC WHERE (AssignmentsQuestionID = '" & GridViewAssignmentsQuestions.SelectedValue & "') AND (UserID='" & Convert.ToString(Session("UserID")) & "')", conStringMC)
        Dim dtblMC As New DataTable()
        dadMC.Fill(dtblMC)

        If dtblMC.Rows.Count > 0 Then
            Flag = True
        End If

        'True False Data
        Dim conStringTF As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
        Dim dadTF As New SqlDataAdapter("SELECT AssignmentsUserID FROM tbl_AssignmentsResponsesTF WHERE (AssignmentsQuestionID = '" & GridViewAssignmentsQuestions.SelectedValue & "') AND (UserID='" & Convert.ToString(Session("UserID")) & "')", conStringTF)
        Dim dtblTF As New DataTable()
        dadTF.Fill(dtblTF)

        If dtblTF.Rows.Count > 0 Then
            Flag = True
        End If

        'Short Answer Data
        Dim conStringSA As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
        Dim dadSA As New SqlDataAdapter("SELECT AssignmentsUserID FROM tbl_AssignmentsResponsesSA WHERE (AssignmentsQuestionID = '" & GridViewAssignmentsQuestions.SelectedValue & "') AND (UserID='" & Convert.ToString(Session("UserID")) & "')", conStringSA)
        Dim dtblSA As New DataTable()
        dadSA.Fill(dtblSA)

        If dtblSA.Rows.Count > 0 Then
            Flag = True
        End If

        If Flag = True Then
            LabelStatus.Text = "YOU HAVE ALREADY ANSWERED THIS QUESTION!"
        Else
            LabelStatus.Text = ""
        End If

    End Sub

    Protected Sub ButtonInsertMC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonInsertMC.Click

        'Multiple Choice Data
        Dim conStringMC As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
        Dim dadMC As New SqlDataAdapter("SELECT ResponseID FROM tbl_AssignmentsQuestionsResponsesMC WHERE (AssignmentsQuestionID = '" & GridViewAssignmentsQuestions.SelectedValue & "') AND isAnswer='True'", conStringMC)
        Dim dtblMC As New DataTable()
        dadMC.Fill(dtblMC)

        Dim StudentResponseID As Integer = 0
        Dim isRightMC As Boolean = False

        For Each GridViewResponsesEditMCRow As GridViewRow In GridViewResponsesEditMC.Rows
            Dim RadioButtonResponse As RadioButton = CType(GridViewResponsesEditMCRow.FindControl("RadioButtonResponse"), RadioButton)
            Dim LabelResponseID As Label = CType(GridViewResponsesEditMCRow.FindControl("LabelResponseID"), Label)
            If RadioButtonResponse.Checked Then
                StudentResponseID = LabelResponseID.Text
                Exit For
            End If
        Next

        SqlDataSourceAssignmentsQuestionsResponsesMC.InsertParameters.Clear()
        SqlDataSourceAssignmentsQuestionsResponsesMC.InsertParameters.Add("AssignmentsQuestionID", GridViewAssignmentsQuestions.SelectedValue)
        SqlDataSourceAssignmentsQuestionsResponsesMC.InsertParameters.Add("StudentResponseID", StudentResponseID)
        SqlDataSourceAssignmentsQuestionsResponsesMC.InsertParameters.Add("StudentID", Session("UserID").ToString)

        If dtblMC.Rows.Item(0).Item("ResponseID") = StudentResponseID Then
            isRightMC = True
        End If

        SqlDataSourceAssignmentsQuestionsResponsesMC.InsertParameters.Add("isRight", isRightMC)
        SqlDataSourceAssignmentsQuestionsResponsesMC.Insert()

        LabelStatus.Text = "Thank You!"
    End Sub

    Protected Sub FormViewResponsesEditTF_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewResponsesEditTF.ItemInserted
        LabelStatus.Text = "Thank You!"
    End Sub

    Protected Sub FormViewResponsesEditSA_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewResponsesEditSA.ItemInserted
        LabelStatus.Text = "Thank You!"
    End Sub

    Protected Sub FormViewResponsesEditYN_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewResponsesEditYN.ItemInserted
        LabelStatus.Text = "Thank You!"
    End Sub
End Class
