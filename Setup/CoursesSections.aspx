<%@ Page Title="Setup Course Sections" Language="VB" MasterPageFile="Setup.Master"
    CodeFile="CoursesSections.aspx.vb" Inherits="Courses_Sections" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ChildHead">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <table class="content-table" width="675">
                <tr>
                    <td height="28" width="120">
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Red" Text="Select Course:">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListCourses" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceDropDownListCourses"
                            DataTextField="CourseCategory" DataValueField="CourseCategoryID" TabIndex="7"
                            Width="95%">
                            <asp:ListItem Value="">Not Selected!</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td width="100">
                        <asp:CheckBox ID="CheckBoxCourseFilter" runat="server" AutoPostBack="True" Enabled="False"
                            Text="Filter?" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="GridviewCourseSections" runat="server" AutoGenerateColumns="False"
                DataKeyNames="CourseSectionID" DataSourceID="SqlDataSourceGridviewCourseSections"
                ShowFooter="True" Width="675px">
                <Columns>
                    <asp:TemplateField InsertVisible="False" SortExpression="AcademicYearID">
                        <ItemTemplate>
                            <img alt="" src="Images/Row.gif" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonDelete" runat="server" CommandName="Delete" ImageUrl="~/Administrators/Images/delete.gif"
                                ToolTip="Delete!" />
                            <asp:ConfirmButtonExtender ID="ImageButtonDelete_ConfirmButtonExtender" runat="server"
                                ConfirmText="Are you sure?" Enabled="True" TargetControlID="ImageButtonDelete">
                            </asp:ConfirmButtonExtender>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CSID" SortExpression="CourseSectionID">
                        <ItemTemplate>
                            <asp:Label ID="LabelCSID" runat="server" Text='<%# Bind("CourseSectionID") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SCID" SortExpression="SectionCatalogID" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="LabelSCID" runat="server" Text='<%# Bind("SectionCatalogID") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Section" SortExpression="SectionCatalog">
                        <ItemTemplate>
                            <asp:Label ID="LabelSectionCategory" runat="server" Text='<%# Eval("SectionCatalog") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="80px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CCID" SortExpression="CourseCatalogID" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="LabelCCID" runat="server" Text='<%# Bind("CourseCatalogID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Course " SortExpression="CourseCatalog">
                        <ItemTemplate>
                            <asp:Label ID="LabelCourseName" runat="server" Text='<%# Eval("CourseCatalog") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SID" SortExpression="StaffID" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="LabelSID" runat="server" Text='<%# Bind("StaffID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Staff" SortExpression="StaffName">
                        <ItemTemplate>
                            <asp:Label ID="LabelStaffName" runat="server" Text='<%# Eval("StaffName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonSelect" runat="server" CausesValidation="False" ImageUrl="~/Setup/Images/more.png"
                                Text="Select" OnCommand="GridviewCourseSectionsSelectRow" />
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
                <RowStyle Height="30px" />
                <SelectedRowStyle BackColor="#FFFF99" />
            </asp:GridView>
            <asp:ModalPopupExtender ID="MPCourseSections" runat="server" PopupControlID="PanelCourseSections"
                TargetControlID="btnShow" BackgroundCssClass="modalBackground" CancelControlID="ButtonCloseCourseSections">
            </asp:ModalPopupExtender>
            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
            <asp:Panel ID="PanelCourseSections" runat="server" CssClass="modalPopup" Width="500px"
                Style="display: none;">
                <table width="100%">
                    <tr>
                        <td width="20">
                            &nbsp;
                        </td>
                        <td>
                            <asp:FormView ID="FormViewCourseSections" runat="server" DataKeyNames="CourseSectionID"
                                DataSourceID="SqlDataSourceFormviewCourseSections" DefaultMode="Edit" Width="100%">
                                <EditItemTemplate>
                                    <table style="width: 100%">
                                        <tr>
                                            <td height="35" width="120">
                                                <asp:Label ID="Label8" runat="server" Text="Section:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListSections" runat="server" DataSourceID="SqlDataSourceGridviewDropDownListSections"
                                                    DataTextField="SectionCatalog" DataValueField="SectionCatalogID" SelectedValue='<%# Bind("SectionCatalogID") %>'
                                                    TabIndex="7" Width="100%">
                                                    <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="35">
                                                <asp:Label ID="Label6" runat="server" Text="Course:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListCourses" runat="server" DataSourceID="SqlDataSourceGridviewDropDownListCourses"
                                                    DataTextField="CourseCatalog" DataValueField="CourseCatalogID" SelectedValue='<%# Bind("CourseCatalogID") %>'
                                                    TabIndex="7" Width="100%">
                                                    <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="35">
                                                <asp:Label ID="Label7" runat="server" Text="Staff:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListStaff" runat="server" DataSourceID="SqlDataSourceGridviewDropDownListStaff"
                                                    DataTextField="StaffName" DataValueField="StaffID" SelectedValue='<%# Bind("StaffID") %>'
                                                    Width="100%">
                                                    <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="35">
                                            </td>
                                            <td>
                                                <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update" Text="Update Course"
                                                    Width="100%" />
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                            </asp:FormView>
                        </td>
                        <td width="20">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="ButtonCloseCourseSections" runat="server" Text="Close" Width="100%" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSourceGridviewDropDownListSections" runat="server"
                                ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT [SectionCatalogID], [SectionCatalog] FROM [tbl_SectionCatalog] ORDER BY [SectionGroup], [SectionCatalog]">
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceGridviewDropDownListCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT CourseCatalogID, CourseCatalog FROM tbl_CourseCatalog ORDER BY CourseCatalog">
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceGridviewDropDownListStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT [StaffID], [StaffName] FROM [tbl_Staff] WHERE ([SchoolCode] = @SchoolCode) ORDER BY [StaffName]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <table width="675" class="content-table">
                <tr>
                    <td width="120" height="28">
                        <asp:Label ID="LabelWeekNo2" runat="server" Font-Bold="True" Text="Copy Courses to:"
                            ForeColor="Red"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListAcademicTermsTo" runat="server" DataSourceID="SqlDataSourceAcademicTerms"
                            DataTextField="AcademicTerm" DataValueField="AcademicTermID" Width="95%">
                        </asp:DropDownList>
                    </td>
                    <td width="100">
                        <asp:Button ID="ButtonCopyCourses" runat="server" Text="Copy" Width="110px" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceDropDownListCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT CourseCategoryID, CourseCategory FROM tbl_CourseCategories ORDER BY CourseCategory">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceGridviewCourseSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                DeleteCommand="DELETE FROM tbl_CourseSections WHERE (CourseSectionID = @CourseSectionID)"
                InsertCommand="UPDATE tbl_CourseSections SET StaffID = @StaffID ,  @LastAddedID =CourseSectionID WHERE (CourseCatalogID = @CourseCatalogID) AND (SectionCatalogID = @SectionCatalogID) AND (AcademicTermID = @AcademicTermID) AND (SchoolCode = @SchoolCode) 

