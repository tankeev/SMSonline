<%@ Page Title="SIS Department Homepage" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="NewUserAccount" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div id="right_wrap">
                <div id="right_content">
                    <h2>
                        DEVELOPMENT</h2>
                    <br />
                    <div id="divChild">
                        <table width="100%">
                            <tr>
                                <td height="30">
                                    <asp:Label ID="Label24" runat="server" Font-Bold="True" Text="Mitra Pasiad Department Pages"></asp:Label>
                                </td>
                                <td height="30" width="180">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <asp:Label ID="Label26" runat="server" Text="Mitra Pasiad Department Pages; the aim of this project is to identify teacher learning, the resources that are drawn upon and the departmental cultures that facilitate learning."
                                        Width="100%"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Image ID="ImageGraduation" runat="server" BorderStyle="Solid" BorderWidth="1px"
                                        ImageUrl="~/Department/Images/education.jpg" Width="100%" />
                                    <br />
                                    <asp:Label ID="Label25" runat="server" Text="To date this project has developed our understanding of teacher knowledge as being a co-constructed and distributed form of professional knowledge within subject departments. ."
                                        Width="100%"></asp:Label>
                                </td>
                                <td valign="top">
                                    
                                </td>
                            </tr>
                        </table>
                        <br />
                    </div>
                </div>
            </div>
            <div class="sidebar" id="sidebar">
                <h2>
                    PROFESSIONAL</h2>
                <br />
                <table class="SISTable" width="230">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew0" runat="server" ImageUrl="~/Department/Images/editor.png"
                                NavigateUrl="~/Department/DepartmentStaff.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Department Staff"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="SISTable" width="230">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                                NavigateUrl="~/Department/DepartmentForum.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Department Forum"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="SISTable" width="230">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                                NavigateUrl="~/Department/StaffAssignments.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Staff Assignments"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="SISTable" width="230">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                                NavigateUrl="~/Department/SharedDocuments.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Shared Documents"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="clear">
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
