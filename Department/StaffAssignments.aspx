<%@ Page Title="SIS Staff Assessments" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="StaffAssignments.aspx.vb" Inherits="NewUserAccount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
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
                            <img alt="" src="Images/no-data.png" />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#FFFFCC" />
                </asp:GridView>
                <br />
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
                <asp:Panel ID="PanelQuiz" runat="server" Visible="False">
                    <asp:GridView ID="GridViewAssignmentsQuestions" runat="server" AutoGenerateColumns="False"
                        OnRowCommand="GridViewAssignmentsQuestions_RowCommand" DataSourceID="SqlDataSourceAssignmentsQuestions"
                        Width="100%" DataKeyNames="AssignmentsQuestionID" AllowPaging="True" PageSize="1"
                        ShowHeader="False">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButtonBackward" runat="server" CommandName="Backward" CommandArgument='<%# Container.DataItemIndex %>'
                                        ImageUrl="~/Students/Images/back.png" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="35px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Question" SortExpression="Question">
                                <ItemTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td height="25" width="25">
                                                
                                            </td>
                                            <td valign="top">
                                                <asp:Label ID="Label38" runat="server" Font-Bold="True" ForeColor="Red" Text="Question:"></asp:Label>
                                            </td>
                                            <td width="25">
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="80">
                                                
                                            </td>
                                            <td valign="top">
                                                <asp:Label ID="LabelQuestion" runat="server" Text='<%# Eval("Question") %>' Width="100%"></asp:Label>
                                                <asp:HiddenField ID="HiddenFieldQuestionTypeID" runat="server" Value='<%# Eval("QuestionTypeID") %>' />
                                            </td>
                                            <td>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="25">
                                                
                                            </td>
                                            <td valign="top">
                                                <asp:Label ID="Label37" runat="server" Font-Bold="True" ForeColor="Red" Text="Response:"></asp:Label>
                                            </td>
                                            <td>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td valign="top">
                                                <asp:GridView ID="GridViewResponsesEditMC" runat="server" AutoGenerateColumns="False"
                                                    DataKeyNames="ResponseID" DataSourceID="SqlDataSourceAssignmentsQuestionsResponsesMC"
                                                    ShowHeader="False" Width="100%" Visible="False">
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
                                                                <asp:Label ID="LabelResponse" runat="server" Width="100%" Text='<%# Eval("Response") %>'></asp:Label>
                                                                <br />
                                                            </ItemTemplate>
                                                            <ItemStyle BackColor="White" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="?" SortExpression="IsAnswer">
                                                            <ItemTemplate>
                                                                <asp:RadioButton ID="RadioButtonResponse" runat="server" OnClick="javascript:SelectSingleRadiobutton(this.id)" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" Width="30px" BackColor="White" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        No Data!
                                                    </EmptyDataTemplate>
                                                    <RowStyle Height="30px" />
                                                </asp:GridView>
                                                <asp:FormView ID="FormViewResponsesEditTF" runat="server" BorderColor="#666666" BorderStyle="Solid"
                                                    BorderWidth="1px" DataSourceID="SqlDataSourceAssignmentsQuestionsResponsesTF"
                                                    DefaultMode="Insert" Width="100%" Visible="False" DataKeyNames="ResponseID">
                                                    <InsertItemTemplate>
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
                                                                    <asp:RadioButtonList ID="RadioButtonListTrueFalseResponse" runat="server" RepeatDirection="Horizontal">
                                                                        <asp:ListItem>True</asp:ListItem>
                                                                        <asp:ListItem>False</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                                <td height="50" width="80">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                </td>
                                                                <td height="25" width="80">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </InsertItemTemplate>
                                                </asp:FormView>
                                                <asp:FormView ID="FormViewResponsesEditSA" runat="server" BorderColor="#666666" BorderStyle="Solid"
                                                    BorderWidth="1px" DataSourceID="SqlDataSourceAssignmentsQuestionsResponsesSA"
                                                    DefaultMode="Insert" Width="100%" Visible="False" DataKeyNames="ResponseID">
                                                    <InsertItemTemplate>
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
                                                                    <asp:TextBox ID="TextBoxShortAnswerResponse" runat="server" Height="50px" TextMode="MultiLine"
                                                                        Width="98%"></asp:TextBox>
                                                                </td>
                                                                <td height="50" width="80">
                                                                    
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                </td>
                                                                <td height="25" width="80">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </InsertItemTemplate>
                                                </asp:FormView>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="35">
                                                
                                            </td>
                                            <td>
                                                <asp:Button ID="ButtonUpdateChanges" runat="server" Height="25px" Text="Submit Your Answer!"
                                                    Width="100%" OnClick="ButtonUpdateChanges_Click" />
                                            </td>
                                            <td>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="35">
                                                
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelQuestionStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                            </td>
                                            <td>
                                                
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:HiddenField ID="HiddenFieldAssignmentID" runat="server" Value='<%# Eval("AssignmentsQuestionID") %>' />
                                    <asp:SqlDataSource ID="SqlDataSourceAssignmentsQuestionsResponsesMC" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" InsertCommand="IF NOT EXISTS (

SELECT AssignmentsUserID FROM tbl_AssignmentsResponsesMC

WHERE (AssignmentsQuestionID = @AssignmentsQuestionID) AND (UserID=@TeacherID)
)

