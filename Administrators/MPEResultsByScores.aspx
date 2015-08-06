<%@ Page Title="SIS General Test Scores" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="MPEResultsByScores.aspx.vb" Inherits="General_Test_Scores" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuMPExams.ascx" TagName="MenuMPExams" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuMPExams ID="MenuMPExams1" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label30" runat="server" Text="Mitra Pasiad Exams"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:DropDownList ID="DropDownListGeneralTestsGroups" runat="server" DataSourceID="SqlDataSourceDropDownListGeneralTestsGroups"
                                DataTextField="GeneralTestGroupName" DataValueField="GeneralTestGroupID" TabIndex="7"
                                Width="95%">
                                <asp:ListItem Value="">Not Selected!</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label33" runat="server" Text="School Sections"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:CheckBoxList ID="CheckBoxListSections" runat="server" DataSourceID="SqlDataSourceCheckBoxSections"
                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" RepeatColumns="4">
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Button ID="ButtonFilter" runat="server" Text="Show Scores" Width="98%" />
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Label ID="LabelStatus" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    MPE RESULTS BY SCORES</h2>
                <br />
                <div id="divChild">
                    <asp:Panel ID="PanelStatus" runat="server" Width="680px">
                        <div align="center">
                            <br />
                            <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Please Select Grades to See Results!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="PanelScores" runat="server">
                        <br />
                        <asp:DataList ID="DataListGeneralTestsStudents" runat="server" Width="680px">
                            <AlternatingItemStyle BackColor="#E9E9E9" />
                            <ItemStyle BorderColor="#666666" BorderStyle="Solid" BorderWidth="1px" />
                            <ItemTemplate>
                                <table width="500">
                                    <tr>
                                        <td width="30">
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Administrators/Images/Item.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelStudentName" runat="server" Font-Bold="True" Text='<%# Eval("StudentName") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <asp:HiddenField ID="HiddenFieldStudentID" runat="server" Value='<%# Eval("StudentID") %>' />
                                <asp:HiddenField ID="HiddenFieldGeneralTestGroupID" runat="server" Value='<%# Eval("GeneralTestGroupID") %>' />
                                <asp:DataList ID="DataListGeneralTestsStudentsRanking" runat="server" DataSourceID="SqlDataSourceGeneralTestsReports"
                                    RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td colspan="3">
                                                    <asp:Label ID="Label27" runat="server" Text="("></asp:Label>
                                                    <asp:Label ID="CourseLabel" runat="server" Font-Size="XX-Small" Text='<%# Eval("CourseCategory") %>' />
                                                    <asp:Label ID="Label28" runat="server" Text=")"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="80">
                                                    <asp:Label ID="Label25" runat="server" Font-Size="XX-Small" ForeColor="Red" Text="C:"></asp:Label>
                                                </td>
                                                <td width="80">
                                                    <asp:Label ID="Label29" runat="server" Font-Size="XX-Small" ForeColor="Red" Text="W:"></asp:Label>
                                                </td>
                                                <td width="80">
                                                    <asp:Label ID="Label26" runat="server" Font-Size="XX-Small" ForeColor="Red" Text="S:"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="80">
                                                    <asp:Label ID="Correct" runat="server" Font-Size="XX-Small" Text='<%# Eval("Correct") %>' />
                                                </td>
                                                <td width="80">
                                                    <asp:Label ID="Wrong" runat="server" Font-Size="XX-Small" Text='<%# Eval("Wrong") %>' />
                                                </td>
                                                <td width="80">
                                                    <asp:Label ID="Score" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# Eval("Score") %>' />
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:SqlDataSource ID="SqlDataSourceGeneralTestsReports" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                    SelectCommand="SELECT CourseCategory, Correct, Wrong, Score, GeneralTestGroupID FROM vw_GeneralTestsScoresCalculated WHERE (StudentID = @StudentID) AND (GeneralTestGroupID = @GeneralTestGroupID)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="HiddenFieldStudentID" Name="StudentID" PropertyName="Value" />
                                        <asp:ControlParameter ControlID="HiddenFieldGeneralTestGroupID" Name="GeneralTestGroupID"
                                            PropertyName="Value" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:DataList>
                    </asp:Panel>
                    <br />
                    <asp:Label ID="LabelCheck" runat="server"></asp:Label>
                    <asp:SqlDataSource ID="SqlDataSourceDropDownListGeneralTestsGroups" runat="server"
                        ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT DISTINCT GeneralTestGroupID, GeneralTestGroupName, AcademicTermID FROM tbl_GeneralTests WHERE (AcademicTermID = @AcademicTermID) ORDER BY GeneralTestGroupName">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceCheckBoxSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT        SectionCatalogID, SectionCatalog
FROM            vw_Sections
WHERE        (SchoolCode = @SchoolCode)
ORDER BY SectionGroup">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
