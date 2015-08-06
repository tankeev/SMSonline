<%@ Control Language="VB" AutoEventWireup="false" CodeFile="WebMessageBox.ascx.vb"
    Inherits="Staff_WebMessageBox" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:ModalPopupExtender ID="ModalPopupExtenderMessageBox" runat="server" TargetControlID="btnShow"
    PopupControlID="PanelWebMessageBox" BackgroundCssClass="modalBackground" DropShadow="true"
    CancelControlID="btnClose">
</asp:ModalPopupExtender>
<asp:Panel ID="PanelWebMessageBox" runat="server" Width="500px" Style="background-color: White;
    border-width: 2px; border-color: gray; font-size: 10pt; font-family: Tahoma;
    line-height: 15px; border: 1px solid #A6A6A6; display: none;">
    <asp:Panel ID="PanelHeader" runat="server" Width="100%" Style="font-weight: bold;"
        BackColor="Red">
        <table width="100%">
            <tr>
                <td align="center" height="35" width="10">
                </td>
                <td>
                    <asp:Label ID="LabelHeader" runat="server" ForeColor="White"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="PanelBody" runat="server" Width="100%">
        <table width="100%">
            <tr>
                <td align="center" height="50" width="50">
                    <asp:Image ID="ImageMessage" runat="server" />
                </td>
                <td>
                    <asp:Label ID="LabelMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                </td>
                <td width="75">
                    
                </td>
            </tr>
            <tr>
                <td height="30">
                    
                </td>
                <td>
                    
                </td>
                <td>
                    <asp:Button ID="btnClose" runat="server" CausesValidation="False" Text="Close" Width="60px" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Panel>
