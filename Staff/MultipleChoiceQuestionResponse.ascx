<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MultipleChoiceQuestionResponse.ascx.vb"
    Inherits="MultipleChoiceQuestionResponse" %>
<table width="100%">
    <tr>
        <td height="50" width="25">
        </td>
        <td colspan="2">
            <asp:TextBox ID="TextBoxMCResponse" runat="server" Height="50px" TextMode="MultiLine"
                Width="98%"></asp:TextBox>
        </td>
        <td width="35">
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorMCResponse" runat="server"
                ControlToValidate="TextBoxMCResponse" ErrorMessage="(*)" ForeColor="Red" 
                ValidationGroup="NewQuestion">(*)</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td height="35" width="25">
            &nbsp;
        </td>
        <td width="200">
            <asp:RadioButton ID="RadioButtonIsAnswer" runat="server" Text="Is Correct Answer?" onclick = "RadioCheck(this);"/>
        </td>
        <td>
            <asp:LinkButton ID="LinkButtonRemove" runat="server">Remove Response</asp:LinkButton>
        </td>
        <td width="25">
        </td>
    </tr>
</table>
<br />
<asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
