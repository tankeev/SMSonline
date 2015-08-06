<%@ Page Title="SIS Final Course Averages" Language="VB" MasterPageFile="~/Site.Master"
    EnableEventValidation="false" AutoEventWireup="false" CodeFile="ReportCardsCourseAveragesFin.aspx.vb"
    Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuReportCards.ascx" TagName="MenuReportCardsStaff" TagPrefix="uc2" %>
<%@ Register Src="WebMessageBox.ascx" TagName="UCWebMessageBox" TagPrefix="uc2" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc2:MenuReportCardsStaff ID="MenuReportCardsStaff" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label174" runat="server" Font-Bold="True" Text="Select Semester" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
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
                            <asp:Label ID="Label175" runat="server" Font-Bold="True" ForeColor="Red" Text="Select Course"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridViewCourses" runat="server" AutoGenerateColumns="False" BackColor="White"
                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" DataKeyNames="CourseCatalogID,CourseGroupingID,SectionCatalogID"
                                DataSourceID="SqlDataSourceCourses" ShowHeader="False" Width="95%">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButtonRadio" runat="server" CausesValidation="False" CommandName="Select"
                                                ImageUrl="~/Staff/Images/radiobutton.png" Text="Select" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CourseCategory" HeaderText="Course Category" ReadOnly="True" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <asp:Label ID="Label177" runat="server" Text="Sorry, No Courses Found!"></asp:Label>
                                </EmptyDataTemplate>
                                <RowStyle Height="25px" />
                                <SelectedRowStyle BackColor="#FFFF66" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td height="35">
                            <asp:Label ID="LabelTotal" runat="server" ForeColor="Red"></asp:Label>
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
                            <asp:Panel ID="PanelPresent1" runat="server" BackColor="#99CC00" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label19" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(E) "></asp:Label>
                            <asp:Label ID="Label15" runat="server" Font-Size="X-Small" Text="Exam"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelAbsentwithLeave0" runat="server" BackColor="#FFFF99" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label21" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(Q) "></asp:Label>
                            <asp:Label ID="Label146" runat="server" Font-Size="X-Small" Text="Quiz"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelEarlyLeave" runat="server" BackColor="#FFCC00" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label147" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(H) "></asp:Label>
                            <asp:Label ID="Label17" runat="server" Font-Size="X-Small" Text="Homework"></asp:Label>
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
                            <asp:Panel ID="PanelSickLeave2" runat="server" BackColor="#CC6699" BorderWidth="1px"
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
                        <td width="35">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Staff/Images/info.png" />
                        </td>
                        <td width="80">
                            <asp:Label ID="Label142" runat="server" Font-Bold="True" ForeColor="Red" Text="Weighting:"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label143" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Exams:"></asp:Label>
                        </td>
                        <td width="40">
                            <asp:Label ID="Label138" runat="server" Font-Bold="True" ForeColor="Red" Text="30%"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label136" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Quizzes:"></asp:Label>
                        </td>
                        <td width="40">
                            <asp:Label ID="Label139" runat="server" Font-Bold="True" ForeColor="Red" Text="25%"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label137" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Homework:"></asp:Label>
                        </td>
                        <td width="40">
                            <asp:Label ID="Label141" runat="server" Font-Bold="True" ForeColor="Red" Text="20%"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label140" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Evaluation:"></asp:Label>
                        </td>
                        <td class="G">
                            <asp:Label ID="Label135" runat="server" Font-Bold="True" ForeColor="Red" Text="25%"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="GridViewStudents" runat="server" Width="675px" DataSourceID="SqlDataSourceAssessmentsFinalStudents"
                    AutoGenerateColumns="False" Style="margin-left: 0px">
                    <Columns>
                        <asp:TemplateField HeaderText="SID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="LabelSID" runat="server" Text='<%# Bind("StudentID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student Name">
                            <ItemTemplate>
                                <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 150px">
                                    <asp:Label ID="LabelStudentName" runat="server" Font-Size="XX-Small" Text='<%# Bind("StudentName") %>'></asp:Label>
                                </div>
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
                                <asp:Label ID="LabelAverage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                <asp:Label ID="LabelKnowledge" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            </FooterTemplate>
                            <HeaderTemplate>
                                <asp:Label ID="Label178" runat="server" Text="Average"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxAverage" runat="server" MaxLength="3" Width="25px" Visible="False"
                                    Enabled="False">0</asp:TextBox>
                                <asp:TextBox ID="TextBoxKnowledge" runat="server" MaxLength="3" Text='<%# Bind("Knowledge") %>'
                                    Visible="False" Width="25px" Enabled="False"></asp:TextBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="65px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Practice">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxPractice" runat="server" MaxLength="3" Text='<%# Bind("Practice") %>'
                                    Width="25px" Enabled="False"></asp:TextBox>
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
                    <HeaderStyle Height="30px" />
                </asp:GridView>
                <br />
                <asp:Panel ID="PanelInput" runat="server" Width="680px" Visible="False">
                    <asp:Label ID="LabelStatus5" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red">Student Course Scores have NOT been sent to the Report Card!</asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="ButtonReady" runat="server" Text="Send Scores to Report Card" ValidationGroup="Average"
                        Width="675px" />
                    <br />
                    <asp:ConfirmButtonExtender ID="ButtonReady_ConfirmButtonExtender" runat="server"
                        ConfirmText="Are you sure, you want to send scores?" Enabled="True" TargetControlID="ButtonReady">
                    </asp:ConfirmButtonExtender>
                    <br />
                </asp:Panel>
                <asp:Panel ID="PanelOutput" runat="server" Visible="False" Width="680px">
                    <asp:Label ID="LabelStatus4" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red">Student Course Scores have already been sent to the Report Card!</asp:Label>
                    <br />
                </asp:Panel>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceAcademicSemesters" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AcademicSemesterID, AcademicTermID, AcademicYear + N' ' + AcademicSemester AS AcademicTerm FROM tbl_AcademicTerms WHERE (ReportTypeID = 2) ORDER BY Active DESC, AcademicYear + N' ' + AcademicSemester">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT SectionCatalog + N' ' + CourseCategory AS CourseCategory, CourseCatalogID, SectionCatalogID, CourseGroupingID, SectionGroup FROM vw_CourseSections WHERE (StaffID = @StaffID) AND (IsAcademic = 1) AND (CourseGroupingIsChild = 0) AND (AcademicSemesterID = @AcademicSemesterID) ORDER BY SectionGroup, CourseCategory">
                    <SelectParameters>
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                        <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessmentsFinalStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName, CourseCategory, Exam, Quiz, Homework, Evaluation, Knowledge, Practice FROM vw_AssessmentMarksAverageofTypesFinalPivot WHERE (AcademicSemesterID = @AcademicSemesterID) AND (SectionCatalogID = @SectionCatalogID) AND (CourseCatalogID = @CourseCatalogID) AND (SchoolCode = @SchoolCode) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAcademicSemesters" Name="AcademicSemesterID"
                            PropertyName="SelectedValue" />
                        <asp:Parameter Name="SectionCatalogID" />
                        <asp:ControlParameter ControlID="GridViewCourses" Name="CourseCatalogID" PropertyName="SelectedValue" />
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceReportFinalAverages" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT ReportAverageID FROM tbl_ReportAverages" InsertCommand="UPDATE tbl_ReportAverages SET Average = @Average, AddedBy = @AddedBy, AddedDate = @AddedDate, Practice = @Practice WHERE (StudentID = @StudentID) AND (AcademicSemesterID = @AcademicSemesterID) AND (CourseCatalogID = @CourseCatalogID) AND (ReportTypeID = @ReportTypeID)

