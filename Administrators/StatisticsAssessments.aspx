<%@ Page Title="Statistics" Language="VB" MasterPageFile="Default.Master" CodeFile="StatisticsAssessments.aspx.vb"
    Inherits="Assessments" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <asp:GridView ID="GridViewLastAddedAssessments" runat="server" AllowPaging="True"
                AutoGenerateColumns="False" DataKeyNames="AssessmentID" DataSourceID="SqlDataSourceLastAddedAssessments"
                Width="100%" PageSize="18">
                <Columns>
                    <asp:BoundField DataField="StaffName" HeaderText="StaffName" SortExpression="StaffName" />
                    <asp:BoundField DataField="SectionCatalog" HeaderText="Section" SortExpression="SectionCatalog" />
                    <asp:BoundField DataField="Assessment" HeaderText="Assessment" SortExpression="Assessment" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" SortExpression="Date" />
                </Columns>
                <EmptyDataTemplate>
                    <div align="center" style="background-color: #FFFFFF">
                        <br />
                        <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                        <br />
                        <br />
                        <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Sorry! No Record Found!"></asp:Label>
                        <br />
                        <br />
                    </div>
                </EmptyDataTemplate>
                <PagerStyle Height="28px" />
                <RowStyle Height="30px" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceLastAddedAssessments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT TOP (100) AssessmentID, Assessment, StaffName, SectionCatalog, Description, Date FROM vw_LastAddedAssessments WHERE (SchoolCode = @SchoolCode) ORDER BY Date DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
