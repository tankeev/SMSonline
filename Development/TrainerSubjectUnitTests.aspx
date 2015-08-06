<%@ Page Title="SIS Subject Unit Tests" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="TrainerSubjectUnitTests.aspx.vb" Inherits="NewUserAccount" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    PROFESSIONAL</h2>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew" runat="server" ImageUrl="~/Development/Images/editor.png"
                                NavigateUrl="~/Development/TrainerAttendanceChecklist.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label23" runat="server" Text="Attendance Checklist"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Development/Images/editor.png"
                                NavigateUrl="~/Development/TrainerTrainerTeaching.aspx">Add New</asp:HyperLink>
                        </td>
                        <td class="style2">
                            <asp:Label ID="Label1" runat="server" Text="Trainer Teaching Sessions"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Development/Images/editor.png"
                                NavigateUrl="~/Development/TrainerMicroTeaching.aspx">Add New</asp:HyperLink>
                        </td>
                        <td class="style2">
                            <asp:Label ID="Label2" runat="server" Text="Micro Teaching Sessions"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/Development/Images/editor.png"
                                NavigateUrl="~/Development/TrainerSubjectUnitTests.aspx" Enabled="False">Add New</asp:HyperLink>
                        </td>
                        <td class="style2">
                            <asp:Label ID="Label3" runat="server" Text="Subject Unit Tests" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink4" runat="server" ImageUrl="~/Development/Images/editor.png"
                                NavigateUrl="~/Development/TrainerSubjectBooksEvaluation.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Subject Books Evaluation"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    DEVELOPMENT</h2>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
