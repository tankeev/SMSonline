<%@ Page Language="VB" CodeFile="SemestaMidReport.aspx.vb" Theme="" StylesheetTheme=""
    Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Mid-Report Card</title>
</head>
<body topmargin="0">
    <form id="form" runat="server">
    <div id="Page1" style="padding: 0px; border: 0px solid #000000; float: none; background-color: #FFFFFF;
        width: 650px; clip: rect(auto, 50%, auto, 50%); font-family: Verdana; font-size: small;
        font-weight: normal;">
        <!--TOP -->
        <div id="ReportTop" style="float: left; width: 650px; height: 150px;">
        </div>
        <br />
        <asp:FormView ID="FormViewStudents" runat="server" BackColor="White" BorderColor="#336666"
            BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataSourceID="SqlDataSourceStudents"
            GridLines="Horizontal" Width="100%" Font-Bold="True" Font-Size="9pt">
            <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <ItemTemplate>
                <table width="100%">
                    <tr>
                        <td width="120" height="25">
                            <asp:Label ID="Label1" runat="server" Text="Student Number"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text=":"></asp:Label>
                            &nbsp;<asp:Label ID="StudentNoLabel" runat="server" Text='<%# Eval("SchoolNo") %>' />
                        </td>
                        <td width="110">
                            <asp:Label ID="Label4" runat="server" Text="Date"></asp:Label>
                        </td>
                        <td width="120">
                            <asp:Label ID="Label11" runat="server" Text=":"></asp:Label>
                            &nbsp;<asp:Label ID="LabelDate" runat="server" Text="20 Mar 2015"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="25">
                            <asp:Label ID="Label2" runat="server" Text="Student Name"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text=":"></asp:Label>
                            &nbsp;<asp:Label ID="StudentNameLabel" runat="server" Text='<%# Bind("StudentName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Academic Year" Width="110px"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label12" runat="server" Text=":"></asp:Label>
                            &nbsp;<asp:Label ID="Label6" runat="server" Text="2014-2015"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="25">
                            <asp:Label ID="Label3" runat="server" Text="Class:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label10" runat="server" Text=":"></asp:Label>
                            &nbsp;<asp:Label ID="GradeLabel" runat="server" Text='<%# Eval("SectionCatalog") %>' />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
        </asp:FormView>
        <br />
        <asp:GridView ID="GridViewAverages" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4"
            DataSourceID="SqlDataSourceAverages" GridLines="Horizontal" Width="100%">
            <AlternatingRowStyle BackColor="#E6E6E6" />
            <Columns>
                <asp:TemplateField HeaderText="No">
                    <ItemTemplate>
                        <strong>
                            <%# Container.DataItemIndex + 1 %>) </strong>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle Font-Bold="True" Width="30px" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Subject">
                    <ItemTemplate>
                        <asp:Label ID="LabelCourse" runat="server" Text='<%# Bind("CourseGroupName") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="200px" HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Minimum">
                    <ItemTemplate>
                        <asp:Label ID="LabelMinimum" runat="server" Text='<%# Eval("CourseMinimumScore") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="75px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Average">
                    <ItemTemplate>
                        <asp:Label ID="LabelAverage" runat="server" Text='<%# Eval("ClassAverage") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="75px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Score">
                    <ItemTemplate>
                        <asp:Label ID="LabelClassAverage" runat="server" Text='<%# Eval("Average") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="75px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Result">
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="--"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle Font-Bold="True" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle Height="25px" />
            <SelectedRowStyle Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
        <br />
        <table width="100%" id="tblBottom">
            <tr>
                <td width="80">
                    &nbsp;
                </td>
                <td width="160">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td width="160">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td width="160" rowspan="3">
                    &nbsp;
                    <img alt="" src="Images/PakHaris.jpg" />
                </td>
                <td width="80">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td width="80">
                    &nbsp;
                </td>
                <td width="160">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td width="160">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td width="80">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td width="150">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    Moh. Haris, S.E, M.Si
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td style="border-top-style: solid; border-top-width: 2px; border-top-color: #000000;">
                    Parent
                </td>
                <td>
                    &nbsp;
                </td>
                <td style="border-top-style: solid; border-top-width: 2px; border-top-color: #000000;"
                    width="150">
                    Class Teacher
                </td>
                <td>
                    &nbsp;
                </td>
                <td style="border-top-style: solid; border-top-width: 2px; border-top-color: #000000;">
                    Principal
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
        SelectCommand="SELECT tbl_Students.StudentID, tbl_Students.StudentName, tbl_SectionCatalog.SectionCatalog, tbl_Students.SchoolNo FROM tbl_Students INNER JOIN tbl_SectionCatalog ON tbl_Students.CurrentSectionID = tbl_SectionCatalog.SectionCatalogID WHERE (tbl_Students.StudentID = @StudentID) ORDER BY tbl_Students.StudentName">
        <SelectParameters>
            <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAverages" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
        
        SelectCommand="SELECT AcademicTermID, StudentID, ReportTypeID, CourseReportOrder, Average, ClassAverage, CourseGroupName, CourseMinimumScore FROM vw_ReportCardMidTermPrinter WHERE (AcademicTermID = @AcademicTermID) AND (StudentID = @StudentID) AND (ReportTypeID = @ReportTypeID) ORDER BY CourseReportOrder">
        <SelectParameters>
            <asp:QueryStringParameter Name="AcademicTermID" QueryStringField="AT" />
            <asp:QueryStringParameter Name="StudentID" QueryStringField="SID" />
            <asp:QueryStringParameter Name="ReportTypeID" QueryStringField="RTID" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
