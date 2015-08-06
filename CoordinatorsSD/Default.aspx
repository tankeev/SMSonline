<%@ Page Title="SIS Coordinator Home Page" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="content-left">
        <br />
        <table id="tbl_UserActivity" class="content-table" width="240">
            <tr>
                <td height="30">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="User Activitiy: Last 5 Logins"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridViewUserActivity" runat="server" AutoGenerateColumns="False"
                        DataSourceID="SqlDataSourceUserActivity" Width="95%">
                        <Columns>
                            <asp:TemplateField HeaderText="UserName" SortExpression="UserName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelUsername" runat="server" Font-Size="X-Small" Text='<%# Bind("UserName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date" SortExpression="LastLoginDate">
                                <ItemTemplate>
                                    <asp:Label ID="LabelDate" runat="server" Font-Size="X-Small" Text='<%# Bind("LastLoginDate", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <table id="TableNumberofStudents" class="content-table" width="240">
            <tr>
                <td height="30">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Number of Students in Classes:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridViewNumberofStudents" runat="server" AutoGenerateColumns="False"
                        DataSourceID="SqlDataSourceNumberofStudents" Width="95%">
                        <Columns>
                            <asp:TemplateField HeaderText="Section Name" SortExpression="SectionCatalog">
                                <ItemTemplate>
                                    <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 150px">
                                        <asp:Label ID="Label3" runat="server" Font-Size="X-Small" Text="Class: "></asp:Label>
                                        <asp:Label ID="LabelSectionName" runat="server" Text='<%# Eval("SectionCatalog") %>'
                                            ToolTip='<%# Bind("SectionCatalog") %>' Font-Size="X-Small"></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total" SortExpression="Total">
                                <ItemTemplate>
                                    <asp:Label ID="LabelTotal" runat="server" Font-Size="X-Small" Text='<%# Bind("Total") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
        <br />
    </div>
    <div class="content-right">
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
            SelectCommand="SELECT DISTINCT AnnouncementID, Title, Message, Date, Publish, AddedBy, RoleName, SchoolCode FROM vw_Announcements WHERE (Publish = 1) AND (RoleName = N'Coordinator') AND (SchoolCode = @SchoolCode) ORDER BY Date DESC">
            <SelectParameters>
                <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceUserActivity" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            SelectCommand="SELECT TOP (5) vw_aspnet_MembershipUsers.LastLoginDate, vw_aspnet_MembershipUsers.UserName FROM vw_aspnet_MembershipUsers INNER JOIN aspnet_Users ON vw_aspnet_MembershipUsers.UserId = aspnet_Users.UserId WHERE (aspnet_Users.SchoolCode = @SchoolCode) ORDER BY vw_aspnet_MembershipUsers.LastLoginDate DESC">
            <SelectParameters>
                <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceNumberofStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            SelectCommand="SELECT SectionCatalog, Total FROM vw_NumberofStudentsinClasses WHERE (SchoolCode = @SchoolCode) ORDER BY SectionGroup, SectionCatalog">
            <SelectParameters>
                <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
