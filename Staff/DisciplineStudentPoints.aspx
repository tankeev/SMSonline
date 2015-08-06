<%@ Page Title="SIS Discipline Checklist" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="DisciplineStudentPoints.aspx.vb" Inherits="Attendance_Checklist" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    DISCIPLINE</h2>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew" runat="server" ImageUrl="~/Staff/Images/button_green.png"
                                NavigateUrl="~/Staff/DisciplineChecklist.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Discipline Checklist"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    </tr>
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink2" runat="server" Enabled="False" ImageUrl="~/Staff/Images/button_green.png"
                                NavigateUrl="~/Staff/DisciplineStudentPoints.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="Student Behaviour Points"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:LoginView ID="LoginViewDiscipline" runat="server">
                    <RoleGroups>
                        <asp:RoleGroup Roles="DisciplineAdmin">
                            <ContentTemplate>
                                <table class="content-table" width="240">
                                    </tr>
                                    <tr>
                                        <td width="40">
                                            <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Staff/Images/button_orange.png"
                                                NavigateUrl="~/Staff/DisciplineAddBonusPoints.aspx">Add New</asp:HyperLink>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="Update Bonus Points"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table class="content-table" width="240">
                                    </tr>
                                    <tr>
                                        <td width="40">
                                            <asp:HyperLink ID="HyperLinkAddNew0" runat="server" ImageUrl="~/Staff/Images/button_orange.png"
                                                NavigateUrl="~/Staff/DisciplineAddOffensePoints.aspx">Add New</asp:HyperLink>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label45" runat="server" Text="Update Offense Points"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table class="content-table" width="240">
                                    </tr>
                                    <tr>
                                        <td class="style1" width="40">
                                            <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/Staff/Images/button_orange.png"
                                                NavigateUrl="~/Staff/DisciplineTypes.aspx">Add New</asp:HyperLink>
                                        </td>
                                        <td class="style1">
                                            <asp:Label ID="Label46" runat="server" Text="Edit Discipline Points"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </ContentTemplate>
                        </asp:RoleGroup>
                    </RoleGroups>
                </asp:LoginView>
                <table class="content-table" width="240">
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label42" runat="server" Font-Bold="True" Text="Select Date:" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
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
                    STUDENT POINTS</h2>
                <br />
                <asp:GridView ID="GridViewDiscipline" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceDisciplinePoints" Width="680px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/Staff/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />
                        <asp:TemplateField HeaderText="Bonus" SortExpression="Bonus">
                            <ItemTemplate>
                                <asp:Label ID="LabelPlus" runat="server" Font-Bold="True" ForeColor="Red" Text="+"></asp:Label>
                                <asp:Label ID="LabelBonus" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Bind("Bonus") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Offense" SortExpression="Discipline">
                            <ItemTemplate>
                                <asp:Label ID="LabelMinus" runat="server" Font-Bold="True" ForeColor="Red" Text="-"></asp:Label>
                                <asp:Label ID="LabelDiscipline" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Bind("Discipline") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total " SortExpression="DisciplinePoint">
                            <ItemTemplate>
                                <asp:Label ID="LabelTotal" runat="server" Font-Bold="True" ForeColor="Red">0</asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
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
                <asp:SqlDataSource ID="SqlDataSourceDisciplinePoints" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName, Bonus, Discipline FROM vw_DisciplinePoints WHERE (AcademicTermID = @AcademicTermID) AND (SchoolCode = @SchoolCode) AND (CurrentSectionID = @CurrentSectionID)"
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
                <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StaffID, StaffName FROM tbl_Staff WHERE (SchoolCode = @SchoolCode) ORDER BY StaffName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT        SectionCatalogID, SectionCatalog
FROM            vw_Sections
WHERE        (SchoolCode = @SchoolCode)
ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
