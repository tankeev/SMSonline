<%@ Page Title="SIS Asessment Settings" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" CodeFile="UserReports.aspx.vb" Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridViewUserReport" runat="server" AutoGenerateColumns="False"
                DataSourceID="SqlDataSourceUserReports" Width="100%">
                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="LastLoginDate" HeaderText="Last Login Date" SortExpression="LastLoginDate">
                        <ItemStyle Width="150px" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceUserReports" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT TOP (20) aspnet_Users.UserName, aspnet_Membership.LastLoginDate FROM aspnet_Membership INNER JOIN aspnet_Users ON aspnet_Membership.UserId = aspnet_Users.UserId ORDER BY aspnet_Membership.LastLoginDate DESC">
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
