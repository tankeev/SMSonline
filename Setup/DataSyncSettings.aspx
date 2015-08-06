<%@ Page Title="Setup Data Sync" Language="VB" MasterPageFile="Setup.Master" AutoEventWireup="false"
    CodeFile="DataSyncSettings.aspx.vb" Inherits="ManageUsers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <br />
    <asp:TabContainer ID="TabContainerData" runat="server" ActiveTabIndex="0" Width="675px"
        CssClass="tab">
        <asp:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
            <HeaderTemplate>
                General Tests
            </HeaderTemplate>
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td height="35">
                            <asp:Label ID="LabelStatusGroup3" runat="server" Font-Bold="True" ForeColor="#FF3300">Use This Section to Sync General Test Scores</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBoxList ID="CheckBoxListGeneralTestsGroupsScores" runat="server" DataSourceID="SqlDataSourceGeneralTestsByTests"
                                DataTextField="GeneralTestName" DataValueField="GeneralTestID" RepeatColumns="2"
                                Font-Size="X-Small" Width="100%">
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="ButtonSyncScores" runat="server" Text="Sync Selected Tests" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="LabelStatusScores" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceGeneralTestsByTests" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT GeneralTestID, GeneralTestName FROM tbl_GeneralTests WHERE (AcademicTermID = @AcademicTermID) ORDER BY GeneralTestName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
            <HeaderTemplate>
                Student Ranking
            </HeaderTemplate>
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td height="35">
                            <asp:Label ID="LabelStatusGroup0" runat="server" Font-Bold="True" ForeColor="#FF3300">Use This Section to Sync General Test Ranking</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBoxList ID="CheckBoxListGeneralTestsGroupsRanking" runat="server" DataSourceID="SqlDataSourceGeneralTestsByGroup"
                                DataTextField="GeneralTestGroupName" DataValueField="GeneralTestGroupID">
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="ButtonSyncGroups" runat="server" Text="Sync Selected Tests" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="LabelStatusGroup" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceGeneralTestsByGroup" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT distinct GeneralTestGroupID, GeneralTestGroupName FROM tbl_GeneralTests ORDER BY GeneralTestGroupName">
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
            <HeaderTemplate>
                General Test Codes
            </HeaderTemplate>
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td height="35">
                            <asp:Label ID="LabelStatusGroup1" runat="server" Font-Bold="True" ForeColor="#FF3300">Use This Section to Sync General Test Courses</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBoxList ID="CheckBoxListGeneralTestsCodes" runat="server" DataSourceID="SqlDataSourceGeneralTestsByCode"
                                DataTextField="GeneralTestCodeName" DataValueField="GeneralTestCodeID">
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="ButtonSyncCodes" runat="server" Text="Sync Selected Tests" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="LabelStatusCode" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceGeneralTestsByCode" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT GeneralTestCodeID, GeneralTestCodeName FROM tbl_GeneralTests ORDER BY GeneralTestCodeName">
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel4">
            <HeaderTemplate>
                Assessments
            </HeaderTemplate>
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td height="35">
                            <asp:Label ID="LabelStatusGroup2" runat="server" Font-Bold="True" ForeColor="#FF3300">Use This Section to Sync Assessment Marks</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:DropDownList ID="DropDownListSections" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceDropDownListSections"
                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBoxList ID="CheckBoxListAssessmentsImport" runat="server" DataSourceID="SqlDataSourceAssessmentsImport"
                                DataTextField="Assessment" DataValueField="AssessmentID" RepeatColumns="2">
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="ButtonSyncAssessmentsImport" runat="server" Text="Sync Selected Tests" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="LabelStatusAssessments" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceDropDownListSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT [SectionCatalogID], [SectionCatalog] FROM [tbl_SectionCatalog] ORDER BY [SectionGroup]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessmentsImport" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT AssessmentID, SectionCatalog + N' ' + Assessment + N'' + N' Data' AS Assessment FROM vw_AssessmentsImport WHERE (SectionCatalogID = @SectionCatalog) ORDER BY Assessment">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSections" Name="SectionCatalog" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
    <br />
</asp:Content>
