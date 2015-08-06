<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MenuDiscipline.ascx.vb"
    Inherits="Discipline_MenuDiscipline" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<table class="content-table" width="240">
    </tr>
    <tr>
        <td height="50" width="50">
            <asp:HyperLink ID="HyperLinkDisciplineChecklist" runat="server" ImageUrl="~/Discipline/Images/menu_discipline_checklist.png"
                NavigateUrl="~/Discipline/DisciplineChecklist.aspx" ToolTip="Discipline Checklist"></asp:HyperLink>
        </td>
        <td width="50">
            <asp:HyperLink ID="HyperLinkBehaviorPoints" runat="server" ImageUrl="~/Discipline/Images/menu_average_calculation.png"
                NavigateUrl="~/Discipline/DisciplineStudentPoints.aspx" ToolTip="Behavior Points"></asp:HyperLink>
        </td>
        <td width="50">
            <asp:HyperLink ID="HyperLinkAddBonusPoints" runat="server" ImageUrl="~/Discipline/Images/menu_discipline_bonus.png"
                NavigateUrl="~/Discipline/DisciplineAddBonusPoints.aspx" ToolTip="Add Bonus Points"></asp:HyperLink>
        </td>
        <td>
            <asp:HyperLink ID="HyperLinkAddOffensePoints" runat="server" ImageUrl="~/Discipline/Images/menu_discipline_offense.png"
                NavigateUrl="~/Discipline/DisciplineAddDisciplinePoints.aspx" ToolTip="Add Offense Points"></asp:HyperLink>
        </td>
    </tr>
</table>
<asp:HoverMenuExtender ID="HLDC_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoDisciplineChecklist" PopupPosition="Right" TargetControlID="HyperLinkDisciplineChecklist">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLBP_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoBehaviorPoints" PopupPosition="Right" TargetControlID="HyperLinkBehaviorPoints">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLABP_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoAddBonusPoints" PopupPosition="Right" TargetControlID="HyperLinkAddBonusPoints">
</asp:HoverMenuExtender>
<asp:HoverMenuExtender ID="HLAOP_HME" runat="server" OffsetX="0" OffsetY="0" PopDelay="50"
    PopupControlID="PanelInfoAddOffensePoints" PopupPosition="Right" TargetControlID="HyperLinkAddOffensePoints">
</asp:HoverMenuExtender>
<div id="divPanels">
    <asp:Panel ID="PanelInfoDisciplineChecklist" runat="server" CssClass="MenuToolTip"
        Style="display: none;" Width="230">
        <asp:Label ID="Label1" runat="server" Text="Discipline Checklist" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label131" runat="server" Text="Click here to see Discipline Checklist."></asp:Label>
        <br />
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoBehaviorPoints" runat="server" CssClass="MenuToolTip" Style="display: none;"
        Width="230">
        <asp:Label ID="Label2" runat="server" Text="Student Behavior Points" ForeColor="Red"
            Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Click here to see Student Behavior Points."></asp:Label>
        <br />
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoAddBonusPoints" runat="server" CssClass="MenuToolTip" Style="display: none;"
        Width="230">
        <asp:Label ID="Label4" runat="server" Text="Add Bonus Points" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Click here to Add Bonus Points."></asp:Label>
        <br />
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
    <asp:Panel ID="PanelInfoAddOffensePoints" runat="server" CssClass="MenuToolTip" Style="display: none;"
        Width="230">
        <asp:Label ID="Label9" runat="server" Text="Add Offense Points" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label10" runat="server" Text="Click here to Add Offense Points"></asp:Label>
        <br />
        <img class="callout" src="images/callout.gif" />
    </asp:Panel>
</div>
