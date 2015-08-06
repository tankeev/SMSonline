<%@ Page Title="SIS Attendance Archive" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="AttendanceArchive.aspx.vb" Inherits="UserList" %>

<%@ Register Src="MenuAttendance.ascx" TagName="MenuAttendance" TagPrefix="usmac" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <usmac:MenuAttendance ID="MenuAttendance" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label42" runat="server" Font-Bold="True" Text="Select Date"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Calendar ID="CalendarAttendanceDate" runat="server" BackColor="White" Width="95%">
                                <SelectedDayStyle BackColor="#FF9900" />
                                <TitleStyle BackColor="#33CCFF" />
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label44" runat="server" Font-Bold="True" Text="Select Section"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListSections" runat="server" DataSourceID="SqlDataSourceSections"
                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" RepeatColumns="4"
                                Width="95%" Font-Size="X-Small">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Button ID="ButtonShowRecords" runat="server" Text="Show Records" Width="95%" />
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label127" runat="server" Font-Bold="True" Text="Insert Missing Periods"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Button ID="ButtonInsertAllRecords" runat="server" Text="Insert All Periods"
                                Width="95%" />
                            <asp:Button ID="ButtonHidden" runat="server" Text="Hidden Button" Style="display: none;" />
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                            <asp:ModalPopupExtender ID="MPInsertAll" runat="server" BackgroundCssClass="modalBackground"
                                CancelControlID="ButtonGroupsCancel" PopupControlID="PanelInsertAll" TargetControlID="ButtonHidden">
                            </asp:ModalPopupExtender>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Panel ID="PanelInsertAll" runat="server" CssClass="modalPopup" Width="230px">
                    <table width="100%">
                        <tr>
                            <td height="25">
                                <asp:Button ID="ButtonGroupsCancel" runat="server" Text="Close" Width="98%" />
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                                <asp:Label ID="Label125" runat="server" Font-Bold="True" Text="Add All Missing Periods"></asp:Label>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:DropDownList ID="DropDownListATAll" runat="server" DataSourceID="SqlDataSourceAttendanceTypes"
                                    DataTextField="AttendanceType" DataValueField="AttendanceTypeID" Width="95%">
                                    <asp:ListItem Value="">?</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LabelStatusInsertAll" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Button ID="ButtonInsertAll" runat="server" Text="Insert All Periods" Width="98%" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
            <div class="content-right">
                <h2>
                    ATTENDANCE ARCHIVE</h2>
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
                <table width="675" style="border: 1px Solid #808080; background-color: #CCCCCC;">
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label122" runat="server" Font-Size="X-Small" ForeColor="Red" Text="Auto Convert Fields &gt;&gt;"></asp:Label>
                        </td>
                        <td width="35">
                            <asp:DropDownList ID="DDLP1" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                DataSourceID="SqlDataSourceAttendanceTypes" DataTextField="AttendanceType" DataValueField="AttendanceTypeID"
                                Width="95%">
                                <asp:ListItem Value="">?</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td width="35">
                            <asp:DropDownList ID="DDLP2" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                DataSourceID="SqlDataSourceAttendanceTypes" DataTextField="AttendanceType" DataValueField="AttendanceTypeID"
                                Width="95%">
                                <asp:ListItem Value="">?</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td width="35">
                            <asp:DropDownList ID="DDLP3" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                DataSourceID="SqlDataSourceAttendanceTypes" DataTextField="AttendanceType" DataValueField="AttendanceTypeID"
                                Width="95%">
                                <asp:ListItem Value="">?</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td width="35">
                            <asp:DropDownList ID="DDLP4" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                DataSourceID="SqlDataSourceAttendanceTypes" DataTextField="AttendanceType" DataValueField="AttendanceTypeID"
                                Width="95%">
                                <asp:ListItem Value="">?</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td width="35">
                            <asp:DropDownList ID="DDLP5" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                DataSourceID="SqlDataSourceAttendanceTypes" DataTextField="AttendanceType" DataValueField="AttendanceTypeID"
                                Width="95%">
                                <asp:ListItem Value="">?</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td width="35">
                            <asp:DropDownList ID="DDLP6" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                DataSourceID="SqlDataSourceAttendanceTypes" DataTextField="AttendanceType" DataValueField="AttendanceTypeID"
                                Width="95%">
                                <asp:ListItem Value="">?</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td width="35">
                            <asp:DropDownList ID="DDLP7" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                DataSourceID="SqlDataSourceAttendanceTypes" DataTextField="AttendanceType" DataValueField="AttendanceTypeID"
                                Width="95%">
                                <asp:ListItem Value="">?</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td width="35">
                            <asp:DropDownList ID="DDLP8" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                DataSourceID="SqlDataSourceAttendanceTypes" DataTextField="AttendanceType" DataValueField="AttendanceTypeID"
                                Width="95%">
                                <asp:ListItem Value="">?</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td width="35">
                            <asp:DropDownList ID="DDLP9" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                DataSourceID="SqlDataSourceAttendanceTypes" DataTextField="AttendanceType" DataValueField="AttendanceTypeID"
                                Width="95%">
                                <asp:ListItem Value="">?</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Panel ID="PanelStatus" runat="server">
                    <div align="center">
                        <br />
                        <img alt="" src="Images/no-data.png" />
                        <br />
                        <br />
                        <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" ForeColor="Red" Text="Please Select Section and Click Show Records to See Records!"></asp:Label>
                        <br />
                        <br />
                    </div>
                </asp:Panel>
                <br />
                <asp:Panel ID="PanelAttendance" runat="server" Visible="False">
                    <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID"
                        DataSourceID="SqlDataSourceStudents" Width="675px">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Secretary/Images/Item.png" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="35px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="NO">
                                <ItemTemplate>
                                    <strong>
                                        <%# Container.DataItemIndex + 1 %>
                                    </strong>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="35px" Font-Size="X-Small" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="StudentID" SortExpression="StudentID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="LabelStudentID" runat="server" Text='<%# Bind("StudentID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                            <asp:TemplateField HeaderText="1" SortExpression="1">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DDLP1" runat="server" DataSourceID="SqlDataSourceAttendanceTypes"
                                        DataTextField="AttendanceType" DataValueField="AttendanceTypeID" Width="95%"
                                        AppendDataBoundItems="True" SelectedValue='<%# Bind("1") %>'>
                                        <asp:ListItem Value="">?</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="36px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="2" SortExpression="2">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DDLP2" runat="server" DataSourceID="SqlDataSourceAttendanceTypes"
                                        DataTextField="AttendanceType" DataValueField="AttendanceTypeID" Width="95%"
                                        AppendDataBoundItems="True" SelectedValue='<%# Bind("2") %>'>
                                        <asp:ListItem Value="">?</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="36px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="3" SortExpression="3">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DDLP3" runat="server" DataSourceID="SqlDataSourceAttendanceTypes"
                                        DataTextField="AttendanceType" DataValueField="AttendanceTypeID" Width="95%"
                                        AppendDataBoundItems="True" SelectedValue='<%# Bind("3") %>'>
                                        <asp:ListItem Value="">?</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="36px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="4" SortExpression="4">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DDLP4" runat="server" DataSourceID="SqlDataSourceAttendanceTypes"
                                        DataTextField="AttendanceType" DataValueField="AttendanceTypeID" Width="95%"
                                        AppendDataBoundItems="True" SelectedValue='<%# Bind("4") %>'>
                                        <asp:ListItem Value="">?</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="36px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="5" SortExpression="5">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DDLP5" runat="server" DataSourceID="SqlDataSourceAttendanceTypes"
                                        DataTextField="AttendanceType" DataValueField="AttendanceTypeID" Width="95%"
                                        AppendDataBoundItems="True" SelectedValue='<%# Bind("5") %>'>
                                        <asp:ListItem Value="">?</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="36px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="6" SortExpression="6">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DDLP6" runat="server" DataSourceID="SqlDataSourceAttendanceTypes"
                                        DataTextField="AttendanceType" DataValueField="AttendanceTypeID" Width="95%"
                                        AppendDataBoundItems="True" SelectedValue='<%# Bind("6") %>'>
                                        <asp:ListItem Value="">?</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="36px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="7" SortExpression="7">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DDLP7" runat="server" DataSourceID="SqlDataSourceAttendanceTypes"
                                        DataTextField="AttendanceType" DataValueField="AttendanceTypeID" Width="95%"
                                        AppendDataBoundItems="True" SelectedValue='<%# Bind("7") %>'>
                                        <asp:ListItem Value="">?</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="36px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="8" SortExpression="8">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DDLP8" runat="server" DataSourceID="SqlDataSourceAttendanceTypes"
                                        DataTextField="AttendanceType" DataValueField="AttendanceTypeID" Width="95%"
                                        AppendDataBoundItems="True" SelectedValue='<%# Bind("8") %>'>
                                        <asp:ListItem Value="">?</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="36px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="9" SortExpression="9">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DDLP9" runat="server" DataSourceID="SqlDataSourceAttendanceTypes"
                                        DataTextField="AttendanceType" DataValueField="AttendanceTypeID" Width="95%"
                                        AppendDataBoundItems="True" SelectedValue='<%# Bind("9") %>'>
                                        <asp:ListItem Value="">?</asp:ListItem>
                                    </asp:DropDownList>
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
                    <br />
                    <asp:Button ID="ButtonUpdate" runat="server" Height="25px" Text="Update Changes"
                        Width="675px" />
                    <br />
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
                </asp:Panel>
                <uc1:WebMessageBox ID="WebMessageBoxAttendance" runat="server" />
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SchoolCode, CurrentSectionID, StudentID, StudentName, Date, [1], [2], [3], [4], [5], [6], [7], [8] , [9] FROM vw_Attendance WHERE (Date = @Date) AND (SchoolCode = @SchoolCode) AND (CurrentSectionID = @CurrentSectionID)"
                    InsertCommand="INSERT INTO tbl_Attendance(AcademicTermID, SchoolCode, AttendanceTypeID, StudentID, Date, Period, SavedOn, SavedAt, SavedBy) VALUES (@AcademicTermID, @SchoolCode, @AttendanceTypeID, @StudentID, @Date, @Period, @SavedOn, @SavedAt, @SavedBy)"
                    UpdateCommand="UPDATE tbl_Attendance SET AttendanceTypeID = @AttendanceTypeID WHERE (StudentID = @StudentID) AND (Date = @Date) AND (Period = @Period)
IF @@ROWCOUNT=0
INSERT INTO tbl_Attendance(AcademicTermID, SchoolCode, AttendanceTypeID, StudentID, Date, Period, SavedOn, SavedAt, SavedBy) VALUES (@AcademicTermID, @SchoolCode, @AttendanceTypeID, @StudentID, @Date, @Period, @SavedOn, @SavedAt, @SavedBy)">
                    <InsertParameters>
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="SchoolCode" />
                        <asp:Parameter Name="AttendanceTypeID" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="Date" />
                        <asp:Parameter Name="Period" />
                        <asp:Parameter Name="SavedOn" />
                        <asp:Parameter Name="SavedAt" />
                        <asp:Parameter Name="SavedBy" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="CalendarAttendanceDate" DbType="Date" Name="Date"
                            PropertyName="SelectedDate" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="AttendanceTypeID" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="Date" />
                        <asp:Parameter Name="Period" />
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="SchoolCode" />
                        <asp:Parameter Name="SavedOn" />
                        <asp:Parameter Name="SavedAt" />
                        <asp:Parameter Name="SavedBy" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAttendanceTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT [AttendanceTypeID], [AttendanceType], [Color] FROM [tbl_AttendanceTypes]">
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
