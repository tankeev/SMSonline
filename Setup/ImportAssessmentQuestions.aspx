<%@ Page Title="Setup Import Question" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" CodeFile="ImportAssessmentQuestions.aspx.vb" Inherits="ImportData" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <table width="680">
        <tr>
            <td height="30" width="140">
                <asp:Label ID="Label2" runat="server" Text="Import Staff to SIS:" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUploadStaffData" runat="server" />
            </td>
        </tr>
        <tr>
            <td height="30">
                <asp:Label ID="Label3" runat="server" Text="Sheet Has Header?" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rbHDR" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Text="Yes" Value="Yes" Selected="True">

                    </asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td height="30">
            </td>
            <td>
                <asp:Button ID="ButtonUploadStafftoExcel" runat="server" OnClick="btnUpload_Click"
                    Text="Upload" ValidationGroup="UploadExcel" Width="100%" />
            </td>
        </tr>
        <tr>
            <td height="90">
            </td>
            <td>
                <asp:ListBox ID="ListBoxStatus" runat="server" Font-Size="X-Small" ForeColor="Maroon"
                    Height="200px" Width="100%"></asp:ListBox>
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridViewStaff" runat="server" Width="680px" AllowPaging="true"
        PageSize="50">
        <Columns>
            <asp:TemplateField HeaderText="Check">
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBoxCheck" runat="server" Checked="True" />
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle Width="40px" HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:Button ID="ButtonAddStaff" runat="server" Text="Add Assessment Questions to SIS"
        Width="680px" Visible="False" />
    <br />
    <br />
</asp:Content>
