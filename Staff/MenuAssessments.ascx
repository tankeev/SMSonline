<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MenuAssessments.ascx.vb"
    Inherits="Staff_MenuAssessments" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<table class="content-table" width="240">
    <tr>
        <td width="60">
            <asp:HyperLink ID="HyperLinkAssessmentsChecklist" runat="server" ImageUrl="~/Staff/Images/menu_assessments_checklist.png"
                NavigateUrl="~/Staff/AssessmentsChecklist.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkAssessmentsByCourses" runat="server" ImageUrl="~/Staff/Images/menu_assessments_courses.png"
                NavigateUrl="~/Staff/AssessmentsByCourses.aspx"></asp:HyperLink>
        </td>
        <td height="50" width="60">
            <asp:HyperLink ID="HyperLinkAssessmentsByStudents" runat="server" ImageUrl="~/Staff/Images/menu_assessments_students.png"
                NavigateUrl="~/Staff/AssessmentsByStudents.aspx"></asp:HyperLink>
        </td>
        <td width="60">
        </td>
    </tr>
</table>
<asp:HoverMenuExtender ID="HLABS_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoAssessmentsByStudents" PopupPosition="Right" TargetControlID="HyperLinkAssessmentsByStudents">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLABC_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoAssessmentsByCourses" PopupPosition="Right" TargetControlID="HyperLinkAssessmentsByCourses">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLABT_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoAssessmentsChecklist" PopupPosition="Right" TargetControlID="HyperLinkAssessmentsChecklist">
</asp:HoverMenuExtender>
<asp:Panel ID="PanelInfoAssessmentsByStudents" runat="server" CssClass="MenuToolTip"
    Style="display: none;" Width="230">
    <asp:Label ID="Label1" runat="server" Text="Assessments By Students" ForeColor="Red"
        Font-Bold="True"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label131" runat="server" Text="Click here to see Assessments Grouped By Students"></asp:Label>
    <img class="callout" src="images/callout.gif" />
</asp:Panel>
<asp:Panel ID="PanelInfoAssessmentsByCourses" runat="server" CssClass="MenuToolTip"
    Style="display: none;" Width="230">
    <asp:Label ID="Label2" runat="server" Text="Assessments By Courses" ForeColor="Red"
        Font-Bold="True"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Click here to see Assessments Grouped By Courses."></asp:Label>
    <img class="callout" src="images/callout.gif" />
</asp:Panel>
<asp:Panel ID="PanelInfoAssessmentsChecklist" runat="server" CssClass="MenuToolTip"
    Style="display: none;" Width="230">
    <asp:Label ID="Label4" runat="server" Text="Assessments Checklist" ForeColor="Red"
        Font-Bold="True"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label5" runat="server" Text="Click here to see Assessments Checklist."></asp:Label>
    <img class="callout" src="images/callout.gif" />
</asp:Panel>
