<%@ Page Language="VB" AutoEventWireup="false" CodeFile="KharismaSDFinReport.aspx.vb"
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
    <link href="KharismaSDFinReport.css" rel="Stylesheet" type="text/css" />
    <link href="ModalPopup.css" rel="stylesheet" type="text/css" />
    <link href="UpdateProgress.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function DoCancel() {
            $get('<%=TextBox1.ClientID%>').value = "";
            $get('<%=TextBox2.ClientID%>').value = "";
            $get('<%=TextBox3.ClientID%>').value = "";
            $get('<%=TextBox4.ClientID%>').value = "";

        }
    </script>
</head>
<body>
    <form id="form" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager" runat="server">
    </asp:ToolkitScriptManager>
    <div id="ReportContainer" class="Container">
        <!--  PAGE 1-->
        <div id="Page1" style="page-break-after: always; width: 650px; position: relative;">
            <div id="ReportTop" style="height: 175px; text-align: center; margin-left: 110px;">
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Names="Bookman Old Style"
                    Font-Size="18pt" Text="STUDENT ACADEMIC REPORT"></asp:Label>
                <br />
                <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Names="Bookman Old Style"
                    Font-Size="14pt" Text="2nd Semester 2014-2015"></asp:Label>
                <br />
                <asp:Label ID="Label31" runat="server" Font-Bold="True" Font-Names="Bookman Old Style"
                    Font-Size="14pt" Text="KHARISMA BANGSA ELEMENTARY SCHOOL"></asp:Label>
                <br />
                <asp:Label ID="Label32" runat="server" Font-Bold="True" Font-Names="Bookman Old Style"
                    Font-Size="10pt" Text="Jalan Terbang Layang No. 21 Pondok Cabe Tangerang Selatan 15418"></asp:Label>
            </div>
            <br />
            <asp:FormView ID="FormViewStudentPagegg" runat="server" BackColor="White" CellPadding="4"
                Style="border: 3px double #336666" GridLines="Horizontal" Width="650px" Font-Bold="True"
                DataSourceID="SqlDataSourceStudents">
                <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td width="90">
                                <asp:Label ID="Label1" runat="server" Text="Name of Student"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text=":"></asp:Label>
                                <asp:Label ID="StudentNameLabel" runat="server" Text='<%# Eval("StudentName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Reg. No"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label9" runat="server" Text=":"></asp:Label>
                                <asp:Label ID="ScNoLbl" runat="server" Text='<%# Eval("SchoolNo") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label17" runat="server" Text="Grade"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label14" runat="server" Text=":"></asp:Label>
                                <asp:Label ID="GrdLbl" runat="server" Text='<%# Eval("SectionCatalog") %>' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT tbl_Students.StudentID, tbl_Students.StudentName, tbl_SectionCatalog.SectionCatalog, tbl_Students.SchoolNo FROM tbl_Students INNER JOIN tbl_SectionCatalog ON tbl_Students.CurrentSectionID = tbl_SectionCatalog.SectionCatalogID WHERE (tbl_Students.StudentID = @StudentID) ORDER BY tbl_Students.StudentName">
                <SelectParameters>
                    <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:DataList ID="DataListAverages" runat="server" DataSourceID="SqlDataSourceAverages"
                Width="650px">
                <HeaderTemplate>
                    <table style="border: 3px double #336666" width="650">
                        <tr>
                            <td align="center" rowspan="3" class="tableborder" width="40">
                                <asp:Label ID="Label33" runat="server" Font-Bold="True" Text="No"></asp:Label>
                            </td>
                            <td align="left" rowspan="3" class="tableborder" width="310">
                                <asp:Label ID="Label34" runat="server" Font-Bold="True" Text="Subject"></asp:Label>
                            </td>
                            <td align="center" rowspan="2" width="75" class="tableborder">
                                <asp:Label ID="Label35" runat="server" Font-Bold="True" Text="Standard of minumum learning completion"></asp:Label>
                            </td>
                            <td align="center" colspan="3" width="225" class="tableborder">
                                <asp:Label ID="Label37" runat="server" Font-Bold="True" Text="Evaluation"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" width="75" class="tableborder">
                                <asp:Label ID="Label38" runat="server" Font-Bold="True" Text="Conceptual Knowledge"></asp:Label>
                            </td>
                            <td align="center" class="tableborder" width="75">
                                <asp:Label ID="Label39" runat="server" Font-Bold="True" Text="Practice"></asp:Label>
                            </td>
                            <td align="center" width="75" class="tableborder">
                                <asp:Label ID="Label40" runat="server" Font-Bold="True" Text="Attitude"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="tableborder" width="75">
                                <asp:Label ID="Label36" runat="server" Font-Bold="True" Text="Figure"></asp:Label>
                            </td>
                            <td align="center" class="tableborder" width="75">
                                <asp:Label ID="Label41" runat="server" Font-Bold="True" Text="Score"></asp:Label>
                            </td>
                            <td align="center" class="tableborder" width="75">
                                <asp:Label ID="Label42" runat="server" Font-Bold="True" Text="Score"></asp:Label>
                            </td>
                            <td align="center" class="tableborder" width="75">
                                <asp:Label ID="Label43" runat="server" Font-Bold="True" Text="Predicate"></asp:Label>
                            </td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td align="center" class="tableborder" width="40">
                            <%# Container.ItemIndex +1  %>
                        </td>
                        <td align="left" class="tableborder" width="310">
                            <asp:Label runat="server" Text='<%# Bind("CourseGroupName") %>' ID="LabelSubject"></asp:Label>
                        </td>
                        <td align="center" class="tableborder" width="75">
                            <asp:Label ID="LabelFigures" runat="server" Text="75"></asp:Label>
                        </td>
                        <td align="center" class="tableborder" width="75">
                            <asp:Label ID="LabelKnowledge" runat="server" Text='<%# If(Eval("Average").ToString() = 0, "--", Eval("Average"))%>'></asp:Label>
                        </td>
                        <td align="center" class="tableborder" width="75">
                            <asp:Label ID="LabelPractice" runat="server" Text='<%# If(Eval("Practice").ToString() = 0, "--", Eval("Practice"))%>'></asp:Label>
                        </td>
                        <td align="center" class="tableborder" width="75">
                            <asp:Label ID="LabelAttitude" runat="server" Text='<%# Eval("Attitude") %>'></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSourceAverages" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT AcademicSemesterID, ReportTypeID, StudentID, CourseReportOrder, CourseGroupName, Average, Practice, Attitude FROM vw_ReportCardFinalPrinterSD WHERE (StudentID = @StudentID) AND (ReportTypeID = @ReportTypeID) AND (AcademicSemesterID = @AcademicSemesterID) ORDER BY CourseReportOrder">
                <SelectParameters>
                    <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
                    <asp:QueryStringParameter Name="ReportTypeID" QueryStringField="RTID" />
                    <asp:QueryStringParameter Name="AcademicSemesterID" QueryStringField="AS" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:DataList ID="DataListClubsActivities" runat="server" DataSourceID="SqlDataSourceClubsActivities"
                Width="300px">
                <HeaderTemplate>
                    <table style="border: 3px double #336666" width="300">
                        <tr>
                            <td align="center" colspan="3" width="300" class="tableborder">
                                <asp:Label ID="Label44" runat="server" Font-Bold="True" Text="Extracurricular Activities"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" width="40" class="tableborder">
                                <asp:Label ID="Label45" runat="server" Font-Bold="True" Text="No"></asp:Label>
                            </td>
                            <td align="center" width="170" class="tableborder">
                                <asp:Label ID="Label46" runat="server" Font-Bold="True" Text="Activities"></asp:Label>
                            </td>
                            <td align="center" width="90" class="tableborder">
                                <asp:Label ID="Label47" runat="server" Font-Bold="True" Text="Scores"></asp:Label>
                            </td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td align="center" width="40" class="tableborder">
                            <%# Container.ItemIndex +1  %>
                        </td>
                        <td width="170" class="tableborder">
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClubActivityName") %>'></asp:Label>
                        </td>
                        <td align="center" width="90" class="tableborder">
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Input") %>'></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSourceClubsActivities" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT tbl_ClubsActivities.ClubActivityName, tbl_ClubsActivitiesStudents.Input FROM tbl_ClubsActivitiesStudents INNER JOIN tbl_ClubsActivities ON tbl_ClubsActivitiesStudents.ClubActivityID = tbl_ClubsActivities.ClubActivityID WHERE (tbl_ClubsActivities.AcademicSemesterID = @AcademicSemesterID) AND (tbl_ClubsActivitiesStudents.StudentID = @StudentID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="AcademicSemesterID" QueryStringField="AS" />
                    <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:UpdatePanel ID="UpdatePanelAT" runat="server">
                <ContentTemplate>
                    <table style="border: 3px double #336666" width="300">
                        <tr>
                            <td align="center" class="tableborder" width="40">
                                <asp:Label ID="Label65" runat="server" Font-Bold="True" Text="No"></asp:Label>
                            </td>
                            <td align="center" class="tableborder" width="170">
                                <asp:Label ID="Label48" runat="server" Font-Bold="True" Text="Absence"></asp:Label>
                            </td>
                            <td width="90" class="tableborder" align="center">
                                <asp:Label ID="Label49" runat="server" Font-Bold="True" Text="Total no. of Days"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tableborder" align="center">
                                <asp:Label ID="LabelAT5" runat="server" Text="1"></asp:Label>
                            </td>
                            <td class="tableborder">
                                <asp:Label ID="Label50" runat="server" Font-Bold="False" Text="Ill"></asp:Label>
                            </td>
                            <td class="tableborder" align="center">
                                <asp:Label ID="LabelAT1" runat="server" Text="0"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tableborder" align="center">
                                <asp:Label ID="LabelAT6" runat="server" Text="2"></asp:Label>
                            </td>
                            <td class="tableborder">
                                <asp:Label ID="Label51" runat="server" Font-Bold="False" Text="With permission"></asp:Label>
                            </td>
                            <td class="tableborder" align="center">
                                <asp:Label ID="LabelAT2" runat="server" Text="0"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tableborder" align="center">
                                <asp:Label ID="LabelAT7" runat="server" Text="3"></asp:Label>
                            </td>
                            <td class="tableborder">
                                <asp:Label ID="Label52" runat="server" Font-Bold="False" Text="Without permission"></asp:Label>
                            </td>
                            <td class="tableborder" align="center">
                                <asp:Label ID="LabelAT3" runat="server" Text="0"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tableborder" align="center">
                                <asp:Label ID="LabelAT8" runat="server" Text="4"></asp:Label>
                            </td>
                            <td class="tableborder">
                                <asp:Label ID="Label53" runat="server" Font-Bold="False" Text="Days late"></asp:Label>
                            </td>
                            <td class="tableborder" align="center">
                                <asp:Label ID="LabelAT4" runat="server" Text="0"></asp:Label>
                                <asp:LinkButton ID="LinkButtonAT" runat="server" Width="100%">Click Here!</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <asp:ModalPopupExtender ID="MPAT" runat="server" PopupControlID="PanelAT" TargetControlID="LinkButtonAT"
                        OnCancelScript="DoCancel()" BackgroundCssClass="modalBackground" CancelControlID="ButtonCancel">
                    </asp:ModalPopupExtender>
                    <asp:Panel ID="PanelAT" runat="server" Width="200px">
                        <table style="border: 1px solid #999999; background-color: #E5E5E5;" width="200">
                            <tr>
                                <td height="25" width="120">
                                    <asp:Label ID="Label61" runat="server" Text="ILL"></asp:Label>
                                </td>
                                <td height="25">
                                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="3" Width="50px" />
                                </td>
                            </tr>
                            <tr>
                                <td height="25">
                                    <asp:Label ID="Label62" runat="server" Text="WITH PERMISSION"></asp:Label>
                                </td>
                                <td height="25">
                                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="3" Width="50px" />
                                </td>
                            </tr>
                            <tr>
                                <td height="25">
                                    <asp:Label ID="Label63" runat="server" Text="WITHOUT PERMISSION"></asp:Label>
                                </td>
                                <td height="25">
                                    <asp:TextBox ID="TextBox3" runat="server" MaxLength="3" Width="50px" />
                                </td>
                            </tr>
                            <tr>
                                <td height="25">
                                    <asp:Label ID="Label64" runat="server" Text="DAYS LATE"></asp:Label>
                                </td>
                                <td height="25">
                                    <asp:TextBox ID="TextBox4" runat="server" MaxLength="3" Width="50px" />
                                </td>
                            </tr>
                            <tr>
                                <td height="25">
                                    <asp:Button ID="ButtonCancel" runat="server" CausesValidation="False" Text="Cancel"
                                        Width="90px" />
                                </td>
                                <td height="25">
                                    <asp:Button ID="ButtonOK" runat="server" Text="OK" Width="50px" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <div class="footer">
                <asp:FormView ID="FormViewFooter1" runat="server" Width="650px" Font-Bold="True"
                    DataSourceID="SqlDataSourceStudents">
                    <ItemTemplate>
                        <table width="100%" class="HeaderLine">
                            <tr>
                                <td align="center">
                                    <asp:Label ID="Lasbel79" runat="server" Text="Grade"></asp:Label>
                                    <asp:Label ID="GrdLbl" runat="server" Text='<%# Eval("SectionCatalog") %>' />
                                    <asp:Label ID="Label72" runat="server" Text="/"></asp:Label>
                                    <asp:Label ID="Label73" runat="server" Text="Semester 2"></asp:Label>
                                    <asp:Label ID="Label74" runat="server" Text="/"></asp:Label>
                                    <asp:Label ID="Label75" runat="server" Text="2014 - 2015"></asp:Label>
                                    <asp:Label ID="Label76" runat="server" Text="/"></asp:Label>
                                    <asp:Label ID="Label77" runat="server" Text="Kharisma Bangsa Elementary School"></asp:Label>
                                </td>
                                <td width="75" align="center">
                                    <asp:Label ID="Label78" runat="server" Text="Page 1"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>
        <!--  PAGE 2-->
        <div id="Page2" style="page-break-after: always; width: 650px; position: relative;">
            <div id="ReportTopPage2" style="height: 235px;">
            </div>
            <asp:DataList ID="DataListStudySkills" runat="server" DataSourceID="SqlDataSourceStudySkills"
                Width="650px">
                <HeaderTemplate>
                    <table style="border: 3px double #336666" width="650">
                        <tr>
                            <td align="center" width="40" class="tableborder">
                                <asp:Label ID="Label54" runat="server" Font-Bold="True" Text="No"></asp:Label>
                            </td>
                            <td width="535" class="tableborder">
                                <asp:Label ID="Label55" runat="server" Font-Bold="True" Text="Behavior"></asp:Label>
                            </td>
                            <td align="center" width="75" class="tableborder">
                                <asp:Label ID="Label56" runat="server" Font-Bold="True" Text="Score"></asp:Label>
                            </td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td align="center" width="40" class="tableborder">
                            <%# Container.ItemIndex +1  %>
                        </td>
                        <td width="535" class="tableborder">
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("StudySkill") %>'></asp:Label>
                        </td>
                        <td align="center" width="75" class="tableborder">
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Response") %>'></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSourceStudySkills" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT tbl_StudySkills.StudySkill, tbl_StudySkillsStudents.Response FROM tbl_StudySkillsStudents INNER JOIN tbl_StudySkills ON tbl_StudySkillsStudents.StudySkillID = tbl_StudySkills.StudySkillID WHERE (tbl_StudySkillsStudents.StudentID = @StudentID) AND (tbl_StudySkillsStudents.ReportTypeID = @ReportTypeID) AND (tbl_StudySkillsStudents.AcademicSemesterID = @AcademicSemesterID) ORDER BY tbl_StudySkills.StudySkill">
                <SelectParameters>
                    <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
                    <asp:QueryStringParameter Name="ReportTypeID" QueryStringField="RTID" />
                    <asp:QueryStringParameter Name="AcademicSemesterID" QueryStringField="AS" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <table width="350" style="border: 3px double #336666">
                <tr>
                    <td align="center" class="tableborder" width="40">
                    </td>
                    <td class="tableborder">
                        <asp:Label ID="Label66" runat="server" Font-Bold="True" Text="SCORES AND SIGNS INFORMATION"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="tableborder">
                        <asp:Label ID="Label67" runat="server" Text="A"></asp:Label>
                    </td>
                    <td class="tableborder">
                        Consistent understanding and application
                    </td>
                </tr>
                <tr>
                    <td align="center" class="tableborder">
                        <asp:Label ID="Label68" runat="server" Text="B"></asp:Label>
                    </td>
                    <td class="tableborder">
                        Thorough understanding and satisfactory application
                    </td>
                </tr>
                <tr>
                    <td align="center" class="tableborder">
                        <asp:Label ID="Label69" runat="server" Text="C"></asp:Label>
                    </td>
                    <td class="tableborder">
                        Good knowledge and skills but limited application
                    </td>
                </tr>
                <tr>
                    <td align="center" class="tableborder">
                        <asp:Label ID="Label70" runat="server" Text="D"></asp:Label>
                    </td>
                    <td class="tableborder">
                        Limited achievement
                    </td>
                </tr>
                <tr>
                    <td align="center" class="tableborder">
                        <asp:Label ID="Label71" runat="server" Text="E"></asp:Label>
                    </td>
                    <td class="tableborder">
                        Very limited achievement
                    </td>
                </tr>
            </table>
            <br />
            <div class="footer">
                <asp:FormView ID="FormViewFooter2" runat="server" Width="650px" Font-Bold="True"
                    DataSourceID="SqlDataSourceStudents">
                    <ItemTemplate>
                        <table class="HeaderLine" width="100%">
                            <tr>
                                <td align="center">
                                    <asp:Label ID="Lasbel79" runat="server" Text="Grade"></asp:Label>
                                    <asp:Label ID="GrdLbl" runat="server" Text='<%# Eval("SectionCatalog") %>' />
                                    <asp:Label ID="Label72" runat="server" Text="/"></asp:Label>
                                    <asp:Label ID="Label73" runat="server" Text="Semester 2"></asp:Label>
                                    <asp:Label ID="Label74" runat="server" Text="/"></asp:Label>
                                    <asp:Label ID="Label75" runat="server" Text="2014 - 2015"></asp:Label>
                                    <asp:Label ID="Label76" runat="server" Text="/"></asp:Label>
                                    <asp:Label ID="Label77" runat="server" Text="Kharisma Bangsa Elementary School"></asp:Label>
                                </td>
                                <td align="center" width="75">
                                    <asp:Label ID="Label78" runat="server" Text="Page 2"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>
        <!--  PAGE 3-->
        <div id="Page 3" style="width: 650px;">
            <div id="ReportTypePage3" style="height: 235px; position: relative;">
            </div>
            <table width="650" style="border: 3px double #336666">
                <tr>
                    <td>
                        <asp:DataList ID="DataListComments" runat="server" DataSourceID="SqlDataSourceComments"
                            Width="100%">
                            <ItemTemplate>
                                <table class="tableborder" width="100%">
                                    <tr>
                                        <td>
                                            <asp:Label ID="LabelCourse" runat="server" Font-Bold="True" Text='<%# Eval("CourseCatalog") %>'></asp:Label>
                                            <asp:Label ID="Label60" runat="server" Font-Bold="True" Text=" Teacher's Note:"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LabelComment" runat="server" Text='<%# Bind("Comment") %>' Font-Size="X-Small"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSourceComments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                            SelectCommand="SELECT tbl_ReportComments.Comment, LEFT (tbl_CourseCatalog.CourseCatalog, LEN(tbl_CourseCatalog.CourseCatalog) - 2) AS CourseCatalog FROM tbl_ReportComments INNER JOIN tbl_CourseCatalog ON tbl_ReportComments.CourseCatalogID = tbl_CourseCatalog.CourseCatalogID INNER JOIN tbl_CourseCategories ON tbl_CourseCatalog.CourseCategoryID = tbl_CourseCategories.CourseCategoryID WHERE (tbl_ReportComments.ReportTypeID = @ReportTypeID) AND (tbl_ReportComments.StudentID = @StudentID) AND (tbl_ReportComments.AcademicSemesterID = @AcademicSemesterID) ORDER BY tbl_CourseCategories.CourseReportOrder">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="ReportTypeID" QueryStringField="RTID" />
                                <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
                                <asp:QueryStringParameter Name="AcademicSemesterID" QueryStringField="AS" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <br />
            <table width="650">
                <tr>
                    <td width="100">
                        <asp:Label ID="Label58" runat="server" Text="Released in.:"></asp:Label>
                    </td>
                    <td width="650">
                        <asp:Label ID="Label57" runat="server" Text="Pondok Cabe, Tangerang Selatan"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label59" runat="server" Text="Date:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LabelDate" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" height="28">
                        <asp:Label ID="LabelResult" runat="server" Text="Considering the results obtained in 1st and 2nd semester, this student has been promoted to the ______ grade."
                            Font-Bold="True" Font-Size="10pt"></asp:Label>
                    </td>
                </tr>
            </table>
            <table width="100%" id="tblBottom1">
                <tr>
                    <td width="40" height="20">
                    </td>
                    <td width="160" rowspan="2">
                    </td>
                    <td>
                    </td>
                    <td width="160" rowspan="2">
                    </td>
                    <td>
                    </td>
                    <td width="160" rowspan="2">
                    </td>
                    <td width="40">
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
                </tr>
                <tr>
                    <td height="20">
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                        Sri Iswatiningrum, S.Pd.
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
                    <td height="20">
                    </td>
                    <td style="border-top-style: solid; border-top-width: 2px; border-top-color: #000000;">
                        Parent/Guardian
                    </td>
                    <td>
                    </td>
                    <td style="border-top-style: solid; border-top-width: 2px; border-top-color: #000000;">
                        Principal
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
            <asp:SqlDataSource ID="SqlDataSourceAdvisorsDefault" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT DISTINCT tbl_Staff.StaffName FROM tbl_SectionMentors INNER JOIN tbl_Staff ON tbl_SectionMentors.StaffID = tbl_Staff.StaffID INNER JOIN tbl_Students ON tbl_SectionMentors.SectionCatalogID = tbl_Students.CurrentSectionID WHERE (tbl_SectionMentors.IsDefault = 1) AND (tbl_Students.StudentID = @StudentID) AND (tbl_SectionMentors.AcademicSemesterID = @AcademicSemesterID) ORDER BY tbl_Staff.StaffName">
                <SelectParameters>
                    <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
                    <asp:QueryStringParameter Name="AcademicSemesterID" QueryStringField="AS" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <div class="footer">
                <asp:FormView ID="FormViewFooter3" runat="server" Width="650px" Font-Bold="True"
                    DataSourceID="SqlDataSourceStudents">
                    <ItemTemplate>
                        <table class="HeaderLine" width="100%">
                            <tr>
                                <td align="center">
                                    <asp:Label ID="Lasbel79" runat="server" Text="Grade"></asp:Label>
                                    <asp:Label ID="GrdLbl" runat="server" Text='<%# Eval("SectionCatalog") %>' />
                                    <asp:Label ID="Label72" runat="server" Text="/"></asp:Label>
                                    <asp:Label ID="Label73" runat="server" Text="Semester 2"></asp:Label>
                                    <asp:Label ID="Label74" runat="server" Text="/"></asp:Label>
                                    <asp:Label ID="Label75" runat="server" Text="2014 - 2015"></asp:Label>
                                    <asp:Label ID="Label76" runat="server" Text="/"></asp:Label>
                                    <asp:Label ID="Label77" runat="server" Text="Kharisma Bangsa Elementary School"></asp:Label>
                                </td>
                                <td align="center" width="75">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>
    </div>
    <asp:UpdateProgress ID="UpdateProgress" runat="server" DisplayAfter="0" EnableViewState="False"
        Style="display: none;">
        <ProgressTemplate>
            <asp:Panel ID="PanelProgress" runat="server">
                <div class="UPmodal">
                    <div class="UPcenter">
                        <br />
                        <br />
                        <asp:Image ID="ImageLoading" runat="server" ImageUrl="images/loading.gif" />
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Names="Tahoma" Font-Size="10pt"
                            ForeColor="#666666" Text="Update In Progress, Please Wait..."></asp:Label>
                        <br />
                        <br />
                    </div>
                </div>
            </asp:Panel>
        </ProgressTemplate>
    </asp:UpdateProgress>
    </form>
</body>
</html>
