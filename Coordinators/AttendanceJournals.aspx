<%@ Page Title="SIS Attendance Leaves" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="AttendanceJournals.aspx.vb" Inherits="Attendance_Checklist" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuAttendance.ascx" TagName="MenuAttendance" TagPrefix="usmac" %>
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
                            <asp:Calendar ID="CalendarAttendance" runat="server" BackColor="White" Width="95%">
                                <SelectedDayStyle BackColor="#FF9900" />
                                <TitleStyle BackColor="#33CCFF" />
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content-right">
                <h2>
                    ATTENDANCE JOURNALS</h2>
                <br />
                <asp:GridView ID="GridViewAttendanceJurnal" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="SectionCatalogID" DataSourceID="SqlDataSourceAttendanceJurnals"
                    Width="650px" AllowPaging="True">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Select"
                                    ImageUrl="~/Coordinators/Images/cursor_hand.png" Text="Select" Width="24px" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="SectionCatalog" HeaderText="Section" SortExpression="SectionCatalog">
                            <ItemStyle Font-Size="Small" />
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
                <br />
                <asp:DataList ID="DataListJurnal" runat="server" DataSourceID="SqlDataSourceAttendanceJournalsDetails"
                    RepeatColumns="1" RepeatDirection="Horizontal" Width="650px" DataKeyField="RegisterID">
                    <AlternatingItemStyle BackColor="#CCCCCC" />
                    <EditItemTemplate>
                        <table style="border: 1px solid #808080" width="650">
                            <tr>
                                <td bgcolor="Gray" style="border: 1px solid #808080" width="25">
                                    
                                </td>
                                <td bgcolor="Gray" style="border: 1px solid #808080" width="60">
                                </td>
                                <td bgcolor="Gray" style="border: 1px solid #808080" width="160">
                                </td>
                                <td bgcolor="Gray" style="border: 1px solid #808080" width="25">
                                    
                                </td>
                                <td bgcolor="Gray" style="border: 1px solid #808080" width="60">
                                </td>
                                <td bgcolor="Gray" style="border: 1px solid #808080">
                                </td>
                            </tr>
                            <tr>
                                <td height="25">
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Coordinators/Images/arrow.gif" />
                                </td>
                                <td height="25">
                                    <asp:Label ID="LabelSubject" runat="server" Text="Date:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date", "{0:d}") %>'
                                        Width="133px" />
                                    <asp:CalendarExtender ID="DateTextBox_CalendarExtender" runat="server" TargetControlID="DateTextBox">
                                    </asp:CalendarExtender>
                                </td>
                                <td>
                                    <asp:Image ID="Image5" runat="server" ImageUrl="~/Coordinators/Images/arrow.gif" />
                                </td>
                                <td>
                                    <asp:Label ID="LabelSubject0" runat="server" Text="Title:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' Width="90%" />
                                </td>
                            </tr>
                            <tr>
                                <td height="25">
                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Coordinators/Images/arrow.gif" />
                                </td>
                                <td height="25">
                                    <asp:Label ID="LabelSubject2" runat="server" Text="Period:"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListPeriods" runat="server" SelectedValue='<%# Eval("Period") %>'
                                        Width="143px">
                                        <asp:ListItem Value="1"></asp:ListItem>
                                        <asp:ListItem Value="2"></asp:ListItem>
                                        <asp:ListItem Value="3"></asp:ListItem>
                                        <asp:ListItem Value="4"></asp:ListItem>
                                        <asp:ListItem Value="5"></asp:ListItem>
                                        <asp:ListItem Value="6"></asp:ListItem>
                                        <asp:ListItem Value="7"></asp:ListItem>
                                        <asp:ListItem Value="8"></asp:ListItem>
                                        <asp:ListItem Value="9"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Image ID="Image6" runat="server" ImageUrl="~/Coordinators/Images/arrow.gif" />
                                </td>
                                <td>
                                    <asp:Label ID="LabelSubject1" runat="server" Text="Notes:"></asp:Label>
                                </td>
                                <td rowspan="3">
                                    <asp:TextBox ID="NotesTextBox" runat="server" Height="80px" Text='<%# Bind("Notes") %>'
                                        TextMode="MultiLine" Width="90%" />
                                </td>
                            </tr>
                            <tr>
                                <td height="25">
                                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Coordinators/Images/arrow.gif" />
                                </td>
                                <td height="25">
                                    <asp:Label ID="LabelSubject3" runat="server" Text="Teacher:"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListTeachers" runat="server" DataSourceID="SqlDataSourceStaff"
                                        DataTextField="StaffName" DataValueField="StaffID" SelectedValue='<%# Eval("StaffID") %>'
                                        Width="143px">
                                        <asp:ListItem Value="1"></asp:ListItem>
                                        <asp:ListItem Value="2"></asp:ListItem>
                                        <asp:ListItem Value="3"></asp:ListItem>
                                        <asp:ListItem Value="4"></asp:ListItem>
                                        <asp:ListItem Value="5"></asp:ListItem>
                                        <asp:ListItem Value="6"></asp:ListItem>
                                        <asp:ListItem Value="7"></asp:ListItem>
                                        <asp:ListItem Value="8"></asp:ListItem>
                                        <asp:ListItem Value="9"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    
                                </td>
                                <td>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td height="40">
                                    
                                </td>
                                <td height="40">
                                    
                                </td>
                                <td>
                                    <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="ButtonCancel" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    
                                </td>
                                <td>
                                    
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <table width="100%" bgcolor="#00C5E3" style="border: 1px solid #0066FF">
                            <tr>
                                <td height="30">
                                    <asp:Label ID="Label12" runat="server" ForeColor="White" Text="Teaching Process Kit"
                                        Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table width="650" style="border: 1px solid #808080">
                            <tr>
                                <td bgcolor="Gray" style="border: 1px solid #808080" width="25" height="25">
                                    
                                </td>
                                <td bgcolor="Gray" style="border: 1px solid #808080" width="60" align="center">
                                    <asp:Label ID="LabelSubject1" runat="server" Font-Bold="True" ForeColor="White" Text="Period:"></asp:Label>
                                </td>
                                <td bgcolor="Gray" style="border: 1px solid #808080" width="160">
                                    <asp:Label ID="LabelSubject" runat="server" Font-Bold="True" ForeColor="White" Text="Teacher:"></asp:Label>
                                </td>
                                <td bgcolor="Gray" style="border: 1px solid #808080" width="25">
                                    
                                </td>
                                <td bgcolor="Gray" style="border: 1px solid #808080">
                                    <asp:Label ID="LabelSubject0" runat="server" Font-Bold="True" ForeColor="White" Text="Title:"></asp:Label>
                                </td>
                                <td bgcolor="Gray" style="border: 1px solid #808080" width="25">
                                    
                                </td>
                                <td bgcolor="Gray" style="border: 1px solid #808080" width="25">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td height="25">
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Coordinators/Images/arrow.gif" />
                                </td>
                                <td align="center" height="25">
                                    <asp:Label ID="LabelP" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Eval("Period") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListTeachers" runat="server" DataSourceID="SqlDataSourceStaff"
                                        DataTextField="StaffName" DataValueField="StaffID" SelectedValue='<%# Eval("StaffID") %>'
                                        Width="143px">
                                        <asp:ListItem Value="1"></asp:ListItem>
                                        <asp:ListItem Value="2"></asp:ListItem>
                                        <asp:ListItem Value="3"></asp:ListItem>
                                        <asp:ListItem Value="4"></asp:ListItem>
                                        <asp:ListItem Value="5"></asp:ListItem>
                                        <asp:ListItem Value="6"></asp:ListItem>
                                        <asp:ListItem Value="7"></asp:ListItem>
                                        <asp:ListItem Value="8"></asp:ListItem>
                                        <asp:ListItem Value="9"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Image ID="Image5" runat="server" ImageUrl="~/Coordinators/Images/arrow.gif" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' Width="90%" />
                                </td>
                                <td align="center">
                                    <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("RegisterID") %>'
                                        CommandName="Edit" ImageUrl="~/Coordinators/Images/edit.png" />
                                </td>
                                <td align="center">
                                    <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Coordinators/Images/Delete_bin.gif" />
                                    <asp:ConfirmButtonExtender ID="ImageButton3_ConfirmButtonExtender" runat="server"
                                        ConfirmText="Are you sure?" TargetControlID="ImageButton3">
                                    </asp:ConfirmButtonExtender>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SeparatorTemplate>
                        <hr />
                    </SeparatorTemplate>
                </asp:DataList>
                <asp:Panel ID="PanelEmptyList" runat="server" Width="650px" Visible="False">
                    <div align="center">
                        <br />
                        <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                        <br />
                        <br />
                        <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Sorry! No Data Found!"></asp:Label>
                        <br />
                        <br />
                    </div>
                </asp:Panel>
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
                <asp:SqlDataSource ID="SqlDataSourceAttendanceJournalsDetails" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT RegisterID, StaffID, Period, Date, Title, Notes, Status, SectionCatalogID, SchoolCode FROM vw_AttendanceJournalDetails WHERE (SchoolCode = @SchoolCode) AND (SectionCatalogID = @SectionCatalogID) AND (Date = @Date) ORDER BY Period"
                    DeleteCommand="DELETE FROM [tbl_ClassRegister] WHERE [RegisterID] = @RegisterID"
                    InsertCommand="INSERT INTO [tbl_ClassRegister] ([SectionCatalogID], [Date], [Title], [Notes], [Status], [Period]) VALUES (@SectionCatalogID, @Date, @Title, @Notes, @Status, @Period)"
                    UpdateCommand="UPDATE tbl_ClassRegister SET Date = @Date, Title = @Title, Notes = @Notes, Period = @Period, StaffID = @StaffID WHERE (RegisterID = @RegisterID)">
                    <DeleteParameters>
                        <asp:Parameter Name="RegisterID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="SectionCatalogID" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="Date" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Notes" Type="String" />
                        <asp:Parameter Name="Status" Type="Boolean" />
                        <asp:Parameter Name="Period" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridViewAttendanceJurnal" Name="SectionCatalogID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="CalendarAttendance" Name="Date" PropertyName="SelectedDate" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter DbType="Date" Name="Date" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Notes" Type="String" />
                        <asp:Parameter Name="Period" Type="Int32" />
                        <asp:Parameter Name="StaffID" />
                        <asp:Parameter Name="RegisterID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
