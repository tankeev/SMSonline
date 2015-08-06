<%@ Page Title="SIS General Tests Ranking" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="MPERankingByStudents.aspx.vb" Inherits="Assignments" %>

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
                <uc1:MenuMPExams ID="MenuMPExams" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label25" runat="server" Text="Mitra Pasiad Exams"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:DropDownList ID="DropDownListGeneralTestsGroups" runat="server" DataSourceID="SqlDataSourceDropDownListGeneralTests"
                                DataTextField="GeneralTestGroupName" DataValueField="GeneralTestGroupID" TabIndex="7"
                                Width="95%">
                                <asp:ListItem Value="">Not Selected!</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:CheckBox ID="CheckBoxSchoolFilter" runat="server" AutoPostBack="True" Text="Filter By School?" />
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:CheckBox ID="CheckBoxClassFilter" runat="server" AutoPostBack="True" Enabled="False"
                                Text="Filter By Class?" />
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:DropDownList ID="DropDownListSections" runat="server" DataSourceID="SqlDataSourceDropDownListSections"
                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" Enabled="False"
                                Width="95%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Button ID="ButtonRanking" runat="server" Text="Show Ranking" Width="95%" />
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Label ID="LabelTotal" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    RANKING BY STUDENTS</h2>
                <br />
                <asp:Panel ID="PanelStatus" runat="server" Width="680px">
                    <div align="center">
                        <br />
                        <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                        <br />
                        <br />
                        <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" Text="Please Select Grades to See Results!"></asp:Label>
                        <br />
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel ID="PanelRanking" runat="server" Visible="False">
                    <asp:Label ID="Label24" runat="server" Font-Bold="True" ForeColor="Red" Text="General Assessment Test - General Ranking"></asp:Label>
                    <br />
                    <br />
                    <asp:GridView ID="GridviewGeneralTestsRanking" runat="server" AutoGenerateColumns="False"
                        Width="680px" AllowPaging="True" AllowSorting="True" PageSize="20">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Administrators/Images/Item.png" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="30px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ranking" SortExpression="Ranking">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Ranking") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Font-Bold="True" HorizontalAlign="Center" Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="School Name" SortExpression="SchoolName">
                                <ItemTemplate>
                                    <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 195px">
                                        <asp:Label ID="LabelStudentName" runat="server" Font-Size="X-Small" Text='<%# Bind("SchoolName") %>'
                                            ToolTip='<%# Bind("SchoolName") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="SectionCatalog" HeaderText="Section" SortExpression="SectionCatalog">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />
                            <asp:TemplateField HeaderText="Score" SortExpression="GeneralScore">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Bind("GeneralScore") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("GeneralScore") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div align="center">
                                <br />
                                <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                                <br />
                                <br />
                                <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Sorry! No Record Found!"></asp:Label>
                                <br />
                                <br />
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <br />
                    <asp:Label ID="LabelStatus" runat="server" ForeColor="Red"></asp:Label>
                    <br />
                </asp:Panel>
                <asp:SqlDataSource ID="SqlDataSourceDropDownListGeneralTests" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT GeneralTestGroupID, GeneralTestGroupName, AcademicTermID FROM tbl_GeneralTests WHERE (AcademicTermID = @AcademicTermID) ORDER BY GeneralTestGroupName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceDropDownListSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT        SectionCatalogID, SectionCatalog
FROM            vw_Sections
WHERE        (SchoolCode = @SchoolCode)
ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceDropDownListGrades" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT SectionGroup FROM vw_Students ORDER BY SectionGroup">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceGeneralTestsRankingGrade" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT GeneralTestGroupID, SchoolCode, CurrentSectionID, GeneralScore, SchoolName, SectionCatalog, SectionGroup, StudentID, StudentName, ROW_NUMBER() OVER (Partition BY GeneralTestGroupID, SectionGroup ORDER BY GeneralScore DESC) AS Ranking FROM vw_GeneralTestsRanking WHERE (GeneralTestGroupID = @GeneralTestGroupID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListGeneralTestsGroups" Name="GeneralTestGroupID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceGeneralTestsRankingSchoolGrade" runat="server"
                    ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT GeneralTestGroupID, SchoolCode, CurrentSectionID, GeneralScore, StudentID, SchoolName, SectionCatalog, SectionGroup, StudentName, ROW_NUMBER() OVER (Partition BY GeneralTestGroupID, SchoolCode , SectionGroup ORDER BY GeneralScore DESC) AS Ranking FROM vw_GeneralTestsRanking WHERE (GeneralTestGroupID = @GeneralTestGroupID) AND (SchoolCode = @SchoolCode) ">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListGeneralTestsGroups" Name="GeneralTestGroupID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceGeneralTestsRankingSchoolClass" runat="server"
                    ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT GeneralTestGroupID, SchoolCode, CurrentSectionID, GeneralScore, StudentID, SchoolName, SectionCatalog, SectionGroup, StudentName, ROW_NUMBER() OVER (Partition BY GeneralTestGroupID, SchoolCode, CurrentSectionID ORDER BY GeneralScore DESC) AS Ranking FROM vw_GeneralTestsRanking WHERE (GeneralTestGroupID = @GeneralTestGroupID) AND (SchoolCode = @SchoolCode) AND (CurrentSectionID = @CurrentSectionID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListGeneralTestsGroups" DefaultValue=""
                            Name="GeneralTestGroupID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" DefaultValue="" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSections" DefaultValue="" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
