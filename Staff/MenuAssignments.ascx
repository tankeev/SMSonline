<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MenuAssignments.ascx.vb"
    Inherits="Staff_MenuAssignments" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<table class="content-table" width="240">
    <tr>
        <td height="50" width="60">
            <asp:HyperLink ID="HyperLinkAssignmentsChecklist" runat="server" ImageUrl="~/Staff/Images/menu_assignments_checklist.png"
                NavigateUrl="~/Staff/AssignmentsChecklist.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkAssignmentsArchive" runat="server" ImageUrl="~/Staff/Images/menu_assignments_archive.png"
                NavigateUrl="~/Staff/AssignmentsArchive.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            &nbsp;
        </td>
        <td width="60">
            &nbsp;
        </td>
    </tr>
</table>
<asp:HoverMenuExtender ID="HLAC_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoAssignmentsChecklist" PopupPosition="Right" TargetControlID="HyperLinkAssignmentsChecklist">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLAA_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoAssignmentsArchive" PopupPosition="Right" TargetControlID="HyperLinkAssignmentsArchive">
</asp:HoverMenuExtender>
<div id="divPanels">
    <asp:Panel ID="PanelInfoAssignmentsChecklist" runat="server" CssClass="MenuToolTip"
        Style="display: none;" Width="230">
        <asp:Label ID="Label1" runat="server" Text="Assignment Checklist" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label131" runat="server" Text="Click here to see your Assignments."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoAssignmentsArchive" runat="server" CssClass="MenuToolTip"
        Style="display: none;" Width="230">
        <asp:Label ID="Label2" runat="server" Text="Assignment Archive" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Click here to see Student Responses to your Assignments."></asp:Label>
        <br />
        <asp:Label ID="Label10" runat="server" Text="You can assign students to your Assignments."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
</div>
