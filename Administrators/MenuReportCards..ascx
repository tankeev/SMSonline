<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MenuReportCards..ascx.vb"
    Inherits="Administrators_MenuAdministrators" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<table class="content-table" width="240">
    </tr >
    <tr>
        <td width="60">
            <asp:HyperLink ID="HyperLinkReportCards" runat="server" ImageUrl="~/Administrators/Images/printer.png"
                NavigateUrl="~/Administrators/ReportCardsSettings.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkStudySkills" runat="server" ImageUrl="~/Administrators/Images/menu_comments.png"
                NavigateUrl="~/Administrators/ReportCardsSkillsComments.aspx"></asp:HyperLink>
        </td>
        <td width="60" height="50">
            <asp:HyperLink ID="HyperLinkReportAverages" runat="server" ImageUrl="~/Administrators/Images/menu_attendance_reports.png"
                NavigateUrl="~/Administrators/ReportCardsReportAverages.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkCourseAverages" runat="server" ImageUrl="~/Administrators/Images/menu_report_card.png"
                NavigateUrl="~/Administrators/ReportCardsCourseAverages.aspx"></asp:HyperLink>
        </td>
    </tr>
</table>
<asp:HoverMenuExtender ID="HLRA_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoReportAverages" PopupPosition="Right" TargetControlID="HyperLinkReportAverages">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLRC_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoReportCards" PopupPosition="Right" TargetControlID="HyperLinkReportCards">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLCA_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoCourseAverages" PopupPosition="Right" TargetControlID="HyperLinkCourseAverages">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLSS_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoStudySkills" PopupPosition="Right" TargetControlID="HyperLinkStudySkills">
</asp:HoverMenuExtender>
<div id="divPanels">
    <asp:Panel ID="PanelInfoReportCards" runat="server" CssClass="MenuToolTip" Style="display: none;"
        Width="230">
        <asp:Label ID="Label2" runat="server" Text="Report Cards" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label131" runat="server" Text="Click here to see Report Cards."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoReportAverages" runat="server" Width="230" CssClass="MenuToolTip"
        Style="display: none;">
        <asp:Label ID="Label1" runat="server" Text="Student Report Averages" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label7" runat="server" Text="Click here to see Student Report Averages."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoCourseAverages" runat="server" Width="230" CssClass="MenuToolTip"
        Style="display: none;">
        <asp:Label ID="Label3" runat="server" Text="Student Course Averages" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Click here to see Student Course Averages."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoStudySkills" runat="server" Width="230" CssClass="MenuToolTip"
        Style="display: none;">
        <asp:Label ID="Label5" runat="server" Text="Study Skills & Comments" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="Click here to see Study Skills & Comments."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
</div>
