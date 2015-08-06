<%@ Page Title="SIS Skills Comments" Language="VB" MasterPageFile="~/Site.Master"
    EnableEventValidation="false" AutoEventWireup="false" CodeFile="ReportCardsSkillsComments.aspx.vb"
    Inherits="Skills_Comments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuReportCards.ascx" TagName="MenuReportCardsStaff" TagPrefix="uc2" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc2:MenuReportCardsStaff ID="MenuReportCardsStaff" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label151" runat="server" Font-Bold="True" Text="Select Semester" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:GridView ID="GridViewAcademicSemesters" runat="server" AutoGenerateColumns="False"
                                BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                                DataKeyNames="AcademicSemesterID,AcademicTermID" DataSourceID="SqlDataSourceAcademicSemesters"
                                ShowHeader="False" Width="95%">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButtonRadio" runat="server" CausesValidation="False" CommandName="Select"
                                                ImageUrl="~/Staff/Images/radiobutton.png" Text="Select" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Academic Terms">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelAT" runat="server" Font-Size="XX-Small" Text='<%# Bind("AcademicTerm") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle Height="25px" />
                                <SelectedRowStyle BackColor="#FFFF66" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label152" runat="server" Font-Bold="True" Text="Select Sections" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridViewSections" runat="server" AutoGenerateColumns="False" BackColor="White"
                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" DataKeyNames="SectionCatalogID"
                                DataSourceID="SqlDataSourceSections" ShowHeader="False" Width="95%">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButtonRadio" runat="server" CausesValidation="False" CommandName="Select"
                                                ImageUrl="~/Staff/Images/radiobutton.png" Text="Select" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sections">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelSection" runat="server" Text='<%# Eval("SectionCatalog") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <asp:Label ID="Label177" runat="server" Text="Sorry, No Sections Found!"></asp:Label>
                                </EmptyDataTemplate>
                                <RowStyle Height="25px" />
                                <SelectedRowStyle BackColor="#FFFF66" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td height="35">
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    SKILLS &amp; COMMENTS</h2>
                <br />
                <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID"
                    DataSourceID="SqlDataSourceStudents" Width="675px" ShowHeader="False" AllowPaging="True"
                    PageSize="5">
                    <Columns>
                        <asp:TemplateField HeaderText="Student Name" SortExpression="StudentName">
                            <ItemTemplate>
                                <table width="100%">
                                    <tr>
                                        <td height="25" valign="top" width="30">
                                            <asp:Image ID="ImageArrow" runat="server" ImageUrl="~/Staff/Images/arrow.gif" />
                                        </td>
                                        <td valign="top">
                                            <asp:Label ID="LabelStudentName" runat="server" Font-Bold="True" Text='<%# Bind("StudentName") %>'></asp:Label>
                                        </td>
                                        <td valign="top" width="320">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25" valign="top" width="30">
                                        </td>
                                        <td valign="top">
                                            <asp:Label ID="LabelFootxcer" runat="server" Font-Bold="False" ForeColor="Red">Report Card Comment:</asp:Label>
                                        </td>
                                        <td valign="top">
                                            <asp:Label ID="LabexclFooter0" runat="server" Font-Bold="False" ForeColor="Red">Study Skills:</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25" valign="top" width="30">
                                        </td>
                                        <td valign="top">
                                            <asp:UpdatePanel ID="UpdatePanelComments" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:FormView ID="FormViewReportComments" runat="server" DataKeyNames="CommentID"
                                                        DataSourceID="SqlDataSourceReportComments" Width="300px">
                                                        <EditItemTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td height="75" valign="top" colspan="2">
                                                                        <asp:TextBox ID="CommentTextBox" runat="server" Height="60px" Text='<%# Bind("Comment") %>'
                                                                            TextMode="MultiLine" Width="95%" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="60%">
                                                                        <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update" Text="Update Comment"
                                                                            Width="90%" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="ButtonCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                            Text="Cancel" Width="90%" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </EditItemTemplate>
                                                        <EmptyDataTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td height="75" valign="top" colspan="2">
                                                                        <asp:Label ID="CommentLabel" runat="server" Text="Sorry, No Comment Found!" Width="90%" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="top" width="60%">
                                                                        <asp:Button ID="ButtonNew" runat="server" CommandName="New" Text="New Comment" Width="90%" />
                                                                    </td>
                                                                    <td valign="top">
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </EmptyDataTemplate>
                                                        <InsertItemTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td height="75" valign="top" colspan="2">
                                                                        <asp:TextBox ID="CommentTextBox" runat="server" Height="60px" Text='<%# Bind("Comment") %>'
                                                                            TextMode="MultiLine" Width="95%" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="60%">
                                                                        <asp:Button ID="ButtonInsert" runat="server" CommandName="Insert" Text="Insert Comment"
                                                                            Width="90%" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="ButtonCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                            Text="Cancel" Width="90%" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td height="75" valign="top" colspan="2">
                                                                        <asp:Label ID="CommentLabel" runat="server" Text='<%# Bind("Comment") %>' Width="90%" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="top" width="60%">
                                                                        <asp:Button ID="ButtonEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                                                            Text="Edit Comment" Width="90%" />
                                                                    </td>
                                                                    <td valign="top">
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </asp:FormView>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td valign="top">
                                            <asp:UpdatePanel ID="UpdatePanelStudySkills" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:FormView ID="FormViewStudySkills" runat="server" DataSourceID="SqlDataSourceStudySkillsStudents"
                                                        Width="300px">
                                                        <EditItemTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td height="75" valign="top" colspan="2">
                                                                        <asp:GridView ID="GridViewStudySkillsEdit" runat="server" AutoGenerateColumns="False"
                                                                            DataKeyNames="ID" DataSourceID="SqlDataSourceStudySkillsEdit" ShowHeader="False"
                                                                            Width="100%">
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID" Visible="False">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="LabelID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <EditItemTemplate>
                                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                                                    </EditItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:BoundField DataField="StudySkill" HeaderText="StudySkill" SortExpression="StudySkill" />
                                                                                <asp:TemplateField>
                                                                                    <ItemTemplate>
                                                                                        <asp:DropDownList ID="DropDownListResponsesEdit" runat="server" SelectedValue='<%# Bind("Response") %>'>
                                                                                            <asp:ListItem>A</asp:ListItem>
                                                                                            <asp:ListItem>B</asp:ListItem>
                                                                                            <asp:ListItem>C</asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <RowStyle Height="28px" />
                                                                        </asp:GridView>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="60%">
                                                                        <asp:Button ID="ButtonUpdate" runat="server" OnClick="ButtonUpdate_Click" Text="Update"
                                                                            Width="90%" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="ButtonCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                            Text="Cancel" Width="90%" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:SqlDataSource ID="SqlDataSourceStudySkillsEdit" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                                                SelectCommand="SELECT tbl_StudySkillsStudents.ID, tbl_StudySkillsStudents.StudySkillID, tbl_StudySkills.StudySkill, tbl_StudySkillsStudents.Response, tbl_StudySkillsStudents.StudentID, tbl_StudySkillsStudents.AcademicSemesterID FROM tbl_StudySkillsStudents INNER JOIN tbl_StudySkills ON tbl_StudySkillsStudents.StudySkillID = tbl_StudySkills.StudySkillID WHERE (tbl_StudySkillsStudents.StudentID = @StudentID) AND (tbl_StudySkillsStudents.AcademicSemesterID = @AcademicSemesterID)"
                                                                UpdateCommand="UPDATE tbl_StudySkillsStudents SET Response = @Response WHERE (ID = @ID)">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                                                    <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                                                                        PropertyName="SelectedValue" />
                                                                </SelectParameters>
                                                                <UpdateParameters>
                                                                    <asp:Parameter Name="Response" />
                                                                    <asp:Parameter Name="ID" />
                                                                </UpdateParameters>
                                                            </asp:SqlDataSource>
                                                        </EditItemTemplate>
                                                        <EmptyDataTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td height="75" valign="top" colspan="2">
                                                                        <asp:Label ID="CommentLabel1" runat="server" Text="Sorry, No Skills Found!" Width="90%" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="top" width="60%">
                                                                        <asp:Button ID="ButtonNew" runat="server" OnClick="ButtonNew_Click" Text="New Study Skills"
                                                                            Width="90%" />
                                                                    </td>
                                                                    <td valign="top">
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </EmptyDataTemplate>
                                                        <InsertItemTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td height="75" valign="top" colspan="2">
                                                                        <asp:GridView ID="GridViewStudySkillsInsert" runat="server" AutoGenerateColumns="False"
                                                                            DataKeyNames="StudySkillID" DataSourceID="SqlDataSourceStudySkills" ShowHeader="False"
                                                                            Width="100%">
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="StudySkillID"
                                                                                    Visible="False">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="LabelSSID" runat="server" Text='<%# Bind("StudySkillID") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:BoundField DataField="StudySkill" HeaderText="StudySkill" SortExpression="StudySkill" />
                                                                                <asp:TemplateField>
                                                                                    <ItemTemplate>
                                                                                        <asp:DropDownList ID="DropDownListResponsesInsert" runat="server">
                                                                                            <asp:ListItem Value="A">A</asp:ListItem>
                                                                                            <asp:ListItem Value="B">B</asp:ListItem>
                                                                                            <asp:ListItem Value="C">C</asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <EmptyDataTemplate>
                                                                                <table width="100%">
                                                                                    <tr>
                                                                                        <td height="75" valign="top">
                                                                                            <asp:Label ID="CommentLabel2" runat="server" Text="Sorry, No Study Skills Found."
                                                                                                Width="90%" />
                                                                                            <br />
                                                                                            <br />
                                                                                            <asp:Label ID="CommentLabel0" runat="server" ForeColor="Red" Text="Please contact your Education Coordinator!"
                                                                                                Width="90%" />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </EmptyDataTemplate>
                                                                            <RowStyle Height="28px" />
                                                                        </asp:GridView>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="60%">
                                                                        <asp:Button ID="ButtonInsert" runat="server" OnClick="ButtonInsert_Click" Text="Insert"
                                                                            Width="90%" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="ButtonCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                            Text="Cancel" Width="90%" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:SqlDataSource ID="SqlDataSourceStudySkills" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                                                SelectCommand="SELECT [StudySkillID], [StudySkill] FROM [tbl_StudySkills] WHERE ([SchoolCode] = @SchoolCode)">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                                                                        PropertyName="SelectedValue" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                            <asp:SqlDataSource ID="SqlDataSourceStudySkillsInsert" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                                                InsertCommand="UPDATE tbl_StudySkillsStudents SET Response = @Response WHERE (StudySkillID = @StudySkillID) AND (AcademicSemesterID = @AcademicSemesterID) AND (StudentID = @StudentID)

