<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MenuReportCards.ascx.vb"
    Inherits="Secretary_MenuReportCards" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<table class="content-table" width="240">
    <tr>
        <td width="60">
            <asp:HyperLink ID="HyperLinkReportCards" runat="server" ImageUrl="~/Secretary/Images/printer.png"
                NavigateUrl="~/Secretary/ReportCardsSettings.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkAverages" runat="server" ImageUrl="~/Secretary/Images/menu_attendance_reports.png"
                NavigateUrl="~/Secretary/ReportCardsReportAverages.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkRanking" runat="server" ImageUrl="~/Secretary/Images/menu_report_card.png"
                NavigateUrl="~/Secretary/ReportCardsRanking.aspx" ToolTip="Essay Evaluation"></asp:HyperLink>
        </td>
        <td width="60" height="50">
            &nbsp;
        </td>
    </tr>
</table>
<asp:HoverMenuExtender ID="HLRC_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoReportCards" PopupPosition="Right" TargetControlID="HyperLinkReportCards">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLRA_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoAverages" PopupPosition="Right" TargetControlID="HyperLinkAverages">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLR_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoRanking" PopupPosition="Right" TargetControlID="HyperLinkRanking">
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
    <asp:Panel ID="PanelInfoAverages" runat="server" Width="230" CssClass="MenuToolTip"
        Style="display: none;">
        <asp:Label ID="Label1" runat="server" Text="Student Report Averages" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label7" runat="server" Text="Click here to see Student Report Averages."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoRanking" runat="server" Width="230" CssClass="MenuToolTip"
        Style="display: none;">
        <asp:Label ID="Label5" runat="server" Text="Student Ranking" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="Click here to see Student Ranking."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
</div>
