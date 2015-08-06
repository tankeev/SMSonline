<%@ Page Title="SIS Students" Language="VB" MasterPageFile="~/Site.Master" CodeFile="UsersSearch.aspx.vb"
    Inherits="ManageUsers" %>

<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uswnb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuUsers.ascx" TagName="MenuUsers" TagPrefix="uc2" %>
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
                <uc2:MenuUsers ID="MenuUsers" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkUsersSearchMenu" runat="server" ImageUrl="~/Administrators/Images/menu_search.png"
                                NavigateUrl="~/Administrators/UsersSearch.aspx" Enabled="False"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label32" runat="server" Text="Search Users" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkStudentsMenu" runat="server" ImageUrl="~/Administrators/Images/menu_students.png"
                                NavigateUrl="~/Administrators/UsersStudents.aspx" ToolTip="Student Details"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Labdel1" runat="server" Text="Student Details"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkStaffMenu" runat="server" ImageUrl="~/Administrators/Images/menu_details.png"
                                NavigateUrl="~/Administrators/UsersStaff.aspx" ToolTip="Staff Details"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Staff Details"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkParentsMenu" runat="server" ImageUrl="~/Administrators/Images/menu_parents.png"
                                NavigateUrl="~/Administrators/UsersParents.aspx" ToolTip="Parent Details"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Parent Details"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    SEARCH</h2>
                <br />
                <asp:Panel ID="PanelSearch" runat="server" DefaultButton="ButtonSearch" Width="680px">
                    <table class="content-table" width="680">
                        <tr>
                            <td height="30">
                                <asp:Label ID="LabelSearch" runat="server" Font-Bold="True" Text="Username or Student Name or Staff Name or Parent Name:"></asp:Label>
                            </td>
                            <td height="25" width="180">
                                <asp:TextBox ID="TextBoxSearchUser" runat="server" Width="160px"></asp:TextBox>
                            </td>
                            <td height="25" width="50">
                                <asp:Button ID="ButtonSearch" runat="server" Text="Find" Width="40px" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:Label ID="Label21" runat="server" Text="This Page allows you to do search in User Data Table."
                    Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridviewUsers" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceUserList"
                    Width="680px" AllowPaging="True" DataKeyNames="UserId">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Administrators/Images/edit.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="School Code" SortExpression="SchoolCode">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListSchoolCodes" runat="server" AppendDataBoundItems="True"
                                    DataSourceID="SqlDataSourceSchoolCodes" DataTextField="SchoolName" DataValueField="SchoolCode"
                                    SelectedValue='<%# Bind("SchoolCode") %>' Width="90%">
                                    <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="180px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name" SortExpression="UserName">
                            <ItemTemplate>
                                <asp:Label ID="LabelUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="130px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="RoleName" HeaderText="Role" SortExpression="RoleName">
                            <ItemStyle />
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LastActivityDate" HeaderText="Last Activity Date" SortExpression="LastActivityDate">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="145px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="A" SortExpression="IsApproved">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxA" runat="server" Checked='<%# Bind("IsApproved") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="L" SortExpression="IsLockedOut">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxL" runat="server" Checked='<%# Bind("IsLockedOut") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonDel" runat="server" CausesValidation="True" CommandArgument="<%# CType(Container,GridViewRow).RowIndex %>"
                                    CommandName="DeleteUser" ImageUrl="~/Administrators/Images/delete.gif" Text="" />
                                <asp:ConfirmButtonExtender ID="ConfirmButtonExtenderDelUser" runat="server" TargetControlID="ImageButtonDel"
                                    ConfirmText="DELETE USER?">
                                </asp:ConfirmButtonExtender>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <asp:Image ID="Image41" runat="server" ImageUrl="~/Administrators/Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Sorry, No Data!"></asp:Label>
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="28px" />
                </asp:GridView>
                <br />
                <asp:Button ID="ButtonUpdate" runat="server" Text="Update All" Width="680px" />
                <br />
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label23" runat="server" Font-Bold="True" ForeColor="Red" Text="Found Students:"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridviewStudents" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceStudents" PageSize="5" Width="680px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image42" runat="server" ImageUrl="~/Administrators/Images/edit.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="School Code" SortExpression="SchoolCode">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListSchoolCodes0" runat="server" AppendDataBoundItems="True"
                                    DataSourceID="SqlDataSourceSchoolCodes" DataTextField="SchoolName" DataValueField="SchoolCode"
                                    SelectedValue='<%# Bind("SchoolCode") %>' Width="90%">
                                    <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="180px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name" SortExpression="UserName">
                            <ItemTemplate>
                                <asp:Label ID="LabelUserName0" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="130px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="SectionCatalog" HeaderText="Section" SortExpression="SectionCatalog">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <asp:Image ID="Image43" runat="server" ImageUrl="~/Administrators/Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label22" runat="server" Font-Bold="True" Text="Sorry, No Data!"></asp:Label>
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="28px" />
                </asp:GridView>
                <br />
                <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="Red" Text="Found Staff:"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridviewStaff" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceStaff" PageSize="5" Width="680px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image44" runat="server" ImageUrl="~/Administrators/Images/edit.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="School Code" SortExpression="SchoolCode">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListSchoolCodes1" runat="server" AppendDataBoundItems="True"
                                    DataSourceID="SqlDataSourceSchoolCodes" DataTextField="SchoolName" DataValueField="SchoolCode"
                                    SelectedValue='<%# Bind("SchoolCode") %>' Width="90%">
                                    <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="180px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name" SortExpression="UserName">
                            <ItemTemplate>
                                <asp:Label ID="LabelUserName1" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="130px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="StaffName" HeaderText="Staff Name" SortExpression="StaffName" />
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <asp:Image ID="Image45" runat="server" ImageUrl="~/Administrators/Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label24" runat="server" Font-Bold="True" Text="Sorry, No Data!"></asp:Label>
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="28px" />
                </asp:GridView>
                <br />
                <asp:Label ID="Label27" runat="server" Font-Bold="True" ForeColor="Red" Text="Found Parents:"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridviewParents" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceParents" PageSize="5" Width="680px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image46" runat="server" ImageUrl="~/Administrators/Images/edit.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="School Code" SortExpression="SchoolCode">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListSchoolCodes2" runat="server" AppendDataBoundItems="True"
                                    DataSourceID="SqlDataSourceSchoolCodes" DataTextField="SchoolName" DataValueField="SchoolCode"
                                    SelectedValue='<%# Bind("SchoolCode") %>' Width="90%">
                                    <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="180px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name" SortExpression="UserName">
                            <ItemTemplate>
                                <asp:Label ID="LabelUserName2" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="130px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="FatherName" HeaderText="FatherName" SortExpression="FatherName" />
                        <asp:BoundField DataField="MotherName" HeaderText="MotherName" SortExpression="MotherName" />
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <asp:Image ID="Image47" runat="server" ImageUrl="~/Administrators/Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label26" runat="server" Font-Bold="True" Text="Sorry, No Data!"></asp:Label>
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="28px" />
                </asp:GridView>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    InsertCommand="INSERT INTO aspnet_Roles(RoleName) VALUES (@RoleName)" SelectCommand="SELECT RoleId, RoleName FROM aspnet_Roles">
                    <InsertParameters>
                        <asp:Parameter Name="RoleName" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT tbl_Students.StudentID, tbl_Students.SchoolCode, aspnet_Users.UserName, tbl_SectionCatalog.SectionCatalog, tbl_Students.StudentName FROM tbl_Students INNER JOIN tbl_SectionCatalog ON tbl_Students.CurrentSectionID = tbl_SectionCatalog.SectionCatalogID LEFT OUTER JOIN aspnet_Users ON tbl_Students.StudentID = aspnet_Users.UserId ORDER BY tbl_Students.StudentName"
                    FilterExpression="UserName LIKE '%{0}%' OR StudentName LIKE '%{0}%'" UpdateCommand="UPDATE aspnet_Users SET SchoolCode = @SchoolCode WHERE (UserId = @UserId)

