<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MenuAttendance.ascx.vb"
    Inherits="Staff_MenuAttendance" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<table class="content-table" width="240">
    </tr >
    <tr>
        <td width="60" height="50" align="center">
            <asp:HyperLink ID="HyperLinkAttendanceChecklist" runat="server" ImageUrl="~/Staff/Images/menu_attendance_checklist.png"
                NavigateUrl="~/Staff/AttendanceChecklist.aspx"></asp:HyperLink>
        </td>
        <td width="60" align="center">
            <asp:HyperLink ID="HyperLinkAttendanceArchive" runat="server" ImageUrl="~/Staff/Images/menu_attendance_archive.png"
                NavigateUrl="~/Staff/AttendanceArchive.aspx"></asp:HyperLink>
        </td>
        <td width="60" align="center">
            <asp:HyperLink ID="HyperLinkAttendanceReports" runat="server" ImageUrl="~/Staff/Images/menu_attendance_reports.png"
                NavigateUrl="~/Staff/AttendanceReports.aspx"></asp:HyperLink>
        </td>
        <td align="center" width="60">
            <asp:HyperLink ID="HyperLinkAttendanceJournals" runat="server" ImageUrl="~/Staff/Images/menu_attendance_journal.png"
                NavigateUrl="~/Staff/AttendanceJournals.aspx"></asp:HyperLink>
        </td>
    </tr>
</table>
<asp:HoverMenuExtender ID="HLAC_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoAttendanceChecklist" PopupPosition="Right" TargetControlID="HyperLinkAttendanceChecklist">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLAA_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoAttendanceArchive" PopupPosition="Right" TargetControlID="HyperLinkAttendanceArchive">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLAR_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoAttendanceReports" PopupPosition="Right" TargetControlID="HyperLinkAttendanceReports">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLAJ_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoAttendanceJournals" PopupPosition="Right" TargetControlID="HyperLinkAttendanceJournals">
</asp:HoverMenuExtender>
<div id="divPanels">
    <asp:Panel ID="PanelInfoAttendanceChecklist" runat="server" CssClass="MenuToolTip"
        Style="display: none;" Width="230">
        <asp:Label ID="Label2" runat="server" Text="Attendance Checklist" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label131" runat="server" Text="Click here to add Attendance Records."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoAttendanceArchive" runat="server" Width="230" CssClass="MenuToolTip"
        Style="display: none;">
        <asp:Label ID="Label3" runat="server" Text="Attendance Archive" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Click here to update Attendance Records."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoAttendanceJournals" runat="server" Width="230" CssClass="MenuToolTip"
        Style="display: none;">
        <asp:Label ID="Label5" runat="server" Text="Attendance Journals" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="Click here to see Class Journals."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoAttendanceReports" runat="server" CssClass="MenuToolTip"
        Style="display: none;" Width="230">
        <asp:Label ID="Label7" runat="server" Text="Attendance Reports" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label8" runat="server" Text="Click here to see Attendance Reports."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
</div>
