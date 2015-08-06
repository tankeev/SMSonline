<%@ Page Title="SIS Courses" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="Courses.aspx.vb" Inherits="UserList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
                <table class="content-table" width="240">
                    <tr>
                        <td height="50" width="50">
                            <asp:HyperLink ID="HyperLinkCourses" runat="server" ImageUrl="~/Administrators/Images/menu_courses.png"
                                NavigateUrl="~/Administrators/Courses.aspx" ToolTip="Courses"></asp:HyperLink>
                        </td>
                        <td width="50">
                            <asp:HyperLink ID="HyperLinkAddStudents" runat="server" ImageUrl="~/Administrators/Images/menu_courses_add.png"
                                NavigateUrl="~/Administrators/CoursesAdd.aspx" ToolTip="Add Students"></asp:HyperLink>
                        </td>
                        <td width="50">
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
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
                            <asp:Label ID="Label44" runat="server" Font-Bold="True" ForeColor="Red" Text="Select School Section"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListSections" runat="server" DataSourceID="SqlDataSourceSections"
                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" RepeatColumns="4"
                                Width="95%" AutoPostBack="True">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    COURSES</h2>
                <br />
                <asp:TabContainer ID="TabContainerCourses" runat="server" ActiveTabIndex="0" CssClass="tab"
                    Width="675px">
                    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                        <HeaderTemplate>
                            COURSE TEACHERS
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:GridView ID="GridViewCourseSections" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="CourseSectionID" DataSourceID="SqlDataSourceGridviewCourseSections"
                                Width="100%">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Administrators/Images/Item.png" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="40px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <strong>
                                                <%# Container.DataItemIndex + 1 %></strong>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Course" SortExpression="CourseCatalog">
                                        <ItemTemplate>
                                            <asp:Label ID="LabelCourse" runat="server" Text='<%# Eval("CourseCatalog") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="150px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Staff Name" SortExpression="StaffName">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="DropDownListStaff" runat="server" DataSourceID="SqlDataSourceDropDownListStaff"
                                                DataTextField="StaffName" DataValueField="StaffID" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "StaffID") %>'
                                                Width="95%">
                                                <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField SortExpression="IsAcademic">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBoxIsAcademic" runat="server" Checked='<%# Bind("IsAcademic") %>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButtonUpdate" runat="server" CommandName="Update" ImageUrl="~/Administrators/Images/save.gif"
                                                ToolTip="Update!" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="40px" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div align="center">
                                        <br />
                                        <img alt="" src="../Administrators/Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                                        <br />
                                        <br />
                                        <asp:Label ID="LabelWarning1" runat="server" Font-Bold="True" Text="Sorry! No Data Found!"></asp:Label>
                                        <br />
                                        <br />
                                    </div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <br />
                            <asp:Label ID="LabelGridStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSourceGridviewCourseSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT tbl_CourseSections.CourseSectionID, tbl_CourseSections.StaffID, tbl_CourseSections.CourseCatalogID, tbl_CourseCatalog.CourseCatalog, tbl_CourseCatalog.IsAcademic FROM tbl_CourseSections INNER JOIN tbl_CourseCatalog ON tbl_CourseSections.CourseCatalogID = tbl_CourseCatalog.CourseCatalogID WHERE (tbl_CourseSections.SectionCatalogID = @SectionCatalogID) AND (tbl_CourseSections.AcademicTermID = @AcademicTermID) AND (tbl_CourseSections.SchoolCode = @SchoolCode)"
                                UpdateCommand="UPDATE tbl_CourseSections SET StaffID = @StaffID WHERE (CourseSectionID = @CourseSectionID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="RadioButtonListSections" Name="SectionCatalogID"
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="StaffID" />
                                    <asp:Parameter Name="CourseSectionID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceDropDownListStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT StaffID, StaffName FROM vw_UsersStaff WHERE (SchoolCode = @SchoolCode) ORDER BY StaffName">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                        <HeaderTemplate>
                            SECTION COURSES
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Section Course Settings:"></asp:Label>
                            <br />
                            <br />
                            <asp:CheckBoxList ID="CheckBoxListCourses" runat="server" DataSourceID="SqlDataSourceAllCourses"
                                DataTextField="CourseCode" DataValueField="CourseCatalogID" RepeatColumns="9"
                                Width="100%" Font-Size="XX-Small">
                            </asp:CheckBoxList>
                            <br />
                            <asp:Label ID="Label24" runat="server" Font-Bold="True" Text="Teacher Settings:"></asp:Label>
                            <br />
                            <br />
                            <asp:DropDownList ID="DropDownListCourseTeacher" runat="server" DataSourceID="SqlDataSourceDropDownListCourseTeacher"
                                DataTextField="StaffName" DataValueField="StaffID" Width="100%">
                            </asp:DropDownList>
                            <br />
                            <br />
                            <asp:Label ID="Label11" runat="server" ForeColor="Red" Text="After Update, Check Subject Teacher and Enrolled Students Settings from Courses Page. "></asp:Label>
                            <br />
                            <br />
                            <asp:Button ID="ButtonUpdateCourses" runat="server" OnClientClick="return confirm('Are you sure? Selected Courses will be Updated and UnSelected Courses will be REMOVED!')"
                                Text="Update Courses" Width="100%" />
                            <br />
                            <br />
                            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            <br />
                            <br />
                            <asp:SqlDataSource ID="SqlDataSourceAllCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT CourseCatalogID, CourseCode, IsAcademic FROM tbl_CourseCatalog ORDER BY CourseCode">
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceCheckBoxListCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                DeleteCommand="DELETE FROM tbl_CourseSections WHERE (AcademicTermID = @AcademicTermID) AND (SchoolCode = @SchoolCode) AND (CourseCatalogID = @CourseCatalogID) AND (SectionCatalogID = @SectionCatalogID)"
                                InsertCommand="IF NOT EXISTS ( SELECT AcademicTermID, SchoolCode, CourseCatalogID, SectionCatalogID FROM vw_CourseSections WHERE (SectionCatalogID = @SectionCatalogID) AND (SchoolCode = @SchoolCode) AND (CourseCatalogID = @CourseCatalogID) AND (AcademicTermID = @AcademicTermID) ) INSERT INTO tbl_CourseSections(AcademicTermID, SchoolCode, CourseCatalogID, StaffID, SectionCatalogID) VALUES (@AcademicTermID, @SchoolCode, @CourseCatalogID, @StaffID, @SectionCatalogID)"
                                SelectCommand="SELECT tbl_CourseSections.CourseCatalogID, tbl_CourseCatalog.CourseCatalog FROM tbl_CourseSections INNER JOIN tbl_CourseCatalog ON tbl_CourseSections.CourseCatalogID = tbl_CourseCatalog.CourseCatalogID WHERE (tbl_CourseSections.SectionCatalogID = @SectionCatalogID) AND (tbl_CourseSections.AcademicTermID = @AcademicTermID) AND (tbl_CourseSections.SchoolCode = @SchoolCode)">
                                <DeleteParameters>
                                    <asp:Parameter Name="AcademicTermID" />
                                    <asp:Parameter Name="SchoolCode" />
                                    <asp:Parameter Name="CourseCatalogID" />
                                    <asp:Parameter Name="SectionCatalogID" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="ListBoxSchoolSections" Name="SectionCatalogID" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="LDropDownListSchoolCodesMaster" Name="SchoolCode"
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownListCourses" Name="CourseCatalogID" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownListCourseTeacher" Name="StaffID" PropertyName="SelectedValue" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="RadioButtonListSections" Name="SectionCatalogID"
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                                        PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceDropDownListCourseTeacher" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT StaffID, StaffName FROM vw_UsersStaff WHERE (SchoolCode = @SchoolCode) ORDER BY StaffName">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) AND (SectionSchool = @SectionSchool) ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSectionSchool" Name="SectionSchool"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
