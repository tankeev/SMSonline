<%@ Page Title="SIS School Assessment Types" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="AssessmentsBySchoolTypes.aspx.vb" Inherits="AssessmentTypesSchools" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuAssessments.ascx" TagName="MenuAssessments" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuAssessments ID="MenuAssessments" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkView" runat="server" ImageUrl="~/Staff/Images/menu_view.png"
                                NavigateUrl="~/Coordinators/AssessmentsBySchoolTypesAll.aspx"></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label81" runat="server" Text="Assessment Types List View"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label82" runat="server" Font-Bold="True" Text="Select a Course Please"
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="ListBoxCourses" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCourses"
                                DataTextField="CourseCategory" DataValueField="CourseCategory" Height="250px"
                                Width="95%"></asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="LabelTotal" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content-right">
                <h2>
                    SCHOOL ASSESSMENT TYPES</h2>
                <br />
                <asp:Panel ID="PanelFilter" runat="server" Enabled="False">
                    <table style="background-color: #EFCFDF; border: 1px solid #CC0066" width="675">
                        <tr>
                            <td height="28" width="20">
                                <img alt="" src="../CoordinatorsSD/Images/arrow.gif" />
                            </td>
                            <td width="130">
                                <asp:Label ID="LabelWeekNo2" runat="server" Font-Bold="True" Text="Filter By Section:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListSchoolSections" runat="server" AutoPostBack="True"
                                    DataSourceID="SqlDataSourceSections" DataTextField="SectionCatalog" DataValueField="SectionCatalogID"
                                    TabIndex="7" Width="95%">
                                    <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td width="120">
                                <asp:CheckBox ID="CheckBoxRemoveFilter" runat="server" AutoPostBack="True" Font-Bold="True"
                                    ForeColor="Red" Text="Use Filter?" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:GridView ID="GridViewCourseSectionAssessmentTypes" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="CourseSectionAssessmentTypeID" DataSourceID="SqlDataSourceGridviewCourseSectionAssessmentTypes"
                    Width="675px" ShowFooter="True" AllowPaging="True">
                    <Columns>
                        <asp:TemplateField InsertVisible="False" SortExpression="AcademicYearID">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Course Section" SortExpression="CourseSectionID">
                            <ItemTemplate>
                                <asp:Label ID="LabelSectionCategory" runat="server" Font-Bold="False" Text='<%# Eval("SectionCatalog") %>'></asp:Label>
                                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text=" / "></asp:Label>
                                <asp:Label ID="LabelCourseCategory" runat="server" Font-Bold="False" Text='<%# Eval("CourseCategory") %>'
                                    Font-Italic="False"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Assessment Types" SortExpression="AssessmentTypeID">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListAssessmentTypes" runat="server" DataSourceID="SqlDataSourceGridviewDropDownListAssessmentTypes"
                                    DataTextField="AssessmentType" DataValueField="AssessmentTypeID" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "AssessmentTypeID") %>'
                                    Width="95%">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description" SortExpression="Description">
                            <FooterTemplate>
                                <asp:Label ID="Label27" runat="server" Font-Bold="True" ForeColor="Red" Text="TOTAL:"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxDescription" runat="server" Text='<%# Bind("Description") %>'
                                    Width="90%"></asp:TextBox>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="%" SortExpression="Percentage">
                            <FooterTemplate>
                                <asp:Label ID="LabelPercentageFooter" runat="server" Font-Bold="True" ForeColor="Red"
                                    Text="0"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelPercentage" runat="server" Font-Bold="True" Text='<%# Bind("Percentage") %>'
                                    ForeColor="Red"></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Center" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonSave0" runat="server" CommandName="Update"
                                    ImageUrl="~/Coordinators/Images/save.gif" ToolTip="Update!" ValidationGroup="Update" />
                                <br />
                            </ItemTemplate>
                            <FooterTemplate>
                                
                            </FooterTemplate>
                            <FooterStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonDelete1" runat="server" CommandName="Delete" ImageUrl="~/Coordinators/Images/delete.gif"
                                    ToolTip="Delete!" Enabled="False" />
                                <asp:ConfirmButtonExtender ID="ImageButtonDelete1_ConfirmButtonExtender" runat="server"
                                    ConfirmText="Do you want to Delete?" Enabled="True" TargetControlID="ImageButtonDelete1">
                                </asp:ConfirmButtonExtender>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="Images/no-data.png" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Please Select a Course to see the Records!"
                                Font-Size="Medium" ForeColor="Red"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <FooterStyle Height="28px" />
                    <RowStyle Height="30px" />
                </asp:GridView>
                <br />
                <asp:Panel ID="PanelTypes" runat="server" Visible="False">
                    <asp:Button ID="ButtonUpdateAll" runat="server" Text="Save All Changes" 
                        Width="675px" />
                    <br />
                    <br />
                    <table width="675" style="background-color: #EFCFDF; border: 1px solid #CC0066">
                        <tr>
                            <td height="30" width="20">
                                <img alt="" src="Images/arrow.gif" />
                            </td>
                            <td width="130">
                                <asp:Label ID="LabelWeekNo" runat="server" Text="Assessment Type:" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListAssessmentTypes" runat="server" DataSourceID="SqlDataSourceDropDownListAssessmentTypes"
                                    DataTextField="AssessmentType" DataValueField="AssessmentTypeID" Width="97%"
                                    AppendDataBoundItems="True">
                                    <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td width="70">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownListAssessmentTypes"
                                    ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="AssessmentTypes">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <img alt="" src="Images/arrow.gif" />
                            </td>
                            <td>
                                <asp:Label ID="LabelWeekNo1" runat="server" Font-Bold="True" Text="Description:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxDescription" runat="server" Width="95%"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxDescription"
                                    ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="AssessmentTypes">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                                <img alt="" src="Images/arrow.gif" />
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Percentage:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxPercentage" runat="server" Width="95%"></asp:TextBox>
                                <asp:SliderExtender ID="TextBoxPercentage_SliderExtender" runat="server" Enabled="True"
                                    Maximum="100" Minimum="0" TargetControlID="TextBoxPercentage" BoundControlID="TextBoxSliderValue"
                                    TooltipText="Percentage: {0}" Length="410" EnableHandleAnimation="True">
                                </asp:SliderExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxSliderValue" runat="server" Width="35px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <img alt="" src="Images/arrow.gif" />
                            </td>
                            <td valign="top">
                                <asp:Label ID="LabelWeekNo0" runat="server" Font-Bold="True" Text="Course Section:"></asp:Label>
                            </td>
                            <td valign="top">
                                <asp:CheckBoxList ID="CheckBoxListCourseSections" runat="server" DataSourceID="SqlDataSourceDropDownListCourseSections"
                                    DataTextField="CourseSection" DataValueField="CourseSectionID" RepeatColumns="3"
                                    Width="95%" Font-Size="X-Small">
                                </asp:CheckBoxList>
                            </td>
                            <td valign="top">
                                <asp:CheckBox ID="CheckBoxCheckAll" runat="server" AutoPostBack="True" Font-Bold="True"
                                    ForeColor="Red" Text="All?" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                
                            </td>
                            <td>
                                
                            </td>
                            <td>
                                <asp:Button ID="ButtonAddAssessmentType" runat="server" CommandName="Insert" Text="Add Assessment Type"
                                    ValidationGroup="AssessmentTypes" Width="97%" />
                            </td>
                            <td>
                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                
                            </td>
                            <td height="50">
                                
                            </td>
                            <td>
                                <asp:Label ID="Label27" runat="server" ForeColor="Red" Text="NOTE: If the Assessment Type you want to add already exists, previous Assessment Type will be updated. (Description)"></asp:Label>
                            </td>
                            <td>
                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                
                            </td>
                            <td height="20">
                                
                            </td>
                            <td>
                                
                            </td>
                            <td>
                                
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT AcademicTermID, SchoolCode, CourseCategory FROM vw_CourseSections WHERE (AcademicTermID = @AcademicTermID) AND (SchoolCode = @SchoolCode) ORDER BY CourseCategory">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE  (SchoolCode = @SchoolCode) ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceGridviewCourseSectionAssessmentTypes" runat="server"
                    ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT CourseSectionAssessmentTypeID, CourseSectionID, AcademicTermID, CourseCategory, AssessmentTypeID, SchoolCode, SectionCatalog, SectionGroup, Description, Percentage, SectionCatalogID FROM vw_CourseSectionAssessmentTypes WHERE (SchoolCode = @SchoolCode) AND (CourseCategory = @CourseCategory) AND (AcademicTermID = @AcademicTermID) ORDER BY SectionGroup, SectionCatalog, Description"
                    UpdateCommand="UPDATE tbl_CourseSectionAssessmentTypes SET AssessmentTypeID = @AssessmentTypeID, Description = @Description WHERE (CourseSectionAssessmentTypeID = @CourseSectionAssessmentTypeID)"
                    DeleteCommand="DELETE FROM tbl_CourseSectionAssessmentTypes WHERE (CourseSectionAssessmentTypeID = @CourseSectionAssessmentTypeID)"
                    InsertCommand="IF EXISTS ( SELECT CourseSectionAssessmentTypeID FROM tbl_CourseSectionAssessmentTypes WHERE (CourseSectionID = @CourseSectionID) AND (AssessmentTypeID = @AssessmentTypeID) ) UPDATE tbl_CourseSectionAssessmentTypes SET Description = @Description, Percentage = @Percentage WHERE (CourseSectionID = @CourseSectionID) AND (AssessmentTypeID = @AssessmentTypeID) ELSE INSERT INTO tbl_CourseSectionAssessmentTypes(CourseSectionID, AssessmentTypeID, Description, Percentage) VALUES (@CourseSectionID,@AssessmentTypeID,@Description,@Percentage)">
                    <DeleteParameters>
                        <asp:Parameter Name="CourseSectionAssessmentTypeID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CourseSectionID" />
                        <asp:Parameter Name="AssessmentTypeID" />
                        <asp:Parameter Name="Description" />
                        <asp:Parameter Name="Percentage" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListBoxCourses" Name="CourseCategory" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="AssessmentTypeID" />
                        <asp:Parameter Name="Description" />
                        <asp:Parameter Name="CourseSectionAssessmentTypeID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceGridviewDropDownListCourseSections" runat="server"
                    ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT CourseSectionID, SchoolName + N' / ' + SectionCategory + N' / ' + CourseCategory AS CourseSection FROM vw_CourseSections ORDER BY CourseSection">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceGridviewDropDownListAssessmentTypes" runat="server"
                    ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT [AssessmentTypeID], [AssessmentType] FROM [tbl_AssessmentTypes]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceDropDownListAssessmentTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT [AssessmentTypeID], [AssessmentType] FROM [tbl_AssessmentTypes]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceDropDownListCourseSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT CourseSectionID, CourseCategory + N' ' + SectionCatalog AS CourseSection, CourseCategory, SectionGroup, AcademicTermID FROM vw_CourseSections WHERE (SchoolCode = @SchoolCode) AND (CourseCategory = @CourseCategory) AND (AcademicTermID = @AcademicTermID) ORDER BY SectionGroup, CourseCategory + N' ' + SectionCatalog">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListBoxCourses" Name="CourseCategory" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
