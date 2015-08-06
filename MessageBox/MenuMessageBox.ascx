<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MenuMessageBox.ascx.vb"
    Inherits="Coordinators_MenuCoordinators" %>



<asp:LoginView ID="LoginViewMessageBox" runat="server">
    <RoleGroups>
        <asp:RoleGroup Roles="Administrator">
            <ContentTemplate>
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew" runat="server" ImageUrl="~/MessageBox/Images/replay.png"
                                NavigateUrl="~/MessageBox/AdministratorsMessagetoStudents.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label25" runat="server" Text="Send Message to Students"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew0" runat="server" ImageUrl="~/MessageBox/Images/replay.png"
                                NavigateUrl="~/MessageBox/AdministratorsMessagetoParents.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label26" runat="server" Text="Send Message to Parents"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew1" runat="server" ImageUrl="~/MessageBox/Images/replay.png"
                                NavigateUrl="~/MessageBox/AdministratorsMessagetoStaff.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label27" runat="server" Text="Send Message to Staff"></asp:Label>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:RoleGroup>
        <asp:RoleGroup Roles="Coordinator">
            <ContentTemplate>
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew" runat="server" ImageUrl="~/MessageBox/Images/replay.png"
                                NavigateUrl="~/MessageBox/CoordinatorsMessagetoStudents.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label25" runat="server" Text="Send Message to Students"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew0" runat="server" ImageUrl="~/MessageBox/Images/replay.png"
                                NavigateUrl="~/MessageBox/CoordinatorsMessagetoParents.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label26" runat="server" Text="Send Message to Parents"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew1" runat="server" ImageUrl="~/MessageBox/Images/replay.png"
                                NavigateUrl="~/MessageBox/CoordinatorsMessagetoStaff.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label27" runat="server" Text="Send Message to Staff"></asp:Label>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:RoleGroup>
        <asp:RoleGroup Roles="Secretary">
            <ContentTemplate>
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew" runat="server" ImageUrl="~/MessageBox/Images/replay.png"
                                NavigateUrl="~/MessageBox/SecretaryMessagetoStudents.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label25" runat="server" Text="Send Message to Students"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew0" runat="server" ImageUrl="~/MessageBox/Images/replay.png"
                                NavigateUrl="~/MessageBox/SecretaryMessagetoParents.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label26" runat="server" Text="Send Message to Parents"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew1" runat="server" ImageUrl="~/MessageBox/Images/replay.png"
                                NavigateUrl="~/MessageBox/SecretaryMessagetoStaff.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label27" runat="server" Text="Send Message to Staff"></asp:Label>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:RoleGroup>
        <asp:RoleGroup Roles="Staff">
            <ContentTemplate>
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew" runat="server" ImageUrl="~/MessageBox/Images/replay.png"
                                NavigateUrl="~/MessageBox/StaffMessagetoStudents.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label25" runat="server" Text="Send Message to Students"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew0" runat="server" ImageUrl="~/MessageBox/Images/replay.png"
                                NavigateUrl="~/MessageBox/StaffMessagetoParents.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label26" runat="server" Text="Send Message to Parents"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew1" runat="server" ImageUrl="~/MessageBox/Images/replay.png"
                                NavigateUrl="~/MessageBox/StaffMessagetoStaff.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label27" runat="server" Text="Send Message to Staff"></asp:Label>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:RoleGroup>
        <asp:RoleGroup Roles="StaffSD">
            <ContentTemplate>
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew" runat="server" ImageUrl="~/MessageBox/Images/replay.png"
                                NavigateUrl="~/MessageBox/StaffMessagetoStudents.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label25" runat="server" Text="Send Message to Students"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew0" runat="server" ImageUrl="~/MessageBox/Images/replay.png"
                                NavigateUrl="~/MessageBox/StaffMessagetoParents.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label26" runat="server" Text="Send Message to Parents"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew1" runat="server" ImageUrl="~/MessageBox/Images/replay.png"
                                NavigateUrl="~/MessageBox/StaffMessagetoStaff.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label27" runat="server" Text="Send Message to Staff"></asp:Label>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:RoleGroup>
        <asp:RoleGroup Roles="Student">
            <ContentTemplate>
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew" runat="server" ImageUrl="~/MessageBox/Images/replay.png"
                                NavigateUrl="~/MessageBox/StudentsMessagetoStudents.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label25" runat="server" Text="Send Message to Students"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew1" runat="server" ImageUrl="~/MessageBox/Images/replay.png"
                                NavigateUrl="~/MessageBox/StudentsMessagetoStaff.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label27" runat="server" Text="Send Message to Teachers"></asp:Label>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:RoleGroup>
        <asp:RoleGroup Roles="StudentSD">
            <ContentTemplate>
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew" runat="server" ImageUrl="~/MessageBox/Images/replay.png"
                                NavigateUrl="~/MessageBox/StudentsMessagetoStudents.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label25" runat="server" Text="Send Message to Students"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew1" runat="server" ImageUrl="~/MessageBox/Images/replay.png"
                                NavigateUrl="~/MessageBox/StudentsMessagetoStaff.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label27" runat="server" Text="Send Message to Teachers"></asp:Label>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:RoleGroup>
    </RoleGroups>
</asp:LoginView>
