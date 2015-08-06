Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Data

Partial Class AssignmentChecklist
    Inherits System.Web.UI.Page

    Private LastAddedID As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserID") Is Nothing Then
            Response.Redirect("Default.aspx")
        End If

        If Not User.IsInRole("Staff") Then
            Response.Redirect("~/Warning.aspx")
        End If

        AddAndRemoveDynamicControls()

    End Sub

    Protected Sub ButtonAddAssignment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddAssignment.Click
        Try
            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            SqlDataSourceAssignments.InsertParameters.Clear()
            SqlDataSourceAssignments.InsertParameters.Add("StaffID", Session("UserID"))
            SqlDataSourceAssignments.InsertParameters.Add("AssignmentDetails", TextBoxDescription.Text)
            SqlDataSourceAssignments.InsertParameters.Add("DateAdded", Date.UtcNow)
            SqlDataSourceAssignments.InsertParameters.Add("DateDeadline", Date.UtcNow)
            SqlDataSourceAssignments.InsertParameters.Add("AcademicTermID", DropDownListAcademicTermsMaster.SelectedValue)
            SqlDataSourceAssignments.InsertParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
            SqlDataSourceAssignments.InsertParameters.Add("isActive", 1)

            'Roles
            Dim conStringRole As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
            Dim dadRole As New SqlDataAdapter("SELECT RoleID FROM aspnet_Roles Where RoleName='Student'", conStringRole)
            Dim dtblRole As New DataTable()
            dadRole.Fill(dtblRole)

            SqlDataSourceAssignments.InsertParameters.Add("RoleID", Convert.ToString(dtblRole.Rows(0).Item("RoleID")))

            SqlDataSourceAssignments.Insert()

            PanelAssignmentQuestions.Visible = False

            TextBoxDescription.Text = ""
            TextBoxDeadline.Text = ""

        Catch ex As Exception
            LabelStatusAssignments.Text = "Error:" + ex.Message
        End Try

    End Sub

    Protected Sub ImageButtonNewQuestion_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonNewQuestion.Click
        TextBoxNewQuestion.Text = ""
        TextBoxNewQuestionPoint.Text = ""
        TextBoxShortAnswerResponse.Text = ""

        LabelStatus.Text = ""

        PlaceHolderMCResponses.Controls.Clear()


        If GridViewAssignments.SelectedValue Is Nothing Then
            WebMessageBoxAssignment.Show("Please Select an Assignment First!", "Warning")
        Else
            PanelResponses.Visible = False
            PanelAssignmentQuestions.Visible = False
            PanelNewQuestion.Visible = True
        End If
    End Sub

    Private Sub AddAndRemoveDynamicControls()

        'Determine which control fired the postback event. 
        Dim senderControl As Control = GetPostBackControl(Page)

        If Not IsNothing(senderControl) Then
            If senderControl.ID.ToString = "btnAdd" Then
                ltlCount.Text = Convert.ToInt16(ltlCount.Text) + 1
            End If
        End If

        PlaceHolderMCResponses.Controls.Clear()

        Dim ControlID As Integer = 0

        'Since these are dynamic user controls, re-add them every time the page loads.
        For i As Integer = 0 To (Convert.ToInt16(ltlCount.Text) - 1)
            Dim MCQResponse As MultipleChoiceQuestionResponse = LoadControl("MultipleChoiceQuestionResponse.ascx")


            'Dim RadioButtonIsAnswer As RadioButton = DirectCast(MCQResponse.FindControl("RadioButtonIsAnswer"), RadioButton)
            'Dim script As String = "SetUniqueRadioButton('RadioButtonIsAnswer.*IsCorrect',this)"
            'RadioButtonIsAnswer.Attributes.Add("onclick", script)

            'If this particular control id has been deleted 
            'from the page, DO NOT use it again. If we do, it will
            'pick up the viewstate data from the old item that 
            'had this control id, instead of generating
            'a completely new control. Instead, increment 
            'the control ID so we're guaranteed to get a "new"
            'control that doesn't have any lingering information in the viewstate.
            While InDeletedList("MultipleChoiceQuestionResponse" & ControlID) = True
                ControlID += 1
            End While

            'Note that if the item has not been deleted from the page, 
            'we DO want it to use the same control id
            'as it used before, so it will automatically maintain 
            'the viewstate information of the user control
            'for us.
            MCQResponse.ID = "MultipleChoiceQuestionResponse" & ControlID

            'Add an event handler to this control to raise 
            'an event when the delete button is clicked
            'on the user control
            AddHandler MCQResponse.RemoveUserControl, AddressOf Me.HandleRemoveUserControl

            'Finally, add the user control to the panel
            PlaceHolderMCResponses.Controls.Add(MCQResponse)

            'Increment the control id for the next round through the loop
            ControlID += 1
        Next
    End Sub

    Private Function InDeletedList(ByVal ControlID As String) As Boolean
        'Determine if the passed in user control ID 
        'has been stored in the list of controls that
        'were previously deleted off the page
        Dim DeletedList() As String = ltlRemoved.Text.Split("|")
        For i As Integer = 0 To DeletedList.GetLength(0) - 1
            If ControlID.ToLower = DeletedList(i).ToLower Then
                Return True
            End If
        Next
        Return False
    End Function

    Sub HandleRemoveUserControl(ByVal sender As Object, ByVal e As EventArgs)
        'This handles delete event fired from the user control

        'Get the user control that fired this event, and remove it
        Dim MCQResponse As MultipleChoiceQuestionResponse = sender.parent
        PlaceHolderMCResponses.Controls.Remove(MCQResponse)

        'Keep a pipe delimited list of which user controls 
        'were removed. This will increase the 
        'viewstate size if the user keeps removing 
        'dynamic controls, but under normal use
        'this is such a small increase in size that it shouldn't be an issue.
        ltlRemoved.Text &= MCQResponse.ID & "|"

        'Also, now that we've removed a user control decrement 
        'the count of total user controls on the page
        ltlCount.Text = Convert.ToInt16(ltlCount.Text) - 1
    End Sub

    Public Function GetPostBackControl(ByVal page As Page) As Control
        Dim control As Control = Nothing

        Dim ctrlname As String = page.Request.Params.[Get]("__EVENTTARGET")
        If Not IsNothing(ctrlname) And ctrlname <> String.Empty Then
            control = page.FindControl(ctrlname)
        Else
            For Each ctl As String In page.Request.Form
                Dim c As Control = page.FindControl(ctl)
                If TypeOf c Is System.Web.UI.WebControls.Button Then
                    control = c
                    Exit For
                End If
            Next
        End If
        Return control
    End Function

    Protected Sub GridViewAssignments_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridViewAssignments.RowDeleted
        WebMessageBoxAssignment.Show("Assignment Has Been Deleted Successfully!", "Success")
        LabelStatus.Text = ""
        PanelAssignmentQuestions.Visible = False
    End Sub

    Protected Sub GridViewAssignments_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAssignments.SelectedIndexChanged
        LabelStatus.Text = ""
        PanelAssignmentQuestions.Visible = True
        PanelNewQuestion.Visible = False
    End Sub

    Protected Sub GridViewAssignmentsQuestions_PageIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAssignmentsQuestions.PageIndexChanged
        LabelStatus.Text = ""
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

    Protected Sub GridViewAssignmentsQuestions_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridViewAssignmentsQuestions.RowDeleted
        WebMessageBoxAssignment.Show("Question Has Been Deleted Successfully!", "Success")
        GridViewAssignmentsQuestions.DataBind()
    End Sub

    Protected Sub GridViewAssignmentsQuestions_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles GridViewAssignmentsQuestions.RowUpdated
        WebMessageBoxAssignment.Show("Question Has Been Updated Successfully!", "Success")
        GridViewAssignmentsQuestions.DataBind()
        PanelResponses.Visible = False
    End Sub

    Protected Sub GridViewResponsesEditMC_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridViewResponsesEditMC.RowDeleted
        WebMessageBoxAssignment.Show("Response Has Been Deleted Successfully!", "Success")
        GridViewResponsesEditMC.DataBind()
    End Sub

    Protected Sub GridViewResponsesEditMC_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles GridViewResponsesEditMC.RowUpdated
        WebMessageBoxAssignment.Show("Question Response Has Been Updated Successfully!", "Success")
        GridViewResponsesEditMC.DataBind()
    End Sub

    Protected Sub FormViewResponsesEditSA_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewResponsesEditSA.ItemUpdated
        WebMessageBoxAssignment.Show("Question Response Has Been Updated Successfully!", "Success")
    End Sub

    Protected Sub FormViewResponsesEditTF_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewResponsesEditTF.ItemUpdated
        WebMessageBoxAssignment.Show("Question Response Has Been Updated Successfully!", "Success")
    End Sub

    Protected Sub DropDownListQuestionTypes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListQuestionTypes.SelectedIndexChanged
        If DropDownListQuestionTypes.SelectedValue = 1 Then
            PanelMultipleChoice.Visible = True
            PanelTrueFalse.Visible = False
            PanelShortAnswer.Visible = False
            PanelYesNo.Visible = False
        ElseIf DropDownListQuestionTypes.SelectedValue = 2 Then
            PanelMultipleChoice.Visible = False
            PanelTrueFalse.Visible = True
            PanelShortAnswer.Visible = False
            PanelYesNo.Visible = False
        ElseIf DropDownListQuestionTypes.SelectedValue = 3 Then
            PanelMultipleChoice.Visible = False
            PanelTrueFalse.Visible = False
            PanelShortAnswer.Visible = True
            PanelYesNo.Visible = False
        ElseIf DropDownListQuestionTypes.SelectedValue = 4 Then
            PanelMultipleChoice.Visible = False
            PanelTrueFalse.Visible = False
            PanelShortAnswer.Visible = False
            PanelYesNo.Visible = True
        End If
        LabelStatus.Text = ""
    End Sub

    Protected Sub SqlDataSourceAssignmentsQuestions_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSourceAssignmentsQuestions.Inserted
        LastAddedID = Convert.ToInt32(e.Command.Parameters("@LastAddedID").Value)
    End Sub

    Protected Sub ButtonSend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSend.Click
        Try

            Dim TextBoxNewQuestionNo As Integer = 0

            'MULTIPLE CHOICE
            If DropDownListQuestionTypes.SelectedValue = 1 Then

                Dim ListOfMultipleChoiceQuestionResponse As List(Of MultipleChoiceQuestionResponse) = PlaceHolderMCResponses.Controls.OfType(Of MultipleChoiceQuestionResponse).ToList

                If ListOfMultipleChoiceQuestionResponse.Count < 4 Or ListOfMultipleChoiceQuestionResponse.Count > 5 Then
                    WebMessageBoxAssignment.Show("Multiple Choice Question must have 4 or 5 Responses!", "Error")
                Else

                    SqlDataSourceAssignmentsQuestions.InsertParameters.Item("QuestionTypeID").DefaultValue = DropDownListQuestionTypes.SelectedValue
                    SqlDataSourceAssignmentsQuestions.InsertParameters.Item("Question").DefaultValue = TextBoxNewQuestion.Text
                    SqlDataSourceAssignmentsQuestions.InsertParameters.Item("QuestionNo").DefaultValue = TextBoxNewQuestionNo
                    SqlDataSourceAssignmentsQuestions.InsertParameters.Item("QuestionPoint").DefaultValue = TextBoxNewQuestionPoint.Text
                    SqlDataSourceAssignmentsQuestions.InsertParameters.Item("AssignmentID").DefaultValue = GridViewAssignments.SelectedValue

                    SqlDataSourceAssignmentsQuestions.Insert()

                    For i = 0 To ListOfMultipleChoiceQuestionResponse.Count - 1

                        SqlDataSourceAssignmentsNewQuestionsResponsesMC.InsertParameters.Clear()
                        SqlDataSourceAssignmentsNewQuestionsResponsesMC.InsertParameters.Add("AssignmentsQuestionID", LastAddedID)
                        SqlDataSourceAssignmentsNewQuestionsResponsesMC.InsertParameters.Add("Response", DirectCast(ListOfMultipleChoiceQuestionResponse(i).FindControl("TextBoxMCResponse"), TextBox).Text)
                        SqlDataSourceAssignmentsNewQuestionsResponsesMC.InsertParameters.Add("IsAnswer", DirectCast(ListOfMultipleChoiceQuestionResponse(i).FindControl("RadioButtonIsAnswer"), RadioButton).Checked)
                        SqlDataSourceAssignmentsNewQuestionsResponsesMC.Insert()

                    Next

                    WebMessageBoxAssignment.Show("Question Has Been Added Successfully!", "Success")

                    PanelNewQuestion.Visible = False
                    GridViewAssignments.DataBind()
                    GridViewAssignmentsQuestions.DataBind()
                End If


            ElseIf DropDownListQuestionTypes.SelectedValue = 2 Then

                SqlDataSourceAssignmentsQuestions.InsertParameters.Item("QuestionTypeID").DefaultValue = DropDownListQuestionTypes.SelectedValue
                SqlDataSourceAssignmentsQuestions.InsertParameters.Item("Question").DefaultValue = TextBoxNewQuestion.Text
                SqlDataSourceAssignmentsQuestions.InsertParameters.Item("QuestionNo").DefaultValue = TextBoxNewQuestionNo
                SqlDataSourceAssignmentsQuestions.InsertParameters.Item("QuestionPoint").DefaultValue = TextBoxNewQuestionPoint.Text
                SqlDataSourceAssignmentsQuestions.InsertParameters.Item("AssignmentID").DefaultValue = GridViewAssignments.SelectedValue

                SqlDataSourceAssignmentsQuestions.Insert()

                SqlDataSourceAssignmentsNewQuestionsResponsesTF.InsertParameters.Clear()
                SqlDataSourceAssignmentsNewQuestionsResponsesTF.InsertParameters.Add("AssignmentsQuestionID", LastAddedID)
                SqlDataSourceAssignmentsNewQuestionsResponsesTF.InsertParameters.Add("Answer", RadioButtonListTrueFalseResponse.SelectedValue)
                SqlDataSourceAssignmentsNewQuestionsResponsesTF.Insert()

                WebMessageBoxAssignment.Show("Question Has Been Added Successfully!", "Success")

                PanelNewQuestion.Visible = False
                GridViewAssignments.DataBind()
                GridViewAssignmentsQuestions.DataBind()

            ElseIf DropDownListQuestionTypes.SelectedValue = 3 Then

                SqlDataSourceAssignmentsQuestions.InsertParameters.Item("QuestionTypeID").DefaultValue = DropDownListQuestionTypes.SelectedValue
                SqlDataSourceAssignmentsQuestions.InsertParameters.Item("Question").DefaultValue = TextBoxNewQuestion.Text
                SqlDataSourceAssignmentsQuestions.InsertParameters.Item("QuestionNo").DefaultValue = TextBoxNewQuestionNo
                SqlDataSourceAssignmentsQuestions.InsertParameters.Item("QuestionPoint").DefaultValue = TextBoxNewQuestionPoint.Text
                SqlDataSourceAssignmentsQuestions.InsertParameters.Item("AssignmentID").DefaultValue = GridViewAssignments.SelectedValue

                SqlDataSourceAssignmentsQuestions.Insert()

                SqlDataSourceAssignmentsNewQuestionsResponsesSA.InsertParameters.Clear()
                SqlDataSourceAssignmentsNewQuestionsResponsesSA.InsertParameters.Add("AssignmentsQuestionID", LastAddedID)
                SqlDataSourceAssignmentsNewQuestionsResponsesSA.InsertParameters.Add("Answer", TextBoxShortAnswerResponse.Text)
                SqlDataSourceAssignmentsNewQuestionsResponsesSA.Insert()

                WebMessageBoxAssignment.Show("Question Has Been Added Successfully!", "Success")

                PanelNewQuestion.Visible = False
                GridViewAssignments.DataBind()
                GridViewAssignmentsQuestions.DataBind()

            ElseIf DropDownListQuestionTypes.SelectedValue = 4 Then

                SqlDataSourceAssignmentsQuestions.InsertParameters.Item("QuestionTypeID").DefaultValue = DropDownListQuestionTypes.SelectedValue
                SqlDataSourceAssignmentsQuestions.InsertParameters.Item("Question").DefaultValue = TextBoxNewQuestion.Text
                SqlDataSourceAssignmentsQuestions.InsertParameters.Item("QuestionNo").DefaultValue = TextBoxNewQuestionNo
                SqlDataSourceAssignmentsQuestions.InsertParameters.Item("QuestionPoint").DefaultValue = TextBoxNewQuestionPoint.Text
                SqlDataSourceAssignmentsQuestions.InsertParameters.Item("AssignmentID").DefaultValue = GridViewAssignments.SelectedValue

                SqlDataSourceAssignmentsQuestions.Insert()

                WebMessageBoxAssignment.Show("Question Has Been Added Successfully!", "Success")

                PanelNewQuestion.Visible = False
                GridViewAssignments.DataBind()
                GridViewAssignmentsQuestions.DataBind()


            End If

        Catch ex As Exception
            WebMessageBoxAssignment.Show("The following error occured: " & ex.Message, "Error")
        End Try
    End Sub

    Protected Sub ButtonUpdateInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Try

            Dim ButtonAddMore As Button = DirectCast(sender, Button)
            Dim GridviewFooter As GridViewRow = ButtonAddMore.NamingContainer

            Dim AssignmentsQuestionID As HiddenField = GridviewFooter.FindControl("HiddenFieldAssignmentID")
            Dim TextBoxResponseFooter As TextBox = GridviewFooter.FindControl("TextBoxResponseFooter")
            'SqlDataSourceAssignmentsQuestionsResponsesMC 

            SqlDataSourceAssignmentsNewQuestionsResponsesMC.InsertParameters.Clear()
            SqlDataSourceAssignmentsNewQuestionsResponsesMC.InsertParameters.Add("AssignmentsQuestionID", GridViewAssignmentsQuestions.SelectedValue)
            SqlDataSourceAssignmentsNewQuestionsResponsesMC.InsertParameters.Add("Response", TextBoxResponseFooter.Text)
            SqlDataSourceAssignmentsNewQuestionsResponsesMC.InsertParameters.Add("IsAnswer", 0)
            SqlDataSourceAssignmentsNewQuestionsResponsesMC.Insert()

            GridViewResponsesEditMC.DataBind()

            WebMessageBoxAssignment.Show("Response Has Been Added Successfully!", "Success")

        Catch ex As Exception
            WebMessageBoxAssignment.Show("Error: " & ex.Message, "Error")
        End Try
    End Sub

    Protected Sub GridViewAssignmentsQuestions_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAssignmentsQuestions.SelectedIndexChanged
        PanelResponses.Visible = True
    End Sub
End Class
