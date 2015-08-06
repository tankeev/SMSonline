<%@ Page Title="SIS Parents Home Page" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="SISDefault">
        <asp:Repeater ID="RepeaterAnnouncements" runat="server" DataSourceID="SqlDataSourceAnnouncements">
            <ItemTemplate>
                <table width="750">
                    <tr>
                        <td colspan="3" height="25">
                            <b>
                                <asp:Label ID="TitleLabel" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black"
                                    Text='<%# Bind("Title") %>' />
                            </b>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="justify">
                            <asp:Label ID="MessageLabel" runat="server" Font-Size="Small" Text='<%# Bind("Message") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td width="160" height="20">
                            <asp:Label ID="DateLabel" runat="server" Font-Size="X-Small" ForeColor="#333333"
                                Text='<%# Bind("Date") %>' />
                        </td>
                        <td width="40">
                            <asp:Label ID="DateLabel1" runat="server" Font-Size="X-Small" ForeColor="#333333"
                                Text="From:" Font-Bold="True" />
                        </td>
                        <td>
                            <asp:Label ID="AddedByLabel" runat="server" Font-Size="X-Small" ForeColor="#333333"
                                Text='<%# Bind("AddedBy") %>' />
                        </td>
                    </tr>
                </table>
                <hr />
                <br />
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceAnnouncements" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
        
        SelectCommand="SELECT DISTINCT AnnouncementID, Title, Message, Date, Publish, AddedBy, RoleName, SchoolCode FROM vw_Announcements WHERE (Publish = 1) AND (RoleName = N'Parent') AND (SchoolCode = @SchoolCode) ORDER BY Date DESC">
        <SelectParameters>
            <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
