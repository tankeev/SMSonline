<%@ Page Title="Setup Manage Roles" Language="VB" MasterPageFile="Setup.Master" AutoEventWireup="false"
    CodeFile="ManageRoles.aspx.vb" Inherits="ManageRoles" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanelRoles" runat="server">
        <ContentTemplate>
            <asp:TabContainer ID="TabContainerRoles" runat="server" ActiveTabIndex="0" Width="680px"
                CssClass="tab">
                <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                    <HeaderTemplate>
                        USER ROLES
                    </HeaderTemplate>
                    <ContentTemplate>
                        <table style="background-color: #E5E5E5; border: 1px solid #999999" width="100%">
                            <tr>
                                <td height="30" width="150">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Search A Username:"></asp:Label>
                                </td>
                                <td height="25">
                                    <asp:TextBox ID="TextBoxSearchUser" runat="server" Width="95%"></asp:TextBox>
                                </td>
                                <td height="25" width="50">
                                    <asp:Button ID="ButtonSearch" runat="server" Text="Find" Width="40px" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:GridView ID="GridviewUsers" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        DataKeyNames="UserID" DataSourceID="SqlDataSourceUserList" Width="100%">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Administrators/Images/edit.png" />
                                                </ItemTemplate>
                                                <ItemStyle Width="20px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName" />
                                            <asp:BoundField DataField="SchoolName" HeaderText="School Name" SortExpression="SchoolName" />
                                            <asp:BoundField DataField="LastActivityDate" DataFormatString="{0:D}" HeaderText="Last Activity Date"
                                                SortExpression="LastActivityDate">
                                                <ItemStyle Width="200px" />
                                            </asp:BoundField>
                                            <asp:CommandField ShowSelectButton="True">
                                                <ItemStyle Width="50px" HorizontalAlign="Center" />
                                            </asp:CommandField>
                                        </Columns>
                                        <SelectedRowStyle BackColor="#FFFFCC" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table style="background-color: #E5E5E5; border: 1px solid #999999" width="100%">
                            <tr>
                                <td height="25">
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Assigned Roles for User:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBoxList ID="CheckBoxListRoles" runat="server" DataSourceID="SqlDataSourceRolesTab1"
                                        DataTextField="RoleName" DataValueField="RoleId" Width="100%" RepeatColumns="6"
                                        RepeatDirection="Horizontal">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                            <tr>
                                <td height="35">
                                    <asp:Button ID="UpdateRoles" runat="server" Text="Update Roles" Width="100%" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        <br />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSourceRolesTab1" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                            InsertCommand="INSERT INTO aspnet_Roles(RoleName) VALUES (@RoleName)" SelectCommand="SELECT RoleId, RoleName FROM aspnet_Roles">
                            <InsertParameters>
                                <asp:Parameter Name="RoleName" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceRolesEdit" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                            DeleteCommand="DELETE FROM aspnet_UsersInRoles WHERE (UserID = @UserID) AND (RoleID = @RoleID)"
                            InsertCommand="INSERT INTO aspnet_Roles(RoleName) VALUES (@RoleName)" SelectCommand="SELECT UserId, RoleId FROM aspnet_UsersInRoles WHERE (UserId = @UserId)"
                            UpdateCommand="IF NOT EXISTS 
(
SELECT UserID, RoleID FROM aspnet_UsersInRoles WHERE (UserID = @UserID) AND (RoleID = @RoleID)
)

INSERT INTO aspnet_UsersInRoles (UserID, RoleID) VALUES (@UserID,@RoleID)">
                            <DeleteParameters>
                                <asp:Parameter Name="UserID" />
                                <asp:Parameter Name="RoleID" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="RoleName" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridviewUsers" Name="UserId" PropertyName="SelectedValue" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="UserID" />
                                <asp:Parameter Name="RoleID" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceUserList" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                            FilterExpression="UserName LIKE '{0}%'" SelectCommand="SELECT [UserId], [UserName], [LastActivityDate], [SchoolName] FROM [vw_aspnet_Users] ORDER BY [LastActivityDate] DESC">
                            <FilterParameters>
                                <asp:ControlParameter ControlID="TextBoxSearchUser" Name="newparameter" PropertyName="Text" />
                            </FilterParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                    <HeaderTemplate>
                        ADD ROLE
                    </HeaderTemplate>
                    <ContentTemplate>
                        <table style="background-color: #E5E5E5; border: 1px solid #999999" width="100%">
                            <tr>
                                <td width="150">
                                    <asp:Label ID="LabelAddNewRole" runat="server" Font-Bold="True">Add New Role:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxNewRole" runat="server" Width="95%"></asp:TextBox>
                                </td>
                                <td width="50">
                                    <asp:Button ID="ButtonNewRole" runat="server" Text="Add" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:GridView ID="GridViewRoles" runat="server" AutoGenerateColumns="False" DataKeyNames="RoleId"
                                        DataSourceID="SqlDataSourceRoles" Width="100%">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBoxRole" runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="20px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="RoleName" SortExpression="RoleName">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RoleName") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="RoleNameLabel" runat="server" Text='<%# Eval("RoleName") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete!" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                                        OnClientClick="return confirm('Are you certain you want to delete this product?');"
                                                        Text="Delete">
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle Width="50px" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                            InsertCommand="INSERT INTO aspnet_Roles(RoleName) VALUES (@RoleName)" SelectCommand="SELECT RoleId, RoleName FROM aspnet_Roles">
                            <InsertParameters>
                                <asp:Parameter Name="RoleName" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
