<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MenuRegistration.ascx.vb"
    Inherits="Secretary_MenuClasses" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<table class="content-table" width="240">
    <tr>
        <td width="60" height="50">
            <asp:HyperLink ID="HyperLinkRegister" runat="server" ImageUrl="~/Secretary/Images/menu_mpe_students.png"
                NavigateUrl="~/Secretary/RegistrationRegister.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkRegistered" runat="server" ImageUrl="~/Secretary/Images/menu_attendance_archive.png"
                NavigateUrl="~/Secretary/RegistrationRegistered.aspx"></asp:HyperLink>
        </td>
        <td width="60">
        </td>
        <td width="60">
        </td>
    </tr>
</table>
<asp:HoverMenuExtender ID="HLCS_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoRegister" PopupPosition="Right" TargetControlID="HyperLinkRegister">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLRS_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoRegistered" PopupPosition="Right" TargetControlID="HyperLinkRegistered">
</asp:HoverMenuExtender>
<div id="divPanels">
    <asp:Panel ID="PanelInfoRegister" runat="server" CssClass="MenuToolTip" Style="display: none;"
        Width="230">
        <asp:Label ID="Label2" runat="server" Text="Register New Student" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Click here to Register New Student."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoRegistered" runat="server" CssClass="MenuToolTip" Style="display: none;"
        Width="230">
        <asp:Label ID="Label4" runat="server" Text="Registered Students" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Click here to see Registered Students."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
</div>
