<%@ Page Title="SIS Course Averages" Language="VB" MasterPageFile="~/Site.Master"
    EnableEventValidation="false" AutoEventWireup="false" CodeFile="ReportCardsCourseAveragesMid.aspx.vb"
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
                            <asp:Label ID="Label175" runat="server" Font-Bold="True" Text="Select Academic Term"
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridViewAcademicTerms" runat="server" AutoGenerateColumns="False"
                                BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                                DataKeyNames="AcademicTermID,AcademicSemesterID" DataSourceID="SqlDataSourceAcademicTerms"
                                ShowHeader="False" Width="95%">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButtonRadio" runat="server" CausesValidation="False" CommandName="Select"
                                                ImageUrl="~/StaffSD/Images/radiobutton.png" Text="Select" />
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
                            <asp:GridView ID="GridViewCourses" runat="server" AutoGenerateColumns="False" DataKeyNames="CourseCatalogID,CourseGroupingID,CourseSectionID"
                                DataSourceID="SqlDataSourceCourses" Width="95%" ShowHeader="False" BackColor="White"
                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButtonRadio" runat="server" CausesValidation="False" CommandName="Select"
                                                ImageUrl="~/StaffSD/Images/radiobutton.png" Text="Select" />
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
                            <asp:Label ID="Label176" runat="server" Font-Bold="True" ForeColor="Red" Text="Lock - Unlock Averages"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <table width="95%" style="border: 1px solid #999999; background-color: #FFFFFF">
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="RadioButtonListMidTermLocker" runat="server" Font-Bold="True"
                                            ForeColor="Red" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True" Value="1">Lock</asp:ListItem>
                                            <asp:ListItem Value="2">Unlock</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td>
                                        <asp:Button ID="ButtonMidTermSave" runat="server" Text="Update" ValidationGroup="Average" />
                                        <asp:ConfirmButtonExtender ID="ButtonMidTermSave_ConfirmButtonExtender" runat="server"
                                            ConfirmText="Do you really want to continue?" Enabled="True" TargetControlID="ButtonMidTermSave">
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
                <asp:GridView ID="GridViewMidTermStudents" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceAssessmentsMidTermStudents" ShowFooter="True" Width="675px">
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
                            <FooterTemplate>
                                <asp:Label ID="LabelQuizAverage" runat="server" Font-Bold="True" ForeColor="Red">100</asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelQuiz" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Eval("Quiz") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle BackColor="#F0B7FF" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle BackColor="#FFFF99" HorizontalAlign="Center" Width="65px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="HW">
                            <FooterTemplate>
                                <asp:Label ID="LabelHomeworkAverage" runat="server" Font-Bold="True" ForeColor="Red">100</asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelHomework" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Eval("Homework") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle BackColor="#F0B7FF" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle BackColor="#FFCC00" HorizontalAlign="Center" Width="65px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mid-Term">
                            <ItemTemplate>
                                <asp:Label ID="LabelMidTerm" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Eval("MidExam") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="LabelMidTermAverage" runat="server" Font-Bold="True" ForeColor="Red">100</asp:Label>
                            </FooterTemplate>
                            <FooterStyle BackColor="#F0B7FF" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle BackColor="#99CC00" HorizontalAlign="Center" Width="65px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Report">
                            <FooterTemplate>
                                <asp:Label ID="LabelReportAverage" runat="server" Font-Bold="True" ForeColor="Red">100</asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxAverage" runat="server" MaxLength="3" Width="25px"></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidatorTextBoxMidAverage" runat="server" ControlToValidate="TextBoxAverage"
                                    ErrorMessage="RangeValidator" Font-Bold="True" ForeColor="Red" MaximumValue="100"
                                    MinimumValue="0" Type="Integer" ValidationGroup="Average">*</asp:RangeValidator>
                            </ItemTemplate>
                            <FooterStyle BackColor="#F0B7FF" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="65px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Practice">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxPractice" runat="server" MaxLength="3" Text='<%# Eval("Practice") %>'
                                    Width="25px"></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidatorTextBoxPractice" runat="server" ControlToValidate="TextBoxPractice"
                                    ErrorMessage="RangeValidator" Font-Bold="True" ForeColor="Red" MaximumValue="100"
                                    MinimumValue="0" Type="Integer" ValidationGroup="Average">*</asp:RangeValidator>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="LabelPracticeAverage" runat="server" Font-Bold="True" ForeColor="Red">100</asp:Label>
                            </FooterTemplate>
                            <FooterStyle BackColor="#F0B7FF" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="65px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="L">
                            <ItemTemplate>
                                <asp:FormView ID="FormViewIsReady" runat="server" DataSourceID="SqlDataSourceIsReadyforReport">
                                    <EmptyDataTemplate>
                                        <asp:Image ID="Image5" runat="server" ImageUrl="~/StaffSD/Images/assessment_unlocked.png"
                                            ToolTip="UnLocked!" />
                                    </EmptyDataTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image5" runat="server" ImageUrl="~/StaffSD/Images/assessment_lock.png"
                                            ToolTip="Locked!" />
                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:SqlDataSource ID="SqlDataSourceIsReadyforReport" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                    SelectCommand="SELECT ApprovedByTeacher FROM tbl_ReportAverages WHERE (StudentID = @StudentID) AND (CourseCatalogID = @CourseCatalogID) AND (AcademicTermID = @AcademicTermID)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                        <asp:ControlParameter ControlID="GridViewCourses" Name="CourseCatalogID" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="GridViewAcademicTerms" Name="AcademicTermID" PropertyName="SelectedValue" />
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
                            <img alt="" src="~/Staff/Images/no-data.png" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                Text="Please Select a School Section to Load Data."></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <FooterStyle Height="28px" HorizontalAlign="Center" />
                    <HeaderStyle Height="30px" />
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AcademicTermID, AcademicSemesterID, AcademicYear + N' ' + AcademicSemester + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms WHERE (ReportTypeID = 1) ORDER BY Active DESC, AcademicTerm">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog, SectionSchool FROM vw_Sections WHERE (SchoolCode = @SchoolCode) AND (SectionSchool = N'SD') ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT CourseCatalogID, CourseGroupingID, CourseSectionID, SectionCatalog + N' ' + CourseCategory AS CourseCategory FROM vw_CourseSections WHERE (AcademicTermID = @AcademicTermID) AND (SchoolCode = @SchoolCode) AND (SectionCatalogID = @SectionCatalogID) AND (IsAcademic = 1) ORDER BY SectionGroup, CourseCategory">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAcademicTerms" Name="AcademicTermID" PropertyName="SelectedValue" />
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="SectionCatalogID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessmentsMidTermStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName, CourseCategory, Quiz, Homework, MidExam, FinalExam, Practice FROM vw_AssessmentMarksAverageofTypesSDMidTermPivot WHERE (CourseCatalogID = @CourseCatalogID) AND (AcademicTermID = @AcademicTermID) AND (SectionCatalogID = @SectionCatalogID) AND (SchoolCode = @SchoolCode) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewCourses" Name="CourseCatalogID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridViewAcademicTerms" Name="AcademicTermID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="SectionCatalogID"
                            PropertyName="SelectedValue" />
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceReportMidTermAverages" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    DeleteCommand="DELETE FROM tbl_ReportAverages WHERE (AcademicTermID = @AcademicTermID) AND (StudentID = @StudentID) AND (CourseCatalogID = @CourseCatalogID)"
                    InsertCommand="UPDATE tbl_ReportAverages SET Average = @Average, AddedBy = @AddedBy, AddedDate = @AddedDate, Practice = @Practice WHERE (StudentID = @StudentID) AND (AcademicTermID = @AcademicTermID) AND (CourseCatalogID = @CourseCatalogID)

