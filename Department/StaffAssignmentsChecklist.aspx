<%@ Page Title="SIS Staff Assessments" Language="VB" MasterPageFile="~/Site.Master"
    EnableEventValidation="false" AutoEventWireup="false" CodeFile="StaffAssignmentsChecklist.aspx.vb"
    Inherits="AssignmentChecklist" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        function DoCancel() {
            $get('<%=TextBoxDescription.ClientID%>').value = "";
            $get('<%=TextBoxDeadline.ClientID%>').value = "";
        }
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div id="right_wrap">
                <div id="right_content">
                    <h2>
                        INFORMATION</h2>
                    <br />
                    <div id="divChild">
                        <asp:Label ID="Label36" runat="server" Text="Select An Assigment to See Questions:"
                            ForeColor="Red" Font-Bold="True"></asp:Label>
                        <br />
                        <br />
                        <asp:GridView ID="GridViewAssignments" runat="server" AutoGenerateColumns="False"
                            DataSourceID="SqlDataSourceAssignments" Width="100%" DataKeyNames="AssignmentID">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButtonSelect" runat="server" CommandName="Select" ImageUrl="~/Staff/Images/info.png" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="35px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="AssignmentDetails" HeaderText="Assignments" SortExpression="AssignmentDetails" />
                                <asp:TemplateField HeaderText="Deadline" SortExpression="DateDeadline">
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
                            <SelectedRowStyle BackColor="#FFFFCC" />
                        </asp:GridView>
                        <br />
                        <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        <br />
                        <br />
                        <asp:Panel ID="PanelAssignmentQuestions" runat="server" BackColor="#E9FFA6" BorderColor="#009933"
                            BorderStyle="Solid" BorderWidth="1px" Visible="False">
                            <asp:GridView ID="GridViewAssignmentsQuestions" runat="server" AutoGenerateColumns="False"
                                DataSourceID="SqlDataSourceAssignmentsQuestions" Width="100%" DataKeyNames="AssignmentsQuestionID"
                                AllowPaging="True" PageSize="1" ShowHeader="False">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <strong>
                                                <%# Container.DataItemIndex + 1 %>
                                            </strong>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Question" SortExpression="Question">
                                        <ItemTemplate>
                                            <table width="100%">
                                                <tr>
                                                    <td height="25" width="25">
                                                        
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label36gh" runat="server" Font-Bold="True" ForeColor="Red" Text="Question:"></asp:Label>
                                                    </td>
                                                    <td width="25">
                                                        
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
                                                    <td height="25">
                                                        
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label38" runat="server" Font-Bold="True" ForeColor="Red" Text="Question No:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25">
                                                        
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="TextBoxQuestionNo" runat="server" Text='<%# Bind("QuestionNo") %>'
                                                            Width="98%"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25">
                                                        
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label39" runat="server" Font-Bold="True" ForeColor="Red" Text="Question Point:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25">
                                                        
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="TextBoxQuestionPoint" runat="server" Text='<%# Bind("QuestionPoint") %>'
                                                            Width="98%"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25">
                                                        
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label37" runat="server" Font-Bold="True" ForeColor="Red" Text="Response:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        
                                                    </td>
                                                    <td>
                                                        <asp:HiddenField ID="HiddenFieldQuestionTypeID" runat="server" Value='<%# Eval("QuestionTypeID") %>' />
                                                        <asp:GridView ID="GridViewResponsesEditMC" runat="server" AutoGenerateColumns="False"
                                                            DataKeyNames="ResponseID" DataSourceID="SqlDataSourceAssignmentsQuestionsResponsesMC"
                                                            ShowHeader="False" Width="100%">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Response" SortExpression="Response">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TextBoxResponse" runat="server" Height="100px" Text='<%# Bind("Response") %>'
                                                                            TextMode="MultiLine" Width="98%"></asp:TextBox>
                                                                        <br />
                                                                        <asp:HtmlEditorExtender ID="TextBoxResponse_HtmlEditorExtender" runat="server" TargetControlID="TextBoxResponse">
                                                                        </asp:HtmlEditorExtender>
                                                                    </ItemTemplate>
                                                                    <ItemStyle BackColor="White" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="A" SortExpression="IsAnswer">
                                                                    <ItemTemplate>
                                                                        <asp:RadioButton ID="RadioButtonResponse" runat="server" Checked='<%# Bind("IsAnswer") %>'
                                                                            GroupName="MC" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="D">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Delete" ImageUrl="~/Staff/Images/delete.gif" />
                                                                        <asp:ConfirmButtonExtender ID="ImageButton2_ConfirmButtonExtender" runat="server"
                                                                            ConfirmText="Do you want to Delete this Response?" Enabled="True" TargetControlID="ImageButton2">
                                                                        </asp:ConfirmButtonExtender>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </td>
                                                    <td>
                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        
                                                    </td>
                                                    <td>
                                                        <asp:FormView ID="FormViewResponsesEditTF" runat="server" BackColor="#CCCCCC" BorderColor="#666666"
                                                            BorderStyle="Solid" BorderWidth="1px" DataSourceID="SqlDataSourceAssignmentsQuestionsResponsesTF"
                                                            DefaultMode="Edit" Width="100%" DataKeyNames="ResponseID">
                                                            <EditItemTemplate>
                                                                <table width="100%">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label29" runat="server" Font-Bold="True" Text="True False Response:"></asp:Label>
                                                                        </td>
                                                                        <td height="25" width="80">
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:RadioButtonList ID="RadioButtonListTrueFalseResponse" runat="server" RepeatDirection="Horizontal"
                                                                                SelectedValue='<%# Bind("Answer") %>'>
                                                                                <asp:ListItem>True</asp:ListItem>
                                                                                <asp:ListItem>False</asp:ListItem>
                                                                            </asp:RadioButtonList>
                                                                        </td>
                                                                        <td height="50" width="80">
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:HiddenField ID="HiddenFieldResponseID" runat="server" Value='<%# Eval("ResponseID") %>' />
                                                                        </td>
                                                                        <td height="25" width="80">
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </EditItemTemplate>
                                                        </asp:FormView>
                                                        <asp:FormView ID="FormViewResponsesEditSA" runat="server" BackColor="#CCCCCC" BorderColor="#666666"
                                                            BorderStyle="Solid" BorderWidth="1px" DataSourceID="SqlDataSourceAssignmentsQuestionsResponsesSA"
                                                            DefaultMode="Edit" Width="100%" DataKeyNames="ResponseID">
                                                            <EditItemTemplate>
                                                                <table width="100%">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label29" runat="server" Font-Bold="True" Text="Short Answer Response:"></asp:Label>
                                                                        </td>
                                                                        <td height="25" width="80">
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:TextBox ID="TextBoxShortAnswerResponse" runat="server" Height="50px" Text='<%# Bind("Answer") %>'
                                                                                TextMode="MultiLine" Width="98%"></asp:TextBox>
                                                                        </td>
                                                                        <td height="50" width="80">
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:HiddenField ID="HiddenFieldResponseID" runat="server" Value='<%# Eval("ResponseID") %>' />
                                                                        </td>
                                                                        <td height="25" width="80">
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </EditItemTemplate>
                                                        </asp:FormView>
                                                    </td>
                                                    <td>
                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="35">
                                                        
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="ButtonUpdateChanges" runat="server" Height="25px" OnClick="ButtonUpdateChanges_Click"
                                                            Text="Update Changes" Width="100%" />
                                                    </td>
                                                    <td>
                                                        
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:HiddenField ID="HiddenFieldAssignmentID" runat="server" Value='<%# Eval("AssignmentsQuestionID") %>' />
                                            <asp:SqlDataSource ID="SqlDataSourceAssignmentsQuestionsResponsesMC" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" InsertCommand="INSERT INTO tbl_AssignmentsQuestionsResponsesMC(AssignmentsQuestionID, Response, IsAnswer) VALUES (@AssignmentsQuestionID, @Response, @IsAnswer)"
                                                SelectCommand="SELECT ResponseID, AssignmentsQuestionID, Response, IsAnswer FROM tbl_AssignmentsQuestionsResponsesMC WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)"
                                                UpdateCommand="UPDATE tbl_AssignmentsQuestionsResponsesMC SET Response = @Response, IsAnswer = @IsAnswer WHERE (ResponseID = @ResponseID)"
                                                DeleteCommand="DELETE FROM tbl_AssignmentsQuestionsResponsesMC WHERE (ResponseID = @ResponseID)">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="ResponseID" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="AssignmentsQuestionID" />
                                                    <asp:Parameter Name="Response" />
                                                    <asp:Parameter Name="IsAnswer" />
                                                </InsertParameters>
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="HiddenFieldAssignmentID" Name="AssignmentsQuestionID"
                                                        PropertyName="Value" />
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
                                                    <asp:ControlParameter ControlID="HiddenFieldAssignmentID" Name="AssignmentsQuestionID"
                                                        PropertyName="Value" />
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
                                                    <asp:ControlParameter ControlID="HiddenFieldAssignmentID" Name="AssignmentsQuestionID"
                                                        PropertyName="Value" />
                                                </SelectParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="Answer" />
                                                    <asp:Parameter Name="ResponseID" />
                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                                        </ItemTemplate>
                                        <ItemStyle BackColor="White" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButtonDelete" runat="server" CommandName="Delete" ImageUrl="~/Staff/Images/Delete24.png" />
                                            <asp:ConfirmButtonExtender ID="ImageButtonDelete_ConfirmButtonExtender" runat="server"
                                                ConfirmText="Are you sure, you want to delete?" Enabled="True" TargetControlID="ImageButtonDelete">
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
                        <asp:Panel ID="PanelNewQuestion" runat="server" BackColor="#E9FFA6" BorderColor="#009933"
                            BorderStyle="Solid" BorderWidth="1px" Visible="False">
                            <table width="100%">
                                <tr>
                                    <td height="30" width="50">
                                        
                                    </td>
                                    <td>
                                        <asp:Label ID="Label25" runat="server" Font-Bold="True" Text="Question:"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxNewQuestion"
                                            ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" ValidationGroup="NewQuestion"></asp:RequiredFieldValidator>
                                    </td>
                                    <td width="80">
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="50" width="50">
                                        
                                    </td>
                                    <td bgcolor="White">
                                        <asp:TextBox ID="TextBoxNewQuestion" runat="server" Height="150px" TextMode="MultiLine"
                                            Width="100%"></asp:TextBox>
                                        <asp:HtmlEditorExtender ID="HtmlEditorExtender1" runat="server" TargetControlID="TextBoxNewQuestion">
                                        </asp:HtmlEditorExtender>
                                    </td>
                                    <td width="80">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30" width="50">
                                        
                                    </td>
                                    <td>
                                        <asp:Label ID="Label39gh" runat="server" Font-Bold="True" Text="Question No:"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorQuestionNo" runat="server"
                                            ControlToValidate="TextBoxNewQuestionNo" ErrorMessage="(*)" Font-Bold="True"
                                            ForeColor="Red" ValidationGroup="NewQuestion"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="RangeValidatorQuestionNo" runat="server" ControlToValidate="TextBoxNewQuestionNo"
                                            ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" Type="Integer" ValidationGroup="NewQuestion"
                                            MaximumValue="100" MinimumValue="0"></asp:RangeValidator>
                                    </td>
                                    <td width="80">
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30" width="50">
                                        
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxNewQuestionNo" runat="server" Width="98%"></asp:TextBox>
                                    </td>
                                    <td width="80">
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30" width="50">
                                        
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
                                    <td width="80">
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30" width="50">
                                        
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxNewQuestionPoint" runat="server" Width="98%"></asp:TextBox>
                                    </td>
                                    <td width="80">
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30" width="50">
                                        
                                    </td>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Question Type"></asp:Label>
                                    </td>
                                    <td width="80">
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30" width="50">
                                        
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownListQuestionTypes" runat="server" AppendDataBoundItems="True"
                                            AutoPostBack="True" Width="100%">
                                            <asp:ListItem Value="0">Not Selected</asp:ListItem>
                                            <asp:ListItem Value="1">Multiple Choice</asp:ListItem>
                                            <asp:ListItem Value="2">True / False</asp:ListItem>
                                            <asp:ListItem Value="3">Essay Question</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td width="80">
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30" width="50">
                                        
                                    </td>
                                    <td>
                                        <asp:Panel ID="PanelMultipleChoice" runat="server" BackColor="#FFFFCC" BorderColor="#FF6600"
                                            BorderStyle="Solid" BorderWidth="1px" Visible="False">
                                            <table width="100%">
                                                <tr>
                                                    <td height="50" width="25">
                                                        
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="btnAdd" runat="server" OnClick="AddTextBox" Text="Add New" />
                                                    </td>
                                                    <td width="25">
                                                        
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <asp:Panel ID="PanelTrueFalse" runat="server" Visible="False" BackColor="#FFCCCC"
                                            BorderColor="#CC0000" BorderStyle="Solid" BorderWidth="1px">
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
                                        <asp:Panel ID="PanelShortAnswer" runat="server" Visible="False" BackColor="#FF9E5E"
                                            BorderColor="#CC0000" BorderStyle="Solid" BorderWidth="1px">
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
                                    </td>
                                    <td width="80">
                                        
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table width="100%">
                                <tr>
                                    <td height="50" width="50">
                                        
                                    </td>
                                    <td>
                                        <asp:Button ID="ButtonSend" runat="server" Height="25px" Text="Submit" Width="100%"
                                            ValidationGroup="NewQuestion" />
                                        <asp:ConfirmButtonExtender ID="ButtonSend_ConfirmButtonExtender" runat="server" ConfirmText="Are you sure, you want to add this question?"
                                            TargetControlID="ButtonSend">
                                        </asp:ConfirmButtonExtender>
                                    </td>
                                    <td width="80">
                                        
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:SqlDataSource ID="SqlDataSourceAssignments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                            DeleteCommand="DELETE FROM tbl_Assignments WHERE (AssignmentID = @AssignmentID)"
                            InsertCommand="INSERT INTO tbl_Assignments(AssignmentDetails, StaffID, DateAdded, DateDeadline, AcademicTermID, SchoolCode, isActive, RoleID) VALUES (@AssignmentDetails, @StaffID, @DateAdded, @DateDeadline, @AcademicTermID, @SchoolCode, @isActive, @RoleID)"
                            
                            SelectCommand="SELECT tbl_Assignments.AssignmentID, tbl_Assignments.AssignmentDetails, tbl_Assignments.DateDeadline, tbl_Assignments.isActive, tbl_Assignments.StaffID FROM tbl_Assignments INNER JOIN aspnet_Roles ON tbl_Assignments.RoleID = aspnet_Roles.RoleId WHERE (tbl_Assignments.AcademicTermID = @AcademicTermID) AND (tbl_Assignments.StaffID = @StaffID) AND (aspnet_Roles.RoleName = N'Staff')">
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
                                <asp:ControlParameter ControlID="DropDownListAcademicTerms" Name="AcademicTermID"
                                    PropertyName="SelectedValue" />
                                <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                            </SelectParameters>
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
                                <asp:Parameter Direction="Output" Name="LastAddedID" Type="Int32" />
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
                        <asp:ModalPopupExtender ID="MPEAssignments" runat="server" PopupControlID="PanelAssignments"
                            TargetControlID="ButtonShowAssignments" CancelControlID="ButtonCloseAssignments"
                            BackgroundCssClass="modalBackground" OnCancelScript="DoCancel()">
                        </asp:ModalPopupExtender>
                        <asp:Panel ID="PanelAssignments" runat="server" CssClass="modalPopup" Width="250px"
                            Style="display: none;">
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
                                        <asp:Label ID="Label28" runat="server" Text="Assignment Deadline:" Font-Bold="True"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxDeadline"
                                            ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" ValidationGroup="NewAssignment"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:TextBox ID="TextBoxDeadline" runat="server" MaxLength="50" Width="95%"></asp:TextBox>
                                        <asp:CalendarExtender ID="TextBoxDeadline_CalendarExtender" runat="server" TargetControlID="TextBoxDeadline">
                                        </asp:CalendarExtender>
                                        <asp:MaskedEditExtender ID="MaskedEditExtenderDeadline" runat="server" TargetControlID="TextBoxDeadline"
                                            MaskType="Date" Mask="99/99/9999" CultureName="id-ID">
                                        </asp:MaskedEditExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="ButtonAddAssignment" runat="server" Text="Add Assignment" Width="99%"
                                            ValidationGroup="NewAssignment" />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:Label ID="LabelStatusAssignments" runat="server" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                            SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms">
                        </asp:SqlDataSource>
                        <br />
                    </div>
                </div>
            </div>
            <div class="sidebar" id="sidebar">
                <h2>
                    ASSIGNMENT
                </h2>
                <br />
                <table class="SISTable" width="230">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                                NavigateUrl="~/Department/Default.aspx">Add New</asp:HyperLink>
                        </td>
                        <td class="style1">
                            <asp:Label ID="Label1" runat="server" Text="Department Home"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="SISTable" width="230">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink2" runat="server" Enabled="False" ImageUrl="~/Coordinators/Images/editor.png"
                                NavigateUrl="~/Staff/AssignmentsChecklist.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="Assignments Checklist"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="SISTable" width="230">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                                NavigateUrl="~/Department/StaffAssignmentsArchive.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label27" runat="server" Text="Assignments Archive"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="SISTable" width="230">
                    <tr>
                        <td height="35">
                            <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" Width="95%" DataSourceID="SqlDataSourceAcademicTerms"
                                DataTextField="AcademicTerm" DataValueField="AcademicTermID" Enabled="False">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="35">
                            <asp:Button ID="ButtonShowAssignments" runat="server" Text="Add Assigment" Width="95%" />
                        </td>
                    </tr>
                    <tr>
                        <td height="35">
                            <asp:Button ID="ButtonNewQuestion" runat="server" Text="Add New Question" Width="95%" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="clear">
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="GridViewAssignmentsQuestions" />
            <asp:PostBackTrigger ControlID="DropDownListQuestionTypes" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
