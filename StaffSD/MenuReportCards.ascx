﻿<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MenuReportCards.ascx.vb"
    Inherits="Coordinators_MenuCoordinators" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<table class="content-table" width="240">
    <tr>
        <td width="60">
            <asp:HyperLink ID="HyperLinkComments" runat="server" ImageUrl="~/StaffSD/Images/menu_comments.png"
                NavigateUrl="~/StaffSD/ReportCardsComments.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkStudySkills" runat="server" ImageUrl="~/StaffSD/Images/menu_assessments_checklist.png"
                NavigateUrl="~/StaffSD/ReportCardsStudySkills.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkCourseAveragesMid" runat="server" ImageUrl="~/StaffSD/Images/menu_report_card.png"
                NavigateUrl="~/StaffSD/ReportCardsCourseAveragesMid.aspx"></asp:HyperLink>
        </td>
        <td width="60" height="50">
            <asp:HyperLink ID="HyperLinkCourseAveragesFin" runat="server" ImageUrl="~/StaffSD/Images/menu_report_card.png"
                NavigateUrl="~/StaffSD/ReportCardsCourseAveragesFin.aspx"></asp:HyperLink>
        </td>
    </tr>
</table>
<asp:HoverMenuExtender ID="HLRA_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoComments" PopupPosition="Right" TargetControlID="HyperLinkComments">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLSS_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoStudySkills" PopupPosition="Right" TargetControlID="HyperLinkStudySkills">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLCAM_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoCourseAveragesMid" PopupPosition="Right" TargetControlID="HyperLinkCourseAveragesMid">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLCAF_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoCourseAveragesFin" PopupPosition="Right" TargetControlID="HyperLinkCourseAveragesFin">
</asp:HoverMenuExtender>
<div id="divPanels">
    <asp:Panel ID="PanelInfoComments" runat="server" Width="240" CssClass="MenuToolTip"
        Style="display: none;">
        <asp:Label ID="Label1" runat="server" Text="Report Comments" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label7" runat="server" Text="Click here to see Report Card Comments."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoStudySkills" runat="server" Width="240" CssClass="MenuToolTip"
        Style="display: none;">
        <asp:Label ID="Label5" runat="server" Text="Study Skills" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="Click here to see Report Card Study Skills."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoCourseAveragesMid" runat="server" Width="240" CssClass="MenuToolTip"
        Style="display: none;">
        <asp:Label ID="Label3" runat="server" Text="Mid-Term Course Averages" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Click here to see Mid-Term Course Averages."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoCourseAveragesFin" runat="server" Width="240" CssClass="MenuToolTip"
        Style="display: none;">
        <asp:Label ID="Label2" runat="server" Text="Final Course Averages" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label8" runat="server" Text="Click here to see Final Course Averages."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
</div>