IF @@ROWCOUNT=0

INSERT INTO tbl_StudySkillsStudents(StudySkillID, StudentID, Response, AcademicSemesterID, AcademicTermID, ReportTypeID) VALUES (@StudySkillID, @StudentID, @Response, @AcademicSemesterID, @AcademicTermID, 0)"
                                                                SelectCommand="SELECT ID, StudySkillID, AcademicTermID, StudentID, Response FROM tbl_StudySkillsStudents">
                                                                <InsertParameters>
                                                                    <asp:Parameter Name="Response" />
                                                                    <asp:Parameter Name="StudySkillID" />
                                                                    <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                                                                        PropertyName="SelectedValue" />
                                                                    <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                                                    <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                                                                        PropertyName="SelectedValue" />
                                                                </InsertParameters>
                                                            </asp:SqlDataSource>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td height="75" valign="top" colspan="2">
                                                                        <div style='overflow: auto; height: 100%;'>
                                                                            <asp:GridView ID="GridViewStudySkillsItem" runat="server" AutoGenerateColumns="False"
                                                                                DataKeyNames="StudySkillID" DataSourceID="SqlDataSourceStudySkillsItem" ShowHeader="False"
                                                                                Width="100%">
                                                                                <Columns>
                                                                                    <asp:BoundField DataField="StudySkill" HeaderText="StudySkill" SortExpression="StudySkill" />
                                                                                    <asp:TemplateField>
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="Label150" runat="server" Text='<%# Eval("Response") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                                <RowStyle Height="28px" />
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="top" width="60%">
                                                                        <asp:Button ID="ButtonEdit" runat="server" OnClick="ButtonEdit_Click" Text="Edit"
                                                                            Width="90%" />
                                                                    </td>
                                                                    <td valign="top">
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:SqlDataSource ID="SqlDataSourceStudySkillsItem" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                                                SelectCommand="SELECT tbl_StudySkillsStudents.ID, tbl_StudySkillsStudents.StudySkillID, tbl_StudySkills.StudySkill, tbl_StudySkillsStudents.Response, tbl_StudySkillsStudents.StudentID, tbl_StudySkillsStudents.AcademicSemesterID FROM tbl_StudySkillsStudents INNER JOIN tbl_StudySkills ON tbl_StudySkillsStudents.StudySkillID = tbl_StudySkills.StudySkillID WHERE (tbl_StudySkillsStudents.StudentID = @StudentID) AND (tbl_StudySkillsStudents.AcademicSemesterID = @AcademicSemesterID)">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                                                    <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                                                                        PropertyName="SelectedValue" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </ItemTemplate>
                                                    </asp:FormView>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                                <asp:HiddenField ID="HiddenFieldStudentID" runat="server" Value='<%# Eval("StudentID") %>' />
                                <asp:SqlDataSource ID="SqlDataSourceReportComments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                    DeleteCommand="DELETE FROM tbl_ReportComments WHERE (CommentID = @CommentID)"
                                    InsertCommand="UPDATE tbl_ReportComments SET Comment = @Comment WHERE (AcademicSemesterID = @AcademicSemesterID) AND (StudentID = @StudentID)

