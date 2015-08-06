<%@ Page Title="SIS Search Users" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="UsersSearch.aspx.vb" Inherits="Users_Search" %>

<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uswnb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuUsers.ascx" TagName="MenuUsers" TagPrefix="uc1" %>
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
                <uc1:MenuUsers ID="MenuUsers" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkUsersSearchTable" runat="server" ImageUrl="~/Staff/Images/menu_search.png"
                                NavigateUrl="~/Staff/UsersSearch.aspx" ToolTip="Search Users">Add New</asp:HyperLink>
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
                            <asp:HyperLink ID="HyperLinkStudentsTable" runat="server" ImageUrl="~/Staff/Images/menu_students.png"
                                NavigateUrl="~/Staff/UsersStudents.aspx">Add New</asp:HyperLink>
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
                            <asp:HyperLink ID="HyperLinkParentsTable" runat="server" ImageUrl="~/Staff/Images/menu_parents.png"
                                NavigateUrl="~/Staff/UsersParents.aspx">Add New</asp:HyperLink>
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
                <asp:Panel ID="PanelSearch" runat="server" DefaultButton="ButtonSearch" 
                    Width="680px">
                    <table class="content-table" width="680">
                        <tr>
                            <td height="30">
                                <asp:Label ID="LabelSearch" runat="server" Font-Bold="True" Text="Username or Student Name or Staff Name or Parent Name:"></asp:Label>
                            </td>
                            <td height="25" width="180">
                                <asp:TextBox ID="TextBoxSearch" runat="server" Width="160px"></asp:TextBox>
                            </td>
                            <td height="25" width="50">
                                <asp:Button ID="ButtonSearch" runat="server" Text="Find" Width="40px" PostBackUrl="UsersSearch.aspx" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:GridView ID="GridviewUsers" runat="server" AutoGenerateColumns="False" Width="680px"
                    OnRowDataBound="OnRowDataBound" OnPageIndexChanging="OnPageIndexChangingGridviewUsers"
                    AllowPaging="True">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Staff/Images/edit.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="School Name">
                            <ItemTemplate>
                                <asp:Label ID="LabelSchoolName" runat="server" Text='<%# Eval("SchoolName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="250px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name">
                            <ItemTemplate>
                                <asp:Label ID="LabelUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="130px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Role">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("RoleName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Activity Date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LastActivityDate") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastActivityDate") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="145px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <asp:Image ID="Image41" runat="server" ImageUrl="~/Staff/Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Sorry, No User Found!"></asp:Label>
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="28px" />
                </asp:GridView>
                <br />
                <asp:Label ID="Label23" runat="server" Font-Bold="True" ForeColor="Red" Text="Found Students:"></asp:Label>
                <br />
                <br />
                <asp:Panel ID="PanelStudents" runat="server">
                    <div id="divEmptyStudents" align="center">
                        <br />
                        <asp:Image ID="Image48" runat="server" ImageUrl="~/Staff/Images/warning.png" />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="Label37" runat="server" Font-Bold="True" Text="Results from Student Data will be listed here!"></asp:Label>
                        <br />
                        <br />
                    </div>
                </asp:Panel>
                <asp:GridView ID="GridviewStudents" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    OnRowDataBound="OnRowDataBound" OnPageIndexChanging="OnPageIndexChangingGridviewStudents"
                    PageSize="5" Width="100%">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image42" runat="server" ImageUrl="~/Staff/Images/edit.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="School Name">
                            <ItemTemplate>
                                <asp:Label ID="Label34" runat="server" Text='<%# Eval("SchoolName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="250px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name">
                            <ItemTemplate>
                                <asp:Label ID="LabelUserName0" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="130px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Section">
                    
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("SectionCatalog") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="80px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student Name">
                   
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("StudentName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <asp:Image ID="Image43" runat="server" ImageUrl="~/Staff/Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label22" runat="server" Font-Bold="True" Text="Sorry, No Student Found!"></asp:Label>
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="28px" />
                </asp:GridView>
                <br />
                <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="Red" Text="Found Staff:"></asp:Label>
                <br />
                <br />
                <asp:Panel ID="PanelStaff" runat="server">
                    <div id="divEmptyStaff" align="center">
                        <br />
                        <asp:Image ID="Image49" runat="server" ImageUrl="~/Staff/Images/warning.png" />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="Label38" runat="server" Font-Bold="True" Text="Results from Staff Data will be listed here!"></asp:Label>
                        <br />
                        <br />
                    </div>
                </asp:Panel>
                <asp:GridView ID="GridviewStaff" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    OnRowDataBound="OnRowDataBound" OnPageIndexChanging="OnPageIndexChangingGridviewStaff"
                    PageSize="5" Width="100%">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image44" runat="server" ImageUrl="~/Staff/Images/edit.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="School Name">
                            <ItemTemplate>
                                <asp:Label ID="Label35" runat="server" Text='<%# Eval("SchoolName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="250px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name">
                            <ItemTemplate>
                                <asp:Label ID="LabelUserName1" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="130px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Staff Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StaffName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("StaffName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <asp:Image ID="Image45" runat="server" ImageUrl="~/Staff/Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label24" runat="server" Font-Bold="True" Text="Sorry, No Staff Found!"></asp:Label>
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="28px" />
                </asp:GridView>
                <br />
                <asp:Label ID="Label27" runat="server" Font-Bold="True" ForeColor="Red" Text="Found Parents:"></asp:Label>
                <br />
                <br />
                <asp:Panel ID="PanelParents" runat="server">
                    <div id="divEmptyParents" align="center">
                        <br />
                        <asp:Image ID="Image50" runat="server" ImageUrl="~/Staff/Images/warning.png" />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="Label39" runat="server" Font-Bold="True" Text="Results from Parents Data will be listed here!"></asp:Label>
                        <br />
                        <br />
                    </div>
                </asp:Panel>
                <asp:GridView ID="GridviewParents" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    OnRowDataBound="OnRowDataBound" OnPageIndexChanging="OnPageIndexChangingGridviewParents"
                    PageSize="5" Width="100%">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image46" runat="server" ImageUrl="~/Staff/Images/edit.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="School Name">
                            <ItemTemplate>
                                <asp:Label ID="Label36" runat="server" Text='<%# Eval("SchoolName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="250px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name">
                            <ItemTemplate>
                                <asp:Label ID="LabelUserName2" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="130px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FatherName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FatherName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("FatherName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="MotherName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MotherName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("MotherName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <asp:Image ID="Image47" runat="server" ImageUrl="~/Staff/Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label26" runat="server" Font-Bold="True" Text="Sorry, No Users Found!"></asp:Label>
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="28px" />
                </asp:GridView>
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
