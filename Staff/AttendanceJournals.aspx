<%@ Page Title="SIS Attendance Leaves" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="AttendanceJournals.aspx.vb" Inherits="Attendance_Checklist" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuAttendance.ascx" TagName="MenuAttendanceStaff" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuAttendanceStaff ID="MenuAttendanceStaff1" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label42" runat="server" Font-Bold="True" Text="Select a Date to see Journal:"
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Calendar ID="CalendarAttendance" runat="server" BackColor="White" Width="95%">
                                <SelectedDayStyle BackColor="#FF9900" />
                                <TitleStyle BackColor="#33CCFF" />
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content-right">
                <h2>
                    ATTENDANCE JOURNAL</h2>
                <br />
                <asp:GridView ID="GridViewAttendanceJurnal" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="SectionCatalogID" DataSourceID="SqlDataSourceAttendanceJurnals"
                    Width="680px" AllowPaging="True">
                    <Columns>
                        <asp:BoundField DataField="SectionCatalog" HeaderText="Section" SortExpression="SectionCatalog">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="Center" Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="1" HeaderText="Period 1" SortExpression="1">
                            <ItemStyle HorizontalAlign="Center" Width="55px" Font-Size="XX-Small" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="2" HeaderText="Period 2" SortExpression="2">
                            <ItemStyle HorizontalAlign="Center" Width="55px" Font-Size="XX-Small" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="3" HeaderText="Period 3" SortExpression="3">
                            <ItemStyle HorizontalAlign="Center" Width="55px" Font-Size="XX-Small" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="4" HeaderText="Period 4" SortExpression="4">
                            <ItemStyle HorizontalAlign="Center" Width="55px" Font-Size="XX-Small" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="5" HeaderText="Period 5" SortExpression="5">
                            <ItemStyle HorizontalAlign="Center" Width="55px" Font-Size="XX-Small" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="6" HeaderText="Period 6" SortExpression="6">
                            <ItemStyle HorizontalAlign="Center" Width="55px" Font-Size="XX-Small" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="7" HeaderText="Period 7" SortExpression="7">
                            <ItemStyle HorizontalAlign="Center" Width="55px" Font-Size="XX-Small" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="8" HeaderText="Period 8" SortExpression="8">
                            <ItemStyle HorizontalAlign="Center" Width="55px" Font-Size="XX-Small" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="9" HeaderText="Period 9" SortExpression="9">
                            <ItemStyle HorizontalAlign="Center" Width="55px" Font-Size="XX-Small" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Sorry! No Data Found!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <HeaderStyle Height="35px" />
                    <PagerStyle Font-Bold="True" Font-Size="Small" />
                    <RowStyle Font-Bold="True" ForeColor="#333333" Height="40px" />
                </asp:GridView>
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StaffID, StaffName FROM tbl_Staff WHERE (SchoolCode = @SchoolCode) ORDER BY StaffName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAttendanceJurnals" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog, [1], [2], [3], [4], [5], [6], [7], [8], [9] FROM vw_AttendanceJournals WHERE (Date = @Date) AND (SchoolCode = @SchoolCode)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="CalendarAttendance" Name="Date" PropertyName="SelectedDate" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
