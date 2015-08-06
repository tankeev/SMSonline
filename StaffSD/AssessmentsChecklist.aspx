<%@ Page Title="SIS Assessments Checklist" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="AssessmentsChecklist.aspx.vb" Inherits="AssessmentTypesSchools" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuAssessments.ascx" TagName="MenuAssessmentsStaff" TagPrefix="uc1" %>
<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uc3" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuAssessmentsStaff ID="MenuAssessmentsStaff" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label34" runat="server" Font-Bold="True" Text="Select a Course Please"
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="ListBoxCourses" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCourses"
                                DataTextField="CourseCategory" DataValueField="CourseSectionID" Height="250px"
                                Width="95%" Font-Size="Small" ForeColor="Maroon"></asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="LabelTotal" runat="server"></asp:Label>
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content-right">
                <h2>
                    ASSESSMENT CHECKLIST</h2>
                <br />
                <asp:TabContainer ID="TabContainerAssessments" runat="server" ActiveTabIndex="0"
                    Width="680px" CssClass="tab">
                    <asp:TabPanel ID="TabPanelAddNewAssessment" runat="server" HeaderText="TabPanel2">
                        <HeaderTemplate>
                            New Assessment
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:Label ID="LabelTopicStatus1" runat="server" Font-Bold="False" Font-Size="XX-Small"
                                ForeColor="Red">Step 1-a: First of all, make sure the Given Subjects Section on the lower left corner is correct.</asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="LabelTopicStatus2" runat="server" Font-Bold="False" Font-Size="XX-Small"
                                ForeColor="Red">Step 1-b: Select a Course by simply clicking on it. On the main part of the page, the list of Assessments Types will appear.</asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="LabelTopicStatus8" runat="server" Font-Bold="False" Font-Size="XX-Small"
                                ForeColor="Red">Step 2-a: Teachers may input each Assessment individually as Quiz-1, Quiz-2, Quiz-3, Mid-Term Exam, Homework-1, etc... </asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Label35" runat="server" Font-Bold="False" Font-Size="XX-Small" ForeColor="Red">Step 2-b: Or; input only one Score for Quiz Averages, one Score for Homework Averages, Mid-Term Score, etc... </asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Label36" runat="server" Font-Bold="False" Font-Size="XX-Small" ForeColor="Red">Step 2-c: System will calculate the overall average automatically. Inputting individually is strongly recommended.</asp:Label>
                            <br />
                            <br />
                            <table width="100%" style="border: 1px solid #990033; background-color: #EBF4E1">
                                <tr>
                                    <td width="20" height="30">
                                    </td>
                                    <td width="130">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownListAssessmentTypes"
                                            ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" ValidationGroup="AssessmentType"
                                            InitialValue="0">(*)</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label28" runat="server" Font-Bold="True" ForeColor="Red" Text="(1) Please Select: What Would You Like to Add? Exam, Quiz, etc..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <img alt="" src="Images/arrow.gif" />
                                    </td>
                                    <td>
                                        <asp:Label ID="LabelWeekNo" runat="server" Font-Bold="True" Text="Assessment Type:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownListAssessmentTypes" runat="server" DataSourceID="SqlDataSourceAssessmentTypes"
                                            DataTextField="CourseSectionAssessmentType" DataValueField="CourseSectionAssessmentTypeID"
                                            Width="97%" ValidationGroup="AssessmentType">
                                            <asp:ListItem Value="0">Not Selected!</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxAssessmentName"
                                            ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" ValidationGroup="AssessmentType">(*)</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label29" runat="server" Font-Bold="True" ForeColor="Red" Text="(2) Please Write: How Would You Like to Name It? Unit 1 Quiz, etc..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <img alt="" src="Images/arrow.gif" />
                                    </td>
                                    <td>
                                        <asp:Label ID="LabelWeekNo1" runat="server" Font-Bold="True" Text="Assessment Name:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxAssessmentName" runat="server" Width="95%" ValidationGroup="AssessmentType"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="40">
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:Button ID="ButtonAddAssessment" runat="server" CommandName="Insert" Text="Add Assessment"
                                            ValidationGroup="AssessmentType" Width="97%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td height="30">
                                    </td>
                                    <td>
                                        <asp:Label ID="LabelStatus" runat="server" Font-Bold="True"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSourceAssessmentTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT CourseSectionAssessmentTypeID, SectionCatalog + N' / ' + CourseCategory + N' / ' + Description AS CourseSectionAssessmentType FROM vw_CourseSectionAssessmentTypes WHERE (StaffID = @StaffID) AND (CourseSectionID = @CourseSectionID) ORDER BY CourseSectionAssessmentType">
                                <SelectParameters>
                                    <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                                    <asp:ControlParameter ControlID="ListBoxCourses" Name="CourseSectionID" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceCourseSectionsStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                InsertCommand="INSERT INTO tbl_AssessmentMarks(AssessmentID, StudentID, AssessmentMark, Excused) VALUES (@AssessmentID, @StudentID, @AssessmentMark, 0)"
                                SelectCommand="SELECT tbl_CourseSectionStudents.CourseSectionID, tbl_CourseSectionStudents.StudentID FROM tbl_CourseSectionStudents INNER JOIN tbl_CourseSections ON tbl_CourseSectionStudents.CourseSectionID = tbl_CourseSections.CourseSectionID WHERE (tbl_CourseSections.SchoolCode = @SchoolCode)">
                                <InsertParameters>
                                    <asp:Parameter Name="AssessmentID" />
                                    <asp:Parameter Name="StudentID" />
                                    <asp:Parameter Name="AssessmentMark" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabPanelAssessmentList" runat="server" HeaderText="TabPanel1">
                        <HeaderTemplate>
                            Assessment List
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:Label ID="LabelTopicStatus3" runat="server" Font-Bold="False" Font-Size="XX-Small"
                                ForeColor="Red">Step 1-a: If you havent added any Assessments yet, the list will appear empty. Please Add a New Assessment first.</asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="LabelTopicStatus6" runat="server" Font-Bold="False" Font-Size="XX-Small"
                                ForeColor="Red">Step 1-b: After doing changes please use Save Changes Button. Make sure, Assessment Types is correct!</asp:Label>
                            <br />
                            <br />
                            <asp:GridView ID="GridViewAssessments" runat="server" AutoGenerateColumns="False"
                                DataSourceID="SqlDataSourceAssessments" Width="100%" AllowPaging="True" DataKeyNames="AssessmentID">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="ImageItem0" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="AID" SortExpression="AssessmentID">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelAID" runat="server" ForeColor="Red" Text='<%# Bind("AssessmentID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Type">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="DropDownListAssessmentTypes" runat="server" DataSourceID="SqlDataSourceGridViewAssessmentTypes"
                                                DataTextField="CourseSectionAssessmentType" DataValueField="CourseSectionAssessmentTypeID"
                                                SelectedValue='<%# DataBinder.Eval (Container.DataItem, "CourseSectionAssessmentTypeID") %>'
                                                ValidationGroup="AssessmentType" Width="95%">
                                                <asp:ListItem Value="0">Not Selected!</asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <ItemStyle Width="210px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Assessment">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TextBoxAssessmentName" runat="server" MaxLength="40" Text='<%# Bind("Assessment") %>'
                                                ValidationGroup="AssessmentType" Width="90%"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="%">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelPercentage" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Bind("Percentage") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="45px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date">
                                        <ItemStyle Width="75px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="L" SortExpression="IsLocked">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBoxIsLocked" runat="server" Checked='<%# Bind("IsLocked") %>'
                                                Enabled="False" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="D">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButtonDelete" runat="server" ImageUrl="~/StaffSD/Images/delete.gif"
                                                OnClientClick="return confirm('Are you sure you want to delete this Assessment?')"
                                                ToolTip="Delete!" OnClick="ImageButtonClick_AssessmentDelete" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div align="center">
                                        <br />
                                        <img alt="" src="Images/no-data.png" />
                                        <br />
                                        <br />
                                        <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Please Select a Course to Load Given Assessments!"
                                            Font-Size="Medium" ForeColor="Red"></asp:Label>
                                        <br />
                                        <br />
                                    </div>
                                </EmptyDataTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                                <RowStyle Height="30px" />
                            </asp:GridView>
                            <br />
                            <asp:Button ID="ButtonUpdate" runat="server" Text="Save Changes" Width="100%" />
                            <br />
                            <br />
                            <asp:Label ID="LabelFooter" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            <br />
                            <asp:ConfirmButtonExtender ID="ButtonUpdate_ConfirmButtonExtender" runat="server"
                                ConfirmText="Are you sure? This will save your changes." Enabled="True" TargetControlID="ButtonUpdate">
                            </asp:ConfirmButtonExtender>
                            <asp:SqlDataSource ID="SqlDataSourceAssessments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT AssessmentID, CourseCategory, AssessmentType, Assessment, Date, SectionCatalog, Percentage, CourseSectionAssessmentTypeID, IsLocked FROM vw_AssessmentsByTeachers WHERE (AcademicTermID = @AcademicTermID) AND (CourseSectionID = @CourseSectionID) AND (StaffID = @StaffID)"
                                DeleteCommand="DELETE FROM tbl_Assessments WHERE (AssessmentID = @AssessmentID) DELETE FROM tbl_AssessmentMarks WHERE (AssessmentID = @AssessmentID)"
                                UpdateCommand="UPDATE tbl_Assessments SET CourseSectionAssessmentTypeID = @CourseSectionAssessmentTypeID, Assessment = @Assessment WHERE (AssessmentID = @AssessmentID)">
                                <DeleteParameters>
                                    <asp:Parameter Name="AssessmentID" />
                                </DeleteParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="ListBoxCourses" Name="CourseSectionID" PropertyName="SelectedValue" />
                                    <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="CourseSectionAssessmentTypeID" />
                                    <asp:Parameter Name="Assessment" />
                                    <asp:Parameter Name="AssessmentID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceGridViewAssessmentTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT CourseSectionAssessmentTypeID, SectionCatalog + N' / ' + Description AS CourseSectionAssessmentType FROM vw_CourseSectionAssessmentTypes WHERE (StaffID = @StaffID) AND (CourseSectionID = @CourseSectionID) ORDER BY SectionCatalog + N' / ' + Description">
                                <SelectParameters>
                                    <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                                    <asp:ControlParameter ControlID="ListBoxCourses" Name="CourseSectionID" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
                <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT CourseSectionID, SectionGroup, SectionCatalog + N' ' + CourseCategory AS CourseCategory FROM vw_CourseSections WHERE (StaffID = @StaffID) AND (AcademicTermID = @AcademicTermID) AND (CourseCategory &lt;&gt; N'Guidance') ORDER BY SectionGroup, SectionCatalog + N' ' + CourseCategory">
                    <SelectParameters>
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <uc3:WebMessageBox ID="WebMessageBoxChecklist" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
