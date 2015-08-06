<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MenuAssessments.ascx.vb"
    Inherits="Coordinators_MenuCoordinators" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<table class="content-table" width="240">
    <tr>
        <td height="50" width="60">
            <asp:HyperLink ID="HyperLinkAssessmentsByStudents" runat="server" ImageUrl="~/CoordinatorsSD/Images/menu_assessments_students.png"
                NavigateUrl="~/CoordinatorsSD/AssessmentsByStudents.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkAssessmentsByCourses" runat="server" ImageUrl="~/CoordinatorsSD/Images/menu_assessments_courses.png"
                NavigateUrl="~/CoordinatorsSD/AssessmentsByCourses.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkAssessmentsTeachers" runat="server" ImageUrl="~/CoordinatorsSD/Images/menu_assessments_teachers.png"
                NavigateUrl="~/CoordinatorsSD/AssessmentsByTeachers.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkAssessmentsTypes" runat="server" ImageUrl="~/CoordinatorsSD/Images/menu_assessments_types.png"
                NavigateUrl="~/CoordinatorsSD/AssessmentsBySchoolTypes.aspx"></asp:HyperLink>
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
    PopupControlID="PanelInfoAssessmentsTeachers" PopupPosition="Right" TargetControlID="HyperLinkAssessmentsTeachers">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLABST_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoAssessmentsTypes" PopupPosition="Right" TargetControlID="HyperLinkAssessmentsTypes">
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
    <asp:Panel ID="PanelInfoAssessmentsTeachers" runat="server" CssClass="MenuToolTip"
        Style="display: none;" Width="240">
        <asp:Label ID="Label4" runat="server" Text="Assessments Teachers" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Click here to see Assessments Grouped By Teachers."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoAssessmentsTypes" runat="server" CssClass="MenuToolTip" Style="display: none;"
        Width="240">
        <asp:Label ID="Label9" runat="server" Text="Assessment Types" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label10" runat="server" Text="Click here to update Assessment Types."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
</div>
