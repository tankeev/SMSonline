<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MenuClasses.ascx.vb"
    Inherits="Coordinators_MenuCoordinators" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<table class="content-table" width="240">
    <tr>
        <td height="50" width="60">
            <asp:HyperLink ID="HyperLinkClassesAdvisors" runat="server" ImageUrl="~/Coordinators/Images/menu_assessments_teachers.png"
                NavigateUrl="~/Coordinators/ClassesAdvisors.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkClassesRegistration" runat="server" ImageUrl="~/Coordinators/Images/menu_attendance_archive.png"
                NavigateUrl="~/Coordinators/ClassesRegistration.aspx" ToolTip="Registered Students"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkClassesStudents" runat="server" ImageUrl="~/Coordinators/Images/menu_mpe_students.png"
                NavigateUrl="~/Coordinators/ClassesStudents.aspx"></asp:HyperLink>
        </td>
        <td width="60">
        </td>
    </tr>
</table>
<asp:HoverMenuExtender ID="HLCS_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoClassesStudents" PopupPosition="Right" TargetControlID="HyperLinkClassesStudents">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLCA_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoClassesRegistration" PopupPosition="Right" TargetControlID="HyperLinkClassesRegistration">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLRS_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoClassesAdvisors" PopupPosition="Right" TargetControlID="HyperLinkClassesAdvisors">
</asp:HoverMenuExtender>
<asp:Panel ID="PanelInfoClassesStudents" runat="server" CssClass="MenuToolTip" Style="display: none;"
    Width="230">
    <asp:Label ID="Label2" runat="server" Text="Classes & Students" ForeColor="Red" Font-Bold="True"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Click here to see Classes & Students."></asp:Label>
    <img class="callout" src="images/callout.gif" />
</asp:Panel>
<asp:Panel ID="PanelInfoClassesRegistration" runat="server" CssClass="MenuToolTip"
    Style="display: none;" Width="230">
    <asp:Label ID="Label6" runat="server" Text="Student Registration" ForeColor="Red"
        Font-Bold="True"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label7" runat="server" Text="Click here to see Student Registration."></asp:Label>
    <img class="callout" src="images/callout.gif" />
</asp:Panel>
<asp:Panel ID="PanelInfoClassesAdvisors" runat="server" CssClass="MenuToolTip" Style="display: none;"
    Width="230">
    <asp:Label ID="Label1" runat="server" Text="Class Advisors" ForeColor="Red" Font-Bold="True"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label131" runat="server" Text="Click here to see Class Advisors"></asp:Label>
    <img class="callout" src="images/callout.gif" />
</asp:Panel>