IF @@ROWCOUNT=0

INSERT INTO tbl_ReportComments(AcademicSemesterID, StudentID, Comment, WrittenBy, AcademicTermID, ReportTypeID, CourseCatalogID, CourseSectionID) VALUES (@AcademicSemesterID, @StudentID, @Comment, @WrittenBy, @AcademicTermID, 0, 0, 0)"
                                    SelectCommand="SELECT CommentID, Comment, AcademicSemesterID, StudentID FROM tbl_ReportComments WHERE (StudentID = @StudentID) AND (AcademicSemesterID = @AcademicSemesterID)"
                                    UpdateCommand="UPDATE tbl_ReportComments SET Comment = @Comment WHERE (CommentID = @CommentID)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="CommentID" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Comment" Type="String" />
                                        <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                                            PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                        <asp:SessionParameter Name="WrittenBy" SessionField="UserID" />
                                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                                            PropertyName="SelectedValue" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                        <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                                            PropertyName="SelectedValue" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Comment" Type="String" />
                                        <asp:Parameter Name="CommentID" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSourceStudySkillsStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                    SelectCommand="SELECT StudySkillID, Response, AcademicSemesterID, StudentID FROM tbl_StudySkillsStudents WHERE (StudentID = @StudentID) AND (AcademicSemesterID = @AcademicSemesterID)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                        <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                                            PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="Images/no-data.png" />
                            <br />
                            <br />
                            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red">If you are an Advisor and can not see your students,</asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red">please contact to your Coordinator!</asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:Label ID="LabelFooter" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Medium"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceAcademicSemesters" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AcademicSemesterID, AcademicTermID, AcademicYear + N' ' + AcademicSemester AS AcademicTerm FROM tbl_AcademicTerms WHERE (ReportTypeID = 2) ORDER BY Active DESC, AcademicYear + N' ' + AcademicSemester">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT tbl_SectionMentors.SectionCatalogID, tbl_SectionCatalog.SectionCatalog, tbl_SectionCatalog.SectionGroup FROM tbl_SectionMentors INNER JOIN tbl_SectionCatalog ON tbl_SectionMentors.SectionCatalogID = tbl_SectionCatalog.SectionCatalogID WHERE (tbl_SectionMentors.IsDefault = 1) AND (tbl_SectionMentors.SchoolCode = @SchoolCode) AND (tbl_SectionMentors.StaffID = @StaffID) AND (tbl_SectionMentors.AcademicSemesterID = @AcademicSemesterID) ORDER BY tbl_SectionCatalog.SectionGroup">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                        <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName FROM tbl_Students WHERE (SchoolCode = @SchoolCode) AND (CurrentSectionID = @CurrentSectionID) AND ([Continue] = 1) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                        <asp:ControlParameter ControlID="GridViewSections" Name="CurrentSectionID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
