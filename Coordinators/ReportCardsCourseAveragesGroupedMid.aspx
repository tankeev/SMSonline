﻿<%@ Page Title="SIS Course Averages" Language="VB" MasterPageFile="~/Site.Master"
    EnableEventValidation="false" AutoEventWireup="false" CodeFile="ReportCardsCourseAveragesGroupedMid.aspx.vb"
    Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuReportCards.ascx" TagName="MenuReportCards" TagPrefix="uc2" %>
<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc2:MenuReportCards ID="MenuReportCards" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkRanking" runat="server" ImageUrl="~/Coordinators/Images/menu_student_ranking.png"
                                NavigateUrl="~/Coordinators/ReportCardsRanking.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label174" runat="server" Text="Student Overall Rankings"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkEssay" runat="server" ImageUrl="~/Coordinators/Images/menu_report_card.png"
                                NavigateUrl="~/Coordinators/ReportCardsCourseAveragesMid.aspx" 
                                ToolTip="Essay Evaluation"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label34" runat="server" Text="Ungrouped Courses &amp; Scores"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label175" runat="server" Font-Bold="True" ForeColor="Red" Text="Select Academic Term"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:GridView ID="GridViewAcademicTerms" runat="server" AutoGenerateColumns="False"
                                BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                                DataKeyNames="AcademicTermID,AcademicSemesterID" DataSourceID="SqlDataSourceAcademicTerms"
                                ShowHeader="False" Width="95%">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButtonRadio" runat="server" CausesValidation="False" CommandName="Select"
                                                ImageUrl="~/Coordinators/Images/radiobutton.png" Text="Select" />
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
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label176" runat="server" Font-Bold="True" Text="Select Section" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="DropDownListSections" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceSections"
                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" Width="95%">
                                <asp:ListItem Value="0">Not Selected!</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label134" runat="server" Font-Bold="True" Text="Select Course" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridViewCourses" runat="server" AutoGenerateColumns="False" BackColor="White"
                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" DataKeyNames="CourseCatalogID,CourseGroupingID,CourseSectionID"
                                DataSourceID="SqlDataSourceCoursesGrouped" ShowHeader="False" Width="95%">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButtonRadio" runat="server" CausesValidation="False" CommandName="Select"
                                                ImageUrl="~/Coordinators/Images/radiobutton.png" Text="Select" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CourseCategory" HeaderText="Course Category" ReadOnly="True" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <asp:Label ID="Label177" runat="server" Text="Please Select A Section!"></asp:Label>
                                </EmptyDataTemplate>
                                <RowStyle Height="25px" />
                                <SelectedRowStyle BackColor="#FFFF66" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label178" runat="server" Font-Bold="True" ForeColor="Red" Text="Lock - Unlock Averages"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <table width="95%" style="border: 1px solid #999999; background-color: #FFFFFF">
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="RadioButtonListLocker" runat="server" Font-Bold="True" ForeColor="Red"
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True" Value="1">Lock</asp:ListItem>
                                            <asp:ListItem Value="2">Unlock</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td width="80">
                                        <asp:Button ID="ButtonSave" runat="server" Text="Update" 
                                            ValidationGroup="Average" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    ASSESSMENTS BY STUDENTS</h2>
                <br />
                <table style="border: 1px solid #CCCCCC; background-color: #FFFF99;" 
                    width="675">
                    <tr>
                        <td width="25">
                            <asp:Panel ID="PanelPresent0" runat="server" BackColor="#006600" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td width="100">
                            <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(P) "></asp:Label>
                            <asp:Label ID="Label12" runat="server" Font-Size="X-Small" Text="Passed"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelAbsentwithoutLeave1" runat="server" BackColor="Red" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td width="100">
                            <asp:Label ID="Label20" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(F) "></asp:Label>
                            <asp:Label ID="Label14" runat="server" Font-Size="X-Small" Text="Failed"></asp:Label>
                        </td>
                        <td width="25">
                        </td>
                        <td width="100">
                        </td>
                        <td width="25">
                        </td>
                        <td width="100">
                        </td>
                        <td width="25">
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td width="25">
                            <asp:Panel ID="PanelAbsentwithLeave1" runat="server" BackColor="#FFFF99" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label19" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(Q) "></asp:Label>
                            <asp:Label ID="Label146" runat="server" Font-Size="X-Small" Text="Quiz"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelEarlyLeave0" runat="server" BackColor="#FFCC00" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label21" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(H) "></asp:Label>
                            <asp:Label ID="Label17" runat="server" Font-Size="X-Small" Text="Homework"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelPresent2" runat="server" BackColor="#99CC00" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label147" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(E) "></asp:Label>
                            <asp:Label ID="Label15" runat="server" Font-Size="X-Small" Text="Exam"></asp:Label>
                        </td>
                        <td>
                            <asp:Panel ID="PanelSickLeave1" runat="server" BackColor="#6699FF" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label22" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(E) "></asp:Label>
                            <asp:Label ID="Label13" runat="server" Font-Size="X-Small" Text="Evaluation"></asp:Label>
                        </td>
                        <td>
                            <asp:Panel ID="PanelSickLeave2" runat="server" BackColor="#FFCCFF" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label144" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(P) "></asp:Label>
                            <asp:Label ID="Label145" runat="server" Font-Size="X-Small" Text="Practice"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table style="border: 1px solid #999999; background-color: #E5E5E5" width="675">
                    <tr>
                        <td height="28" width="35">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Staff/Images/info.png" />
                        </td>
                        <td width="75">
                            <asp:Label ID="Label142" runat="server" Font-Bold="True" ForeColor="Red" Text="Weighting:"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label136" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Quiz:"
                                Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="35">
                            <asp:Label ID="Label138" runat="server" Font-Bold="True" ForeColor="Red" Text="25%"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label137" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Homework:"
                                Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="35">
                            <asp:Label ID="Label139" runat="server" Font-Bold="True" ForeColor="Red" Text="20%"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label143" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Exam:"
                                Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="35">
                            <asp:Label ID="Label141" runat="server" Font-Bold="True" ForeColor="Red" Text="30%"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label140" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Evaluation:"
                                Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="40">
                            <asp:Label ID="Label135" runat="server" Font-Bold="True" ForeColor="Red" Text="25%"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAssessmentsMidTermStudents"
                    Width="675px" PageSize="5" ShowHeader="False">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <asp:Label ID="LabelStudent" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Red"
                                                Text='<%# Eval("StudentName") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:GridView ID="GridViewStudentsGrouped" runat="server" 
                                                AutoGenerateColumns="False" DataSourceID="SqlDataSourceAssessmentsStudentsGrouped"
                                                ShowFooter="True" Width="100%" OnDataBound="DataBound" 
                                                OnRowDataBound="RowDataBound">
                                                <Columns>
                                                    <asp:BoundField DataField="CourseCategory" HeaderText="Course" SortExpression="CourseCategory" />
                                                    <asp:TemplateField HeaderText="SID" SortExpression="StudentID" Visible="False">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LabelSID" runat="server" Text='<%# Bind("StudentID") %>'></asp:Label>
                                                        </ItemTemplate>
                                        
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Exam">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LabelExam" runat="server" Font-Bold="True" Text='<%# Eval("Exam") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle BackColor="#99CC00" HorizontalAlign="Center" Width="45px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Quiz">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LabelQuiz" runat="server" Font-Bold="True" Text='<%# Eval("Quiz") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle BackColor="#FFFF99" HorizontalAlign="Center" Width="45px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Homework">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LabelHomework" runat="server" Font-Bold="True" Text='<%# Eval("Homework") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle BackColor="#FFCC00" HorizontalAlign="Center" Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Evaluation">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LabelEvaluation" runat="server" Font-Bold="True" Text='<%# Eval("Evaluation") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle BackColor="#6699FF" HorizontalAlign="Center" Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Average">
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TextBoxAverageFooter" runat="server" MaxLength="3" Width="25px"></asp:TextBox>
                                                            <asp:RangeValidator ID="RangeValidatorTextBoxAverage" runat="server" ControlToValidate="TextBoxAverageFooter"
                                                                ErrorMessage="RangeValidator" Font-Bold="True" ForeColor="Red" MaximumValue="100"
                                                                MinimumValue="0" Type="Integer" ValidationGroup="Average">*</asp:RangeValidator>
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TextBoxAverage" runat="server" MaxLength="3" Width="25px"></asp:TextBox>
                                                            <asp:RangeValidator ID="RangeValidatorTextBoxAverage" runat="server" ControlToValidate="TextBoxAverage"
                                                                ErrorMessage="RangeValidator" Font-Bold="True" ForeColor="Red" MaximumValue="100"
                                                                MinimumValue="0" Type="Integer" ValidationGroup="Average">*</asp:RangeValidator>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Practice">
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="TextBoxPracticeFooter" runat="server" MaxLength="3" Text='<%# Bind("Practice") %>'
                                                                Width="25px"></asp:TextBox>
                                                            <asp:RangeValidator ID="RangeValidatorTextBoxPracticeFooter" runat="server" ControlToValidate="TextBoxPracticeFooter"
                                                                ErrorMessage="RangeValidator" Font-Bold="True" ForeColor="Red" MaximumValue="100"
                                                                MinimumValue="0" Type="Integer" ValidationGroup="Average">*</asp:RangeValidator>
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TextBoxPractice" runat="server" MaxLength="3" Text='<%# Bind("Practice") %>'
                                                                Width="25px"></asp:TextBox>
                                                            <asp:RangeValidator ID="RangeValidatorTextBoxPractice" runat="server" ControlToValidate="TextBoxPractice"
                                                                ErrorMessage="RangeValidator" Font-Bold="True" ForeColor="Red" MaximumValue="100"
                                                                MinimumValue="0" Type="Integer" ValidationGroup="Average">*</asp:RangeValidator>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" Width="60px" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    Sorry, No Data!
                                                </EmptyDataTemplate>
                                                <FooterStyle Height="28px" HorizontalAlign="Center" />
                                                <HeaderStyle Height="30px" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                                <asp:HiddenField ID="HiddenFieldStudentID" runat="server" Value='<%# Eval("StudentID") %>' />
                                <asp:SqlDataSource ID="SqlDataSourceAssessmentsStudentsGrouped" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                    
                                    SelectCommand="SELECT StudentID, StudentName, CourseCategory, Quiz, Homework, Exam, Evaluation, Practice, Knowledge FROM vw_AssessmentMarksAverageofTypesMidTermPivot WHERE (AcademicTermID = @AcademicTermID) AND (StudentID = @StudentID) AND (CourseGroupingID = @CourseGroupingID) ORDER BY StudentName">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="GridViewAcademicTerms" Name="AcademicTermID" 
                                            PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                        <asp:Parameter Name="CourseGroupingID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LOCKED?">
                            <ItemTemplate>
                                <asp:FormView ID="FormViewIsReady" runat="server" DataSourceID="SqlDataSourceIsReadyforReport">
                                    <EmptyDataTemplate>
                                        <asp:Image ID="Image5" runat="server" ImageUrl="~/Coordinators/Images/assessment_unlocked.png"
                                            ToolTip="UnLocked!" />
                                    </EmptyDataTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image5" runat="server" ImageUrl="~/Coordinators/Images/assessment_lock.png"
                                            ToolTip="Locked!" />
                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:SqlDataSource ID="SqlDataSourceIsReadyforReport" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                    
                                    SelectCommand="SELECT ApprovedByTeacher FROM tbl_ReportAverages WHERE (AcademicTermID = @AcademicTermID) AND (StudentID = @StudentID)  AND (CourseGroupingID = @CourseGroupingID)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="GridViewAcademicTerms" Name="AcademicTermID" 
                                            PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="HiddenFieldStudentIDLocked" Name="StudentID" PropertyName="Value" />
                                        <asp:Parameter Name="CourseGroupingID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:HiddenField ID="HiddenFieldStudentIDLocked" runat="server" Value='<%# Eval("StudentID") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="Images/no-data.png" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                Text="No Assessments Given yet!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AcademicTermID, AcademicSemesterID, AcademicYear + N' ' + AcademicSemester + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms WHERE (ReportTypeID = 1) ORDER BY Active DESC, AcademicTerm">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog, SectionSchool FROM vw_Sections WHERE (SchoolCode = @SchoolCode) AND (SectionSchool &lt;&gt; N'SD') ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCoursesGrouped" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    
                    SelectCommand="SELECT CourseCatalogID, CourseGroupingID, CourseSectionID, SectionCatalog + N' ' + CourseCategory AS CourseCategory FROM vw_CourseSections WHERE (SchoolCode = @SchoolCode) AND (SectionCatalogID = @SectionCatalogID) AND (IsAcademic = 1) AND (CourseGroupingIsChild = 1) AND (AcademicTermID = @AcademicTermID) ORDER BY SectionGroup, CourseCategory">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                        <asp:ControlParameter ControlID="DropDownListSections" Name="SectionCatalogID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridViewAcademicTerms" Name="AcademicTermID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessmentsMidTermStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName FROM tbl_Students WHERE (CurrentSectionID = @CurrentSectionID) AND ([Continue] = 1) AND (SchoolCode = @SchoolCode) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSections" Name="CurrentSectionID" PropertyName="SelectedValue" />
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceReportMidTermAverages" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT ReportAverageID FROM tbl_ReportAverages" InsertCommand="UPDATE tbl_ReportAverages SET Average = @Average, AddedBy = @AddedBy, AddedDate = @AddedDate, Practice = @Practice WHERE (AcademicTermID = @AcademicTermID) AND (StudentID = @StudentID) AND (CourseGroupingID = @CourseGroupingID)

