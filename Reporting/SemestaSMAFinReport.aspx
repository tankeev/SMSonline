<%@ Page Language="VB" CodeFile="SemestaSMAFinReport.aspx.vb" Theme="" StylesheetTheme=""
    Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Report Card</title>
    <link href="SemestaFinReport.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form" runat="server">
    <div id="ReportContainer" class="Container">
        <!--  PAGE 1-->
        <div id="Page1" style="page-break-after: always; width: 650px;">
            <!--TOP -->
            <div id="ReportTopPage1" style="height: 150px;">
            </div>
            <asp:FormView ID="FormViewStudentsPage1" runat="server" BackColor="White" BorderColor="#336666"
                BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataSourceID="SqlDataSourceStudents"
                GridLines="Horizontal" Width="100%" Font-Bold="True" Font-Size="9pt">
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td height="22" width="150">
                                <asp:Label ID="Label20" runat="server" Text="Nama Perserta Didik"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:Label ID="Label8" runat="server" Text=":"></asp:Label>
                                <asp:Label ID="StudentNameLabel" runat="server" Text='<%# Bind("StudentName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td height="22">
                                <asp:Label ID="Label21" runat="server" Text="Nomor Induk / NISN"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label9" runat="server" Text=":"></asp:Label>
                                <asp:Label ID="ScNoLbl" runat="server" Text='<%# Bind("SchoolNo") %>' />
                                /<asp:Label ID="StNoLbl" runat="server" Text='<%# Eval("UserName") %>' />
                            </td>
                            <td width="130">
                                <asp:Label ID="Label4" runat="server" Text="Kelas / Semester"></asp:Label>
                            </td>
                            <td width="100">
                                <asp:Label ID="Label15" runat="server" Text=":"></asp:Label>
                                <asp:Label ID="GrdLbl" runat="server" Text='<%# Eval("SectionCatalog") %>' />
                                / II
                            </td>
                        </tr>
                        <tr>
                            <td height="22">
                                <asp:Label ID="Label3" runat="server" Text="Nama Sekolah"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label22" runat="server" Text=":"></asp:Label>
                                <asp:Label ID="Label13" runat="server" Text="SMA SEMESTA SEMARANG"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Tahun Pelajaran"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label23" runat="server" Text=":"></asp:Label>
                                <asp:Label ID="Label6" runat="server" Text="2014-2015"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT tbl_Students.StudentID, tbl_Students.StudentName, tbl_SectionCatalog.SectionCatalog, tbl_Students.SchoolNo, aspnet_Users.UserName FROM tbl_Students INNER JOIN tbl_SectionCatalog ON tbl_Students.CurrentSectionID = tbl_SectionCatalog.SectionCatalogID INNER JOIN aspnet_Users ON tbl_Students.StudentID = aspnet_Users.UserId WHERE (tbl_Students.StudentID = @StudentID) ORDER BY tbl_Students.StudentName">
                <SelectParameters>
                    <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <strong>NILAI HASIL BELAJAR SISWA</strong>
            <asp:DataList ID="DataListAverages" runat="server" DataSourceID="SqlDataSourceAverages"
                Width="650px">
                <HeaderTemplate>
                    <table style="border: 3px double #336666" width="100%">
                        <tr>
                            <td width="30" class="tableHeader">
                                No
                            </td>
                            <td class="tableHeader">
                                Mata Pelajaran
                            </td>
                            <td width="35" class="tableHeader">
                                KKM
                            </td>
                            <td width="150" class="tableHeader">
                                Pengetahuan
                            </td>
                            <td width="130" class="tableHeader">
                                Keterampilan
                            </td>
                            <td width="45" class="tableHeader">
                                Sikap
                            </td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td width="30" class="tableBorder">
                            <%# Container.ItemIndex + 1%>
                        </td>
                        <td class="tableBorder">
                            <asp:Label ID="LabelCourse" runat="server" Text='<%# Eval("CourseCategoryTranslation") %>'></asp:Label>
                        </td>
                        <td width="35" class="tableBorder">
                            <asp:Label ID="LabelKKM" runat="server" Text='<%# Eval("CourseMinimumScore") %>'></asp:Label>
                        </td>
                        <td width="150" class="tableBorder">
                            <asp:Label ID="LabelTheory" runat="server" Text='<%# If(Eval("Average").ToString() = 0, "--", Eval("Average"))%>'></asp:Label>
                            <asp:Label ID="LabelTheoryToLetter" runat="server"></asp:Label>
                        </td>
                        <td width="130" class="tableBorder">
                            <asp:Label ID="LabelPractice" runat="server" Text='<%# If(Eval("Practice").ToString() = 0, "--", Eval("Practice"))%>'></asp:Label>
                            <asp:Label ID="LabelPracticeToLetter" runat="server"></asp:Label>
                        </td>
                        <td width="45" class="tableBorder">
                            <asp:Label ID="LabelAttitude" runat="server" Text='<%# Bind("Attitude") %>'></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    <tr>
                        <td class="tableHeader" colspan="6" align="right">
                            <strong>Semarang, Juni 2015</strong>
                        </td>
                    </tr>
                    </table>
                </FooterTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSourceAverages" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT CourseCategoryTranslation, CourseMinimumScore, Average, Practice, CourseReportOrder, Attitude FROM vw_ReportCardFinalPrinter WHERE (StudentID = @StudentID) AND (ReportTypeID = @ReportTypeID) AND (AcademicSemesterID = @AcademicSemesterID) ORDER BY CourseReportOrder">
                <SelectParameters>
                    <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
                    <asp:QueryStringParameter Name="ReportTypeID" QueryStringField="RTID" />
                    <asp:QueryStringParameter Name="AcademicSemesterID" QueryStringField="AS" />
                </SelectParameters>
            </asp:SqlDataSource>
            <table width="100%" id="tblBottom">
                <tr>
                    <td width="80">
                    </td>
                    <td width="160">
                    </td>
                    <td>
                    </td>
                    <td width="160">
                    </td>
                    <td>
                    </td>
                    <td width="160" rowspan="3" height="75">
                    </td>
                    <td width="80">
                    </td>
                </tr>
                <tr>
                    <td width="80">
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
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td width="150">
                    </td>
                    <td>
                    </td>
                    <td>
                        Moh. Haris, S.E, M.Si
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td style="border-top-style: solid; border-top-width: 2px; border-top-color: #000000;">
                        Parent
                    </td>
                    <td>
                    </td>
                    <td style="border-top-style: solid; border-top-width: 2px; border-top-color: #000000;"
                        width="150">
                        Class Teacher
                    </td>
                    <td>
                    </td>
                    <td style="border-top-style: solid; border-top-width: 2px; border-top-color: #000000;">
                        Kepala SMA Semesta
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </div>
        <!--  PAGE 2-->
        <div id="Page2" style="page-break-after: always; width: 650px;">
            <div id="ReportTopPage2" style="height: 150px;">
            </div>
            <asp:FormView ID="FormViewStudentsPage2" runat="server" BackColor="White" BorderColor="#336666"
                BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataSourceID="SqlDataSourceStudents"
                GridLines="Horizontal" Width="100%" Font-Bold="True" Font-Size="9pt">
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td height="22" width="150">
                                <asp:Label ID="Label1" runat="server" Text="Nama Perserta Didik"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:Label ID="Label8" runat="server" Text=":"></asp:Label>
                                <asp:Label ID="StudentNameLabel" runat="server" Text='<%# Bind("StudentName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td height="22">
                                <asp:Label ID="Label2" runat="server" Text="Nomor Induk / NISN"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label9" runat="server" Text=":"></asp:Label>
                                <asp:Label ID="ScNoLbl" runat="server" Text='<%# Bind("SchoolNo") %>' />
                                /<asp:Label ID="StNoLbl" runat="server" Text='<%# Eval("UserName") %>' />
                            </td>
                            <td width="130">
                                <asp:Label ID="Label4" runat="server" Text="Kelas / Semester"></asp:Label>
                            </td>
                            <td width="100">
                                <asp:Label ID="Label15" runat="server" Text=":"></asp:Label>
                                <asp:Label ID="GrdLbl" runat="server" Text='<%# Eval("SectionCatalog") %>' />
                                / II
                            </td>
                        </tr>
                        <tr>
                            <td height="22">
                                <asp:Label ID="Label3" runat="server" Text="Nama Sekolah"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label17" runat="server" Text=":"></asp:Label>
                                <asp:Label ID="Label13" runat="server" Text="SMA SEMESTA SEMARANG"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Tahun Pelajaran"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label16" runat="server" Text=":"></asp:Label>
                                <asp:Label ID="Label6" runat="server" Text="2014-2015"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <br />
            <strong>KETERCAPAIAN KOMPETENSI PESERTA DIDIKIK</strong>
            <br />
            <asp:DataList ID="DatalistResults" runat="server" DataSourceID="SqlDataSourceAverages"
                Width="650px">
                <HeaderTemplate>
                    <table style="border: 3px double #336666" width="100%">
                        <tr>
                            <td width="30" class="tableHeader">
                                No
                            </td>
                            <td width="240" class="tableHeader">
                                Mata Pelajaran
                            </td>
                            <td class="tableHeader">
                                Ketercapaian Kompetensi
                            </td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td width="30" class="tableBorder">
                            <%# Container.ItemIndex + 1 %>
                        </td>
                        <td width="240" class="tableBorder">
                            <asp:Label ID="LabelCourse" runat="server" Text='<%# Eval("CourseCategoryTranslation") %>'></asp:Label>
                        </td>
                        <td class="tableBorder">
                            <asp:Label ID="Label14" runat="server" Text="Tuntas"></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    <tr>
                        <td colspan="3" class="tableHeader" align="right">
                            <strong>Semarang, Juni 2015</strong>
                        </td>
                    </tr>
                    </table>
                </FooterTemplate>
            </asp:DataList>
            <table width="100%" id="tblBottom2">
                <tr>
                    <td width="80">
                    </td>
                    <td width="160">
                    </td>
                    <td>
                    </td>
                    <td width="160">
                    </td>
                    <td>
                    </td>
                    <td width="160" rowspan="3" height="75">
                    </td>
                    <td width="80">
                    </td>
                </tr>
                <tr>
                    <td width="80">
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
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td width="150">
                    </td>
                    <td>
                    </td>
                    <td>
                        Moh. Haris, S.E, M.Si
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td style="border-top-style: solid; border-top-width: 2px; border-top-color: #000000;">
                        Orang Tua / Wali
                    </td>
                    <td>
                    </td>
                    <td style="border-top-style: solid; border-top-width: 2px; border-top-color: #000000;"
                        width="150">
                        Wali Kelas
                    </td>
                    <td>
                    </td>
                    <td style="border-top-style: solid; border-top-width: 2px; border-top-color: #000000;">
                        Kepala SMA Semesta
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </div>
        <!--  PAGE 3-->
        <div id="Page 3" style="width: 650px;">
            <div id="ReportTypePage3" style="height: 150px;">
            </div>
            <asp:FormView ID="FormViewStudentsPage3" runat="server" BackColor="White" BorderColor="#336666"
                BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataSourceID="SqlDataSourceStudents"
                GridLines="Horizontal" Width="100%" Font-Bold="True" Font-Size="9pt">
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td height="22" width="150">
                                <asp:Label ID="Label1" runat="server" Text="Nama Perserta Didik"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:Label ID="Label8" runat="server" Text=":"></asp:Label>
                                <asp:Label ID="StudentNameLabel" runat="server" Text='<%# Bind("StudentName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td height="22">
                                <asp:Label ID="Label2" runat="server" Text="Nomor Induk / NISN"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label9" runat="server" Text=":"></asp:Label>
                                <asp:Label ID="ScNoLbl" runat="server" Text='<%# Bind("SchoolNo") %>' />
                                /<asp:Label ID="StNoLbl" runat="server" Text='<%# Eval("UserName") %>' />
                            </td>
                            <td width="130">
                                <asp:Label ID="Label4" runat="server" Text="Kelas / Semester"></asp:Label>
                            </td>
                            <td width="100">
                                <asp:Label ID="Label15" runat="server" Text=":"></asp:Label>
                                <asp:Label ID="GrdLbl" runat="server" Text='<%# Eval("SectionCatalog") %>' />
                                / II
                            </td>
                        </tr>
                        <tr>
                            <td height="22">
                                <asp:Label ID="Label3" runat="server" Text="Nama Sekolah"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label17" runat="server" Text=":"></asp:Label>
                                <asp:Label ID="Label13" runat="server" Text="SMA SEMESTA SEMARANG"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Tahun Pelajaran"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label16" runat="server" Text=":"></asp:Label>
                                <asp:Label ID="Label6" runat="server" Text="2014-2015"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <br />
            <strong>PENGEMBANGAN DIRI </strong>
            <asp:DataList ID="DataListClubsActivities" runat="server" DataSourceID="SqlDataSourceGridViewClubsActivities"
                Width="650">
                <HeaderTemplate>
                    <table style="border: 3px double #336666" width="100%">
                        <tr>
                            <td width="30" class="tableHeader">
                                No
                            </td>
                            <td width="550" class="tableHeader">
                                Jenis Kegiatan
                            </td>
                            <td class="tableHeader" width="70">
                                Keterangan
                            </td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td width="30" class="tableBorder">
                            <%# Container.ItemIndex + 1 %>
                        </td>
                        <td width="550" class="tableBorder">
                            <asp:Label ID="LabelName" runat="server" Text='<%# Bind("ClubActivityName") %>'></asp:Label>
                        </td>
                        <td width="70" class="tableBorder">
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Input") %>'></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:DataList>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceGridViewClubsActivities" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT ClubActivityName, Input FROM vw_ClubsActivitiesStudents WHERE (StudentID = @StudentID) AND (AcademicSemesterID = @AcademicSemesterID) ORDER BY ClubActivityName">
                <SelectParameters>
                    <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
                    <asp:QueryStringParameter Name="AcademicSemesterID" QueryStringField="AS" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <strong>AKHLAK MULIA dan KEPRIBADIAN </strong>
            <asp:DataList ID="DataListStidySkills" runat="server" DataSourceID="SqlDataSourceGridViewStudySkills"
                Width="650px">
                <HeaderTemplate>
                    <table style="border: 3px double #336666" width="100%">
                        <tr>
                            <td width="30" class="tableHeader">
                                No
                            </td>
                            <td width="550" class="tableHeader">
                                Aspek Yang Dinilai
                            </td>
                            <td class="tableHeader" width="70">
                                Keterangan
                            </td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td width="30" class="tableBorder">
                            <%# Container.ItemIndex + 1%>
                        </td>
                        <td width="550" class="tableBorder">
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("StudySkill") %>'></asp:Label>
                        </td>
                        <td width="70" class="tableBorder">
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Response") %>'></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:DataList>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceGridViewStudySkills" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT StudySkill, Response FROM vw_StudySkillsStudents WHERE (StudentID = @StudentID) AND (AcademicSemesterID = @AcademicSemesterID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
                    <asp:QueryStringParameter Name="AcademicSemesterID" QueryStringField="AS" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <strong>CATATAN WALI KELAS</strong>
            <asp:FormView ID="FormViewComments" runat="server" DataSourceID="SqlDataSourceFormViewComments"
                BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px"
                CellPadding="4" GridLines="Horizontal" Width="100%">
                <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <EmptyDataTemplate>
                    -
                </EmptyDataTemplate>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <ItemTemplate>
                    <asp:Label ID="CommentLabel" runat="server" Text='<%# Bind("Comment") %>' />
                    <br />
                </ItemTemplate>
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" Font-Size="8pt" />
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSourceFormViewComments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT Comment FROM tbl_ReportComments WHERE (StudentID = @StudentID) AND (AcademicSemesterID = @AcademicSemesterID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
                    <asp:QueryStringParameter Name="AcademicSemesterID" QueryStringField="AS" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <table style="border: 1px solid #333333; font-size: medium; font-weight: bold;" width="100%">
                <tr>
                    <td width="280">
                        KETERANGAN KENAIKAN KELAS:
                    </td>
                    <td>
                        NAIK / <span style="text-decoration: line-through">TIDAK NAIK</span>
                    </td>
                </tr>
                <tr>
                    <td width="280">
                    </td>
                    <td style="text-align: right">
                    </td>
                </tr>
                <tr>
                    <td width="280">
                    </td>
                    <td style="text-align: right">
                        <strong>Semarang, 13 Juni 2015</strong>
                    </td>
                </tr>
            </table>
            <table width="100%" id="tblBottom3">
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
                    </td>
                    <td>
                    </td>
                    <td width="150">
                    </td>
                    <td>
                    </td>
                    <td>
                        Moh. Haris, S.E, M.Si
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td style="border-top-style: solid; border-top-width: 2px; border-top-color: #000000;">
                        Orang Tua / Wali
                    </td>
                    <td>
                    </td>
                    <td style="border-top-style: solid; border-top-width: 2px; border-top-color: #000000;"
                        width="150">
                        Wali Kelas
                    </td>
                    <td>
                    </td>
                    <td style="border-top-style: solid; border-top-width: 2px; border-top-color: #000000;">
                        Kepala SMA Semesta
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
