<%@ Page Title="SIS Add New School" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="SchoolsAdd.aspx.vb" Inherits="UserList" %>

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
                        <td width="40">
                            <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Administrators/Images/menu_school.png"
                                NavigateUrl="~/Administrators/Schools.aspx" ToolTip="School Details">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="School Details"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew" runat="server" ImageUrl="~/Administrators/Images/menu_school_add.png"
                                NavigateUrl="~/Administrators/SchoolsAdd.aspx" ToolTip="Add New School">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label25" runat="server" Text="Add New School" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    ADD NEW SCHOOL</h2>
                <br />
      
                    <asp:FormView ID="FormViewSchools" runat="server" DataSourceID="SqlDataSourceFormViewSchools"
                        DefaultMode="Insert" DataKeyNames="SchoolID" Width="680px">
                        <EmptyDataTemplate>
                            <div align="center">
                                <br />
                                <asp:Image ID="Image41" runat="server" ImageUrl="~/Administrators/Images/warning.png" />
                                <br />
                                <br />
                                <br />
                                <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Select A Staff Please!"></asp:Label>
                                <br />
                                <br />
                            </div>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <table id="StudentTable" width="100%">
                                <tr>
                                    <td height="28" width="20">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td width="120">
                                        <asp:Label ID="Label19" runat="server" meta:resourcekey="Label1Resource1" Text="School Name:"></asp:Label>
                                    </td>
                                    <td width="240">
                                        <asp:TextBox ID="TextBoxSchoolName" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                            Text='<%# Bind("SchoolName") %>' Width="220px"></asp:TextBox>
                                    </td>
                                    <td width="35">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxSchoolName"
                                            ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" ValidationGroup="AddSchool">(*)</asp:RequiredFieldValidator>
                                    </td>
                                    <td colspan="2" rowspan="11" valign="top">
                                        <img src='../UserData/000.jpg' style="border: 3px solid #C0C0C0" width="150" />
                                        <br />
                                        <br />
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28">
                                        <asp:Image ID="Image14" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label24" runat="server" meta:resourcekey="Label1Resource1" Text="School Code:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxSchoolCode" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                            Text='<%# Bind("SchoolCode") %>' Width="220px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxSchoolCode"
                                            ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" ValidationGroup="AddSchool">(*)</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28">
                                        <asp:Image ID="Image11" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="Principal Name:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownListUsers" runat="server" AppendDataBoundItems="True"
                                            DataSourceID="SqlDataSourceUsers" DataTextField="UserName" DataValueField="UserId"
                                            SelectedValue='<%# Bind("PrincipalID") %>' Width="230px">
                                            <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28">
                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1" Text="Contact Phone 1:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxDateofBirth" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                            Text='<%# Bind("ContactPhone1") %>' Width="220px"></asp:TextBox>
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28">
                                        <asp:Image ID="Image13" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label20" runat="server" meta:resourcekey="Label5Resource1" Text="Contact Phone 2:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxBirthPlace" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                            Text='<%# Bind("ContactPhone2") %>' Width="220px"></asp:TextBox>
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="32">
                                        <asp:Image ID="Image6" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label23" runat="server" meta:resourcekey="Label5Resource1" Text="City:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxBirthPlace1" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                            Text='<%# Bind("City") %>' Width="220px"></asp:TextBox>
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" valign="top">
                                        <asp:Image ID="Image10" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td valign="top">
                                        <asp:Label ID="Label22" runat="server" meta:resourcekey="Label5Resource1" Text="Contact Address:"></asp:Label>
                                    </td>
                                    <td valign="top">
                                        <asp:TextBox ID="TextBoxBirthPlace0" runat="server" Height="80px" MaxLength="50"
                                            meta:resourcekey="TextBoxSexResource1" Text='<%# Bind("ContactAddress") %>' TextMode="MultiLine"
                                            Width="220px"></asp:TextBox>
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28">
                                        <asp:Image ID="Image12" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" meta:resourcekey="Label7Resource1" Text="Contact Email:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxContactEmail" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                            Text='<%# Bind("ContactEmail") %>' Width="220px"></asp:TextBox>
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28">
                                        <asp:Image ID="Image15" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label21" runat="server" meta:resourcekey="Label7Resource1" Text="Web Address:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxWebAddress" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                            Text='<%# Bind("WebAddress") %>' Width="220px"></asp:TextBox>
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28">
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="CheckBoxShow" runat="server" Checked='<%# Bind("Show") %>' ForeColor="Red"
                                            Text="Visible on the List?" />
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28">
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        <asp:HyperLink ID="HyperLink" runat="server" NavigateUrl='<%# Eval("WebAddress", "http://{0}")  %>'
                                            Text='<%# Eval("WebAddress") %>' Target="_blank"></asp:HyperLink>
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28">
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        <asp:Button ID="Update" runat="server" CommandName="Insert" Text="Add School" Width="220px"
                                            ValidationGroup="AddSchool" />
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28">
                                        
                                    </td>
                                    <td height="28">
                                        
                                    </td>
                                    <td height="28">
                                        
                                    </td>
                                    <td height="28">
                                        
                                    </td>
                                    <td height="28" width="120">
                                        
                                    </td>
                                    <td height="28">
                                        
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                    </asp:FormView>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSourceGridViewSchools" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT * FROM [tbl_Schools] ORDER BY [SchoolCode]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceFormViewSchools" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT SchoolID, SchoolCode, SchoolName, PrincipalID, ContactPhone1, ContactPhone2, ContactEmail, WebAddress, City, ContactAddress FROM tbl_Schools"
                        InsertCommand="INSERT INTO tbl_Schools(SchoolCode, SchoolName, PrincipalID, ContactPhone1, ContactPhone2, ContactEmail, WebAddress, City, ContactAddress) VALUES (@SchoolCode, @SchoolName, @PrincipalID, @ContactPhone1, @ContactPhone2, @ContactEmail, @WebAddress, @City, @ContactAddress)">
                        <InsertParameters>
                            <asp:Parameter Name="SchoolCode" />
                            <asp:Parameter Name="SchoolName" />
                            <asp:Parameter Name="PrincipalID" />
                            <asp:Parameter Name="ContactPhone1" />
                            <asp:Parameter Name="ContactPhone2" />
                            <asp:Parameter Name="ContactEmail" />
                            <asp:Parameter Name="WebAddress" />
                            <asp:Parameter Name="City" />
                            <asp:Parameter Name="ContactAddress" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT aspnet_Users.UserId, aspnet_Users.UserName, aspnet_Roles.RoleName FROM aspnet_Users INNER JOIN vw_aspnet_UsersInRoles ON aspnet_Users.UserId = vw_aspnet_UsersInRoles.UserId INNER JOIN aspnet_Roles ON vw_aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId WHERE (aspnet_Roles.RoleName &lt;&gt; N'Student') AND (aspnet_Roles.RoleName &lt;&gt; N'Parent')">
                    </asp:SqlDataSource>
                    <br />
                    <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    <br />
                    <br />
          
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
