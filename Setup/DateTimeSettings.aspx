<%@ Page Title="Setup Academic Terms" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" CodeFile="DateTimeSettings.aspx.vb" Inherits="Academic_Terms" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <asp:DropDownList ID="DropDownListTimeZones" runat="server" AutoPostBack="True" AppendDataBoundItems="true">
                <asp:ListItem Text="Select a TimeZone" Value="Default value" />
            </asp:DropDownList>
            <br />
            <br />
            Local Time:
            <asp:Label ID="lblLocalTime" runat="server" Text=""></asp:Label>
            <br />
            <br />
            Converted Time:
            <asp:Label ID="lblTimeZone" runat="server" Text=""></asp:Label>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
