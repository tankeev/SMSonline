<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MenuClasses.ascx.vb"
    Inherits="Coordinators_MenuCoordinators" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<table class="content-table" width="240">
    <tr>
        <td width="60">
            <asp:HyperLink ID="HyperLinkClassesStudents" runat="server" ImageUrl="~/CoordinatorsSD/Images/menu_mpe_students.png"
                NavigateUrl="~/CoordinatorsSD/ClassesStudents.aspx"></asp:HyperLink>
        </td>
        <td height="50" width="60">
            <asp:HyperLink ID="HyperLinkClassesAdvisors" runat="server" ImageUrl="~/CoordinatorsSD/Images/menu_assessments_teachers.png"
                NavigateUrl="~/CoordinatorsSD/ClassesAdvisors.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkRegisteredStudents" runat="server" ImageUrl="~/CoordinatorsSD/Images/menu_attendance_archive.png"
                NavigateUrl="~/CoordinatorsSD/ClassesRegistration.aspx" ToolTip="Registered Students"></asp:HyperLink>
        </td>
        <td width="60">
            &nbsp;
        </td>
    </tr>
</table>
<asp:HoverMenuExtender ID="HLCA_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoClassesAdvisors" PopupPosition="Right" TargetControlID="HyperLinkClassesAdvisors">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLCS_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoClassesStudents" PopupPosition="Right" TargetControlID="HyperLinkClassesStudents">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLRS_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoRegisteredStudents" PopupPosition="Right" TargetControlID="HyperLinkRegisteredStudents">
</asp:HoverMenuExtender>
<div id="divPanels">
    <asp:Panel ID="PanelInfoClassesAdvisors" runat="server" CssClass="MenuToolTip" Style="display: none;"
        Width="240">
        <asp:Label ID="Label1" runat="server" Text="Classes & Advisors" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label131" runat="server" Text="Click here to see Advisors"></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoClassesStudents" runat="server" CssClass="MenuToolTip" Style="display: none;"
        Width="240">
        <asp:Label ID="Label2" runat="server" Text="Classes & Students" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Click here to see Classes & Students."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoRegisteredStudents" runat="server" CssClass="MenuToolTip"
        Style="display: none;" Width="240">
        <asp:Label ID="Label4" runat="server" Text="Registered Students" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Click here to see Registered Students."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
</div>