UPDATE aspnet_Administrators SET IsApproved = @IsApproved, IsLockedOut = @IsLockedOut WHERE (UserId = @UserId)">
                    <FilterParameters>
                        <asp:ControlParameter ControlID="TextBoxSearchUser" Name="ParameterUserName" PropertyName="Text"
                            ConvertEmptyStringToNull="False" />
                    </FilterParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SchoolCode" />
                        <asp:Parameter Name="UserId" />
                        <asp:Parameter Name="IsApproved" />
                        <asp:Parameter Name="IsLockedOut" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    FilterExpression="UserName LIKE '%{0}%' OR StaffName LIKE '%{0}%'" SelectCommand="SELECT tbl_Staff.StaffID, tbl_Staff.StaffName, tbl_Staff.SchoolCode, aspnet_Users.UserName FROM tbl_Staff LEFT OUTER JOIN aspnet_Users ON tbl_Staff.StaffID = aspnet_Users.UserId ORDER BY tbl_Staff.StaffName"
                    UpdateCommand="UPDATE aspnet_Users SET SchoolCode = @SchoolCode WHERE (UserId = @UserId)

UPDATE aspnet_Administrators SET IsApproved = @IsApproved, IsLockedOut = @IsLockedOut WHERE (UserId = @UserId)">
                    <FilterParameters>
                        <asp:ControlParameter ControlID="TextBoxSearchUser" ConvertEmptyStringToNull="False"
                            Name="ParameterUserName" PropertyName="Text" />
                    </FilterParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SchoolCode" />
                        <asp:Parameter Name="UserId" />
                        <asp:Parameter Name="IsApproved" />
                        <asp:Parameter Name="IsLockedOut" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceParents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    FilterExpression="UserName LIKE '%{0}%' OR FatherName LIKE '%{0}%' OR MotherName LIKE '%{0}%'"
                    SelectCommand="SELECT tbl_Parents.FatherName, tbl_Parents.MotherName, tbl_Parents.SchoolCode, tbl_Parents.ResponsibleParentID, aspnet_Users.UserName FROM tbl_Parents LEFT OUTER JOIN aspnet_Users ON tbl_Parents.ResponsibleParentID = aspnet_Users.UserId"
                    UpdateCommand="UPDATE aspnet_Users SET SchoolCode = @SchoolCode WHERE (UserId = @UserId)

