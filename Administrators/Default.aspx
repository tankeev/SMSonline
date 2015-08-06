<%@ Page Title="HomePage" Language="VB" MasterPageFile="Default.Master" CodeFile="Default.aspx.vb"
    Inherits="_Default" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <asp:Repeater ID="RepeaterAnnouncements" runat="server" DataSourceID="SqlDataSourceAnnouncements">
                <ItemTemplate>
                    <table width="680">
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
                    <hr width="680" />
                    <br />
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSourceAnnouncements" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT DISTINCT AnnouncementID, Title, Message, Date, Publish, AddedBy, RoleName FROM vw_Announcements WHERE (Publish = 1) AND (RoleName = N'Administrator') ORDER BY Date DESC">
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
