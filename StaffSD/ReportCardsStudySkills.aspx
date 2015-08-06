<%@ Page Title="SIS Study Skills" Language="VB" MasterPageFile="~/Site.Master" EnableEventValidation="false"
    AutoEventWireup="false" CodeFile="ReportCardsStudySkills.aspx.vb" Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuReportCards.ascx" TagName="MenuReportCards" TagPrefix="uc2" %>
<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc2:MenuReportCards ID="MenuReportCards" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label175" runat="server" Font-Bold="True" ForeColor="Red" Text="Select Semester"></asp:Label>
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
                        <td height="28">
                            <asp:Label ID="Label149" runat="server" Font-Bold="True" ForeColor="Red" Text="Select Report Type"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="56">
                            <asp:RadioButtonList ID="RadioButtonListReportTypes" runat="server" AutoPostBack="True"
                                Width="95%" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                <asp:ListItem Value="1">Midterm Report Card</asp:ListItem>
                                <asp:ListItem Selected="True" Value="2">Final Report Card</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label134" runat="server" Font-Bold="True" Text="Select Course Sections"
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="250">
                            <div style='overflow: auto; height: 100%;'>
                                <asp:GridView ID="GridViewCourseSections" runat="server" AutoGenerateColumns="False"
                                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"
                                    DataSourceID="SqlDataSourceSectionsCourses" ShowHeader="False" Width="95%" DataKeyNames="SectionCatalogID">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButtonRadio" runat="server" CausesValidation="False" CommandName="Select"
                                                    ImageUrl="~/StaffSD/Images/radiobutton.png" Text="Select" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="SectionCatalog" HeaderText="Section" ReadOnly="True" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <asp:Label ID="Label177" runat="server" Text="Sorry, No Sections Found!"></asp:Label>
                                    </EmptyDataTemplate>
                                    <RowStyle Height="22px" />
                                    <SelectedRowStyle BackColor="#FFFF66" />
                                </asp:GridView>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="LabelTotal" runat="server"></asp:Label>
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    STUDY SKILLS</h2>
                <br />
                <asp:GridView ID="GridViewStudySkills" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataKeyNames="StudentID" DataSourceID="SqlDataSourceStudents" PageSize="8" ShowHeader="False"
                    Width="675px">
                    <Columns>
                        <asp:TemplateField HeaderText="Student Name" SortExpression="StudentName">
                            <ItemTemplate>
                                <table width="100%">
                                    <tr>
                                        <td valign="top">
                                            <asp:Label ID="LabelStudentName" runat="server" Font-Bold="True" Text='<%# Bind("StudentName") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <asp:UpdatePanel ID="UpdatePanelStudySkills" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:FormView ID="FormViewStudySkills" runat="server" DataSourceID="SqlDataSourceStudySkillsStudents"
                                                        Width="100%">
                                                        <EditItemTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td colspan="2" valign="top" height="100">
                                                                        <div style='overflow: auto; height: 100%;'>
                                                                            <asp:GridView ID="GridViewStudySkillsEdit" runat="server" AutoGenerateColumns="False"
                                                                                DataKeyNames="ID" DataSourceID="SqlDataSourceStudySkillsEdit" ShowHeader="False"
                                                                                Width="100%">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID" Visible="False">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LabelID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                                                                        </ItemTemplate>
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
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="180">
                                                                        <asp:Button ID="ButtonUpdate" runat="server" OnClick="ButtonUpdate_Click" Text="Update Study Skills"
                                                                            Width="90%" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="ButtonCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                            Text="Cancel" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:SqlDataSource ID="SqlDataSourceStudySkillsEdit" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                                                SelectCommand="SELECT tbl_StudySkillsStudents.ID, tbl_StudySkillsStudents.StudySkillID, tbl_StudySkills.StudySkill, tbl_StudySkillsStudents.Response, tbl_StudySkillsStudents.ReportTypeID FROM tbl_StudySkillsStudents INNER JOIN tbl_StudySkills ON tbl_StudySkillsStudents.StudySkillID = tbl_StudySkills.StudySkillID WHERE (tbl_StudySkillsStudents.StudentID = @StudentID) AND (tbl_StudySkillsStudents.AcademicSemesterID = @AcademicSemesterID) AND (tbl_StudySkillsStudents.ReportTypeID = @ReportTypeID)"
                                                                UpdateCommand="UPDATE tbl_StudySkillsStudents SET Response = @Response WHERE (ID = @ID)">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                                                    <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                                                                        PropertyName="SelectedValue" />
                                                                    <asp:ControlParameter ControlID="RadioButtonListReportTypes" Name="ReportTypeID"
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
                                                                    <td valign="top" colspan="2">
                                                                        <asp:Label ID="CommentLabel3" runat="server" Text="Sorry, No Skills Found!" Width="90%" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="top" width="180">
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
                                                                    <td colspan="2" valign="top" height="100">
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
                                                                                            <asp:Label ID="CommentLabel4" runat="server" Text="Sorry, No Study Skills Found."
                                                                                                Width="90%" />
                                                                                            <br />
                                                                                            <br />
                                                                                            <asp:Label ID="CommentLabel5" runat="server" ForeColor="Red" Text="Please contact your Education Coordinator!"
                                                                                                Width="90%" />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </EmptyDataTemplate>
                                                                            <RowStyle Height="28px" />
                                                                        </asp:GridView>
                                                                        <asp:SqlDataSource ID="SqlDataSourceStudySkills" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                                                            SelectCommand="SELECT StudySkillID, StudySkill FROM tbl_StudySkills WHERE (SchoolCode = @SchoolCode) AND (ReportTypeID = @ReportTypeID)">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                                                                                    PropertyName="SelectedValue" Type="Int32" />
                                                                                <asp:ControlParameter ControlID="RadioButtonListReportTypes" Name="ReportTypeID"
                                                                                    PropertyName="SelectedValue" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                        <asp:SqlDataSource ID="SqlDataSourceStudySkillsInsert" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                                                            InsertCommand="UPDATE tbl_StudySkillsStudents SET Response = @Response WHERE (StudentID = @StudentID) AND (StudySkillID = @StudySkillID) AND (AcademicSemesterID = @AcademicSemesterID) AND (ReportTypeID = @ReportTypeID)