UPDATE aspnet_Administrators SET IsApproved = @IsApproved, IsLockedOut = @IsLockedOut WHERE (UserId = @UserId)">
                    <FilterParameters>
                        <asp:ControlParameter ControlID="TextBoxSearchUser" ConvertEmptyStringToNull="False"
                            Name="ParameterUserName" PropertyName="Text" />
                    </FilterParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SchoolCode" />
                        <asp:Parameter Name="UserId" />
                        <asp:Parameter Name="IsApproved" />
                        <asp:Parameter Name="IsLockedOut" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceUserList" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    FilterExpression="UserName LIKE '%{0}%'" SelectCommand="SELECT aspnet_Users.UserId, aspnet_Roles.RoleId, aspnet_Roles.RoleName, aspnet_Users.SchoolCode, aspnet_Users.LastActivityDate, aspnet_Users.UserName, aspnet_Administrators.IsApproved, aspnet_Administrators.IsLockedOut FROM aspnet_UsersInRoles INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId INNER JOIN aspnet_Users ON aspnet_UsersInRoles.UserId = aspnet_Users.UserId INNER JOIN aspnet_Administrators ON aspnet_Users.UserId = aspnet_Administrators.UserId"
                    UpdateCommand="UPDATE aspnet_Users SET SchoolCode = @SchoolCode WHERE (UserId = @UserId)

UPDATE aspnet_Administrators SET IsApproved = @IsApproved, IsLockedOut = @IsLockedOut WHERE (UserId = @UserId)">
                    <FilterParameters>
                        <asp:ControlParameter ControlID="TextBoxSearchUser" ConvertEmptyStringToNull="False"
                            Name="ParameterUserName" PropertyName="Text" />
                    </FilterParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SchoolCode" />
                        <asp:Parameter Name="UserId" />
                        <asp:Parameter Name="IsApproved" />
                        <asp:Parameter Name="IsLockedOut" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" 
                    SelectCommand="SELECT SchoolCode, SchoolName FROM tbl_Schools ORDER BY SchoolName">
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
