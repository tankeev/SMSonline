<%@ Page Title="SIS Department Staff" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="DepartmentStaff.aspx.vb" Inherits="NewUserAccount" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div id="right_wrap">
                <div id="right_content">
                    <h2>
                        INFORMATION</h2>
                    <br />
                    <div id="divChild">
                        <br />
                        <asp:Panel ID="PanelSearch" runat="server" DefaultButton="ButtonSearch">
                            <table class="SISTable" width="98%">
                                <tr>
                                    <td height="30">
                                        <asp:Label ID="LabelSearch" runat="server" Font-Bold="True" Text="Search Username or Staff Name or University Name:"></asp:Label>
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
                        <asp:GridView ID="GridViewDepartmentStaff" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="StaffID" DataSourceID="SqlDataSourceDepartmentStaff" Width="100%"
                            AllowPaging="True" PageSize="5">
                            <Columns>
                                <asp:TemplateField HeaderText="Photo">
                                    <ItemTemplate>
                                        <asp:Image ID="ImagePhoto" runat="server" ImageUrl='<%#"~/SchoolData/UploadedPhotos/"+Eval("PhotoURL") %>'
                                            Width="100%" />
                                    </ItemTemplate>
                                    <ItemStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Staff Details" SortExpression="StaffName">
                                    <ItemTemplate>
                                        <table width="100%">
                                            <tr>
                                                <td width="25" height="25">
                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Department/Images/row.gif" />
                                                </td>
                                                <td width="90">
                                                    <asp:Label ID="Label31" runat="server" Text="Username:" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td width="180">
                                                    <asp:Label ID="LabelUsername" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                                                </td>
                                                <td width="25">
                                                    <asp:Image ID="Image5" runat="server" ImageUrl="~/Department/Images/row.gif" />
                                                </td>
                                                <td width="90">
                                                    <asp:Label ID="Label28" runat="server" Text="Phone:" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="LabelContactPhone" runat="server" Text='<%# Bind("ContactPhone1") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25">
                                                    <asp:Image ID="Image10" runat="server" ImageUrl="~/Department/Images/row.gif" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label25" runat="server" Text="Staff Name:" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="LabelStaffName" runat="server" Text='<%# Bind("StaffName") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image9" runat="server" ImageUrl="~/Department/Images/row.gif" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label29" runat="server" Text="University:" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="LabelUniversity" runat="server" Text='<%# Bind("University") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25">
                                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Department/Images/row.gif" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label26" runat="server" Text="School Name:" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="LabelSchoolName" runat="server" Text='<%# Bind("SchoolName") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image8" runat="server" ImageUrl="~/Department/Images/row.gif" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label30" runat="server" Text="Department:" ForeColor="Red"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="LabelDepartment" runat="server" Text='<%# Bind("Department") %>'></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <ItemStyle VerticalAlign="Top" />
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div align="center">
                                    <br />
                                    <img alt="" src="../Administrators/Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                                    <br />
                                    <br />
                                    <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" Text="Sorry! No Staff Found!"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="LabelWarning1" runat="server" Font-Bold="True" ForeColor="Red" Text="Please Select Your Default Departments from Menu"></asp:Label>
                                    <br />
                                    <br />
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <br />
                        <asp:Label ID="LabelTotal" runat="server" Font-Bold="True"></asp:Label>
                        <br />
                        <br />
                    </div>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT SchoolCode, SchoolName, Show FROM tbl_Schools WHERE (Show = 1)  ORDER BY SchoolName">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceStaffCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT DISTINCT TOP (100) PERCENT tbl_CourseCategories.CourseCategory FROM tbl_CourseSections INNER JOIN tbl_CourseCatalog ON tbl_CourseSections.CourseCatalogID = tbl_CourseCatalog.CourseCatalogID INNER JOIN tbl_CourseCategories ON tbl_CourseCatalog.CourseCategoryID = tbl_CourseCategories.CourseCategoryID WHERE (tbl_CourseSections.AcademicTermID = @AcademicTermID) AND (tbl_CourseSections.SchoolCode = @SchoolCode) AND (tbl_CourseSections.StaffID = @StaffID) AND (tbl_CourseCategories.CourseCategory &lt;&gt; N'Guidance') ORDER BY tbl_CourseCategories.CourseCategory">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListAcademicTerms" Name="AcademicTermID"
                                PropertyName="SelectedValue" />
                            <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                            <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceDepartmentStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        FilterExpression="UserName LIKE '{0}%' OR StaffName LIKE '{0}%' OR University LIKE '{0}%'"
                        SelectCommand="SELECT DISTINCT tbl_Staff.StaffID, tbl_Staff.StaffName, aspnet_Users.PhotoUrl, tbl_Schools.SchoolName, tbl_Staff.DateofBirth, tbl_Staff.ContactPhone1, tbl_Staff.University, tbl_Staff.Department, aspnet_Users.UserName, tbl_CourseCategories.CourseCategory, tbl_CourseSections.AcademicTermID, tbl_Staff.SchoolCode FROM tbl_CourseCatalog INNER JOIN tbl_CourseSections ON tbl_CourseCatalog.CourseCatalogID = tbl_CourseSections.CourseCatalogID INNER JOIN tbl_Staff INNER JOIN aspnet_Users ON tbl_Staff.StaffID = aspnet_Users.UserId INNER JOIN tbl_Schools ON tbl_Staff.SchoolCode = tbl_Schools.SchoolCode ON tbl_CourseSections.StaffID = tbl_Staff.StaffID INNER JOIN tbl_CourseCategories ON tbl_CourseCatalog.CourseCategoryID = tbl_CourseCategories.CourseCategoryID WHERE (tbl_CourseSections.AcademicTermID = @AcademicTermID) AND (tbl_CourseCategories.CourseCategory = @CourseCategory) ORDER BY tbl_Staff.StaffName">
                        <FilterParameters>
                            <asp:ControlParameter ControlID="TextBoxSearchUser" ConvertEmptyStringToNull="False"
                                Name="ParameterUserName" PropertyName="Text" />
                        </FilterParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListAcademicTerms" Name="AcademicTermID"
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="RadioButtonListCourses" Name="CourseCategory" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                </div>
            </div>
            <div class="sidebar" id="sidebar">
                <h2>
                    CLASSES</h2>
                <br />
                <table class="SISTable" width="230">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew0" runat="server" ImageUrl="~/Department/Images/editor.png"
                                NavigateUrl="~/Department/DepartmentStaff.aspx" Enabled="False">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label24" runat="server" Text="Department Staff" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="SISTable" width="230">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                                NavigateUrl="~/Department/DepartmentForum.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Department Forum"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="SISTable" width="230">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                                NavigateUrl="~/Department/StaffAssignments.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Staff Assignments"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="SISTable" width="230">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/Coordinators/Images/editor.png"
                                NavigateUrl="~/Department/SharedDocuments.aspx">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Shared Documents"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="SISTable" width="230">
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label32" runat="server" ForeColor="Red" Text="Select Your Department:"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:RadioButtonList ID="RadioButtonListCourses" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceStaffCourses" DataTextField="CourseCategory" DataValueField="CourseCategory"
                                Width="100%">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="20">
                            
                        </td>
                    </tr>
                </table>
                <br />
                <table class="SISTable" width="230">
                    <tr>
                        <td height="30">
                            <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" DataSourceID="SqlDataSourceAcademicTerms"
                                DataTextField="AcademicTerm" DataValueField="AcademicTermID" Width="95%" Enabled="False">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:CheckBox ID="CheckBoxFilter" runat="server" AutoPostBack="True" ForeColor="Red"
                                Text="Filter By School Name?" />
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:ListBox ID="ListBoxSchoolCodes" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceSchoolCodes"
                                DataTextField="SchoolName" DataValueField="SchoolCode" Height="200px" Width="95%">
                            </asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="clear">
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
