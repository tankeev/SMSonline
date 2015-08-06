<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MenuAssessments.ascx.vb"
    Inherits="Coordinators_MenuCoordinators" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<table class="content-table" width="240">
    <tr>
        <td width="60">
            <asp:HyperLink ID="HyperLinkAssessmentsChecklist" runat="server" ImageUrl="~/StaffSD/Images/menu_assessments_checklist.png"
                NavigateUrl="~/StaffSD/AssessmentsChecklist.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkAssessmentsStudentMarks" runat="server" ImageUrl="~/StaffSD/Images/menu_assessments_marks.png"
                NavigateUrl="~/StaffSD/AssessmentsStudentMarks.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkAssessmentsByCourses" runat="server" ImageUrl="~/StaffSD/Images/menu_assessments_courses.png"
                NavigateUrl="~/StaffSD/AssessmentsByCourses.aspx"></asp:HyperLink>
        </td>
        <td height="50" width="60">
            <asp:HyperLink ID="HyperLinkAssessmentsByStudents" runat="server" ImageUrl="~/StaffSD/Images/menu_assessments_students.png"
                NavigateUrl="~/StaffSD/AssessmentsByStudents.aspx"></asp:HyperLink>
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
<asp:HoverMenuExtender ID="HLABST_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoAssessmentsStudentMarks" PopupPosition="Right" TargetControlID="HyperLinkAssessmentsStudentMarks">
</asp:HoverMenuExtender>
<div id="divPanels">
    <asp:Panel ID="PanelInfoAssessmentsByStudents" runat="server" CssClass="MenuToolTip"
        Style="display: none;" Width="240">
        <asp:Label ID="Label1" runat="server" Text="Assessments By Students" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label131" runat="server" Text="Click here to see Assessments Grouped By Students"></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoAssessmentsByCourses" runat="server" CssClass="MenuToolTip"
        Style="display: none;" Width="240">
        <asp:Label ID="Label2" runat="server" Text="Assessments By Courses" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Click here to see Assessments Grouped By Courses."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoAssessmentsChecklist" runat="server" CssClass="MenuToolTip"
        Style="display: none;" Width="240">
        <asp:Label ID="Label4" runat="server" Text="Assessments Checklist" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Click here to see Assessments Checklist."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoAssessmentsStudentMarks" runat="server" CssClass="MenuToolTip"
        Style="display: none;" Width="240">
        <asp:Label ID="Label9" runat="server" Text="Assessment Marks" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label10" runat="server" Text="Click here to update Assessment Marks."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
</div>
