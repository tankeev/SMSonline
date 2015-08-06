<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MenuMPExams.ascx.vb"
    Inherits="Staff_MenuMPExams" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<table class="content-table" width="240">
    <tr>
        <td height="50" width="60">
            <asp:HyperLink ID="HyperLinkMPEResultsByCourses" runat="server" ImageUrl="~/Staff/Images/menu_mpe_courses.png"
                NavigateUrl="~/Staff/MPEResultsByCourses.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkMPEResultsByScores" runat="server" ImageUrl="~/Staff/Images/menu_mpe_scores.png"
                NavigateUrl="~/Staff/MPEResultsByScores.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkMPERankingByStudents" runat="server" ImageUrl="~/Staff/Images/menu_attendance_reports.png"
                NavigateUrl="~/Staff/MPEResultsByRanking.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkMPEResultsUpload" runat="server" ImageUrl="~/Staff/Images/menu_mpe_upload.png"
                NavigateUrl="~/Staff/MPEResultsEvaluation.aspx"></asp:HyperLink>
        </td>
    </tr>
</table>
<asp:HoverMenuExtender ID="HLRBC_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoResultsByCourses" PopupPosition="Right" TargetControlID="HyperLinkMPEResultsByCourses">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLRBS_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoResultsByScores" PopupPosition="Right" TargetControlID="HyperLinkMPEResultsByScores">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLBYST_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoRankingByStudents" PopupPosition="Right" TargetControlID="HyperLinkMPERankingByStudents">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLRUP_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoResultsUpload" PopupPosition="Right" TargetControlID="HyperLinkMPEResultsUpload">
</asp:HoverMenuExtender>
<div id="divPanels">
    <asp:Panel ID="PanelInfoResultsByCourses" runat="server" CssClass="MenuToolTip" Style="display: none;"
        Width="230">
        <asp:Label ID="Label1" runat="server" Text="MP Exam Results By Course" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label131" runat="server" Text="Click here to see MP Exam Results grouped by Courses."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoResultsByScores" runat="server" CssClass="MenuToolTip" Style="display: none;"
        Width="230">
        <asp:Label ID="Label2" runat="server" Text="MP Exam Results By Scores" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Click here to see MP Exam Results grouped by Scores."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoRankingByStudents" runat="server" CssClass="MenuToolTip"
        Style="display: none;" Width="230">
        <asp:Label ID="Label4" runat="server" Text="MP Exam Results & Rankings" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Click here to see Student Rankings."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoResultsUpload" runat="server" CssClass="MenuToolTip" Style="display: none;"
        Width="230">
        <asp:Label ID="Label9" runat="server" Text="MP Exam Results Upload" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label10" runat="server" Text="Click here to upload MP Exam Results."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
</div>
