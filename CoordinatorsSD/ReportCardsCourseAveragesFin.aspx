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
                        <td height="28">
                            <asp:Label ID="Label175" runat="server" Font-Bold="True" Text="Select Semester" ForeColor="Red"></asp:Label>
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
                                                ImageUrl="~/CoordinatorsSD/Images/radiobutton.png" Text="Select" />
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
                            <asp:Label ID="Label44" runat="server" Font-Bold="True" Text="Select Section" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListSections" runat="server" DataSourceID="SqlDataSourceSections"
                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" RepeatColumns="4"
                                Width="95%" AutoPostBack="True">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label134" runat="server" Font-Bold="True" Text="Given Courses" ForeColor="Red"></asp:Label>
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
                                                ImageUrl="~/CoordinatorsSD/Images/radiobutton.png" Text="Select" />
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
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label176" runat="server" Font-Bold="True" ForeColor="Red" Text="Lock - Unlock Averages"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <table style="border: 1px solid #999999; background-color: #FFFFFF" width="95%">
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="RadioButtonListFinalLocker" runat="server" Font-Bold="True"
                                            ForeColor="Red" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True" Value="1">Lock</asp:ListItem>
                                            <asp:ListItem Value="2">Unlock</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td width="80">
                                        <asp:Button ID="ButtonFinalSave" runat="server" Text="Update" ValidationGroup="Average" />
                                        <asp:ConfirmButtonExtender ID="ButtonFinalSave_ConfirmButtonExtender" runat="server"
                                            ConfirmText="Do you really want to continue?" Enabled="True" TargetControlID="ButtonFinalSave">
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
                    COURSE AVERAGES</h2>
                <br />
                <table style="border: 1px solid #CCCCCC; background-color: #FFFF99;" width="675">
                    <tr>
                        <td width="25">
                            <asp:Panel ID="PanelAbsentwithoutLeave2" runat="server" BackColor="Red" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td width="100">
                            <asp:Label ID="Label154" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(F) "></asp:Label>
                            <asp:Label ID="Label155" runat="server" Font-Size="X-Small" Text="Failed"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelPresent5" runat="server" BackColor="#006600" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td width="100">
                            <asp:Label ID="Label152" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(P) "></asp:Label>
                            <asp:Label ID="Label153" runat="server" Font-Size="X-Small" Text="Passed"></asp:Label>
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
                            <asp:Label ID="Label156" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(Q) "></asp:Label>
                            <asp:Label ID="Label157" runat="server" Font-Size="X-Small" Text="Quiz"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelEarlyLeave0" runat="server" BackColor="#FFCC00" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label158" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(H) "></asp:Label>
                            <asp:Label ID="Label159" runat="server" Font-Size="X-Small" Text="Homework"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelPresent2" runat="server" BackColor="#99CC00" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label160" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(M) "></asp:Label>
                            <asp:Label ID="Label161" runat="server" Font-Size="X-Small" Text="Mid-Exam"></asp:Label>
                        </td>
                        <td>
                            <asp:Panel ID="PanelSickLeave3" runat="server" BackColor="#6699FF" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label162" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(F) "></asp:Label>
                            <asp:Label ID="Label163" runat="server" Font-Size="X-Small" Text="Final-Exam"></asp:Label>
                        </td>
                        <td>
                            <asp:Panel ID="PanelSickLeave4" runat="server" BackColor="#FFCCFF" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label164" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(P) "></asp:Label>
                            <asp:Label ID="Label165" runat="server" Font-Size="X-Small" Text="Practice"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table style="border: 1px solid #999999; background-color: #E5E5E5" width="675">
                    <tr>
                        <td height="28" width="35">
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Staff/Images/info.png" />
                        </td>
                        <td width="75">
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Red" Text="Weighting:"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Homework:"
                                Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="35">
                            <asp:Label ID="Label7" runat="server" Font-Bold="True" ForeColor="Red" Text="20%"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Quizzes:"
                                Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="35">
                            <asp:Label ID="Label166" runat="server" Font-Bold="True" ForeColor="Red" Text="25%"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label167" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Mid-Term Exam:"
                                Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="35">
                            <asp:Label ID="Label168" runat="server" Font-Bold="True" ForeColor="Red" Text="25%"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label169" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Final Exam:"
                                Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="40">
                            <asp:Label ID="Label170" runat="server" Font-Bold="True" ForeColor="Red" Text="30%"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="GridViewFinalStudents" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceAssessmentsFinalStudents" ShowFooter="True" Width="675px">
                    <Columns>
                        <asp:TemplateField HeaderText="SID" SortExpression="StudentID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="LabelSID" runat="server" Text='<%# Bind("StudentID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student Name" SortExpression="StudentName">
                            <ItemTemplate>
                                <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 200px">
                                    <asp:Label ID="LabelStudentName" runat="server" Font-Size="XX-Small" Text='<%# Bind("StudentName") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Quiz">
                            <ItemTemplate>
                                <asp:Label ID="LabelQuiz" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Eval("Quiz") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle BackColor="#FFFF99" HorizontalAlign="Center" Width="65px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="HW">
                            <ItemTemplate>
                                <asp:Label ID="LabelHomework" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Eval("Homework") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle BackColor="#FFCC00" HorizontalAlign="Center" Width="65px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mid-Term">
                            <ItemTemplate>
                                <asp:Label ID="LabelMidTerm" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Eval("MidExam") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle BackColor="#99CC00" HorizontalAlign="Center" Width="65px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Final">
                            <ItemTemplate>
                                <asp:Label ID="LabelFinal" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Eval("FinalExam") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle BackColor="#6699FF" HorizontalAlign="Center" Width="65px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Average">
                            <FooterTemplate>
                                <asp:Label ID="LabelReport" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxAverage" runat="server" MaxLength="3" Width="25px"></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidatorTextBoxFinalAverage" runat="server" ControlToValidate="TextBoxAverage"
                                    ErrorMessage="RangeValidator" Font-Bold="True" ForeColor="Red" MaximumValue="100"
                                    MinimumValue="0" Type="Integer" ValidationGroup="Average">*</asp:RangeValidator>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="65px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Practice">
                            <FooterTemplate>
                                <asp:Label ID="LabelPractice" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxPractice" runat="server" MaxLength="3" Text='<%# Eval("Practice") %>'
                                    Width="25px"></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidatorTextBoxPractice" runat="server" ControlToValidate="TextBoxPractice"
                                    ErrorMessage="RangeValidator" Font-Bold="True" ForeColor="Red" MaximumValue="100"
                                    MinimumValue="0" Type="Integer" ValidationGroup="Average">*</asp:RangeValidator>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="65px" />
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
                                        <asp:ImageButton ID="ImageButtonUnLocked" runat="server" ImageUrl="~/CoordinatorsSD/Images/assessment_unlocked.png"
                                            OnClick="ImageButtonUnlocked_Clicked" ToolTip="Click to Lock!" />
                                        <asp:ConfirmButtonExtender ID="ImageButtonUnLocked_ConfirmButtonExtender" runat="server"
                                            ConfirmText="Do you really want to LOCK the Scores?" Enabled="True" TargetControlID="ImageButtonUnLocked">
                                        </asp:ConfirmButtonExtender>
                                    </EmptyDataTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButtonLock" runat="server" ImageUrl="~/CoordinatorsSD/Images/assessment_lock.png"
                                            OnClick="ImageButtonLocked_Clicked" ToolTip="Click to Unlock!" />
                                        <asp:ConfirmButtonExtender ID="ImageButtonLock_ConfirmButtonExtender" runat="server"
                                            ConfirmText="Do you really want to UNLOCK the Scores?" Enabled="True" TargetControlID="ImageButtonLock">
                                        </asp:ConfirmButtonExtender>
                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:SqlDataSource ID="SqlDataSourceIsReadyforReport" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                    SelectCommand="SELECT ApprovedByTeacher FROM tbl_ReportAverages WHERE (StudentID = @StudentID) AND (CourseCatalogID = @CourseCatalogID) AND (AcademicSemesterID = @AcademicSemesterID) AND (ReportTypeID = 2)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                        <asp:ControlParameter ControlID="GridViewCourses" Name="CourseCatalogID" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                                            PropertyName="SelectedValue" />
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
                            <img alt="" src="../Staff/Images/no-data.png" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" Font-Size="Medium"
                                ForeColor="Red" Text="Please Select a School Section to Load Data."></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <FooterStyle Height="28px" HorizontalAlign="Center" />
                    <HeaderStyle Height="30px" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceAcademicSemesters" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AcademicSemesterID, AcademicTermID, AcademicYear + N' ' + AcademicSemester AS AcademicTerm FROM tbl_AcademicTerms WHERE (ReportTypeID = 2) ORDER BY Active DESC, AcademicYear + N' ' + AcademicSemester">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog, SectionSchool FROM vw_Sections WHERE (SchoolCode = @SchoolCode) AND (SectionSchool = N'SD') ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT CourseCatalogID, CourseGroupingID, SectionCatalog + N' ' + CourseCategory AS CourseCategory, SectionGroup FROM vw_CourseSections WHERE (SchoolCode = @SchoolCode) AND (SectionCatalogID = @SectionCatalogID) AND (IsAcademic = 1) AND (AcademicSemesterID = @AcademicSemesterID) ORDER BY SectionGroup, CourseCategory">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="SectionCatalogID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessmentsFinalStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName, CourseCategory, Quiz, Homework, MidExam, FinalExam, Practice FROM vw_AssessmentMarksAverageofTypesSDFinalPivot WHERE (AcademicSemesterID = @AcademicSemesterID) AND (CourseCatalogID = @CourseCatalogID) AND (SectionCatalogID = @SectionCatalogID) AND (SchoolCode = @SchoolCode) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridViewCourses" Name="CourseCatalogID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="SectionCatalogID"
                            PropertyName="SelectedValue" />
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceReportFinalAverages" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    DeleteCommand="DELETE FROM tbl_ReportAverages WHERE (StudentID = @StudentID) AND (CourseCatalogID = @CourseCatalogID) AND (AcademicSemesterID = @AcademicSemesterID) AND (ReportTypeID = @ReportTypeID)"
                    InsertCommand="UPDATE tbl_ReportAverages SET Average = @Average, AddedBy = @AddedBy, AddedDate = @AddedDate, Practice = @Practice WHERE (StudentID = @StudentID) AND (AcademicSemesterID = @AcademicSemesterID) AND (CourseCatalogID = @CourseCatalogID) AND (ReportTypeID = @ReportTypeID)

