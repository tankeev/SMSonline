<%@ Page Title="SIS Discipline Checklist" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="DisciplineChecklist.aspx.vb" Inherits="Attendance_Checklist" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="50" width="50">
                            <asp:HyperLink ID="HyperLinkDisciplineChecklist" runat="server" ImageUrl="~/Administrators/Images/menu_discipline_checklist.png"
                                NavigateUrl="~/Administrators/DisciplineChecklist.aspx" ToolTip="Discipline Checklist"></asp:HyperLink>
                        </td>
                        <td width="50">
                            <asp:HyperLink ID="HyperLinkAddBonusPoints" runat="server" ImageUrl="~/Administrators/Images/menu_discipline_bonus.png"
                                NavigateUrl="~/Administrators/DisciplineAddBonusPoints.aspx" ToolTip="Add Bonus Points"></asp:HyperLink>
                        </td>
                        <td width="50">
                            
                            <asp:HyperLink ID="HyperLinkAddOffensePoints" runat="server" ImageUrl="~/Administrators/Images/menu_discipline_offense.png"
                                NavigateUrl="~/Administrators/DisciplineAddDisciplinePoints.aspx" ToolTip="Add Offense Points"></asp:HyperLink>
                        </td>
                        <td>
                            
                            <asp:HyperLink ID="HyperLinkBehaviorPoints" runat="server" ImageUrl="~/Administrators/Images/menu_discipline_points.png"
                                NavigateUrl="~/Administrators/DisciplineStudentPoints.aspx" ToolTip="Behavior Points"></asp:HyperLink>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label42" runat="server" Font-Bold="True" Text="Select Date:" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Calendar ID="CalendarDisciplineDate" runat="server" BackColor="White" Width="95%">
                                <SelectedDayStyle BackColor="#FF9900" />
                                <TitleStyle BackColor="#33CCFF" />
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label44" runat="server" Font-Bold="True" Text="Select Section:" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListSections" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceSections" DataTextField="SectionCatalog" DataValueField="SectionCatalogID"
                                RepeatColumns="4" Width="95%" Font-Size="X-Small">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    DISCIPLINE CHECKLIST</h2>
                <br />
                <asp:GridView ID="GridViewDiscipline" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceDiscipline" Width="680px" DataKeyNames="DisciplineID">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/Administrators/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />
                        <asp:BoundField DataField="DisciplineType" HeaderText="Discipline Type" SortExpression="DisciplineType" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:d}">
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Point" SortExpression="DisciplinePoint">
                            <ItemTemplate>
                                <asp:Label ID="LabelPointType" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Bind("PointType") %>'
                                    Visible="False"></asp:Label>
                                <asp:Label ID="LabelSign" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Bind("DisciplinePoint") %>'></asp:Label>
                                <asp:Label ID="LabelPoint" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Bind("DisciplinePoint") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonDel" runat="server" CommandName="Delete" ImageUrl="~/Administrators/Images/delete.gif" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
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
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StaffID, StaffName FROM tbl_Staff WHERE (SchoolCode = @SchoolCode) ORDER BY StaffName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceDiscipline" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName, DisciplineType, DisciplinePoint, Date, PointType, DisciplineID FROM vw_Discipline WHERE (AcademicTermID = @AcademicTermID) AND (SchoolCode = @SchoolCode) AND (CurrentSectionID = @CurrentSectionID)"
                    DeleteCommand="DELETE FROM tbl_Discipline WHERE (DisciplineID = @DisciplineID)">
                    <DeleteParameters>
                        <asp:Parameter Name="DisciplineID" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