IF @@ROWCOUNT = 0 

INSERT INTO tbl_CourseSections (AcademicTermID, StaffID, CourseCatalogID, SectionCatalogID, SchoolCode) VALUES (@AcademicTermID,@StaffID,@CourseCatalogID,@SectionCatalogID,@SchoolCode) SET @LastAddedID = SCOPE_IDENTITY();

" SelectCommand="SELECT CourseSectionID, SectionCatalogID, SectionCatalog, CourseCatalogID, CourseCatalog, StaffID, StaffName FROM vw_CourseSections WHERE (AcademicTermID = @AcademicTermID) AND (SchoolCode = @SchoolCode) AND (CourseCategoryID = @CourseCategoryID) ORDER BY SectionGroup, SectionCatalog, CourseCatalog"
                UpdateCommand="UPDATE tbl_CourseSections SET StaffID = @StaffID, CourseCatalogID = @CourseCatalogID WHERE (CourseSectionID = @CourseSectionID)">
                <DeleteParameters>
                    <asp:Parameter Name="CourseSectionID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="StaffID" />
                    <asp:Parameter Name="LastAddedID" Type="Int32" Direction="Output" />
                    <asp:Parameter Name="CourseCatalogID" />
                    <asp:Parameter Name="SectionCatalogID" />
                    <asp:Parameter Name="AcademicTermID" />
                    <asp:Parameter Name="SchoolCode" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListCourses" Name="CourseCategoryID" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="StaffID" />
                    <asp:Parameter Name="CourseCatalogID" />
                    <asp:Parameter Name="CourseSectionID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCourseSectionsAssessmentTypes" runat="server"
                ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" InsertCommand="INSERT INTO tbl_CourseSectionAssessmentTypes(CourseSectionID, AssessmentTypeID, Description, Percentage) VALUES (@CourseSectionID, @AssessmentTypeID, @Description, @Percentage)"
                SelectCommand="SELECT CourseSectionAssessmentTypeID, CourseSectionID, AssessmentTypeID, Description, Percentage FROM tbl_CourseSectionAssessmentTypes">
                <InsertParameters>
                    <asp:Parameter Name="CourseSectionID" />
                    <asp:Parameter Name="AssessmentTypeID" />
                    <asp:Parameter Name="Description" />
                    <asp:Parameter Name="Percentage" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceFormviewCourseSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT CourseSectionID, StaffID, CourseCatalogID, SectionCatalogID FROM tbl_CourseSections WHERE (CourseSectionID = @CourseSectionID)"
                UpdateCommand="UPDATE tbl_CourseSections SET StaffID = @StaffID, CourseCatalogID = @CourseCatalogID, SectionCatalogID = @SectionCatalogID WHERE (CourseSectionID = @CourseSectionID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridviewCourseSections" Name="CourseSectionID" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="StaffID" />
                    <asp:Parameter Name="CourseCatalogID" />
                    <asp:Parameter Name="SectionCatalogID" />
                    <asp:Parameter Name="CourseSectionID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms">
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