IF @@ROWCOUNT = 0 

INSERT INTO tbl_ReportAverages(AcademicSemesterID, ReportTypeID, CourseCatalogID, CurrentSectionID, CourseGroupingID, StudentID, Average, Practice, AddedBy, AddedDate, ApprovedByTeacher, AcademicTermID, CourseSectionID, SchoolCode) VALUES (@AcademicSemesterID, @ReportTypeID, @CourseCatalogID, @CurrentSectionID, @CourseGroupingID, @StudentID, @Average, @Practice, @AddedBy, @AddedDate, @ApprovedByTeacher, @AcademicTermID, @CourseSectionID, @SchoolCode)"
                    SelectCommand="SELECT ReportAverageID FROM tbl_ReportAverages">
                    <DeleteParameters>
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="CourseCatalogID" />
                        <asp:Parameter Name="AcademicSemesterID" />
                        <asp:Parameter Name="ReportTypeID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Average" />
                        <asp:Parameter Name="AddedBy" />
                        <asp:Parameter Name="AddedDate" />
                        <asp:Parameter Name="Practice" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="AcademicSemesterID" />
                        <asp:Parameter Name="CourseCatalogID" />
                        <asp:Parameter Name="ReportTypeID" />
                        <asp:Parameter Name="CurrentSectionID" />
                        <asp:Parameter Name="CourseGroupingID" />
                        <asp:Parameter Name="ApprovedByTeacher" />
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="CourseSectionID" />
                        <asp:Parameter Name="SchoolCode" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceReportAttitude" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" 
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