INSERT INTO tbl_AssignmentsResponsesMC(UserID, UserResponseID, AssignmentsQuestionID, isRight) VALUES (@TeacherID, @TeacherResponseID, @AssignmentsQuestionID, @isRight)"
                                        
                                        SelectCommand="SELECT ResponseID, AssignmentsQuestionID, Response, IsAnswer FROM tbl_AssignmentsQuestionsResponsesMC WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)">
                                        <InsertParameters>
                                            <asp:Parameter Name="AssignmentsQuestionID" />
                                            <asp:Parameter Name="TeacherID" />
                                            <asp:Parameter Name="TeacherResponseID" />
                                            <asp:Parameter Name="isRight" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HiddenFieldAssignmentID" Name="AssignmentsQuestionID"
                                                PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceAssignmentsQuestionsResponsesTF" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" InsertCommand="IF NOT EXISTS (

SELECT AssignmentsUserID FROM tbl_AssignmentsResponsesTF

WHERE (AssignmentsQuestionID = @AssignmentsQuestionID) AND (UserID=@TeacherID)
)
INSERT INTO tbl_AssignmentsResponsesTF(UserID, UserResponse, AssignmentsQuestionID, isRight) VALUES (@TeacherID, @TeacherResponse, @AssignmentsQuestionID, @isRight)"
                                        
                                        
                                        SelectCommand="SELECT ResponseID, AssignmentsQuestionID, Answer FROM tbl_AssignmentsQuestionsResponsesTF WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)">
                                        <InsertParameters>
                                            <asp:Parameter Name="AssignmentsQuestionID" />
                                            <asp:Parameter Name="TeacherID" />
                                            <asp:Parameter Name="TeacherResponse" />
                                            <asp:Parameter Name="isRight" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HiddenFieldAssignmentID" Name="AssignmentsQuestionID"
                                                PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceAssignmentsQuestionsResponsesSA" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" InsertCommand="IF NOT EXISTS (

SELECT AssignmentsUserID FROM tbl_AssignmentsResponsesSA

