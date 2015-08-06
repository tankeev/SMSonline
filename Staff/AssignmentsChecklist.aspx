<%@ Page Title="SIS Staff Assessments" Language="VB" MasterPageFile="~/Site.Master"
    EnableEventValidation="false" AutoEventWireup="false" CodeFile="AssignmentsChecklist.aspx.vb"
    Inherits="AssignmentChecklist" %>

<%@ Register Src="MultipleChoiceQuestionResponse.ascx" TagName="MutipleChoiceQuestionResponse"
    TagPrefix="usmcr" %>
<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uswnb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuAssignments.ascx" TagName="MenuAssignments" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">

        function RadioCheck(rb) {
            var gv = document.getElementById("<%=GridViewResponsesEditMC.ClientID%>");
            var rbs = gv.getElementsByTagName("input");
            var row = rb.parentNode.parentNode;
            for (var i = 0; i < rbs.length; i++) {
                if (rbs[i].type == "radio") {
                    if (rbs[i].checked && rbs[i] != rb) {
                        rbs[i].checked = false;
                        break;
                    }
                }
            }
        }


        function RadioCheckEdit(rb) {
            var gv = document.getElementById("<%=GridViewAssignmentsQuestions.ClientID%>");
            var rbs = gv.getElementsByTagName("input");
            var row = rb.parentNode.parentNode;
            for (var i = 0; i < rbs.length; i++) {
                if (rbs[i].type == "radio") {
                    if (rbs[i].checked && rbs[i] != rb) {
                        rbs[i].checked = false;
                        break;
                    }
                }
            }
        }     
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU
                </h2>
                <br />
                <uc1:MenuAssignments ID="MenuAssignments" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:ImageButton ID="ImageButtonShowAssignments" runat="server" ImageUrl="~/Staff/Images/menu_assignments_add.png" />
                        </td>
                        <td>
                            <asp:Label ID="Labdel1" runat="server" Text="Add New Assignment"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:ImageButton ID="ImageButtonNewQuestion" runat="server" ImageUrl="~/Staff/Images/menu_assignments_question.png" />
                        </td>
                        <td>
                            <asp:Label ID="Labdel2" runat="server" Text="Add New Question"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Panel ID="PanelAssignments" runat="server" CssClass="modalPopup" Style="display: none;"
                    Width="250px">
                    <asp:ModalPopupExtender ID="MPEAssignments" runat="server" PopupControlID="PanelAssignments"
                        TargetControlID="ImageButtonShowAssignments" CancelControlID="ButtonCloseAssignments"
                        BackgroundCssClass="modalBackground" OnCancelScript="DoCancel()">
                    </asp:ModalPopupExtender>
                    <table>
                        <tr>
                            <td height="25" width="250">
                                <asp:Button ID="ButtonCloseAssignments" runat="server" Text="Close" Width="99%" />
                            </td>
                        </tr>
                        <tr>
                            <td height="25" width="250">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Assignment Description"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxDescription"
                                    ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" ValidationGroup="NewAssignment"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:TextBox ID="TextBoxDescription" runat="server" Width="95%" />
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Label ID="Label28" runat="server" Font-Bold="True" Text="Assignment Deadline:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxDeadline"
                                    ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" ValidationGroup="NewAssignment"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:TextBox ID="TextBoxDeadline" runat="server" MaxLength="50" Width="95%"></asp:TextBox>
                                <asp:CalendarExtender ID="TextBoxDeadline_CalendarExtender0" runat="server" TargetControlID="TextBoxDeadline">
                                </asp:CalendarExtender>
                                <asp:MaskedEditExtender ID="MaskedEditExtenderDeadline" runat="server" CultureName="id-ID"
                                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextBoxDeadline">
                                </asp:MaskedEditExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="ButtonAddAssignment" runat="server" Text="Add Assignment" ValidationGroup="NewAssignment"
                                    Width="99%" />
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Label ID="LabelStatusAssignments" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    ASSIGNMENT CHECKLIST</h2>
                <br />
                <asp:Label ID="LabelTopicStatus1" runat="server" Font-Bold="False" Font-Size="XX-Small"
                    ForeColor="Red">Step 1-a: First of all, add new Assignment by using the Add New Assignment Button from the menu left.</asp:Label>
                <br />
                <br />
                <asp:Label ID="LabelTopicStatus2" runat="server" Font-Bold="False" Font-Size="XX-Small"
                    ForeColor="Red">Step 1-b: When you add an Assignment, it appears on the list. Use the hand icon to select it.</asp:Label>
                <br />
                <br />
                <asp:Label ID="Label11" runat="server" Font-Bold="False" Font-Size="XX-Small" ForeColor="Red">Step 2-a: In order to add new question to the selected assignment, use Add New Question Button from the menu left.</asp:Label>
                <br />
                <br />
                <asp:Label ID="Label12" runat="server" Font-Bold="False" Font-Size="XX-Small" ForeColor="Red">Step 2-b: In the Add New Question Panel, 4 types of questions can be added. Multiple Choice, True-False, Essay and Yes-No.</asp:Label>
                <br />
                <br />
                <asp:Label ID="Label43" runat="server" Font-Bold="False" Font-Size="XX-Small" ForeColor="Red">Step 2-c: Yes-No Question Type may be used for preparing Surveys / Questionnaires for your students.</asp:Label>
                <br />
                <br />
                <asp:Label ID="Label13" runat="server" Font-Bold="False" Font-Size="XX-Small" ForeColor="Red">Step 3-a: When questions are added, you can assign it to your students from Assignment Archive Button from the menu left.</asp:Label>
                <br />
                <br />
                <asp:Label ID="Label36" runat="server" Text="Use Hand Icon to Select An Assignment to See Questions:"
                    ForeColor="Red" Font-Bold="True"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridViewAssignments" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceAssignments" Width="680px" DataKeyNames="AssignmentID">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonSelect" runat="server" CommandName="Select" ImageUrl="~/Staff/Images/cursor_hand.png"
                                    Width="18px" />
                                <asp:HoverMenuExtender ID="HLRC_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
                                    PopupControlID="PanelInfoSelect" PopupPosition="Right" TargetControlID="ImageButtonSelect">
                                </asp:HoverMenuExtender>
                                <asp:Panel ID="PanelInfoSelect" runat="server" CssClass="MenuToolTip" Style="display: none;"
                                    Width="230">
                                    <asp:Label ID="Label2" runat="server" Text="Assignment Questions" ForeColor="Red"
                                        Font-Bold="True"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label131" runat="server" Text="Click here to see Assignment Questions"></asp:Label>
                                    <img class="callout" src="images/callout.gif" />
                                </asp:Panel>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButtonSave" runat="server" CommandName="Update" ImageUrl="~/Staff/Images/Save-as-icon.png"
                                    Text="Button" ToolTip="Save!" Width="18px" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Edit" ImageUrl="~/Staff/Images/Text-Edit-icon.png"
                                    Text="Button" Width="18px" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Assignments" SortExpression="AssignmentDetails">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxAssignmentDetails" runat="server" Text='<%# Bind("AssignmentDetails") %>'
                                    Width="90%"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("AssignmentDetails") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Deadline" SortExpression="DateDeadline">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxDeadline" runat="server" Width="90%" Text='<%# Bind("DateDeadline") %>'></asp:TextBox>
                                <asp:CalendarExtender ID="TextBoxDeadline_CalendarExtender" runat="server" TargetControlID="TextBoxDeadline">
                                </asp:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelDeadline" runat="server" Font-Bold="True" Text='<%# Bind("DateDeadline", "{0:D}") %>'
                                    Font-Size="X-Small"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="190px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Active" SortExpression="isActive">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxActive" runat="server" Checked='<%# Bind("isActive") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="45px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Delete" ImageUrl="~/Staff/Images/Delete24.png" />
                                <asp:ConfirmButtonExtender ID="ImageButton1_ConfirmButtonExtender" runat="server"
                                    ConfirmText="Are you sure you want to Delete?" Enabled="True" TargetControlID="ImageButton1">
                                </asp:ConfirmButtonExtender>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="Images/no-data.png" />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="30px" />
                    <SelectedRowStyle BackColor="#FFFFCC" />
                </asp:GridView>
                <br />
                <br />
                <asp:Panel ID="PanelAssignmentQuestions" runat="server" BorderColor="#009933" BorderStyle="Solid"
                    BorderWidth="1px" Visible="False" Width="680px">
                    <asp:GridView ID="GridViewAssignmentsQuestions" runat="server" AutoGenerateColumns="False"
                        DataSourceID="SqlDataSourceAssignmentsQuestions" Width="680px" DataKeyNames="AssignmentsQuestionID"
                        AllowPaging="True" PageSize="1" ShowHeader="False">
                        <Columns>
                            <asp:TemplateField HeaderText="Question" SortExpression="Question">
                                <ItemTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td height="25" width="20">
                                            </td>
                                            <td>
                                                <asp:Label ID="Label36gh" runat="server" Font-Bold="True" ForeColor="Red" Text="Question Prompt:"></asp:Label>
                                            </td>
                                            <td width="20">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxQuestion" runat="server" Height="150px" Text='<%# Bind("Question") %>'
                                                    TextMode="MultiLine" Width="98%"></asp:TextBox>
                                                <asp:HtmlEditorExtender ID="TextBoxQuestion_HtmlEditorExtender" runat="server" TargetControlID="TextBoxQuestion">
                                                </asp:HtmlEditorExtender>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="80">
                                            </td>
                                            <td>
                                                <table width="100%">
                                                    <tr>
                                                        <td width="150">
                                                            <asp:Label ID="Label40" runat="server" Font-Bold="True" ForeColor="Red" Text="Question Type:"></asp:Label>
                                                        </td>
                                                        <td width="100">
                                                            <asp:Label ID="Label39" runat="server" Font-Bold="True" ForeColor="Red" Text="Question Point:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorQuestionPoint" runat="server"
                                                                ControlToValidate="TextBoxQuestionPoint" ErrorMessage="(*)" Font-Bold="True"
                                                                ForeColor="Red" ValidationGroup="UpdateQuestion"></asp:RequiredFieldValidator>
                                                            <asp:RangeValidator ID="RangeValidatorQuestionPoint" runat="server" ControlToValidate="TextBoxQuestionPoint"
                                                                ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" MaximumValue="100" MinimumValue="0"
                                                                Type="Integer" ValidationGroup="UpdateQuestion"></asp:RangeValidator>
                                                        </td>
                                                        <td width="90">
                                                            &nbsp;
                                                        </td>
                                                        <td width="90">
                                                            &nbsp;
                                                        </td>
                                                        <td width="90">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList ID="DropDownListQuestionTypes" runat="server" AppendDataBoundItems="True"
                                                                AutoPostBack="True" Enabled="False" SelectedValue='<%# Bind("QuestionTypeID") %>'
                                                                Width="90%">
                                                                <asp:ListItem Value="0">Not Selected</asp:ListItem>
                                                                <asp:ListItem Value="1">Multiple Choice</asp:ListItem>
                                                                <asp:ListItem Value="2">True / False</asp:ListItem>
                                                                <asp:ListItem Value="3">Essay Question</asp:ListItem>
                                                                <asp:ListItem Value="4">Yes / No</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="TextBoxQuestionPoint" runat="server" Text='<%# Bind("QuestionPoint") %>'
                                                                Width="90px"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="ButtonShowResopnses" runat="server" CommandName="Select" Height="25px"
                                                                Text=" Responses" Width="90%" />
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="ButtonUpdateChanges0" runat="server" CommandName="Delete" Height="25px"
                                                                Text="Delete" Width="90%" ValidationGroup="UpdateQuestion" />
                                                            <asp:ConfirmButtonExtender ID="ButtonUpdateChanges0_ConfirmButtonExtender" runat="server"
                                                                ConfirmText="Do you really want to Delete?" Enabled="True" TargetControlID="ButtonUpdateChanges0">
                                                            </asp:ConfirmButtonExtender>
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="ButtonUpdateChanges" runat="server" CommandName="Update" Height="25px"
                                                                Text="Update" ValidationGroup="UpdateQuestion" Width="90%" />
                                                            <asp:ConfirmButtonExtender ID="ButtonUpdateChanges_ConfirmButtonExtender" runat="server"
                                                                ConfirmText="Do you really want to Update?" Enabled="True" TargetControlID="ButtonUpdateChanges">
                                                            </asp:ConfirmButtonExtender>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <ItemStyle BackColor="White" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div align="center">
                                <br />
                                <img alt="" src="Images/no-data.png" />
                                <br />
                                <asp:Label ID="LabelInfo" runat="server" Font-Bold="True" ForeColor="Red" Text="Please Add A Question By Using the Menu Left."></asp:Label>
                                <br />
                                <br />
                            </div>
                        </EmptyDataTemplate>
                        <FooterStyle Font-Bold="False" />
                        <PagerStyle Font-Bold="True" Font-Size="Medium" />
                        <SelectedRowStyle BackColor="#FFFFCC" />
                    </asp:GridView>
                </asp:Panel>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceAssignmentsQuestionsResponsesMC" runat="server"
                    ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" DeleteCommand="DELETE FROM tbl_AssignmentsQuestionsResponsesMC WHERE (ResponseID = @ResponseID)"
                    InsertCommand="INSERT INTO tbl_AssignmentsQuestionsResponsesMC(AssignmentsQuestionID, Response, IsAnswer) VALUES (@AssignmentsQuestionID, @Response, @IsAnswer)"
                    SelectCommand="SELECT ResponseID, AssignmentsQuestionID, Response, IsAnswer FROM tbl_AssignmentsQuestionsResponsesMC WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)"
                    UpdateCommand="UPDATE tbl_AssignmentsQuestionsResponsesMC SET Response = @Response, IsAnswer = @IsAnswer WHERE (ResponseID = @ResponseID)">
                    <DeleteParameters>
                        <asp:Parameter Name="ResponseID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="AssignmentsQuestionID" />
                        <asp:Parameter Name="Response" />
                        <asp:Parameter Name="IsAnswer" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAssignmentsQuestions" Name="AssignmentsQuestionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Response" />
                        <asp:Parameter Name="IsAnswer" />
                        <asp:Parameter Name="ResponseID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssignmentsQuestionsResponsesTF" runat="server"
                    ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" InsertCommand="INSERT INTO tbl_AssignmentsQuestionsResponsesTF(AssignmentsQuestionID, Answer) VALUES (@AssignmentsQuestionID, @Answer)"
                    SelectCommand="SELECT ResponseID, AssignmentsQuestionID, Answer FROM tbl_AssignmentsQuestionsResponsesTF WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)"
                    UpdateCommand="UPDATE tbl_AssignmentsQuestionsResponsesTF SET Answer = @Answer WHERE (ResponseID = @ResponseID)">
                    <InsertParameters>
                        <asp:Parameter Name="AssignmentsQuestionID" />
                        <asp:Parameter Name="Answer" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAssignmentsQuestions" Name="AssignmentsQuestionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Answer" />
                        <asp:Parameter Name="ResponseID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssignmentsQuestionsResponsesSA" runat="server"
                    ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" InsertCommand="INSERT INTO tbl_AssignmentsQuestionsResponsesSA(AssignmentsQuestionID, Answer) VALUES (@AssignmentsQuestionID, @Answer)"
                    SelectCommand="SELECT ResponseID, AssignmentsQuestionID, Answer FROM tbl_AssignmentsQuestionsResponsesSA WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)"
                    UpdateCommand="UPDATE tbl_AssignmentsQuestionsResponsesSA SET Answer = @Answer WHERE (ResponseID = @ResponseID)">
                    <InsertParameters>
                        <asp:Parameter Name="AssignmentsQuestionID" />
                        <asp:Parameter Name="Answer" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAssignmentsQuestions" Name="AssignmentsQuestionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Answer" />
                        <asp:Parameter Name="ResponseID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:Panel ID="PanelResponses" runat="server" Width="680px">
                    <asp:GridView ID="GridViewResponsesEditMC" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="ResponseID" DataSourceID="SqlDataSourceAssignmentsQuestionsResponsesMC"
                        ShowFooter="True" ShowHeader="False" Width="680px">
                        <Columns>
                            <asp:TemplateField HeaderText="Response" SortExpression="Response">
                                <FooterTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td width="20">
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxResponseFooter" runat="server" Height="100px" TextMode="MultiLine"
                                                    Width="98%"></asp:TextBox>
                                            </td>
                                            <td height="25" width="20">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <table width="100%">
                                                    <tr>
                                                        <td width="100">
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td width="100">
                                                            &nbsp;
                                                        </td>
                                                        <td width="100">
                                                            <asp:Button ID="ButtonUpdateInsert" runat="server" Height="25px" Text="Insert" Width="90%"
                                                                OnClick="ButtonUpdateInsert_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td height="35">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:HtmlEditorExtender ID="TextBoxResponseFooter_HtmlEditorExtender0" runat="server"
                                        TargetControlID="TextBoxResponseFooter">
                                    </asp:HtmlEditorExtender>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td height="25" width="20">
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxResponse" runat="server" Height="100px" Text='<%# Bind("Response") %>'
                                                    TextMode="MultiLine" Width="98%"></asp:TextBox>
                                            </td>
                                            <td width="20">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="50">
                                            </td>
                                            <td>
                                                <table width="100%">
                                                    <tr>
                                                        <td width="100">
                                                            <asp:RadioButton ID="RadioButtonIsAnswer" runat="server" Text="Is Answer" onclick="RadioCheck(this);"
                                                                ValidationGroup="IsAnswer" Checked='<%# Bind("IsAnswer") %>' />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td width="90">
                                                            <asp:Button ID="ButtonDeleteResponse" runat="server" CommandName="Delete" Height="25px"
                                                                Text="Delete" Width="90%" />
                                                            <asp:ConfirmButtonExtender ID="ButtonDeleteResponse_ConfirmButtonExtender" runat="server"
                                                                ConfirmText="Do you really want to Delete?" Enabled="True" TargetControlID="ButtonDeleteResponse">
                                                            </asp:ConfirmButtonExtender>
                                                        </td>
                                                        <td width="90">
                                                            <asp:Button ID="ButtonUpdateChanges" runat="server" CommandName="Update" Height="25px"
                                                                Text="Update" Width="90%" />
                                                            <asp:ConfirmButtonExtender ID="ButtonUpdateChanges_ConfirmButtonExtender" runat="server"
                                                                ConfirmText="Do you really want to Update?" Enabled="True" TargetControlID="ButtonUpdateChanges">
                                                            </asp:ConfirmButtonExtender>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:HtmlEditorExtender ID="TextBoxResponse_HtmlEditorExtender0" runat="server" TargetControlID="TextBoxResponse">
                                    </asp:HtmlEditorExtender>
                                </ItemTemplate>
                                <ItemStyle BackColor="White" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:FormView ID="FormViewResponsesEditTF" runat="server" BorderColor="#666666" BorderStyle="Solid"
                        BorderWidth="1px" DataKeyNames="ResponseID" DataSourceID="SqlDataSourceAssignmentsQuestionsResponsesTF"
                        DefaultMode="Edit" Width="100%">
                        <EditItemTemplate>
                            <table width="100%">
                                <tr>
                                    <td width="20">
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="RadioButtonListTrueFalseResponse" runat="server" RepeatDirection="Horizontal"
                                            SelectedValue='<%# Bind("Answer") %>'>
                                            <asp:ListItem>True</asp:ListItem>
                                            <asp:ListItem>False</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td height="25" width="20">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td width="100">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td width="100">
                                                    &nbsp;
                                                </td>
                                                <td width="90">
                                                    <asp:Button ID="ButtonUpdateChanges" runat="server" CommandName="Update" Height="25px"
                                                        Text="Update" Width="90%" />
                                                    <asp:ConfirmButtonExtender ID="ButtonUpdateChanges_ConfirmButtonExtender" runat="server"
                                                        ConfirmText="Do you really want to Update?" Enabled="True" TargetControlID="ButtonUpdateChanges">
                                                    </asp:ConfirmButtonExtender>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td height="35">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                    </asp:FormView>
                    <asp:FormView ID="FormViewResponsesEditSA" runat="server" BorderColor="#666666" BorderStyle="Solid"
                        BorderWidth="1px" DataKeyNames="ResponseID" DataSourceID="SqlDataSourceAssignmentsQuestionsResponsesSA"
                        DefaultMode="Edit" Width="100%">
                        <EditItemTemplate>
                            <table width="100%">
                                <tr>
                                    <td width="20">
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxShortAnswerResponse1" runat="server" Height="50px" Text='<%# Bind("Answer") %>'
                                            TextMode="MultiLine" Width="98%"></asp:TextBox>
                                    </td>
                                    <td height="25" width="20">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td width="100">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td width="100">
                                                    &nbsp;
                                                </td>
                                                <td width="90">
                                                    <asp:Button ID="ButtonUpdateChanges" runat="server" CommandName="Update" Height="25px"
                                                        Text="Update" Width="90%" />
                                                    <asp:ConfirmButtonExtender ID="ButtonUpdateChanges_ConfirmButtonExtender" runat="server"
                                                        ConfirmText="Do you really want to Update?" Enabled="True" TargetControlID="ButtonUpdateChanges">
                                                    </asp:ConfirmButtonExtender>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                    </asp:FormView>
                </asp:Panel>
                <asp:Panel ID="PanelNewQuestion" runat="server" BorderColor="#009933" BorderStyle="Solid"
                    BorderWidth="1px" Visible="False" Width="680px">
                    <table width="100%">
                        <tr>
                            <td height="30" width="20">
                            </td>
                            <td>
                                <asp:Label ID="Label25" runat="server" Font-Bold="True" Text="Question Prompt:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxNewQuestion"
                                    ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" ValidationGroup="NewQuestion"></asp:RequiredFieldValidator>
                            </td>
                            <td width="20">
                            </td>
                        </tr>
                        <tr>
                            <td height="50">
                            </td>
                            <td bgcolor="White">
                                <asp:TextBox ID="TextBoxNewQuestion" runat="server" Height="150px" TextMode="MultiLine"
                                    Width="100%"></asp:TextBox>
                                <asp:HtmlEditorExtender ID="HtmlEditorExtender1" runat="server" TargetControlID="TextBoxNewQuestion">
                                </asp:HtmlEditorExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                            </td>
                            <td>
                                <asp:Label ID="Label40" runat="server" Font-Bold="True" Text="Question Point:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorQuestionPoint" runat="server"
                                    ControlToValidate="TextBoxNewQuestionPoint" ErrorMessage="(*)" Font-Bold="True"
                                    ForeColor="Red" ValidationGroup="NewQuestion"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidatorQuestionPoint" runat="server" ControlToValidate="TextBoxNewQuestionPoint"
                                    ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" Type="Integer" ValidationGroup="NewQuestion"
                                    MaximumValue="100" MinimumValue="0"></asp:RangeValidator>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxNewQuestionPoint" runat="server" Width="98%"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                            </td>
                            <td>
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Question Type:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorQuestionType" runat="server"
                                    ControlToValidate="DropDownListQuestionTypes" ErrorMessage="(*)" Font-Bold="True"
                                    ForeColor="Red" InitialValue="0" ValidationGroup="NewQuestion"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListQuestionTypes" runat="server" AppendDataBoundItems="True"
                                    AutoPostBack="True" Width="100%">
                                    <asp:ListItem Value="0">Not Selected</asp:ListItem>
                                    <asp:ListItem Value="1">Multiple Choice</asp:ListItem>
                                    <asp:ListItem Value="2">True / False</asp:ListItem>
                                    <asp:ListItem Value="3">Essay Question</asp:ListItem>
                                    <asp:ListItem Value="4">Yes / No</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                            </td>
                            <td>
                                <asp:Panel ID="PanelMultipleChoice" runat="server" BorderColor="#FF6600" BorderStyle="Solid"
                                    BorderWidth="1px" Visible="False">
                                    <table width="100%">
                                        <tr>
                                            <td height="50" width="25">
                                            </td>
                                            <td>
                                                <asp:Button ID="btnAdd" runat="server" Text="Add New" />
                                            </td>
                                            <td width="25">
                                                <!--The text value determines how many items are initially displayed on the page-->
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="50" width="25">
                                            </td>
                                            <td>
                                                <asp:PlaceHolder ID="PlaceHolderMCResponses" runat="server"></asp:PlaceHolder>
                                                <asp:Literal ID="ltlValues" runat="server" />
                                                <asp:Literal ID="ltlCount" runat="server" Text="0" Visible="false" />
                                                <asp:Literal ID="ltlRemoved" runat="server" Visible="false" />
                                            </td>
                                            <td width="25">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="PanelTrueFalse" runat="server" Visible="False" BorderColor="#CC0000"
                                    BorderStyle="Solid" BorderWidth="1px">
                                    <table width="100%">
                                        <tr>
                                            <td height="50" width="25">
                                            </td>
                                            <td>
                                                <asp:Label ID="Label34" runat="server" Font-Bold="True" Text="Responses:"></asp:Label>
                                            </td>
                                            <td width="25">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="50">
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="RadioButtonListTrueFalseResponse" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True">True</asp:ListItem>
                                                    <asp:ListItem>False</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="PanelShortAnswer" runat="server" Visible="False" BorderColor="#CC0000"
                                    BorderStyle="Solid" BorderWidth="1px">
                                    <table width="100%">
                                        <tr>
                                            <td height="50" width="25">
                                            </td>
                                            <td>
                                                <asp:Label ID="Label35" runat="server" Font-Bold="True" Text="Responses:"></asp:Label>
                                            </td>
                                            <td width="25">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="50">
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxShortAnswerResponse" runat="server" Height="50px" TextMode="MultiLine"
                                                    Width="100%"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="25">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="PanelYesNo" runat="server" BorderColor="#CC0000" BorderStyle="Solid"
                                    BorderWidth="1px" Visible="False">
                                    <table width="100%">
                                        <tr>
                                            <td height="50" width="25">
                                            </td>
                                            <td>
                                                <asp:Label ID="Label41" runat="server" Font-Bold="True" Text="Responses:"></asp:Label>
                                            </td>
                                            <td width="25">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="50">
                                            </td>
                                            <td>
                                                <asp:Label ID="Label42" runat="server" Text="This Option is used for Survey Questions, there is no answer."></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                    <table width="100%">
                        <tr>
                            <td height="50" width="20">
                            </td>
                            <td>
                                <asp:Button ID="ButtonSend" runat="server" Height="25px" Text="Submit Question" Width="100%"
                                    ValidationGroup="NewQuestion" />
                                <asp:ConfirmButtonExtender ID="ButtonSend_ConfirmButtonExtender" runat="server" ConfirmText="Are you sure, you want to add this question?"
                                    TargetControlID="ButtonSend">
                                </asp:ConfirmButtonExtender>
                            </td>
                            <td width="20">
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceAssignments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    DeleteCommand="DELETE FROM tbl_Assignments WHERE (AssignmentID = @AssignmentID)"
                    InsertCommand="INSERT INTO tbl_Assignments(AssignmentDetails, StaffID, DateAdded, DateDeadline, AcademicTermID, SchoolCode, isActive, RoleID) VALUES (@AssignmentDetails, @StaffID, @DateAdded, @DateDeadline, @AcademicTermID, @SchoolCode, @isActive, @RoleID)"
                    SelectCommand="SELECT tbl_Assignments.AssignmentID, tbl_Assignments.AssignmentDetails, tbl_Assignments.DateDeadline, tbl_Assignments.isActive, tbl_Assignments.StaffID, aspnet_Roles.RoleName FROM tbl_Assignments INNER JOIN aspnet_Roles ON tbl_Assignments.RoleID = aspnet_Roles.RoleId WHERE (tbl_Assignments.AcademicTermID = @AcademicTermID) AND (tbl_Assignments.StaffID = @StaffID) AND (aspnet_Roles.RoleName = N'Student')"
                    UpdateCommand="UPDATE tbl_Assignments SET DateDeadline = @DateDeadline, AssignmentDetails = @AssignmentDetails WHERE (AssignmentID = @AssignmentID)">
                    <DeleteParameters>
                        <asp:Parameter Name="AssignmentID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="AssignmentDetails" />
                        <asp:Parameter Name="StaffID" />
                        <asp:Parameter Name="DateAdded" />
                        <asp:Parameter Name="DateDeadline" />
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="SchoolCode" />
                        <asp:Parameter Name="isActive" />
                        <asp:Parameter Name="RoleID" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DateDeadline" />
                        <asp:Parameter Name="AssignmentDetails" />
                        <asp:Parameter Name="AssignmentID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssignmentsQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    DeleteCommand="DELETE FROM tbl_AssignmentsQuestions WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)"
                    InsertCommand="INSERT INTO tbl_AssignmentsQuestions (AssignmentID, QuestionTypeID, Question, QuestionNo, QuestionPoint) VALUES (@AssignmentID,@QuestionTypeID,@Question,@QuestionNo,@QuestionPoint) SET @LastAddedID = SCOPE_IDENTITY();"
                    SelectCommand="SELECT AssignmentsQuestionID, AssignmentID, QuestionNo, QuestionTypeID, Question, QuestionPoint FROM tbl_AssignmentsQuestions WHERE (AssignmentID = @AssignmentID)"
                    UpdateCommand="UPDATE tbl_AssignmentsQuestions SET Question = @Question, QuestionNo = @QuestionNo, QuestionPoint = @QuestionPoint WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)">
                    <DeleteParameters>
                        <asp:Parameter Name="AssignmentsQuestionID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="AssignmentID" />
                        <asp:Parameter Name="QuestionTypeID" />
                        <asp:Parameter Name="Question" />
                        <asp:Parameter Name="QuestionNo" />
                        <asp:Parameter Name="QuestionPoint" />
                        <asp:Parameter Name="LastAddedID" Direction="Output" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAssignments" Name="AssignmentID" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Question" />
                        <asp:Parameter Name="QuestionNo" />
                        <asp:Parameter Name="QuestionPoint" />
                        <asp:Parameter Name="AssignmentsQuestionID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssignmentsNewQuestionsResponsesMC" runat="server"
                    ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" InsertCommand="INSERT INTO tbl_AssignmentsQuestionsResponsesMC(AssignmentsQuestionID, Response, IsAnswer) VALUES (@AssignmentsQuestionID, @Response, @IsAnswer)"
                    SelectCommand="SELECT ResponseID, AssignmentsQuestionID, Response, IsAnswer FROM tbl_AssignmentsQuestionsResponsesMC WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)">
                    <InsertParameters>
                        <asp:Parameter Name="AssignmentsQuestionID" />
                        <asp:Parameter Name="Response" />
                        <asp:Parameter Name="IsAnswer" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAssignments" Name="AssignmentsQuestionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssignmentsNewQuestionsResponsesTF" runat="server"
                    ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" InsertCommand="INSERT INTO tbl_AssignmentsQuestionsResponsesTF(AssignmentsQuestionID, Answer) VALUES (@AssignmentsQuestionID, @Answer)"
                    SelectCommand="SELECT ResponseID, AssignmentsQuestionID, Answer FROM tbl_AssignmentsQuestionsResponsesTF WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)">
                    <InsertParameters>
                        <asp:Parameter Name="AssignmentsQuestionID" />
                        <asp:Parameter Name="Answer" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAssignments" Name="AssignmentsQuestionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssignmentsNewQuestionsResponsesSA" runat="server"
                    ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" InsertCommand="INSERT INTO tbl_AssignmentsQuestionsResponsesSA(AssignmentsQuestionID, Answer) VALUES (@AssignmentsQuestionID, @Answer)"
                    SelectCommand="SELECT ResponseID, AssignmentsQuestionID, Answer FROM tbl_AssignmentsQuestionsResponsesSA WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)">
                    <InsertParameters>
                        <asp:Parameter Name="AssignmentsQuestionID" />
                        <asp:Parameter Name="Answer" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAssignments" Name="AssignmentsQuestionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssignmentsNewQuestionsResponsesYN" runat="server"
                    ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" InsertCommand="INSERT INTO tbl_AssignmentsQuestionsResponsesYN(AssignmentsQuestionID, Answer) VALUES (@AssignmentsQuestionID, @Answer)"
                    SelectCommand="SELECT ResponseID, AssignmentsQuestionID, Answer FROM tbl_AssignmentsQuestionsResponsesYN WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)">
                    <InsertParameters>
                        <asp:Parameter Name="AssignmentsQuestionID" />
                        <asp:Parameter Name="Answer" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAssignments" Name="AssignmentsQuestionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT tbl_SectionCatalog.SectionCatalogID, tbl_SectionCatalog.SectionCategory, tbl_SectionCatalog.SectionGroup FROM tbl_Students INNER JOIN tbl_SectionCatalog ON tbl_Students.CurrentSectionID = tbl_SectionCatalog.SectionCatalogID WHERE (tbl_Students.SchoolCode = @SchoolCode) ORDER BY tbl_SectionCatalog.SectionGroup, tbl_SectionCatalog.SectionCategory">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                <uswnb:WebMessageBox ID="WebMessageBoxAssignment" runat="server" />
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