IF @@ROWCOUNT=0

INSERT INTO tbl_StudySkillsStudents(StudySkillID, AcademicTermID, ReportTypeID, StudentID, Response, AcademicSemesterID) VALUES (@StudySkillID, @AcademicTermID, @ReportTypeID, @StudentID, @Response, @AcademicSemesterID)"
                                                                            SelectCommand="SELECT ID FROM tbl_StudySkillsStudents">
                                                                            <InsertParameters>
                                                                                <asp:Parameter Name="Response" />
                                                                                <asp:Parameter Name="ReportTypeID" />
                                                                                <asp:Parameter Name="HiddenFieldStudentID" />
                                                                                <asp:Parameter Name="StudySkillID" />
                                                                                <asp:Parameter Name="AcademicTermID" />
                                                                                <asp:Parameter Name="AcademicSemesterID" />
                                                                            </InsertParameters>
                                                                        </asp:SqlDataSource>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="180">
                                                                        <asp:Button ID="ButtonInsert" runat="server" OnClick="ButtonInsert_Click" Text="Insert Study Skill"
                                                                            Width="90%" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="ButtonCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                            Text="Cancel" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td valign="top" colspan="2" height="100">
                                                                        <div style='overflow: auto; height: 100%;'>
                                                                            <asp:GridView ID="GridViewStudySkillsItem" runat="server" AutoGenerateColumns="False"
                                                                                DataKeyNames="StudySkillID" DataSourceID="SqlDataSourceStudySkillsItem" ShowHeader="False"
                                                                                Width="100%">
                                                                                <Columns>
                                                                                    <asp:BoundField DataField="StudySkill" HeaderText="StudySkill" SortExpression="StudySkill" />
                                                                                    <asp:TemplateField>
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="Label152" runat="server" Text='<%# Eval("Response") %>'></asp:Label>
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
                                                                    <td valign="top" width="180">
                                                                        <asp:Button ID="ButtonEdit" runat="server" CausesValidation="False" OnClick="ButtonEdit_Click"
                                                                            Text="Edit Skills" Width="90%" />
                                                                    </td>
                                                                    <td valign="top">
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:SqlDataSource ID="SqlDataSourceStudySkillsItem" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                                                SelectCommand="SELECT tbl_StudySkillsStudents.ID, tbl_StudySkillsStudents.StudySkillID, tbl_StudySkills.StudySkill, tbl_StudySkillsStudents.Response FROM tbl_StudySkillsStudents INNER JOIN tbl_StudySkills ON tbl_StudySkillsStudents.StudySkillID = tbl_StudySkills.StudySkillID WHERE (tbl_StudySkillsStudents.StudentID = @StudentID) AND (tbl_StudySkillsStudents.AcademicSemesterID = @AcademicSemesterID) AND (tbl_StudySkillsStudents.ReportTypeID = @ReportTypeID)">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                                                    <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                                                                        PropertyName="SelectedValue" />
                                                                    <asp:ControlParameter ControlID="RadioButtonListReportTypes" Name="ReportTypeID"
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
                                <asp:SqlDataSource ID="SqlDataSourceStudySkillsStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                    SelectCommand="SELECT StudySkillID, Response FROM tbl_StudySkillsStudents WHERE (ReportTypeID = @ReportTypeID) AND (StudentID = @StudentID) AND (AcademicSemesterID = @AcademicSemesterID)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="RadioButtonListReportTypes" Name="ReportTypeID"
                                            PropertyName="SelectedValue" />
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
                            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red">Please Select a School Section to See Student List!</asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="LabelStatus0" runat="server" Font-Bold="True" Font-Size="Medium" 
                                ForeColor="Red">Attention! This Section is for Homeroom Teachers only.</asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceAcademicSemesters" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AcademicSemesterID, AcademicTermID, AcademicYear + N' ' + AcademicSemester AS AcademicTerm FROM tbl_AcademicTerms WHERE (ReportTypeID = 2) ORDER BY Active DESC, AcademicYear + N' ' + AcademicSemester">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSectionsCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT tbl_SectionMentors.SectionCatalogID, tbl_SectionCatalog.SectionCatalog, tbl_SectionCatalog.SectionGroup FROM tbl_SectionMentors INNER JOIN tbl_SectionCatalog ON tbl_SectionMentors.SectionCatalogID = tbl_SectionCatalog.SectionCatalogID WHERE (tbl_SectionMentors.IsDefault = 1) AND (tbl_SectionMentors.SchoolCode = @SchoolCode) AND (tbl_SectionMentors.StaffID = @StaffID) AND (tbl_SectionMentors.AcademicSemesterID = @AcademicSemesterID) ORDER BY tbl_SectionCatalog.SectionGroup">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                        <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName, SchoolCode FROM tbl_Students WHERE (CurrentSectionID = @CurrentSectionID) AND ([Continue] = 1) AND (SchoolCode = @SchoolCode)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewCourseSections" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <uc1:WebMessageBox ID="WebMessageBoxStudySkills" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
