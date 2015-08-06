﻿<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MenuUsers.ascx.vb" Inherits="Secretary_MenuUsers" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<table class="content-table" width="240">
    <tr>
        <td width="60" height="50">
            <asp:HyperLink ID="HyperLinkUsersSearch" runat="server" ImageUrl="~/Secretary/Images/menu_search.png"
                NavigateUrl="~/Secretary/UsersSearch.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkStudents" runat="server" ImageUrl="~/Secretary/Images/menu_students.png"
                NavigateUrl="~/Secretary/UsersStudents.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkParents" runat="server" ImageUrl="~/Secretary/Images/menu_parents.png"
                NavigateUrl="~/Secretary/UsersParents.aspx"></asp:HyperLink>
        </td>
        <td width="60">
        </td>
    </tr>
</table>
<br />
<table class="content-table" width="240">
    <tr>
        <td width="40">
            <asp:HyperLink ID="HyperLinkStudentsTable" runat="server" ImageUrl="~/Secretary/Images/menu_attendance_checklist.png"
                NavigateUrl="~/Secretary/UsersAccounts.aspx" ToolTip="User Accounts"></asp:HyperLink>
        </td>
        <td>
            <asp:Label ID="Labdel1" runat="server" Text="Manage User Accounts"></asp:Label>
        </td>
    </tr>
</table>
<asp:HoverMenuExtender ID="HLUS_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoUsersSearch" PopupPosition="Right" TargetControlID="HyperLinkUsersSearch">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLSU_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoStudents" PopupPosition="Right" TargetControlID="HyperLinkStudents">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLPA_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoParents" PopupPosition="Right" TargetControlID="HyperLinkParents">
</asp:HoverMenuExtender>
<div id="divPanels">
    <asp:Panel ID="PanelInfoUsersSearch" runat="server" CssClass="MenuToolTip" Style="display: none;"
        Width="230">
        <asp:Label ID="Label2" runat="server" Text="Search Users" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label131" runat="server" Text="Click here to Search a User."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoStudents" runat="server" Width="230" CssClass="MenuToolTip"
        Style="display: none;">
        <asp:Label ID="Label3" runat="server" Text="Student Details" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Click here to see Student Details."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoParents" runat="server" Width="230" CssClass="MenuToolTip"
        Style="display: none;">
        <asp:Label ID="Label5" runat="server" Text="Parent Details" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="Click here to see Parent Details."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
</div>