IF @@ROWCOUNT = 0 

INSERT INTO tbl_ReportAverages(AcademicTermID, StudentID, CourseSectionID, ReportTypeID, Average, Practice, AddedBy, AddedDate, ApprovedByTeacher, CurrentSectionID, CourseGroupingID, AcademicSemesterID, CourseCatalogID, SchoolCode) VALUES (@AcademicTermID, @StudentID, @CourseSectionID, @ReportTypeID, @Average, @Practice, @AddedBy, @AddedDate, @ApprovedByTeacher, @CurrentSectionID, @CourseGroupingID, @AcademicSemesterID, @CourseCatalogID, @SchoolCode)"
                    SelectCommand="SELECT ReportAverageID FROM tbl_ReportAverages">
                    <DeleteParameters>
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="CourseCatalogID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Average" />
                        <asp:Parameter Name="AddedBy" />
                        <asp:Parameter Name="AddedDate" />
                        <asp:Parameter Name="Practice" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="CourseCatalogID" />
                        <asp:Parameter Name="CourseSectionID" />
                        <asp:Parameter Name="ReportTypeID" />
                        <asp:Parameter Name="ApprovedByTeacher" />
                        <asp:Parameter Name="CurrentSectionID" />
                        <asp:Parameter Name="CourseGroupingID" />
                        <asp:Parameter Name="AcademicSemesterID" />
                        <asp:Parameter Name="SchoolCode" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <uc1:WebMessageBox ID="WebMessageBoxCourseAverages" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
