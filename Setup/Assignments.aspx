<%@ Page Title="SIS Asessment Settings" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" CodeFile="Assignments.aspx.vb" Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridViewAssignments" runat="server" AutoGenerateColumns="False"
                DataKeyNames="AssignmentID" DataSourceID="SqlDataSourceAssignments" Width="100%">
                <Columns>
                    <asp:BoundField DataField="AssignmentID" HeaderText="AID" InsertVisible="False" ReadOnly="True"
                        SortExpression="AssignmentID">
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="StaffName" HeaderText="Staff Name" SortExpression="StaffName" />
                    <asp:BoundField DataField="AssignmentDetails" HeaderText="Assignment Details" SortExpression="AssignmentDetails" />
                    <asp:BoundField DataField="DateAdded" DataFormatString="{0:D}" HeaderText="DateAdded"
                        SortExpression="DateAdded">
                        <ItemStyle Width="180px" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSourceAssignments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT tbl_Assignments.AssignmentID, tbl_Assignments.AssignmentDetails, tbl_Assignments.DateAdded, tbl_Staff.StaffName FROM tbl_Assignments INNER JOIN tbl_Staff ON tbl_Assignments.StaffID = tbl_Staff.StaffID">
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
