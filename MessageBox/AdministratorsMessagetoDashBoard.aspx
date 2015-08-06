<%@ Page Title="SIS Send Message to Students" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="AdministratorsMessagetoDashBoard.aspx.vb" Inherits="SendMessagetoStudents" %>

<%@ Register Src="MenuMessageBox.ascx" TagName="MenuMessageBox" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    SEND MESSAGE</h2>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew" runat="server" ImageUrl="~/Administrators/Images/editor.png"
                                NavigateUrl="~/Administrators/SendMessagetoStudents.aspx">Add New</asp:HyperLink>
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
                            <asp:HyperLink ID="HyperLinkAddNew0" runat="server" ImageUrl="~/Administrators/Images/editor.png"
                                NavigateUrl="~/Administrators/SendMessagetoParents.aspx">Add New</asp:HyperLink>
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
                            <asp:HyperLink ID="HyperLinkAddNew1" runat="server" ImageUrl="~/Administrators/Images/editor.png"
                                NavigateUrl="~/Administrators/SendMessagetoStaff.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label27" runat="server" Text="Send Message to Staff"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew2" runat="server" Enabled="False" ImageUrl="~/Administrators/Images/editor.png"
                                NavigateUrl="~/Administrators/SendMessagetoDashBoard.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label30" runat="server" ForeColor="Red" Text="Send to DashBoard"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    MESSAGE</h2>
                <br />
                <div id="divChild">
                    <asp:Panel ID="PanelMessageBox" runat="server" Width="680px">
                        <table width="680">
                            <tr>
                                <td height="28">
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" 
                                        Text="Send Message to Dashboard:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="TextBoxMessage" runat="server" Width="650px" Font-Size="Small" Height="150px"
                                        Text='<%# Bind("Message") %>' TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Label ID="Label29" runat="server" Font-Bold="True" Text="Select School:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:DropDownList ID="DropDownListSchoolCodes" runat="server" AutoPostBack="True"
                                        DataSourceID="SqlDataSourceSchoolCodes" DataTextField="SchoolName" DataValueField="SchoolCode"
                                        Width="650px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Button ID="ButtonSendMessage" runat="server" Height="25px" OnClientClick="return confirm('You are about to send this message to All Selected Students, do you confirm?')"
                                        Text="Send Message" ValidationGroup="Message" Width="650px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="PanelAdded" runat="server" HorizontalAlign="Center" Visible="False"
                                        Width="100%">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Profile/Images/success-icon.png" />
                                        <br />
                                        <br />
                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Your Message Has Been Sent Successfully!"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="LabelCounter" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                        <br />
                                        <br />
                                    </asp:Panel>
                                    <asp:Panel ID="PanelWarning" runat="server" HorizontalAlign="Center" Visible="False"
                                        Width="100%">
                                        <br />
                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Profile/Images/Error.png" />
                                        <br />
                                        <br />
                                        <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" ForeColor="Red" Text="Sorry, An Error Occured!"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                        <br />
                                        <br />
                                        <br />
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                        <asp:ValidationSummary ID="ValidationSummary" runat="server" ShowMessageBox="True"
                            ValidationGroup="Message" />
                    </asp:Panel>
                    <br />
                    <asp:Label ID="LabelCheck" runat="server" Font-Bold="True"></asp:Label>
                    <br />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT SchoolCode, SchoolName, Show FROM tbl_Schools WHERE (Show = 1) ORDER BY SchoolName">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceDashBoard" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        InsertCommand="INSERT INTO tbl_DashBoard(SenderID, Message, Date) VALUES (@SenderID, @Message, @Date)"
                        SelectCommand="SELECT DasboardID, SenderID, Message, Date FROM tbl_DashBoard">
                        <InsertParameters>
                            <asp:SessionParameter Name="SenderID" SessionField="UserID" />
                            <asp:Parameter Name="Message" />
                            <asp:Parameter Name="Date" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
