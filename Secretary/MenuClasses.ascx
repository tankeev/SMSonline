<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MenuClasses.ascx.vb"
    Inherits="Secretary_MenuClasses" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<table class="content-table" width="240">
    <tr>
        <td width="60" height="50">
            <asp:HyperLink ID="HyperLinkClassesStudents" runat="server" ImageUrl="~/Secretary/Images/menu_mpe_students.png"
                NavigateUrl="~/Secretary/ClassesStudents.aspx"></asp:HyperLink>
        </td>
        <td width="60">
            <asp:HyperLink ID="HyperLinkClassesAdvisors" runat="server" ImageUrl="~/Secretary/Images/menu_assessments_teachers.png"
                NavigateUrl="~/Secretary/ClassesAdvisors.aspx"></asp:HyperLink>
        </td>
        <td width="60">
        </td>
        <td width="60">
        </td>
    </tr>
</table>
<asp:HoverMenuExtender ID="HLCA_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoClassesAdvisors" PopupPosition="Right" TargetControlID="HyperLinkClassesAdvisors">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLCS_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoClassesStudents" PopupPosition="Right" TargetControlID="HyperLinkClassesStudents">
</asp:HoverMenuExtender>
<div id="divPanels">
    <asp:Panel ID="PanelInfoClassesAdvisors" runat="server" CssClass="MenuToolTip" Style="display: none;"
        Width="230">
        <asp:Label ID="Label1" runat="server" Text="Classes & Advisors" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label131" runat="server" Text="Click here to see Advisors"></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoClassesStudents" runat="server" CssClass="MenuToolTip" Style="display: none;"
        Width="230">
        <asp:Label ID="Label2" runat="server" Text="Classes & Students" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Click here to see Classes & Students."></asp:Label>
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
</div>
