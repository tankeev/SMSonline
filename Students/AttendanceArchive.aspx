<%@ Page Title="SIS Attendance Archive" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="AttendanceArchive.aspx.vb" Inherits="UserList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    CLASSES</h2>
                <br />
                <table class="content-table" width="230">
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
                    CLASS INFORMATION</h2>
                <br />
                <table style="border: 1px solid #CCCCCC; background-color: #FFFF99;" width="675">
                    <tr>
                        <td width="25">
                            <asp:Panel ID="PanelPresent0" runat="server" BackColor="#99CC00" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td width="100">
                            <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(P) "></asp:Label>
                            <asp:Label ID="Label12" runat="server" Text="Present" Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelAbsentwithoutLeave1" runat="server" BackColor="Red" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td width="100">
                            <asp:Label ID="Label20" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(A) "></asp:Label>
                            <asp:Label ID="Label14" runat="server" Text="Absent" Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelSickLeave0" runat="server" BackColor="#FFFF99" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td width="100">
                            <asp:Label ID="Label22" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(S) "></asp:Label>
                            <asp:Label ID="Label13" runat="server" Text="Sick" Font-Size="X-Small"></asp:Label>
                        </td>
                        <td class="style2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td width="25">
                            <asp:Panel ID="PanelPresent1" runat="server" BackColor="#009933" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label19" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(L) "></asp:Label>
                            <asp:Label ID="Label15" runat="server" Text="Late" Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelAbsentwithLeave0" runat="server" BackColor="#FF6699" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label21" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(O) "></asp:Label>
                            <asp:Label ID="Label9" runat="server" Text="Olympiad" Font-Size="X-Small"></asp:Label>
                        </td>
                        <td width="25">
                            <asp:Panel ID="PanelEarlyLeave" runat="server" BackColor="#FFCC00" BorderWidth="1px"
                                Height="20px" Width="20px">
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Maroon" Text="(I) "></asp:Label>
                            <asp:Label ID="Label17" runat="server" Text="Permission" Font-Size="X-Small"></asp:Label>
                        </td>
                        <td class="style2">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID"
                    DataSourceID="SqlDataSourceStudents" Width="675px" AllowPaging="True" PageSize="15">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/Administrators/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="StudentID" SortExpression="StudentID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="LabelStudentID" runat="server" Text='<%# Bind("StudentID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                        <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" SortExpression="Date">
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="1" SortExpression="1">
                            <ItemTemplate>
                                <asp:Label ID="LabelP1" runat="server" Text='<%# Eval("1") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="36px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="2" SortExpression="2">
                            <ItemTemplate>
                                <asp:Label ID="LabelP2" runat="server" Text='<%# Eval("2") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="36px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="3" SortExpression="3">
                            <ItemTemplate>
                                <asp:Label ID="LabelP3" runat="server" Text='<%# Eval("3") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="36px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="4" SortExpression="4">
                            <ItemTemplate>
                                <asp:Label ID="LabelP4" runat="server" Text='<%# Eval("4") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="36px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="5" SortExpression="5">
                            <ItemTemplate>
                                <asp:Label ID="LabelP5" runat="server" Text='<%# Eval("5") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="36px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="6" SortExpression="6">
                            <ItemTemplate>
                                <asp:Label ID="LabelP6" runat="server" Text='<%# Eval("6") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="36px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="7" SortExpression="7">
                            <ItemTemplate>
                                <asp:Label ID="LabelP7" runat="server" Text='<%# Eval("7") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="36px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="8" SortExpression="8">
                            <ItemTemplate>
                                <asp:Label ID="LabelP8" runat="server" Text='<%# Eval("8") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="36px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="9" SortExpression="9">
                            <ItemTemplate>
                                <asp:Label ID="LabelP9" runat="server" Text='<%# Eval("9") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="36px" />
                        </asp:TemplateField>
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
                <asp:GridView ID="GridViewAttendanceTypes" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="AttendanceTypeID" DataSourceID="SqlDataSourceAttendanceTypes" Width="675px"
                    Visible="False">
                    <Columns>
                        <asp:TemplateField HeaderText="AttendanceTypeID" InsertVisible="False" SortExpression="AttendanceTypeID">
                            <ItemTemplate>
                                <asp:Label ID="LabelATID" runat="server" Text='<%# Bind("AttendanceTypeID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="AttendanceType" SortExpression="AttendanceType">
                            <ItemTemplate>
                                <asp:Label ID="LabelAT" runat="server" Text='<%# Bind("AttendanceType") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Color" SortExpression="Color">
                            <ItemTemplate>
                                <asp:Label ID="LabelCR" runat="server" Text='<%# Bind("Color") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SchoolCode, CurrentSectionID, StudentID, StudentName, Date, [1], [2], [3], [4], [5], [6], [7], [8] , [9] FROM vw_Attendance WHERE (StudentID = @StudentID) ORDER BY Date DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="StudentID" SessionField="UserID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAttendanceTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT [AttendanceTypeID], [AttendanceType], [Color] FROM [tbl_AttendanceTypes]">
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
