<%@ Page Title="SIS Staff Home Page" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Src="WebMessageBox.ascx" TagName="UCWebMessageBox" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="content-left">
        <br />
        <table id="tbl_UserActivity" class="content-table" width="240">
            <tr>
                <td>
                    <asp:FormView ID="FormViewUserProfile" runat="server" DataSourceID="SqlDataSourceStaffProfile"
                        Width="100%">
                        <ItemTemplate>
                            <table width="100%">
                                <tr>
                                    <td width="20">
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:Image ID="ImageStudent" runat="server" ImageUrl="~/Images/StudentProfile.png"
                                            Width="128px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="22">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Staff/Images/plus.gif" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" ForeColor="Black" Text="User Name:"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="22">
                                        <asp:Image ID="Image7" runat="server" ImageUrl="~/Staff/Images/minus.gif" />
                                    </td>
                                    <td>
                                        <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="22">
                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Staff/Images/plus.gif" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" ForeColor="Black" Text="Staff Name: "></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="22">
                                        <asp:Image ID="Image8" runat="server" ImageUrl="~/Staff/Images/minus.gif" />
                                    </td>
                                    <td>
                                        <asp:Label ID="StudentNameLabel" runat="server" Text='<%# Bind("StaffName") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="22">
                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Staff/Images/plus.gif" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" ForeColor="Black" Text="Date of Birth: "></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="22">
                                        <asp:Image ID="Image9" runat="server" ImageUrl="~/Staff/Images/minus.gif" />
                                    </td>
                                    <td>
                                        <asp:Label ID="DateofBirthLabel" runat="server" Text='<%# Bind("DateofBirth", "{0:D}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="22">
                                        <asp:Image ID="Image4" runat="server" ImageUrl="~/Staff/Images/plus.gif" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" ForeColor="Black" Text="School Name: "></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="22">
                                        <asp:Image ID="Image10" runat="server" ImageUrl="~/Staff/Images/minus.gif" />
                                    </td>
                                    <td>
                                        <asp:Label ID="SchoolNameLabel" runat="server" Text='<%# Bind("SchoolName") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="22">
                                        <asp:Image ID="Image5" runat="server" ImageUrl="~/Staff/Images/plus.gif" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" ForeColor="Black" Text="Last Activity Date:"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="22">
                                        <asp:Image ID="Image11" runat="server" ImageUrl="~/Staff/Images/minus.gif" />
                                    </td>
                                    <td>
                                        <asp:Label ID="LastActivityDateLabel" runat="server" Text='<%# Bind("LastActivityDate") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="22">
                                        <asp:Image ID="Image6" runat="server" ImageUrl="~/Staff/Images/plus.gif" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label8" runat="server" ForeColor="Black" Text="User Roles:"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        <asp:DataList ID="DataListRoles" runat="server" DataSourceID="SqlDataSourceRoles">
                                            <ItemTemplate>
                                                <asp:Label ID="RoleNameLabel" runat="server" Text='<%# Eval("RoleName") %>' />
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                            </table>
                            <asp:SqlDataSource ID="SqlDataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT aspnet_Roles.RoleName FROM aspnet_UsersInRoles INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId WHERE (aspnet_UsersInRoles.UserId = @UserId) ORDER BY aspnet_Roles.RoleName">
                                <SelectParameters>
                                    <asp:SessionParameter Name="UserId" SessionField="UserID" />
                                </SelectParameters>
                            </asp:SqlDataSource>
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
        <asp:UpdatePanel ID="UpdatePanelHelpDesk" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table id="HelpDesk" class="content-table" width="240">
                    <tr>
                        <td height="25">
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
                                            <td height="25">
                                                <asp:Label ID="HelpDesk" runat="server" ForeColor="Red" Text="Your Message or Request:"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="MessageTextBox" runat="server" Height="100px" Text='<%# Bind("Message") %>'
                                                    TextMode="MultiLine" Width="97%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="35">
                                                <asp:Button ID="ButtonHelpDesk" runat="server" CommandName="Insert" Text="Send Your Message"
                                                    ValidationGroup="HelpDesk" Width="100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="20">
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorHelpDesk" runat="server"
                                                    ControlToValidate="MessageTextBox" ErrorMessage="Check Your Message Please!"
                                                    Font-Bold="True" Font-Size="X-Small" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9.]|-|\s)+$"
                                                    ValidationGroup="HelpDesk">Check Your Message Please!</asp:RegularExpressionValidator>
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
                        </td>
                    </tr>
                </table>
                <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                <uc1:UCWebMessageBox ID="UCWebMessageBoxDefault" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
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
                            <asp:Label ID="MessageLabel" runat="server" Text='<%# Bind("Message") %>' />
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
            SelectCommand="SELECT DISTINCT AnnouncementID, Title, Message, Date, Publish, AddedBy, RoleName, SchoolCode FROM vw_Announcements WHERE (Publish = 1) AND (RoleName = N'Staff') AND (SchoolCode = @SchoolCode) ORDER BY Date DESC">
            <SelectParameters>
                <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
