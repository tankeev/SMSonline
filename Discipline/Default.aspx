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
                                NavigateUrl="~/Discipline/DisciplineAddBonusPoints.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Add Bonus Card"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkSettings" runat="server" ImageUrl="~/Clubs/Images/editor.png"
                                NavigateUrl="~/Discipline/DisciplineAddDisciplinePoints.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="Add Offense Card"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkStudents" runat="server" ImageUrl="~/Clubs/Images/editor.png"
                                NavigateUrl="~/Discipline/DisciplineChecklist.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Discipline Checklist"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkEvaluation" runat="server" ImageUrl="~/Clubs/Images/editor.png"
                                NavigateUrl="~/Discipline/DisciplineStudentPoints.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Discipline Student Points"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkDisciplineTypes" runat="server" 
                                ImageUrl="~/Clubs/Images/editor.png" 
                                NavigateUrl="~/Discipline/DisciplineTypes.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label11" runat="server" Text="Edit Discipline Types"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    DISCIPLINE</h2>
                <br />
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Discipline/Images/discipline.jpg"
                    Width="650px" />
                <br />
                <table style="border: 1px solid #FF6600; background-color: #F3E584" width="650">
                    <tr>
                        <td height="28" width="80">
                            <asp:HyperLink ID="HyperLink1" runat="server" 
                                NavigateUrl="~/Discipline/DisciplineAddBonusPoints.aspx">Click Here</asp:HyperLink>
                        </td>
                        <td width="180">
                            <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="Bonus Card Settings"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label10" runat="server" Text="Add / Edit Clubs  and Activities in your school."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:HyperLink ID="HyperLink2" runat="server" 
                                NavigateUrl="~/Discipline/DisciplineAddDisciplinePoints.aspx">Click Here</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="Offense Card Settings"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Add / Edit Student in Clubs  and Activities in your school."></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
