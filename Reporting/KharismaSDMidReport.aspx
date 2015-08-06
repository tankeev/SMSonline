<%@ Page Language="VB" AutoEventWireup="false" CodeFile="KharismaSDMidReport.aspx.vb"
    Theme="" StylesheetTheme="" Inherits="Reporting_ReportCard" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>
        <%= Request.QueryString("Name")%>
    </title>
    <link href="KharismaSDMidReport.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form" runat="server">
    <div id="ReportContainer" class="Container">
        <div id="Page1" style="width: 650px;">
            <div id="ReportTop" style="height: 80px; text-align: center;">
                <asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Names="Bookman Old Style"
                    Font-Size="18pt" Text="BRIEF REPORT"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Names="Bookman Old Style"
                    Font-Size="18pt" Text="SD KHARISMA BANGSA "></asp:Label>
            </div>
            <br />
            <table width="100%" style="border: 3px double #336666">
                <tr>
                    <td width="90" height="25">
                        <asp:Label ID="Label5" runat="server" Text="Academic Year" Font-Bold="True"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label28" runat="server" Text=":"></asp:Label>
                        <asp:Label ID="Label25" runat="server" Text="2014 - 2015"></asp:Label>
                    </td>
                    <td width="70">
                        <asp:Label ID="Label24" runat="server" Text="Semester" Font-Bold="True"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label29" runat="server" Text=":"></asp:Label>
                        <asp:Label ID="Label26" runat="server" Text="2nd"></asp:Label>
                    </td>
                    <td width="30">
                        <asp:Label ID="Label23" runat="server" Text="Date" Font-Bold="True"></asp:Label>
                    </td>
                    <td width="130">
                        <asp:Label ID="Label30" runat="server" Text=":"></asp:Label>
                        <asp:Label ID="LabelDate" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <table width="100%" style="border: 3px double #336666">
                <tr>
                    <td valign="top" width="300">
                        <asp:FormView ID="FormViewStudentPagegg" runat="server" BackColor="White" CellPadding="4"
                            GridLines="Horizontal" Width="100%" Font-Bold="True" DataSourceID="SqlDataSourceStudents">
                            <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                            <FooterStyle BackColor="White" ForeColor="#333333" />
                            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                            <ItemTemplate>
                                <table width="100%">
                                    <tr>
                                        <td width="90">
                                            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label8" runat="server" Text=":"></asp:Label>
                                            <asp:Label ID="StudentNameLabel" runat="server" Text='<%# Eval("StudentName") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label17" runat="server" Text="Grade"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label9" runat="server" Text=":"></asp:Label>
                                            <asp:Label ID="GrdLbl" runat="server" Text='<%# Eval("SectionCatalog") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text="Reg. No"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label14" runat="server" Text=":"></asp:Label>
                                            <asp:Label ID="ScNoLbl" runat="server" Text='<%# Eval("SchoolNo") %>' />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#333333" />
                        </asp:FormView>
                    </td>
                    <td valign="top">
                        <asp:GridView ID="GridViewAdvisors" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAdvisors"
                            Width="160px">
                            <Columns>
                                <asp:BoundField DataField="StaffName" HeaderText="Class Teacher" SortExpression="StaffName">
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td valign="top" width="165">
                        <asp:GridView ID="GridViewStudySkills" runat="server" AutoGenerateColumns="False"
                            DataSourceID="SqlDataSourceSkills" Width="160px">
                            <Columns>
                                <asp:BoundField DataField="StudySkill" HeaderText="Personality" SortExpression="StudySkill">
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Response" SortExpression="Response">
                                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            <br />
            <table width="100%" style="border: 3px double #336666">
                <tr>
                    <td>
                        <asp:GridView ID="GridViewCourseAverages" runat="server" AutoGenerateColumns="False"
                            DataSourceID="SqlDataSourceAverages" Width="300px">
                            <Columns>
                                <asp:BoundField DataField="CourseGroupName" HeaderText="SUBJECT" SortExpression="CourseGroupName">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" Width="130px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="NUMBER" SortExpression="Average">
                                    <ItemTemplate>
                                        <asp:Label ID="LabelScore" runat="server" Text='<%# Bind("Average") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="60px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="LETTER">
                                    <ItemTemplate>
                                        <asp:Label ID="LabelScoretoLetter" runat="server" Text='<%# Bind("Average") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <br />
                                Not Available!
                                <br />
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            <br />
            <table width="100%" style="border: 3px double #336666">
                <tr>
                    <td>
                        <asp:Chart ID="ChartArea" runat="server" DataSourceID="SqlDataSourceAveragesChart"
                            ImageLocation="~/Images/ChartImages/ChartPic_#SEQ(300,3)" ImageStorageMode="UseImageLocation"
                            Width="640px">
                            <Series>
                                <asp:Series Name="SeriesAverages" XValueMember="CourseGroupName" YValueMembers="Average"
                                    IsValueShownAsLabel="False" Legend="LegendSD" LegendText="Student's Score">
                                </asp:Series>
                                <asp:Series ChartArea="ChartAreaSD" Name="SeriesClassAverages" XValueMember="CourseGroupName"
                                    YValueMembers="ClassAverage" IsValueShownAsLabel="False" Legend="LegendSD" LegendText="Class Average">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartAreaSD">
                                    <AxisY Interval="10">
                                    </AxisY>
                                    <AxisX Interval="1">
                                    </AxisX>
                                </asp:ChartArea>
                            </ChartAreas>
                            <Legends>
                                <asp:Legend Alignment="Center" Docking="Bottom" Name="LegendSD">
                                </asp:Legend>
                            </Legends>
                        </asp:Chart>
                    </td>
                </tr>
            </table>
            <br />
            <table width="100%" style="border: 3px double #336666">
                <tr>
                    <td>
                        <asp:GridView ID="GridViewComments" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceComments"
                            Width="100%" ShowHeader="False">
                            <Columns>
                                <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment">
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            <table width="100%" id="tblBottom1">
                <tr>
                    <td width="80" height="20">
                    </td>
                    <td width="160">
                    </td>
                    <td>
                    </td>
                    <td width="160">
                    </td>
                    <td>
                    </td>
                    <td width="160" rowspan="3">
                    </td>
                    <td width="80">
                    </td>
                </tr>
                <tr>
                    <td width="80" height="20">
                    </td>
                    <td width="160">
                    </td>
                    <td>
                    </td>
                    <td width="160">
                    </td>
                    <td>
                    </td>
                    <td width="80">
                    </td>
                </tr>
                <tr>
                    <td height="20">
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        Sri Iswatiningrum, S.Pd.
                    </td>
                    <td>
                    </td>
                    <td width="150">
                    </td>
                    <td>
                    </td>
                    <td>
                        <asp:FormView ID="FormViewAdvisor" runat="server" DataSourceID="SqlDataSourceAdvisorsDefault"
                            Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="StaffNameLabel" runat="server" Text='<%# Bind("StaffName") %>' />
                            </ItemTemplate>
                        </asp:FormView>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td style="border-top-style: solid; border-top-width: 2px; border-top-color: #000000;">
                        Principal
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td style="border-top-style: solid; border-top-width: 2px; border-top-color: #000000;">
                        Class Teacher
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
        SelectCommand="SELECT tbl_Students.StudentID, tbl_Students.StudentName, tbl_SectionCatalog.SectionCatalog, tbl_Students.SchoolNo FROM tbl_Students INNER JOIN tbl_SectionCatalog ON tbl_Students.CurrentSectionID = tbl_SectionCatalog.SectionCatalogID WHERE (tbl_Students.StudentID = @StudentID) ORDER BY tbl_Students.StudentName">
        <SelectParameters>
            <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAdvisors" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
        SelectCommand="SELECT tbl_Staff.StaffName, tbl_SectionMentors.IsDefault FROM tbl_SectionMentors INNER JOIN tbl_Staff ON tbl_SectionMentors.StaffID = tbl_Staff.StaffID INNER JOIN tbl_Students ON tbl_SectionMentors.SectionCatalogID = tbl_Students.CurrentSectionID WHERE (tbl_Students.StudentID = @StudentID) AND (tbl_SectionMentors.AcademicTermID = @AcademicTermID) ORDER BY tbl_SectionMentors.IsDefault DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
            <asp:QueryStringParameter Name="AcademicTermID" QueryStringField="AT" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAdvisorsDefault" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
        SelectCommand="SELECT tbl_Staff.StaffName FROM tbl_SectionMentors INNER JOIN tbl_Staff ON tbl_SectionMentors.StaffID = tbl_Staff.StaffID INNER JOIN tbl_Students ON tbl_SectionMentors.SectionCatalogID = tbl_Students.CurrentSectionID WHERE (tbl_SectionMentors.IsDefault = 1) AND (tbl_Students.StudentID = @StudentID) AND (tbl_SectionMentors.AcademicTermID = @AcademicTermID) ORDER BY tbl_Staff.StaffName">
        <SelectParameters>
            <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
            <asp:QueryStringParameter Name="AcademicTermID" QueryStringField="AT" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSkills" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
        SelectCommand="SELECT tbl_StudySkills.StudySkill, tbl_StudySkillsStudents.Response FROM tbl_StudySkillsStudents INNER JOIN tbl_StudySkills ON tbl_StudySkillsStudents.StudySkillID = tbl_StudySkills.StudySkillID WHERE (tbl_StudySkillsStudents.StudentID = @StudentID) AND (tbl_StudySkillsStudents.ReportTypeID = @ReportTypeID) AND (tbl_StudySkillsStudents.AcademicTermID = @AcademicTermID) ORDER BY tbl_StudySkills.StudySkill">
        <SelectParameters>
            <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
            <asp:QueryStringParameter Name="ReportTypeID" QueryStringField="RTID" />
            <asp:QueryStringParameter Name="AcademicTermID" QueryStringField="AT" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAverages" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
        SelectCommand="SELECT ClassAverage, CourseGroupName, Average, CourseReportOrder FROM vw_ReportCardMidTermPrinterSD WHERE (StudentID = @StudentID) AND (ReportTypeID = @ReportTypeID) AND (AcademicTermID = @AcademicTermID) ORDER BY CourseReportOrder">
        <SelectParameters>
            <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
            <asp:QueryStringParameter Name="ReportTypeID" QueryStringField="RTID" />
            <asp:QueryStringParameter Name="AcademicTermID" QueryStringField="AT" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAveragesChart" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
        SelectCommand="SELECT ClassAverage, CourseGroupName, Average FROM vw_ReportCardMidTermPrinterSD WHERE (StudentID = @StudentID) AND (ReportTypeID = @ReportTypeID) AND (AcademicTermID = @AcademicTermID) ORDER BY CourseReportOrder">
        <SelectParameters>
            <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
            <asp:QueryStringParameter Name="ReportTypeID" QueryStringField="RTID" />
            <asp:QueryStringParameter Name="AcademicTermID" QueryStringField="AT" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceComments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
        SelectCommand="SELECT Comment FROM tbl_ReportComments WHERE (ReportTypeID = @ReportTypeID) AND (StudentID = @StudentID) AND (AcademicTermID = @AcademicTermID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ReportTypeID" QueryStringField="RTID" />
            <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
            <asp:QueryStringParameter Name="AcademicTermID" QueryStringField="AT" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
