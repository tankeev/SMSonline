<%@ Page Title="SIS Attendance Archive" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="Attendance.aspx.vb" Inherits="UserList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    ATTENDANCE</h2>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="30">
                            <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" Width="95%" DataSourceID="SqlDataSourceAcademicTerms"
                                DataTextField="AcademicTerm" DataValueField="AcademicTermID">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:DropDownList ID="DropDownListSchoolCodes" runat="server" TabIndex="7" Width="95%"
                                DataSourceID="SqlDataSourceSchoolCodes" DataTextField="SchoolName" DataValueField="SchoolCode"
                                AutoPostBack="True" Enabled="False">
                                <asp:ListItem Value="">Select School</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label42" runat="server" Font-Bold="True" Text="Select Date:" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Calendar ID="CalendarAttendanceDate" runat="server" BackColor="White" Width="95%">
                                <SelectedDayStyle BackColor="#FF9900" />
                                <TitleStyle BackColor="#33CCFF" />
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    ARCHIVE</h2>
                <br />
                <br />
                <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataKeyNames="AttendanceID"
                    DataSourceID="SqlDataSourceStudents" Width="100%">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/Administrators/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" SortExpression="Date">
                            <ItemStyle Width="120px" />
                            <ItemStyle Width="75px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TraineeName" HeaderText="Trainee Name" SortExpression="TraineeName" />
                        <asp:BoundField DataField="Definition" HeaderText="Definition" SortExpression="Definition" />
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
                </asp:GridView>
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms ">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SchoolCode, SchoolName FROM tbl_Schools WHERE (SchoolCode = @SchoolCode) ORDER BY SchoolName">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT tbl_DevelopmentAttendanceChecklist.AcademicTermID, tbl_DevelopmentAttendanceChecklist.TraineeID, tbl_DevelopmentAttendanceChecklist.AttendanceTypeID, tbl_DevelopmentAttendanceChecklist.Date, tbl_DevelopmentAttendanceChecklist.AttendanceID, tbl_Staff.StaffName AS TraineeName, tbl_AttendanceTypes.Definition FROM tbl_DevelopmentAttendanceChecklist INNER JOIN tbl_AttendanceTypes ON tbl_DevelopmentAttendanceChecklist.AttendanceTypeID = tbl_AttendanceTypes.AttendanceTypeID INNER JOIN tbl_Staff ON tbl_DevelopmentAttendanceChecklist.TraineeID = tbl_Staff.StaffID">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAttendanceTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT [AttendanceTypeID], [AttendanceType], [Color] FROM [tbl_AttendanceTypes]">
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
