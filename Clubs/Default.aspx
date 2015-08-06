<%@ Page Title="SIS Clubs - Activities" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkHome" runat="server" ImageUrl="~/Clubs/Images/editor.png"
                                NavigateUrl="~/Clubs/Default.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Clubs &amp; Activities Home"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkSettings" runat="server" ImageUrl="~/Clubs/Images/editor.png"
                                NavigateUrl="~/Clubs/ClubsActivitiesSettings.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="Clubs &amp; Activities Settings"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkStudents" runat="server" ImageUrl="~/Clubs/Images/editor.png"
                                NavigateUrl="~/Clubs/ClubsActivitiesStudents.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Clubs &amp; Activities Students"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkEvaluation" runat="server" ImageUrl="~/Clubs/Images/editor.png"
                                NavigateUrl="~/Clubs/ClubsActivitiesEvaluation.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Clubs &amp; Activities Evaluation"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    CLUBS - AFTER SCHOOL ACTIVITIES</h2>
                <br />
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Clubs/Images/clubs_activities.jpg"
                    Width="650px" />
                <br />
                <table style="border: 1px solid #FF6600; background-color: #F3E584" width="650">
                    <tr>
                        <td height="28" width="80">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Clubs/ClubsActivitiesSettings.aspx">Click Here</asp:HyperLink>
                        </td>
                        <td width="180">
                            <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="Red" Text="Clubs - Activities Settings"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label10" runat="server" Text="Add / Edit Clubs  and Activities in your school."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Clubs/ClubsActivitiesStudents.aspx">Click Here</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Red" Text="Clubs - Activities Students"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Add / Edit Student in Clubs  and Activities in your school."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Clubs/ClubsActivitiesEvaluation.aspx">Click Here</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="Red" Text="Clubs - Activities Evaluation"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="Evaluation of Students in Clubs  and Activities in your school."></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
