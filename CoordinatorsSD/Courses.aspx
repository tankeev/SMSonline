<%@ Page Title="SIS Courses" Language="VB" MasterPageFile="~/Site.Master" CodeFile="Courses.aspx.vb"
    Inherits="UserList" %>

<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uswnb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    COURSES</h2>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew" runat="server" ImageUrl="~/CoordinatorsSD/Images/editor.png"
                                NavigateUrl="~/CoordinatorsSD/CoursesAdd.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label23" runat="server" Text="Add Students to Course"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Button ID="ButtonShowCourses" runat="server" Text="Add New Course" Width="95%" />
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label25" runat="server" Text="Available Sections"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DataList ID="DataListSections" runat="server" DataSourceID="SqlDataSourceSections"
                                RepeatColumns="5" Width="95%" Font-Size="X-Small" ForeColor="Red">
                                <ItemTemplate>
                                    <asp:Label ID="Label82" runat="server" Text='<%# Eval("SectionCatalog") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                            <asp:Button ID="ButtonHidden" runat="server" Text="Hidden Button" Style="display: none;" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:ModalPopupExtender ID="MPAddCourses" runat="server" BackgroundCssClass="modalBackground"
                    CancelControlID="ButtonGroupsCancel" OnCancelScript="DoCancel()" PopupControlID="PanelAddCourses"
                    TargetControlID="ButtonHidden">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelAddCourses" runat="server" CssClass="modalPopup" Style="display: none;"
                    Width="240px">
                    <table width="100%">
                        <tr>
                            <td height="25">
                                <asp:Button ID="ButtonGroupsCancel" runat="server" Text="Close" Width="98%" />
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Label ID="Label33" runat="server" Font-Bold="True" Text="Select Course:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:DropDownList ID="DropDownListCourses" runat="server" DataSourceID="SqlDataSourceDropDownListCourses"
                                    DataTextField="CourseCategory" DataValueField="CourseCatalogID" Width="100%">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Label ID="Label34" runat="server" Font-Bold="True" Text="Select Staff:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:DropDownList ID="DropDownListCourseTeacher" runat="server" DataSourceID="SqlDataSourceDropDownListStaff"
                                    DataTextField="StaffName" DataValueField="StaffID" Width="100%">
                                    <asp:ListItem Value="">Not Specified!</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Label ID="LabelStatusAddCourse" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <asp:Button ID="ButtonUpdateCourses" runat="server" Text="Add Course" Width="100%" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    INFORMATION</h2>
                <br />
                <asp:Label ID="Label29" runat="server" Font-Bold="True" ForeColor="#990000" Text="/////////////////////// USE THIS SECTION TO SELECT CLASS"></asp:Label>
                <br />
                <br />
                <asp:Label ID="LabelSectionInfo" runat="server" Text="Select a Section to see assigned courses."
                    ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:RadioButtonList ID="RadioButtonListSections" runat="server" AutoPostBack="True"
                    DataSourceID="SqlDataSourceRadioButtonListSections" DataTextField="SectionCatalog"
                    DataValueField="SectionCatalogID" RepeatColumns="10" Width="100%">
                </asp:RadioButtonList>
                <br />
                <asp:Label ID="Label30" runat="server" Font-Bold="True" ForeColor="#990000" Text="/////////////////////// USE THIS SECTION TO SET SUBJECT TEACHERS"></asp:Label>
                <br />
                <br />
                <asp:Label ID="LabelSectionInfo2" runat="server" ForeColor="Red" Text="To update course teacher, please use the list below. Do not forget to update your changes."></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridViewCourseSections" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceGridviewCourseSections" Width="100%" DataKeyNames="CourseSectionID">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/CoordinatorsSD/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="40px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <strong>
                                    <%# Container.DataItemIndex + 1 %>
                                </strong>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Course Catalog" SortExpression="CourseCatalogID">
                            <ItemTemplate>
                                <asp:Label ID="Label32" runat="server" Text='<%# Eval("CourseCatalog") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="200px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Staff Name" SortExpression="StaffName">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListStaff" runat="server" DataSourceID="SqlDataSourceDropDownListStaff"
                                    DataTextField="StaffName" DataValueField="StaffID" Width="95%" SelectedValue='<%# Bind("StaffID") %>'>
                                    <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Sorry! No Courses Found!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:Button ID="ButtonUpdateTeachers" runat="server" Text="Update Course Teachers"
                    Width="100%" />
                <br />
                <br />
                <asp:Label ID="LabelStatusTeachers" runat="server" Font-Bold="True"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label28" runat="server" Text="If your Course exists in the Section, Course Teacher will be Updated."
                    ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label11" runat="server" Text="After Update, please add Course Students to Courses from "
                    ForeColor="Red"></asp:Label>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CoordinatorsSD/CoursesAdd.aspx">Add Students Page</asp:HyperLink>
                <br />
                <br />
                <uswnb:WebMessageBox ID="WebMessageBoxAttendance" runat="server" />
                <asp:SqlDataSource ID="SqlDataSourceRadioButtonListSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog, SectionGroup FROM tbl_SectionCatalog WHERE (SectionSchool = N'SD') ORDER BY SectionGroup">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceGridviewCourseSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT tbl_CourseSections.CourseSectionID, tbl_CourseSections.SchoolCode, tbl_CourseSections.CourseCatalogID, tbl_CourseSections.StaffID, tbl_CourseCatalog.CourseCatalog FROM tbl_CourseSections INNER JOIN tbl_CourseCatalog ON tbl_CourseSections.CourseCatalogID = tbl_CourseCatalog.CourseCatalogID WHERE (tbl_CourseSections.AcademicTermID = @AcademicTermID) AND (tbl_CourseSections.SectionCatalogID = @SectionCatalogID) AND (tbl_CourseSections.SchoolCode = @SchoolCode) ORDER BY tbl_CourseCatalog.CourseCatalog"
                    UpdateCommand="UPDATE tbl_CourseSections SET StaffID = @StaffID WHERE (CourseSectionID = @CourseSectionID)"
                    InsertCommand="IF NOT EXISTS (SELECT CourseSectionID FROM tbl_CourseSections WHERE (SectionCatalogID = @SectionCatalogID) AND (CourseCatalogID = @CourseCatalogID) AND (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID)) INSERT INTO tbl_CourseSections(CourseCatalogID, SectionCatalogID, AcademicTermID, SchoolCode, StaffID) VALUES (@CourseCatalogID,@SectionCatalogID,@AcademicTermID,@SchoolCode,@StaffID) ELSE UPDATE tbl_CourseSections SET StaffID = @StaffID WHERE (SectionCatalogID = @SectionCatalogID) AND (CourseCatalogID = @CourseCatalogID) AND (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID)">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="SectionCatalogID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListCourses" Name="CourseCatalogID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListBoxSchoolCodes" Name="SchoolCode" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListCourseTeacher" Name="StaffID" PropertyName="SelectedValue" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="SectionCatalogID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="StaffID" />
                        <asp:Parameter Name="CourseSectionID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceDropDownListCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT CourseCatalogID, CourseCode + N' /  ' + CourseCatalog AS CourseCategory FROM tbl_CourseCatalog ORDER BY CourseCategory">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceDropDownListStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StaffID, StaffName FROM vw_UsersStaff WHERE (SchoolCode = @SchoolCode) ORDER BY StaffName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) AND (SectionSchool = N'SD') ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
