<%@ Page Title="SIS Report Averages" Language="VB" MasterPageFile="~/Site.Master"
    EnableEventValidation="false" AutoEventWireup="false" CodeFile="ReportCardsReportAverages.aspx.vb"
    Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuReportCards.ascx" TagName="MenuReportCards" TagPrefix="uc2" %>
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
                            <asp:Label ID="Label44" runat="server" Font-Bold="True" ForeColor="Red" Text="School Section"></asp:Label>
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
                            <asp:Label ID="LabelTotal" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    REPORT CARD AVERAGES</h2>
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
                            &nbsp;
                        </td>
                        <td width="100">
                            &nbsp;
                        </td>
                        <td width="25">
                            &nbsp;
                        </td>
                        <td width="100">
                            &nbsp;
                        </td>
                        <td width="25">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
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
                        <td height="28" width="35">
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
                        <td width="40">
                            <asp:Label ID="Label135" runat="server" Font-Bold="True" ForeColor="Red" Text="25%"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Panel ID="PanelData" runat="server" Visible="False" Width="675px">
                    <table width="100%">
                        <tr>
                            <td height="25">
                                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Medium">In order to see Averages, Scores must be Approved by Course Teachers!</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                                <asp:Label ID="LabelStatus0" runat="server" Font-Bold="True" ForeColor="Black">Education Coordinators can also Approve Scores from Student Course Averages Page.</asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <div style='overflow: auto; width: 100%;'>
                        <asp:DataList ID="DataList" runat="server" DataSourceID="SqlDataSourceReportAveragesSD"
                            Width="940px">
                            <HeaderTemplate>
                                <table width="940">
                                    <tr>
                                        <td width="220">
                                            <asp:Label ID="lblSN" runat="server" Font-Bold="True" ForeColor="Red" Text="Student Name"></asp:Label>
                                        </td>
                                        <td align="center" colspan="2" width="80" bgcolor="#FFFFC6">
                                            <asp:Label ID="h1" runat="server" Font-Bold="True" ForeColor="Red">Citizenship</asp:Label>
                                        </td>
                                        <td align="center" colspan="2" width="80" bgcolor="#FFFFC6">
                                            <asp:Label ID="h3" runat="server" Font-Bold="True" ForeColor="Red">Indonesian</asp:Label>
                                        </td>
                                        <td align="center" colspan="2" width="80" bgcolor="#FFFFC6">
                                            <asp:Label ID="h0" runat="server" Font-Bold="True" ForeColor="Red">English</asp:Label>
                                        </td>
                                        <td align="center" colspan="2" width="80" bgcolor="#FFFFC6">
                                            <asp:Label ID="h" runat="server" Font-Bold="True" ForeColor="Red">Mathematics</asp:Label>
                                        </td>
                                        <td align="center" colspan="2" width="80" bgcolor="#FFFFC6">
                                            <asp:Label ID="h6" runat="server" Font-Bold="True" ForeColor="Red">Science</asp:Label>
                                        </td>
                                        <td align="center" colspan="2" width="80" bgcolor="#FFFFC6">
                                            <asp:Label ID="h5" runat="server" Font-Bold="True" ForeColor="Red">Social</asp:Label>
                                        </td>
                                        <td align="center" colspan="2" width="80" bgcolor="#FFFFC6">
                                            <asp:Label ID="h2" runat="server" Font-Bold="True" ForeColor="Red">Art</asp:Label>
                                        </td>
                                        <td align="center" colspan="2" width="80" bgcolor="#FFFFC6">
                                            <asp:Label ID="h4" runat="server" Font-Bold="True" ForeColor="Red">Music</asp:Label>
                                        </td>
                                        <td align="center" colspan="2" width="80" bgcolor="#FFFFC6">
                                            <asp:Label ID="h7" runat="server" Font-Bold="True" ForeColor="Red">Sports</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="220">
                                            <asp:Label ID="Label149" runat="server" ForeColor="Red" Text="A: Average; P: Practice"></asp:Label>
                                        </td>
                                        <td width="40" align="center" bgcolor="#CCCCCC">
                                            <asp:Label ID="lblMA" runat="server" Font-Bold="True">A</asp:Label>
                                        </td>
                                        <td width="40" align="center" bgcolor="#EFEFEF">
                                            <asp:Label ID="lblMP" runat="server" Font-Bold="True">P</asp:Label>
                                        </td>
                                        <td width="40" align="center" bgcolor="#CCCCCC">
                                            <asp:Label ID="lblEA" runat="server" Font-Bold="True">A</asp:Label>
                                        </td>
                                        <td width="40" align="center" bgcolor="#EFEFEF">
                                            <asp:Label ID="lblEP" runat="server" Font-Bold="True">P</asp:Label>
                                        </td>
                                        <td width="40" align="center" bgcolor="#CCCCCC">
                                            <asp:Label ID="lblCA" runat="server" Font-Bold="True">A</asp:Label>
                                        </td>
                                        <td width="40" align="center" bgcolor="#EFEFEF">
                                            <asp:Label ID="lblCP" runat="server" Font-Bold="True">P</asp:Label>
                                        </td>
                                        <td width="40" align="center" bgcolor="#CCCCCC">
                                            <asp:Label ID="lblAA" runat="server" Font-Bold="True">A</asp:Label>
                                        </td>
                                        <td width="40" align="center" bgcolor="#EFEFEF">
                                            <asp:Label ID="lblAP" runat="server" Font-Bold="True">P</asp:Label>
                                        </td>
                                        <td width="40" align="center" bgcolor="#CCCCCC">
                                            <asp:Label ID="lblIA" runat="server" Font-Bold="True">A</asp:Label>
                                        </td>
                                        <td width="40" align="center" bgcolor="#EFEFEF">
                                            <asp:Label ID="lblIP" runat="server" Font-Bold="True">P</asp:Label>
                                        </td>
                                        <td width="40" align="center" bgcolor="#CCCCCC">
                                            <asp:Label ID="lblMuA" runat="server" Font-Bold="True">A</asp:Label>
                                        </td>
                                        <td align="center" width="40" bgcolor="#EFEFEF">
                                            <asp:Label ID="lblMuP" runat="server" Font-Bold="True">P</asp:Label>
                                        </td>
                                        <td align="center" width="40" bgcolor="#CCCCCC">
                                            <asp:Label ID="lblIPSA" runat="server" Font-Bold="True">A</asp:Label>
                                        </td>
                                        <td align="center" width="40" bgcolor="#EFEFEF">
                                            <asp:Label ID="lblIPSP" runat="server" Font-Bold="True">P</asp:Label>
                                        </td>
                                        <td align="center" width="40" bgcolor="#CCCCCC">
                                            <asp:Label ID="lblISA" runat="server" Font-Bold="True">A</asp:Label>
                                        </td>
                                        <td align="center" width="40" bgcolor="#EFEFEF">
                                            <asp:Label ID="lblISP" runat="server" Font-Bold="True">P</asp:Label>
                                        </td>
                                        <td align="center" width="40" bgcolor="#CCCCCC">
                                            <asp:Label ID="lblISpA" runat="server" Font-Bold="True">A</asp:Label>
                                        </td>
                                        <td width="40" align="center" bgcolor="#EFEFEF">
                                            <asp:Label ID="lblISpP" runat="server" Font-Bold="True">P</asp:Label>
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td width="220">
                                        <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 190px">
                                            <asp:Label ID="lblSN" runat="server" Text='<%# Bind("StudentName") %>' Font-Bold="True"></asp:Label>
                                    </td>
                                    <td align="center" width="40" bgcolor="#CCCCCC">
                                        <asp:Label ID="lblCitizenship_A" runat="server" Text='<%# Bind("Citizenship_A") %>'></asp:Label>
                                    </td>
                                    <td align="center" width="40" bgcolor="#EFEFEF">
                                        <asp:Label ID="lblCitizenship_P" runat="server" Text='<%# Bind("Citizenship_P") %>'></asp:Label>
                                    </td>
                                    <td align="center" width="40" bgcolor="#CCCCCC">
                                        <asp:Label ID="lblIndonesian_A" runat="server" Text='<%# Bind("Indonesian_A") %>'></asp:Label>
                                    </td>
                                    <td align="center" width="40" bgcolor="#EFEFEF">
                                        <asp:Label ID="lblIndonesian_P" runat="server" Text='<%# Bind("Indonesian_P") %>'></asp:Label>
                                    </td>
                                    <td align="center" width="40" bgcolor="#CCCCCC">
                                        <asp:Label ID="lblEnglish_A" runat="server" Text='<%# Bind("English_A") %>'></asp:Label>
                                    </td>
                                    <td align="center" width="40" bgcolor="#EFEFEF">
                                        <asp:Label ID="lblEnglish_P" runat="server" Text='<%# Bind("English_P") %>'></asp:Label>
                                    </td>
                                    <td align="center" width="40" bgcolor="#CCCCCC">
                                        <asp:Label ID="lblMathematics_A" runat="server" Text='<%# Bind("Mathematics_A") %>'></asp:Label>
                                    </td>
                                    <td align="center" width="40" bgcolor="#EFEFEF">
                                        <asp:Label ID="lblMathematics_P" runat="server" Text='<%# Bind("Mathematics_P") %>'></asp:Label>
                                    </td>
                                    <td align="center" width="40" bgcolor="#CCCCCC">
                                        <asp:Label ID="lblScience_A" runat="server" Text='<%# Bind("Science_A") %>'></asp:Label>
                                    </td>
                                    <td align="center" width="40" bgcolor="#EFEFEF">
                                        <asp:Label ID="lblScience_P" runat="server" Text='<%# Bind("Science_P") %>'></asp:Label>
                                    </td>
                                    <td align="center" width="40" bgcolor="#CCCCCC">
                                        <asp:Label ID="lblIPS_A" runat="server" Text='<%# Bind("IPS_A") %>'></asp:Label>
                                    </td>
                                    <td align="center" width="40" bgcolor="#EFEFEF">
                                        <asp:Label ID="lblIPS_P" runat="server" Text='<%# Bind("IPS_P") %>'></asp:Label>
                                    </td>
                                    <td align="center" width="40" bgcolor="#CCCCCC">
                                        <asp:Label ID="lblArt_A" runat="server" Text='<%# Bind("Art_A") %>'></asp:Label>
                                    </td>
                                    <td align="center" width="40" bgcolor="#EFEFEF">
                                        <asp:Label ID="lblArt_P" runat="server" Text='<%# Bind("Art_P") %>'></asp:Label>
                                    </td>
                                    <td align="center" width="40" bgcolor="#CCCCCC">
                                        <asp:Label ID="lblMusic_A" runat="server" Text='<%# Bind("Music_A") %>'></asp:Label>
                                    </td>
                                    <td align="center" width="40" bgcolor="#EFEFEF">
                                        <asp:Label ID="lblMusic_P" runat="server" Text='<%# Bind("Music_P") %>'></asp:Label>
                                    </td>
                                    <td align="center" width="40" bgcolor="#CCCCCC">
                                        <asp:Label ID="lblSports_A" runat="server" Text='<%# Bind("Sports_A") %>'></asp:Label>
                                    </td>
                                    <td align="center" width="40" bgcolor="#EFEFEF">
                                        <asp:Label ID="lblSports_P" runat="server" Text='<%# Bind("Sports_P") %>'></asp:Label>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:DataList>
                    </div>
                </asp:Panel>
                <asp:Panel ID="PanelEmpty" runat="server" HorizontalAlign="Center">
                    <br />
                    <asp:Image ID="ImageEmpty0" runat="server" ImageUrl="~/CoordinatorsSD/Images/no-data.png" />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label31" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Please Select a School Section!"
                        Font-Size="Medium"></asp:Label>
                    <br />
                </asp:Panel>
                <br />
                <asp:Label ID="LabelFooter" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Medium"></asp:Label>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) AND (SectionSchool = N'SD') ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT CourseSectionID, SectionGroup, SectionCatalog + N' ' + CourseCategory AS CourseCategory FROM vw_CourseSections WHERE (AcademicTermID = @AcademicTermID) AND (CourseCategory &lt;&gt; N'Guidance') AND (SchoolCode = @SchoolCode) AND (SectionCatalogID = @SectionCatalogID) ORDER BY SectionGroup, CourseCategory">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="SectionCatalogID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceReportAveragesSD" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentName, Mathematics_A, Mathematics_P, English_A, English_P, Citizenship_A, Citizenship_P, Art_A, Art_P, Indonesian_A, Indonesian_P, Music_A, Music_P, IPS_A, IPS_P, Science_A, Science_P, Sports_A, Sports_P FROM vw_ReportCardAveragesPivotSD WHERE (AcademicTermID = @AcademicTermID) AND (CurrentSectionID = @CurrentSectionID) ORDER BY StudentName"
                    InsertCommand="UPDATE tbl_ReportAverages SET Average = @Average, AddedBy = @AddedBy, AddedDate = @AddedDate WHERE (AcademicTermID = @AcademicTermID) AND (StudentID = @StudentID) AND (CourseSectionID = @CourseSectionID)

IF @@ROWCOUNT=0

INSERT INTO tbl_ReportAverages(AcademicTermID, StudentID, CourseSectionID, Average, AddedBy, AddedDate) VALUES (@AcademicTermID, @StudentID, @CourseSectionID, @Average, @AddedBy, @AddedDate)

">
                    <InsertParameters>
                        <asp:Parameter Name="Average" />
                        <asp:Parameter Name="AddedBy" />
                        <asp:Parameter Name="AddedDate" />
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="CourseSectionID" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
