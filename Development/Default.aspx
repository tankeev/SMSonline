<%@ Page Title="SIS Teacher Development" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="NewUserAccount" %>

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
                                NavigateUrl="~/Development/TrainerSubjectUnitTests.aspx">Add New</asp:HyperLink>
                        </td>
                        <td class="style2">
                            <asp:Label ID="Label3" runat="server" Text="Subject Unit Tests"></asp:Label>
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
                <table width="100%">
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label24" runat="server" Font-Bold="True" Text="Mitra Pasiad Teacher Trainee Programme"></asp:Label>
                        </td>
                        <td rowspan="2" valign="top" width="350">
                            <asp:Image ID="ImageGraduation" runat="server" BorderStyle="Solid" BorderWidth="1px"
                                ImageUrl="~/Development/Images/graduation.jpg" />
                        </td>
                    </tr>
                    <tr>
                        <td height="320" valign="top">
                            <asp:Label ID="Label25" runat="server" Text="The Mitra Pasiad Graduate Teacher Trainee programme is a teacher training and development programme aimed at young graduates or university senior students who are passionate about the teaching profession."></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Label26" runat="server" Font-Bold="True" Text="The Programme Objectives Include:"></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Label71" runat="server" Text="To institute professionalism in teaching by providing the required training for new entrants into the field."></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Label51" runat="server" Text="To equip trainable young entrants into the profession with the latest developments and best practice for effective teaching and learning."></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Label61" runat="server" Text="To attract into the teaching profession dynamic individuals who will acquire workplace and professional values to impact children and the nation."></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Label81" runat="server" Text="To create an exceptional pool of teachers."></asp:Label>
                            <br />
                        </td>
                    </tr>
                </table>
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
