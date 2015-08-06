<%@ Page Title="SIS Student Home Page" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="content-left">
        <br />
        <table id="tbl_UserActivity" class="content-table" width="240">
            <tr>
                <td height="30">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="User Profile:" Font-Size="Small"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:FormView ID="FormViewUserProfile" runat="server" DataSourceID="SqlDataSourceStaffProfile"
                        Width="100%">
                        <ItemTemplate>
                            <asp:Image ID="ImageStudent" runat="server" ImageUrl="~/Images/StudentProfile.png"
                                Width="128px" />
                            <br />
                            User Name:
                            <br />
                            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' />
                            <br />
                            <br />
                            Staff Name:
                            <br />
                            <asp:Label ID="StudentNameLabel" runat="server" Text='<%# Bind("StaffName") %>' />
                            <br />
                            <br />
                            School Name:
                            <br />
                            <asp:Label ID="SchoolNameLabel" runat="server" Text='<%# Bind("SchoolName") %>' />
                            <br />
                            <br />
                            Date of Birth:
                            <br />
                            <asp:Label ID="DateofBirthLabel" runat="server" Text='<%# Bind("DateofBirth", "{0:D}") %>' />
                            <br />
                            <br />
                            Last Activity Date:<br />
                            <asp:Label ID="LastActivityDateLabel" runat="server" Text='<%# Bind("LastActivityDate") %>' />
                            <br />
                        </ItemTemplate>
                    </asp:FormView>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <asp:UpdatePanel ID="UpdatePanel" runat="server">
            <ContentTemplate>
                <table id="HelpDesk" class="content-table" width="240">
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Help Desk" Font-Size="Small"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:FormView ID="FormViewHelpDesk" runat="server" DataKeyNames="HelpDeskID" DataSourceID="SqlDataSourceHelpDesk"
                                DefaultMode="Insert" Width="92%">
                                <InsertItemTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="HelpDesk" runat="server" ForeColor="Red" Text="Your Message or Request:"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="MessageTextBox" runat="server" Height="100px" Text='<%# Bind("Message") %>'
                                                    TextMode="MultiLine" Width="100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="35">
                                                <asp:Button ID="ButtonHelpDesk" runat="server" CommandName="Insert" Text="Send Your Message"
                                                    Width="100%" />
                                            </td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelHelpDeskStatus" runat="server" ForeColor="#FF3300"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:SqlDataSource ID="SqlDataSourceStaffProfile" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            SelectCommand="SELECT aspnet_Users.UserId, aspnet_Users.UserName, aspnet_Users.LastActivityDate, tbl_Staff.StaffName, tbl_Staff.DateofBirth, tbl_Schools.SchoolName FROM aspnet_Users INNER JOIN tbl_Staff ON aspnet_Users.UserId = tbl_Staff.StaffID INNER JOIN tbl_Schools ON tbl_Staff.SchoolCode = tbl_Schools.SchoolCode WHERE (aspnet_Users.UserId = @UserId)">
            <SelectParameters>
                <asp:SessionParameter Name="UserId" SessionField="UserID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceHelpDesk" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            SelectCommand="SELECT HelpDeskID, UserID, Message, Date, IsActive FROM tbl_HelpDesk"
            InsertCommand="INSERT INTO tbl_HelpDesk(UserID, Message, Date, IsActive) VALUES (@UserID, @Message, @Date, @IsActive)">
            <InsertParameters>
                <asp:Parameter Name="UserID" />
                <asp:Parameter Name="Message" />
                <asp:Parameter Name="Date" />
                <asp:Parameter Name="IsActive" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceAnnouncements" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            SelectCommand="SELECT DISTINCT AnnouncementID, Title, Message, Date, Publish, AddedBy, RoleName, SchoolCode FROM vw_Announcements WHERE (Publish = 1) AND (RoleName = N'Trainee') AND (SchoolCode = @SchoolCode) ORDER BY Date DESC">
            <SelectParameters>
                <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
            </SelectParameters>
        </asp:SqlDataSource>
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
    </div>
</asp:Content>
