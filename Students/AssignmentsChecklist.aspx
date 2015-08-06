<%@ Page Title="SIS Staff Assessments" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="AssignmentsChecklist.aspx.vb" Inherits="NewUserAccount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
    <script language="javascript" type="text/javascript">
        function SelectSingleRadiobutton(rdbtnid) {
            var rdBtn = document.getElementById(rdbtnid);
            var rdBtnList = document.getElementsByTagName("input");
            for (i = 0; i < rdBtnList.length; i++) {
                if (rdBtnList[i].type == "radio" && rdBtnList[i].id != rdBtn.id) {
                    rdBtnList[i].checked = false;
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="content-left">
        <h2>
            CLASSES</h2>
        <br />
        <table class="content-table" width="230">
            <tr>
                <td width="40">
                    <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                        NavigateUrl="~/Staff/AssignmentsChecklist.aspx" Enabled="False">Add New</asp:HyperLink>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Assignments Checklist" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table class="content-table" width="230">
            <tr>
                <td width="40">
                    <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                        NavigateUrl="~/Students/AssignmentsArchive.aspx">Add New</asp:HyperLink>
                </td>
                <td>
                    <asp:Label ID="Label27" runat="server" Text="Assignments Archive"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <br />
    </div>
    <div class="content-right">
        <h2>
            INFORMATION</h2>
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
                <asp:BoundField DataField="StaffName" HeaderText="Teacher" SortExpression="StaffName">
                    <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="AssignmentDetails" HeaderText="Assignments" SortExpression="AssignmentDetails" />
                <asp:BoundField DataField="DateDeadline" HeaderText="Deadline" SortExpression="DateDeadline"
                    DataFormatString="{0:d}">
                    <ItemStyle Width="90px" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemStyle HorizontalAlign="Center" Width="35px" />
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <div align="center">
                    <br />
                    <img alt="" src="Images/No_Assignment.png" />
                    <br />
                    <br />
                    <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Keep Calm!" ForeColor="Red"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" Text="Because there is no Assignment found! :D"></asp:Label>
                    <br />
                    <br />
                </div>
            </EmptyDataTemplate>
            <SelectedRowStyle BackColor="#FFFFCC" />
        </asp:GridView>
        <br />
        <asp:Panel ID="PanelIntroduction" runat="server" HorizontalAlign="Center" Visible="False"
            BackColor="#CCFFFF" BorderColor="#00CCFF" BorderStyle="Solid" BorderWidth="1px">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Staff/Images/Attention.png" />
            <br />
            <asp:Label ID="Label39" runat="server" Font-Bold="True" ForeColor="#FF3300" Text="You are about to take the quiz!"></asp:Label>
            <br />
            <br />
            <asp:Button ID="ButtonStart" runat="server" Text="Start!" Width="120px" />
            <br />
            <br />
        </asp:Panel>
        <br />
        <asp:Panel ID="PanelQuiz" runat="server">
            <asp:GridView ID="GridViewAssignmentsQuestions" runat="server" AllowPaging="True"
                AutoGenerateColumns="False" DataKeyNames="AssignmentsQuestionID" DataSourceID="SqlDataSourceAssignmentsQuestions"
                PageSize="1" ShowHeader="False" Width="100%">
                <Columns>
                    <asp:TemplateField>
                        <ItemStyle Width="35px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Question" SortExpression="Question">
                        <ItemTemplate>
                            <table width="100%">
                                <tr>
                                    <td valign="top" height="25">
                                        <asp:Label ID="Label38" runat="server" Font-Bold="True" ForeColor="Red" Text="Question:"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" height="50">
                                        <asp:Label ID="LabelQuestion" runat="server" Text='<%# Eval("Question") %>' Width="100%"></asp:Label>
                                        <asp:HiddenField ID="HiddenFieldAssignmentQuestionID" runat="server" Value='<%# Eval("AssignmentsQuestionID") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td height="35" width="150">
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
                                                    <asp:Label ID="LabelQuestionStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td width="90">
                                                    &nbsp;<asp:Button ID="ButtonShowResponses" runat="server" Height="25px" Text=" Responses"
                                                        Width="90%" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' CommandName="Select" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <ItemStyle BackColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemStyle Width="35px" />
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div align="center">
                        <br />
                        <img alt="" src="../Staff/Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                        <br />
                        <br />
                        <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Sorry! No Data Found!"></asp:Label>
                        <br />
                        <br />
                    </div>
                </EmptyDataTemplate>
                <FooterStyle Font-Bold="False" />
                <PagerSettings Mode="NextPrevious" NextPageImageUrl="~/Students/Images/forward.png"
                    PreviousPageImageUrl="~/Students/Images/back.png" />
                <PagerStyle Font-Bold="True" Font-Size="Medium" HorizontalAlign="Center" />
            </asp:GridView>
            <br />
            <br />
            <asp:Panel ID="PanelMC" runat="server" Visible="False">
                <table style="border: 1px solid #CC0000" width="100%">
                    <tr>
                        <td height="25" width="35">
                        </td>
                        <td>
                            <asp:GridView ID="GridViewResponsesEditMC" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="ResponseID" DataSourceID="SqlDataSourceAssignmentsQuestionsResponsesMC"
                                ShowHeader="False" Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="ResponseID" InsertVisible="False" SortExpression="ResponseID"
                                        Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelResponseID" runat="server" Text='<%# Bind("ResponseID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ResponseID") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Response" SortExpression="Response">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelResponse" runat="server" Text='<%# Eval("Response") %>' Width="100%"></asp:Label>
                                            <br />
                                        </ItemTemplate>
                                        <ItemStyle BackColor="White" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="?" SortExpression="IsAnswer">
                                        <ItemTemplate>
                                            <asp:RadioButton ID="RadioButtonResponse" runat="server" OnClick="javascript:SelectSingleRadiobutton(this.id)" />
                                        </ItemTemplate>
                                        <ItemStyle BackColor="White" HorizontalAlign="Center" Width="30px" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    No Data!
                                </EmptyDataTemplate>
                                <RowStyle Height="30px" />
                            </asp:GridView>
                        </td>
                        <td width="35">
                        </td>
                    </tr>
                    <tr>
                        <td height="50">
                        </td>
                        <td>
                            <table width="100%">
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td width="90">
                                        <asp:Button ID="ButtonInsertMC" runat="server" Height="25px" Text="Submit" Width="90%" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="PanelTF" runat="server" Visible="False">
                <table style="border: 1px solid #CC0000" width="100%">
                    <tr>
                        <td height="25" width="35">
                        </td>
                        <td>
                            <asp:FormView ID="FormViewResponsesEditTF" runat="server" BorderColor="#666666" BorderStyle="Solid"
                                BorderWidth="1px" DataKeyNames="ResponseID" DataSourceID="SqlDataSourceAssignmentsQuestionsResponsesTF"
                                DefaultMode="Insert" Width="100%">
                                <InsertItemTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label29" runat="server" Font-Bold="True" Text="True False Response:"></asp:Label>
                                            </td>
                                            <td height="25" width="80">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" height="75">
                                                <asp:RadioButtonList ID="RadioButtonListTrueFalseResponse" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem>True</asp:ListItem>
                                                    <asp:ListItem>False</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td height="25" width="90">
                                                <asp:Button ID="ButtonUpdateChanges" runat="server" CommandName="Insert" Height="25px"
                                                    Text="Submit" Width="90%" />
                                            </td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                            </asp:FormView>
                        </td>
                        <td width="35">
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="PanelSA" runat="server" Visible="False">
                <table style="border: 1px solid #CC0000" width="100%">
                    <tr>
                        <td height="25" width="35">
                        </td>
                        <td>
                            <asp:FormView ID="FormViewResponsesEditSA" runat="server" BorderColor="#666666" BorderStyle="Solid"
                                BorderWidth="1px" DataKeyNames="ResponseID" DataSourceID="SqlDataSourceAssignmentsQuestionsResponsesSA"
                                DefaultMode="Insert" Width="100%">
                                <InsertItemTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label40" runat="server" Font-Bold="True" Text="Short Answer Response:"></asp:Label>
                                            </td>
                                            <td height="25" width="90">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" height="75">
                                                <asp:TextBox ID="TextBoxShortAnswerResponse" runat="server" Height="50px" TextMode="MultiLine"
                                                    Width="98%"></asp:TextBox>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td height="25">
                                                <asp:Button ID="ButtonUpdateChanges" runat="server" CommandName="Insert" Height="25px"
                                                    Text="Submit" Width="90%" />
                                            </td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                            </asp:FormView>
                        </td>
                        <td width="35">
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="PanelYN" runat="server" Visible="False">
                <table style="border: 1px solid #CC0000" width="100%">
                    <tr>
                        <td height="25" width="35">
                        </td>
                        <td>
                            <asp:FormView ID="FormViewResponsesEditYN" runat="server" BorderColor="#666666" BorderStyle="Solid"
                                BorderWidth="1px" DataKeyNames="ResponseID" DataSourceID="SqlDataSourceAssignmentsQuestionsResponsesYN"
                                DefaultMode="Insert" Width="100%">
                                <InsertItemTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label42" runat="server" Font-Bold="True" Text="Yes No Response:"></asp:Label>
                                            </td>
                                            <td height="25" width="80">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" height="75">
                                                <asp:RadioButtonList ID="RadioButtonListTrueFalseResponse1" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="No">Yes</asp:ListItem>
                                                    <asp:ListItem>No</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td height="25" width="90">
                                                <asp:Button ID="ButtonUpdateChanges" runat="server" CommandName="Insert" Height="25px"
                                                    Text="Submit" Width="90%" />
                                            </td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                            </asp:FormView>
                        </td>
                        <td width="35">
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:Panel>
        <br />
        <asp:Label ID="LabelStatus" runat="server" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSourceAssignments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            SelectCommand="SELECT tbl_AssignmentsStudents.AssignmentsStudentID, tbl_AssignmentsStudents.AssignmentID, tbl_Assignments.AssignmentDetails, tbl_Assignments.DateAdded, tbl_Assignments.DateDeadline, tbl_Assignments.StaffID, tbl_Staff.StaffName, tbl_AssignmentsStudents.StudentID FROM tbl_AssignmentsStudents INNER JOIN tbl_Assignments ON tbl_AssignmentsStudents.AssignmentID = tbl_Assignments.AssignmentID INNER JOIN tbl_Staff ON tbl_Assignments.StaffID = tbl_Staff.StaffID WHERE (tbl_AssignmentsStudents.StudentID = @StudentID)"
            InsertCommand="INSERT INTO tbl_Assignments(AssignmentDetails, StaffID, DateAdded, DateDeadline) VALUES (@AssignmentDetails, @StaffID, @DateAdded, @DateDeadline)"
            DeleteCommand="DELETE FROM tbl_Assignments WHERE (AssignmentID = @AssignmentID)">
            <DeleteParameters>
                <asp:Parameter Name="AssignmentID" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AssignmentDetails" />
                <asp:Parameter Name="StaffID" />
                <asp:Parameter Name="DateAdded" />
                <asp:Parameter Name="DateDeadline" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="StudentID" SessionField="UserID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceAssignmentsQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            SelectCommand="SELECT AssignmentsQuestionID, AssignmentID, QuestionTypeID, Question, QuestionNo FROM tbl_AssignmentsQuestions WHERE (AssignmentID = @AssignmentID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridViewAssignments" Name="AssignmentID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceAssignmentsQuestionsResponsesMC" runat="server"
            ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" InsertCommand="IF NOT EXISTS (

SELECT AssignmentsUserID FROM tbl_AssignmentsResponsesMC

WHERE (AssignmentsQuestionID = @AssignmentsQuestionID) AND (UserID=@StudentID)
)


INSERT INTO tbl_AssignmentsResponsesMC(UserID, UserResponseID, AssignmentsQuestionID, isRight) VALUES (@StudentID, @StudentResponseID, @AssignmentsQuestionID, @isRight)"
            SelectCommand="SELECT ResponseID, Response, IsAnswer FROM tbl_AssignmentsQuestionsResponsesMC WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)">
            <InsertParameters>
                <asp:ControlParameter ControlID="GridViewAssignmentsQuestions" Name="AssignmentsQuestionID"
                    PropertyName="SelectedValue" />
                <asp:SessionParameter Name="StudentID" SessionField="UserID" />
                <asp:Parameter Name="StudentResponseID" />
                <asp:Parameter Name="isRight" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridViewAssignmentsQuestions" Name="AssignmentsQuestionID"
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceAssignmentsQuestionsResponsesTF" runat="server"
            ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" InsertCommand="IF NOT EXISTS (

SELECT AssignmentsUserID FROM tbl_AssignmentsResponsesTF

WHERE (AssignmentsQuestionID = @AssignmentsQuestionID) AND (UserID=@StudentID)
)
INSERT INTO tbl_AssignmentsResponsesTF(UserID, UserResponse, AssignmentsQuestionID, isRight) VALUES (@StudentID, @StudentResponse, @AssignmentsQuestionID, @isRight)"
            SelectCommand="SELECT ResponseID, AssignmentsQuestionID, Answer FROM tbl_AssignmentsQuestionsResponsesTF WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)">
            <InsertParameters>
                <asp:ControlParameter ControlID="GridViewAssignmentsQuestions" Name="AssignmentsQuestionID"
                    PropertyName="SelectedValue" />
                <asp:SessionParameter Name="StudentID" SessionField="UserID" />
                <asp:Parameter Name="StudentResponse" />
                <asp:Parameter Name="isRight" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridViewAssignmentsQuestions" Name="AssignmentsQuestionID"
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceAssignmentsQuestionsResponsesSA" runat="server"
            ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" InsertCommand="IF NOT EXISTS (

SELECT AssignmentsUserID FROM tbl_AssignmentsResponsesSA

WHERE (AssignmentsQuestionID = @AssignmentsQuestionID) AND (UserID=@StudentID)
)
INSERT INTO tbl_AssignmentsResponsesSA(AssignmentsQuestionID, UserID, UserResponse, isRight) VALUES (@AssignmentsQuestionID, @StudentID, @StudentResponse, @isRight)"
            SelectCommand="SELECT ResponseID, AssignmentsQuestionID, Answer FROM tbl_AssignmentsQuestionsResponsesSA  WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)">
            <InsertParameters>
                <asp:ControlParameter ControlID="GridViewAssignmentsQuestions" Name="AssignmentsQuestionID"
                    PropertyName="SelectedValue" />
                <asp:Parameter Name="StudentID" />
                <asp:SessionParameter Name="StudentID" SessionField="UserID" />
                <asp:Parameter Name="StudentResponse" />
                <asp:Parameter Name="isRight" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridViewAssignmentsQuestions" Name="AssignmentsQuestionID"
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceAssignmentsQuestionsResponsesYN" runat="server"
            ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" InsertCommand="IF NOT EXISTS (

SELECT AssignmentsUserID FROM tbl_AssignmentsResponsesYN

WHERE (AssignmentsQuestionID = @AssignmentsQuestionID) AND (UserID=@StudentID)
)
INSERT INTO tbl_AssignmentsResponsesYN(UserID, UserResponse, AssignmentsQuestionID, isYes) VALUES (@StudentID, @StudentResponse, @AssignmentsQuestionID, @isYes)"
            SelectCommand="SELECT ResponseID, AssignmentsQuestionID, Answer FROM tbl_AssignmentsQuestionsResponsesYN WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)">
            <InsertParameters>
                <asp:ControlParameter ControlID="GridViewAssignmentsQuestions" Name="AssignmentsQuestionID"
                    PropertyName="SelectedValue" />
                <asp:SessionParameter Name="StudentID" SessionField="UserID" />
                <asp:Parameter Name="StudentResponse" />
                <asp:Parameter Name="isYes" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridViewAssignmentsQuestions" Name="AssignmentsQuestionID"
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