IF @@ROWCOUNT = 0 

INSERT INTO tbl_ReportAverages(AcademicTermID, StudentID, CourseSectionID, AcademicSemesterID, Average, Practice, AddedBy, AddedDate, ApprovedByTeacher, CurrentSectionID, CourseGroupingID, ReportTypeID, CourseCatalogID, SchoolCode) VALUES (@AcademicTermID, @StudentID, @CourseSectionID, @AcademicSemesterID, @Average, @Practice, @AddedBy, @AddedDate, @ApprovedByTeacher, @CurrentSectionID, @CourseGroupingID, @ReportTypeID, @CourseCatalogID, @SchoolCode)">
                    <InsertParameters>
                        <asp:Parameter Name="Average" />
                        <asp:Parameter Name="AddedBy" />
                        <asp:Parameter Name="AddedDate" />
                        <asp:Parameter Name="Practice" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="AcademicSemesterID" />
                        <asp:Parameter Name="CourseCatalogID" />
                        <asp:Parameter Name="ReportTypeID" />
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="CourseSectionID" />
                        <asp:Parameter Name="ApprovedByTeacher" />
                        <asp:Parameter Name="CurrentSectionID" />
                        <asp:Parameter Name="CourseGroupingID" />
                        <asp:Parameter Name="SchoolCode" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceReportAttitude" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    InsertCommand="UPDATE tbl_ReportAttitudes SET Attitude = @Attitude WHERE (StudentID = @StudentID) AND (AcademicSemesterID = @AcademicSemesterID) AND (CourseCatalogID = @CourseCatalogID) AND (ReportTypeID = @ReportTypeID)

IF @@ROWCOUNT=0

INSERT INTO tbl_ReportAttitudes(AcademicTermID, StudentID, CourseSectionID, Attitude, AcademicSemesterID, ReportTypeID, CourseCatalogID, CurrentSectionID) VALUES (@AcademicTermID, @StudentID, @CourseSectionID, @Attitude, @AcademicSemesterID, @ReportTypeID, @CourseCatalogID, @CurrentSectionID)"
                    SelectCommand="SELECT AttitudeID FROM tbl_ReportAttitudes">
                    <InsertParameters>
                        <asp:Parameter Name="Attitude" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="AcademicSemesterID" />
                        <asp:Parameter Name="CourseCatalogID" />
                        <asp:Parameter Name="ReportTypeID" />
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="CourseSectionID" />
                        <asp:Parameter Name="CurrentSectionID" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <uc2:UCWebMessageBox ID="WebMessageBoxCourseAverages" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
