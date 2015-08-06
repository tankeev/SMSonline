<%@ Page Title="SIS Final Course Averages" Language="VB" MasterPageFile="~/Site.Master"
    EnableEventValidation="false" AutoEventWireup="false" CodeFile="ReportCardsCourseAveragesFin.aspx.vb"
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
                                NavigateUrl="~/Coordinators/ReportCardsCourseAveragesGroupedFin.aspx" ToolTip="Essay Evaluation"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label34" runat="server" Text="Grouped Courses &amp; Scores"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label runat="server" Text="Select Semester" Font-Bold="True" ForeColor="Red"
                                ID="Label173"></asp:Label>
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
                                                ImageUrl="~/Coordinators/Images/radiobutton.png" Text="Select" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Academic Semesters">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelAS" runat="server" Font-Size="XX-Small" Text='<%# Eval("AcademicSemester") %>'></asp:Label>
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
                            <asp:Label ID="Label44" runat="server" Font-Bold="True" Text="Select Section" ForeColor="Red"></asp:Label>
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
                            <asp:GridView ID="GridViewCourses" runat="server" AutoGenerateColumns="False" DataKeyNames="CourseCatalogID,CourseGroupingID"
                                DataSourceID="SqlDataSourceCourses" Width="95%" ShowHeader="False" BackColor="White"
                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButtonRadio" runat="server" CausesValidation="False" CommandName="Select"
                                                ImageUrl="~/Coordinators/Images/radiobutton.png" Text="Select" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CourseCategory" HeaderText="Course Category" ReadOnly="True"
                                        SortExpression="CourseCategory" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <asp:Label ID="Label177" runat="server" Text="Please Select A Section!"></asp:Label>
                                </EmptyDataTemplate>
                                <RowStyle Height="22px" />
                                <SelectedRowStyle BackColor="#FFFF66" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label176" runat="server" Font-Bold="True" ForeColor="Red" Text="Lock - Unlock Averages"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="border: 1px solid #999999; background-color: #FFFFFF" width="95%">
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="RadioButtonListLocker" runat="server" Font-Bold="True" ForeColor="Red"
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True" Value="1">Lock</asp:ListItem>
                                            <asp:ListItem Value="2">Unlock</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td>
                                        <asp:Button ID="ButtonSave" runat="server" Text="Update" ValidationGroup="Average" />
                                        <asp:ConfirmButtonExtender ID="ButtonSave_ConfirmButtonExtender" runat="server" ConfirmText="Do you really want to continue?"
                                            Enabled="True" TargetControlID="ButtonSave">
                                        </asp:ConfirmButtonExtender>
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
                <table style="border: 1px solid #CCCCCC; background-color: #FFFF99;" width="675">
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
                <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" Width="675px"
                    DataSourceID="SqlDataSourceAssessmentsFinalStudents" ShowFooter="True">
                    <Columns>
                        <asp:TemplateField HeaderText="SID" SortExpression="StudentID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="LabelSID" runat="server" Text='<%# Bind("StudentID") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StudentID") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student Name" SortExpression="StudentName">
                            <ItemTemplate>
                                <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 160px">
                                    <asp:Label ID="LabelStudentName" runat="server" Text='<%# Bind("StudentName") %>'
                                        Font-Size="XX-Small"></asp:Label></div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Exam">
                            <ItemTemplate>
                                <asp:Label ID="LabelExam" runat="server" Text='<%# Eval("Exam") %>' Font-Bold="True"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="45px" BackColor="#99CC00" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Quiz">
                            <ItemTemplate>
                                <asp:Label ID="LabelQuiz" runat="server" Text='<%# Eval("Quiz") %>' Font-Bold="True"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="45px" BackColor="#FFFF99" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Homework">
                            <ItemTemplate>
                                <asp:Label ID="LabelHomework" runat="server" Text='<%# Eval("Homework") %>' Font-Bold="True"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="70px" BackColor="#FFCC00" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Evaluation">
                            <ItemTemplate>
                                <asp:Label ID="LabelEvaluation" runat="server" Text='<%# Eval("Evaluation") %>' Font-Bold="True"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="70px" BackColor="#6699FF" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Average">
                            <FooterTemplate>
                                <asp:Label ID="LabelAverage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                <asp:Label ID="LabelKnowledge" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxAverage" runat="server" Width="25px" MaxLength="3" Visible="False">0</asp:TextBox>
                                <asp:TextBox ID="TextBoxKnowledge" runat="server" MaxLength="3" Text='<%# Bind("Knowledge") %>'
                                    Visible="False" Width="25px"></asp:TextBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Practice">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxPractice" runat="server" Width="25px" MaxLength="3" Text='<%# Bind("Practice") %>'></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidatorTextBoxPractice" runat="server" ControlToValidate="TextBoxPractice"
                                    ErrorMessage="RangeValidator" Font-Bold="True" ForeColor="Red" MaximumValue="100"
                                    MinimumValue="0" Type="Integer" ValidationGroup="Average">*</asp:RangeValidator>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Attitude">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListAttitude" runat="server">
                                    <asp:ListItem Value="A">A</asp:ListItem>
                                    <asp:ListItem Value="B">B</asp:ListItem>
                                    <asp:ListItem Value="C">C</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle BackColor="#FF9999" HorizontalAlign="Center" Width="50px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="L">
                            <ItemTemplate>
                                <asp:FormView ID="FormViewIsReady" runat="server" DataSourceID="SqlDataSourceIsReadyforReport">
                                    <EmptyDataTemplate>
                                        <asp:ImageButton ID="ImageButtonUnLocked" runat="server" ImageUrl="~/Coordinators/Images/assessment_unlocked.png"
                                            OnClick="ImageButtonUnlocked_Clicked" ToolTip="Click to Lock!" />
                                        <asp:ConfirmButtonExtender ID="ImageButtonUnLocked_ConfirmButtonExtender" runat="server"
                                            ConfirmText="Do you really want to LOCK the Scores?" Enabled="True" TargetControlID="ImageButtonUnLocked">
                                        </asp:ConfirmButtonExtender>
                                    </EmptyDataTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButtonLock" runat="server" ImageUrl="~/Coordinators/Images/assessment_lock.png"
                                            OnClick="ImageButtonLocked_Clicked" ToolTip="Click to Unlock!" />
                                        <asp:ConfirmButtonExtender ID="ImageButtonLock_ConfirmButtonExtender" runat="server"
                                            ConfirmText="Do you really want to UNLOCK the Scores?" Enabled="True" TargetControlID="ImageButtonLock">
                                        </asp:ConfirmButtonExtender>
                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:SqlDataSource ID="SqlDataSourceIsReadyforReport" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                    SelectCommand="SELECT ApprovedByTeacher FROM tbl_ReportAverages WHERE (StudentID = @StudentID) AND (CourseCatalogID = @CourseCatalogID) AND (AcademicSemesterID = @AcademicSemesterID) AND (ReportTypeID = @ReportTypeID)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                        <asp:ControlParameter ControlID="GridViewCourses" DefaultValue="" Name="CourseCatalogID"
                                            PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                                            PropertyName="SelectedValue" />
                                        <asp:Parameter Name="ReportTypeID" DefaultValue="2" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:HiddenField ID="HiddenFieldStudentID" runat="server" Value='<%# Eval("StudentID") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
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
                    <FooterStyle Height="28px" HorizontalAlign="Center" />
                    <HeaderStyle Height="30px" />
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceAcademicSemesters" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AcademicTermID, AcademicSemesterID, AcademicYear + N' ' + AcademicSemester AS AcademicSemester FROM tbl_AcademicTerms WHERE (ReportTypeID = 2) ORDER BY Active DESC, AcademicSemester">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) AND (SectionSchool &lt;&gt; N'SD') ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT CourseCatalogID, CourseGroupingID, SectionCatalog + N' ' + CourseCategory AS CourseCategory, SectionGroup FROM vw_CourseSections WHERE (AcademicSemesterID = @AcademicSemesterID) AND (SchoolCode = @SchoolCode) AND (SectionCatalogID = @SectionCatalogID) AND (IsAcademic = 1) AND (CourseGroupingIsChild = 0) ORDER BY SectionGroup, CourseCategory">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                            PropertyName="SelectedValue" />
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                        <asp:ControlParameter ControlID="DropDownListSections" Name="SectionCatalogID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessmentsFinalStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName, CourseCategory, Quiz, Homework, Exam, Evaluation, Practice, Knowledge FROM vw_AssessmentMarksAverageofTypesFinalPivot WHERE (AcademicSemesterID = @AcademicSemesterID) AND (SectionCatalogID = @SectionCatalogID) AND (CourseCatalogID = @CourseCatalogID) AND (SchoolCode = @SchoolCode) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSections" Name="SectionCatalogID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridViewCourses" Name="CourseCatalogID" PropertyName="SelectedValue" />
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceReportFinalAverages" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT ReportAverageID FROM tbl_ReportAverages" InsertCommand="UPDATE tbl_ReportAverages SET Average = @Average, AddedBy = @AddedBy, AddedDate = @AddedDate, Practice = @Practice WHERE (StudentID = @StudentID) AND (CourseCatalogID = @CourseCatalogID) AND (ReportTypeID = @ReportTypeID) AND (AcademicSemesterID = @AcademicSemesterID)

