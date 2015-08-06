<%@ Page Title="SIS Students" AutoEventWireup="true" Language="VB" MasterPageFile="~/Site.Master"  CodeFile="Schedule.aspx.vb"
    Inherits="_Default" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU
                </h2>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    STUDENTS</h2>
                <br />
                <div class="space">
                    <asp:LinkButton ID="LinkButtonSample" ForeColor="Gray" runat="server" OnClick="LinkButtonSample_Click">Clear and Generate Random Data</asp:LinkButton>
                </div>
                <DayPilot:DayPilotScheduler ID="DayPilotScheduler1" runat="server" DataStartField="eventstart"
                    DataEndField="eventend" DataTextField="name" DataIdField="id" DataResourceField="resource_id"
                    CellGroupBy="Month" Scale="Day" EventMoveHandling="CallBack">
                </DayPilot:DayPilotScheduler>
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
