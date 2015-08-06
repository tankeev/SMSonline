<%@ Page Title="Setup Manage Users Status" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" CodeFile="ManageUserEmails.aspx.vb" Inherits="ManageUsers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridViewUsers" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceUserEMails"
                Width="100%" AllowPaging="True">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Setup/Images/Item.png" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Name" SortExpression="UserName">
                        <ItemTemplate>
                            <asp:Label ID="LabelUsername" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="200px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email" SortExpression="Email">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxEmail" runat="server" Text='<%# Bind("Email") %>' Width="90%"
                                ValidationGroup="Validator"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ErrorMessage="*" ControlToValidate="TextBoxEmail" ForeColor="Red"></asp:RegularExpressionValidator>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="ButtonUpdate" runat="server" Text="Update User E-Mails" Width="100%"
                ValidationGroup="Validator" />
            <br />
            <asp:SqlDataSource ID="SqlDataSourceUserEMails" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT aspnet_Users.UserId, aspnet_Users.UserName, aspnet_Membership.Email, aspnet_Membership.LoweredEmail FROM aspnet_Users INNER JOIN aspnet_Membership ON aspnet_Users.UserId = aspnet_Membership.UserId">
            </asp:SqlDataSource>
            <br />
            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