IF @@ROWCOUNT = 0 

INSERT INTO tbl_ReportAverages(AcademicTermID, AcademicSemesterID, SchoolCode, CourseSectionID, CourseCatalogID, CurrentSectionID, CourseGroupingID, ReportTypeID, StudentID, Average, Practice, AddedBy, AddedDate, ApprovedByTeacher) VALUES (@AcademicTermID, @AcademicSemesterID, @SchoolCode, @CourseSectionID, @CourseCatalogID, @CurrentSectionID, @CourseGroupingID, @ReportTypeID, @StudentID, @Average, @Practice, @AddedBy, @AddedDate, @ApprovedByTeacher)"
                    DeleteCommand="DELETE FROM tbl_ReportAverages WHERE (AcademicSemesterID = @AcademicSemesterID) AND (StudentID = @StudentID) AND (CourseCatalogID = @CourseCatalogID) AND (ReportTypeID = @ReportTypeID)">
                    <DeleteParameters>
                        <asp:Parameter Name="AcademicSemesterID" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="CourseCatalogID" />
                        <asp:Parameter Name="ReportTypeID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Average" />
                        <asp:Parameter Name="AddedBy" />
                        <asp:Parameter Name="AddedDate" />
                        <asp:Parameter Name="Practice" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="CourseCatalogID" />
                        <asp:Parameter Name="ReportTypeID" />
                        <asp:Parameter Name="AcademicSemesterID" />
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="SchoolCode" />
                        <asp:Parameter Name="CourseSectionID" />
                        <asp:Parameter Name="CurrentSectionID" />
                        <asp:Parameter Name="CourseGroupingID" />
                        <asp:Parameter Name="ApprovedByTeacher" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceReportAttitude" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    InsertCommand="IF NOT EXISTS (
SELECT AttitudeID FROM tbl_ReportAttitudes WHERE (AcademicSemesterID = @AcademicSemesterID) AND (ReportTypeID = @ReportTypeID) AND (CourseCatalogID = @CourseCatalogID) AND (StudentID = @StudentID)
)
INSERT INTO tbl_ReportAttitudes(AcademicTermID, StudentID, CourseSectionID, Attitude, AcademicSemesterID, ReportTypeID, CourseCatalogID, CurrentSectionID) VALUES (@AcademicTermID, @StudentID, @CourseSectionID, @Attitude, @AcademicSemesterID, @ReportTypeID, @CourseCatalogID, @CurrentSectionID)"
                    SelectCommand="SELECT AttitudeID FROM tbl_ReportAttitudes">
                    <InsertParameters>
                        <asp:Parameter Name="AcademicSemesterID" />
                        <asp:Parameter Name="ReportTypeID" />
                        <asp:Parameter Name="CourseCatalogID" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="CourseSectionID" />
                        <asp:Parameter Name="Attitude" />
                        <asp:Parameter Name="CurrentSectionID" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <uc1:WebMessageBox ID="WebMessageBoxCourseAverages" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