IF @@ROWCOUNT = 0 

INSERT INTO tbl_ReportAverages(AcademicTermID, StudentID, CourseSectionID, ReportTypeID, Average, Practice, AddedBy, AddedDate, ApprovedByTeacher, CourseGroupingID, CurrentSectionID, AcademicSemesterID, SchoolCode, CourseCatalogID) VALUES (@AcademicTermID, @StudentID, @CourseSectionID, @ReportTypeID, @Average, @Practice, @AddedBy, @AddedDate, @ApprovedByTeacher, @CourseGroupingID, @CurrentSectionID, @AcademicSemesterID, @SchoolCode, @CourseCatalogID)"
                    DeleteCommand="DELETE FROM tbl_ReportAverages WHERE (AcademicTermID = @AcademicTermID) AND (StudentID = @StudentID) AND (CourseGroupingID = @CourseGroupingID)">
                    <DeleteParameters>
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="CourseGroupingID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Average" />
                        <asp:Parameter Name="AddedBy" />
                        <asp:Parameter Name="AddedDate" />
                        <asp:Parameter Name="Practice" />
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="CourseGroupingID" />
                        <asp:Parameter Name="CourseSectionID" />
                        <asp:Parameter Name="ReportTypeID" />
                        <asp:Parameter Name="ApprovedByTeacher" />
                        <asp:Parameter Name="CurrentSectionID" />
                        <asp:Parameter Name="AcademicSemesterID" />
                        <asp:Parameter Name="SchoolCode" />
                        <asp:Parameter Name="CourseCatalogID" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <uc1:WebMessageBox ID="WebMessageBoxCourseAverages" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
