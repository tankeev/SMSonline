<%@ Page Title="SIS Mid-Term Course Averages" Language="VB" MasterPageFile="~/Site.Master"
    EnableEventValidation="false" AutoEventWireup="false" CodeFile="ReportCardsCourseAveragesMid.aspx.vb"
    Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuReportCards.ascx" TagName="MenuReportCardsCoordinators" TagPrefix="uc2" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
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
                <uc2:MenuReportCardsCoordinators ID="MenuReportCardsCoordinators" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label175" runat="server" Font-Bold="True" Text="Select Academic Term"
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:GridView ID="GridViewAcademicTerms" runat="server" AutoGenerateColumns="False"
                                BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                                DataKeyNames="AcademicTermID,AcademicSemesterID" DataSourceID="SqlDataSourceAcademicTerms"
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
                            <asp:Label ID="Label134" runat="server" Font-Bold="True" Text="Select a Course Please"
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridViewCourses" runat="server" AutoGenerateColumns="False" BackColor="White"
                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" DataKeyNames="CourseSectionID,CourseCatalogID,CourseGroupingID,SectionCatalogID"
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
                                    <asp:Label ID="Label177" runat="server" Text="Please Select A Section!"></asp:Label>
                                </EmptyDataTemplate>
                                <RowStyle Height="25px" />
                                <SelectedRowStyle BackColor="#FFFF66" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                            <asp:Label ID="LabelTotal" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    REPORT CARD COURSE AVERAGES</h2>
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
                            <asp:Label ID="Label144" runat="server" Font-Bold="True" ForeColor="Red" Text="Weighting:"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label145" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Homework:"
                                Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="35">
                            <asp:Label ID="Label146" runat="server" Font-Bold="True" ForeColor="Red" Text="20%"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label147" runat="server" Font-Bold="True" ForeColor="#333333" Text="MP Quizzes:"
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
                <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" Width="675px"
                    DataSourceID="SqlDataSourceAssessmentsMidTermStudents" Font-Names="Arial" Font-Size="8pt">
                    <Columns>
                        <asp:TemplateField HeaderText="SID" SortExpression="StudentID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="LabelSID" runat="server" Text='<%# Bind("StudentID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student Name" SortExpression="StudentName">
                            <ItemTemplate>
                                <asp:Label ID="LabelStudentName" runat="server" Text='<%# Bind("StudentName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Quiz">
                            <ItemTemplate>
                                <asp:Label ID="LabelQuiz" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Eval("Quiz") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="45px" BackColor="#FFFF99" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="HW">
                            <ItemTemplate>
                                <asp:Label ID="LabelHomework" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Eval("Homework") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" BackColor="#FFCC00" Width="45px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mid-Term">
                            <ItemTemplate>
                                <asp:Label ID="LabelMidTerm" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Eval("MidExam") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="70px" BackColor="#99CC00" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Average">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxMidAverage" runat="server" MaxLength="3" Width="25px"></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidatorTextBoxMidAverage0" runat="server" ControlToValidate="TextBoxMidAverage"
                                    ErrorMessage="RangeValidator" Font-Bold="True" ForeColor="Red" MaximumValue="100"
                                    MinimumValue="0" Type="Integer" ValidationGroup="Average">*</asp:RangeValidator>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="75px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Practice">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxPractice" runat="server" MaxLength="3" Width="25px" Text='<%# Eval("Practice") %>'></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidatorTextBoxPractice" runat="server" ControlToValidate="TextBoxPractice"
                                    ErrorMessage="RangeValidator" Font-Bold="True" ForeColor="Red" MaximumValue="100"
                                    MinimumValue="0" Type="Integer" ValidationGroup="Average">*</asp:RangeValidator>
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
                                Text="Please Select a School Section to Load Data."></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <HeaderStyle Height="30px" />
                </asp:GridView>
                <br />
                <asp:Panel ID="PanelInput" runat="server">
                    <asp:Label ID="LabelStatus5" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Medium">Student Course Scores have NOT been sent to the Report Card!</asp:Label>
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
                <asp:Panel ID="PanelOutput" runat="server" Visible="False">
                    <asp:Label ID="LabelStatus4" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red">Student Course Scores have already been sent to the Report Card!</asp:Label>
                    <br />
                </asp:Panel>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AcademicTermID, AcademicSemesterID, AcademicYear + N' ' + AcademicSemester + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms WHERE (ReportTypeID = 1) ORDER BY Active DESC, AcademicTerm">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT CourseSectionID, CourseCatalogID, CourseGroupingID, SectionGroup, SectionCatalog + N' ' + CourseCategory AS CourseCategory, SectionCatalogID FROM vw_CourseSections WHERE (StaffID = @StaffID) AND (AcademicTermID = @AcademicTermID) AND (IsAcademic = 1) ORDER BY SectionGroup, CourseCategory">
                    <SelectParameters>
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                        <asp:ControlParameter ControlID="GridViewAcademicTerms" Name="AcademicTermID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessmentsMidTermStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName, CourseCategory, Quiz, Homework, MidExam, FinalExam, Practice FROM vw_AssessmentMarksAverageofTypesSDMidTermPivot WHERE (AcademicTermID = @AcademicTermID) AND (SectionCatalogID = @SectionCatalogID) AND (CourseCatalogID = @CourseCatalogID) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAcademicTerms" Name="AcademicTermID" PropertyName="SelectedValue" />
                        <asp:Parameter Name="SectionCatalogID" />
                        <asp:Parameter Name="CourseCatalogID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceReportMidTermAverages" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT ReportAverageID FROM tbl_ReportAverages" InsertCommand="UPDATE tbl_ReportAverages SET Average = @Average, AddedBy = @AddedBy, AddedDate = @AddedDate, Practice = @Practice WHERE (StudentID = @StudentID) AND (AcademicTermID = @AcademicTermID) AND (CourseCatalogID = @CourseCatalogID)

IF @@ROWCOUNT = 0

INSERT INTO tbl_ReportAverages(AcademicTermID, StudentID, CourseSectionID, ReportTypeID, Average, Practice, AddedBy, AddedDate, ApprovedByTeacher, CurrentSectionID, CourseGroupingID, AcademicSemesterID, CourseCatalogID, SchoolCode) VALUES (@AcademicTermID, @StudentID, @CourseSectionID, @ReportTypeID, @Average, @Practice, @AddedBy, @AddedDate, @ApprovedByTeacher, @CurrentSectionID, @CourseGroupingID, @AcademicSemesterID, @CourseCatalogID, @SchoolCode)">
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
