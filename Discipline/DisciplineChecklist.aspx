<%@ Page Title="SIS Discipline Checklist" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="DisciplineChecklist.aspx.vb" Inherits="Attendance_Checklist" %>

<%@ Register Src="MenuDiscipline.ascx" TagName="MenuDiscipline" TagPrefix="uc1" %>
<%@ Register Src="EmptyTemplate.ascx" TagName="EmptyTemplate" TagPrefix="uc2" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuDiscipline ID="MenuDiscipline" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label175" runat="server" Font-Bold="True" ForeColor="Red" Text="Select School Level"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:RadioButtonList ID="RadioButtonListSectionSchool" runat="server" AutoPostBack="True"
                                RepeatDirection="Horizontal" Width="95%">
                                <asp:ListItem Value="SD">SD</asp:ListItem>
                                <asp:ListItem Value="SMP">SMP</asp:ListItem>
                                <asp:ListItem Selected="True" Value="SMA">SMA</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label176" runat="server" Font-Bold="True" ForeColor="Red" Text="Select School Section"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListSections" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceSections" DataTextField="SectionCatalog" DataValueField="SectionCatalogID"
                                RepeatColumns="4" Width="95%">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="22">
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
                    DataSourceID="SqlDataSourceDiscipline" Width="675px" DataKeyNames="DisciplineID"
                    AllowPaging="True" PageSize="18">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/Staff/Images/Item.png" />
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
                                <asp:ImageButton ID="ImageButtonDel" runat="server" CommandName="Delete" ImageUrl="~/Staff/Images/delete.gif" />
                                <asp:ConfirmButtonExtender ID="ImageButtonDel_ConfirmButtonExtender" 
                                    runat="server" ConfirmText="Are you sure?" Enabled="True" 
                                    TargetControlID="ImageButtonDel">
                                </asp:ConfirmButtonExtender>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <uc2:EmptyTemplate ID="EmptyTemplate1" runat="server" />
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_SectionsMentors WHERE (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID) AND (SectionSchool = @SectionSchool) ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSectionSchool" Name="SectionSchool"
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
                    SelectCommand="SELECT StudentID, StudentName, DisciplineType, DisciplinePoint, Date, PointType, DisciplineID, SectionCatalogID FROM vw_Discipline WHERE (AcademicTermID = @AcademicTermID) AND (SchoolCode = @SchoolCode) ORDER BY StudentName"
                    
                    DeleteCommand="DELETE FROM tbl_Discipline WHERE (DisciplineID = @DisciplineID)" 
                    FilterExpression="SectionCatalogID={0}">
                    <DeleteParameters>
                        <asp:Parameter Name="DisciplineID" />
                    </DeleteParameters>
                    <FilterParameters>
                        <asp:ControlParameter ControlID="RadioButtonListSections" 
                            Name="SectionCatalogID" PropertyName="SelectedValue" />
                    </FilterParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