WHERE (AssignmentsQuestionID = @AssignmentsQuestionID) AND (UserID=@TeacherID)
)
INSERT INTO tbl_AssignmentsResponsesSA(AssignmentsQuestionID, UserID, UserResponse, isRight) VALUES (@AssignmentsQuestionID, @TeacherID, @TeacherResponse, @isRight)"
                                        
                                        SelectCommand="SELECT ResponseID, AssignmentsQuestionID, Answer FROM tbl_AssignmentsQuestionsResponsesSA WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)">
                                        <InsertParameters>
                                            <asp:Parameter Name="AssignmentsQuestionID" />
                                            <asp:Parameter Name="TeacherID" />
                                            <asp:Parameter Name="TeacherResponse" />
                                            <asp:Parameter Name="isRight" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HiddenFieldAssignmentID" Name="AssignmentsQuestionID"
                                                PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </ItemTemplate>
                                <ItemStyle BackColor="White" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButtonForward" runat="server" CommandName="Forward" CommandArgument='<%# DataBinder.Eval(Container, "DataItemIndex") %>'
                                        ImageUrl="~/Students/Images/forward.png" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="35px" />
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
                        <PagerStyle Font-Bold="True" Font-Size="Medium" />
                        <SelectedRowStyle BackColor="#FFFFCC" />
                    </asp:GridView>
                    <br />
                </asp:Panel>
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SchoolCode, SchoolName, Show FROM tbl_Schools WHERE (Show = 1) AND (SchoolCode = @SchoolCode) ORDER BY SchoolName">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT CourseCatalogID, CourseName FROM vw_CourseSections WHERE (AcademicTermID = @AcademicTermID) AND (StaffID = @StaffID) ORDER BY CourseName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTerms" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssignments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT tbl_Assignments.AssignmentDetails, tbl_Assignments.DateAdded, tbl_Assignments.DateDeadline, tbl_Assignments.StaffID, tbl_Staff.StaffName, tbl_AssignmentsTeachers.AssignmentsTeacherID, tbl_AssignmentsTeachers.AssignmentID, tbl_AssignmentsTeachers.TeacherID FROM tbl_Assignments INNER JOIN tbl_Staff ON tbl_Assignments.StaffID = tbl_Staff.StaffID INNER JOIN tbl_AssignmentsTeachers ON tbl_Assignments.AssignmentID = tbl_AssignmentsTeachers.AssignmentID WHERE (tbl_AssignmentsTeachers.TeacherID = @TeacherID)"
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
                        <asp:SessionParameter Name="TeacherID" SessionField="UserID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssignmentsQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AssignmentsQuestionID, AssignmentID, QuestionTypeID, Question, QuestionNo FROM tbl_AssignmentsQuestions WHERE (AssignmentID = @AssignmentID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAssignments" Name="AssignmentID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssignmentsQuestionsResponsesMC" runat="server"
                    ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT ResponseID, AssignmentsQuestionID, Response, IsAnswer FROM tbl_AssignmentsQuestionsResponsesMC WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAssignments" Name="AssignmentsQuestionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssignmentsQuestionsResponsesTF" runat="server"
                    ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT ResponseID, AssignmentsQuestionID, Answer FROM tbl_AssignmentsQuestionsResponsesTF WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAssignments" Name="AssignmentsQuestionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssignmentsQuestionsResponsesSA" runat="server"
                    ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT ResponseID, AssignmentsQuestionID, Answer FROM tbl_AssignmentsQuestionsResponsesSA WHERE (AssignmentsQuestionID = @AssignmentsQuestionID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAssignments" Name="AssignmentsQuestionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <br />
        </div>
    </div>
    <div class="sidebar" id="sidebar">
        <h2>
            CLASSES</h2>
        <br />
        <table class="SISTable" width="230">
            <tr>
                <td width="40">
                    <asp:HyperLink ID="HyperLinkAddNew0" runat="server" ImageUrl="~/Department/Images/editor.png"
                        NavigateUrl="~/Department/DepartmentStaff.aspx">Add New</asp:HyperLink>
                </td>
                <td>
                    <asp:Label ID="Label24" runat="server" Text="Department Staff"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table class="SISTable" width="230">
            <tr>
                <td width="40">
                    <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                        NavigateUrl="~/Department/DepartmentForum.aspx">Add New</asp:HyperLink>
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Department Forum"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table class="SISTable" width="230">
            <tr>
                <td width="40">
                    <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                        NavigateUrl="~/Department/StaffAssignments.aspx" Enabled="False">Add New</asp:HyperLink>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Staff Assignments" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table class="SISTable" width="230">
            <tr>
                <td width="40">
                    <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                        NavigateUrl="~/Department/SharedDocuments.aspx">Add New</asp:HyperLink>
                </td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Shared Documents"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:LoginView ID="LoginViewStaffAssignments" runat="server">
            <RoleGroups>
                <asp:RoleGroup Roles="Department">
                    <ContentTemplate>
                        <table class="SISTable" width="230">
                            <tr>
                                <td width="40">
                                    <asp:HyperLink ID="HyperLink4" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                                        NavigateUrl="~/Department/StaffAssignmentsChecklist.aspx">Add New</asp:HyperLink>
                                </td>
                                <td>
                                    <asp:Label ID="Label40" runat="server" Text="Assignment Checklist"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table class="SISTable" width="230">
                            <tr>
                                <td width="40">
                                    <asp:HyperLink ID="HyperLink5" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                                        NavigateUrl="~/Department/StaffAssignmentsArchive.aspx">Add New</asp:HyperLink>
                                </td>
                                <td>
                                    <asp:Label ID="Label42" runat="server" Text="Assignment Archive"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>
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
                    <asp:DropDownList ID="DropDownListSchoolCodes" runat="server" AutoPostBack="True"
                        TabIndex="7" Width="95%" DataSourceID="SqlDataSourceSchoolCodes" DataTextField="SchoolName"
                        DataValueField="SchoolCode" Enabled="False">
                        <asp:ListItem Value="">Select School</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td height="35">
                </td>
            </tr>
        </table>
        <br />
    </div>
    <div class="clear">
    </div>
</asp:Content>
