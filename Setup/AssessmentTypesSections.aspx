<%@ Page Title="SIS Assessment Types Schools" Language="VB" MasterPageFile="Setup.Master"
    AutoEventWireup="false" CodeFile="AssessmentTypesSections.aspx.vb" Inherits="AssessmentTypes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <table width="675" class="content-table">
                <tr>
                    <td height="28" width="120">
                        <asp:Label ID="LabelWeekNo3" runat="server" Font-Bold="True" Text="Select Section:"></asp:Label>
                    </td>
                    <td width="200">
                        <asp:DropDownList ID="DropDownListSections" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceDropDownListSections"
                            DataTextField="SectionCatalog" DataValueField="SectionCatalogID" TabIndex="7"
                            Width="95%">
                            <asp:ListItem Value="">Not Selected!</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td height="28">
                        <asp:Label ID="LabelWeekNo5" runat="server" Font-Bold="True" Text="Select Course:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListCourseSections" runat="server" AutoPostBack="True"
                            DataSourceID="SqlDataSourceCheckBoxListCourseSections" DataTextField="CourseSection"
                            DataValueField="CourseSectionID" Width="95%">
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="GridViewCourseSectionAssessmentTypes" runat="server" AutoGenerateColumns="False"
                DataKeyNames="CourseSectionAssessmentTypeID" DataSourceID="SqlDataSourceGridviewCourseSectionAssessmentTypes"
                ShowFooter="True" Width="675px" AllowPaging="True">
                <Columns>
                    <asp:TemplateField InsertVisible="False" SortExpression="AcademicYearID">
                        <ItemTemplate>
                            <img alt="" src="Images/Row.gif" style="width: 16px; height: 16px" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <strong>
                                <%# Container.DataItemIndex + 1 %>
                            </strong>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="CourseSectionAssessmentTypeID" HeaderText="ID" InsertVisible="False"
                        ReadOnly="True" SortExpression="CourseSectionAssessmentTypeID">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Course Section" SortExpression="CourseSectionID">
                        <ItemTemplate>
                            <asp:Label ID="LabelCourseCategory" runat="server" Font-Bold="False" Text='<%# Eval("CourseCategory") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Assessment Types" SortExpression="AssessmentTypeID">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownListAssessmentTypes" runat="server" DataSourceID="SqlDataSourceGridviewDropDownListAssessmentTypes"
                                DataTextField="AssessmentType" DataValueField="AssessmentTypeID" SelectedValue='<%# Bind("AssessmentTypeID") %>'
                                Width="95%">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description" SortExpression="Description">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxDescription" runat="server" Text='<%# Bind("Description") %>'
                                Width="90%"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="%" SortExpression="Percentage">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxPercentage" runat="server" Text='<%# Bind("Percentage") %>'
                                Width="35px"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonSave0" runat="server" CommandName="Update" ImageUrl="~/Administrators/Images/save.gif"
                                ToolTip="Update!" ValidationGroup="Update" />
                            <br />
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                        <FooterStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonDelete1" runat="server" CommandName="Delete" ImageUrl="~/Administrators/Images/delete.gif"
                                ToolTip="Delete!" OnClientClick="return confirm('Are you sure you want to delete this Assessment Type?')" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
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
            </asp:GridView>
            <br />
            <asp:Button ID="ButtonUpdateAll" runat="server" Text="Update All Assessment Types"
                Width="675px" />
            <br />
            <br />
            <asp:Label ID="LabelStatusAssessmentTypes" runat="server" Font-Bold="True"></asp:Label>
            <br />
            <br />
            <table width="675" style="border: 1px solid #990033; background-color: #EBF4E1">
                <tr>
                    <td height="30" width="30">
                        <img alt="" src="Images/arrow.gif" />
                    </td>
                    <td width="150">
                        <asp:Label ID="LabelWeekNo" runat="server" Font-Bold="True" Text="Assessment Type:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListAssessmentTypes" runat="server" DataSourceID="SqlDataSourceDropDownListAssessmentTypes"
                            DataTextField="AssessmentType" DataValueField="AssessmentTypeID" Width="410px">
                        </asp:DropDownList>
                    </td>
                    <td width="70">
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
                        <asp:CheckBoxList ID="CheckBoxListCourseSections" runat="server" DataSourceID="SqlDataSourceCheckBoxListCourseSections"
                            DataTextField="CourseSection" DataValueField="CourseSectionID" RepeatColumns="3"
                            Width="400px">
                        </asp:CheckBoxList>
                    </td>
                    <td valign="top">
                        <asp:CheckBox ID="CheckBoxCheckAll" runat="server" AutoPostBack="True" Font-Bold="True"
                            ForeColor="Red" Text="All?" />
                    </td>
                </tr>
                <tr>
                    <td height="30">
                        <img alt="" src="Images/arrow.gif" />
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Percentage:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxPercentage" runat="server" Width="410px"></asp:TextBox>
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
                    <td height="30">
                        <img alt="" src="Images/arrow.gif" />
                    </td>
                    <td>
                        <asp:Label ID="LabelWeekNo1" runat="server" Font-Bold="True" Text="Description:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxDescription" runat="server" Width="400px"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="ButtonAddAssessmentType" runat="server" CommandName="Insert" Text="Add Assessment Type"
                            ValidationGroup="AddWeek" Width="410px" />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td height="30">
                    </td>
                    <td>
                        <asp:Label ID="LabelStatus" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceDropDownListSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT DISTINCT SectionGroup, SectionCatalogID, SectionCatalog FROM vw_CourseSections WHERE (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID) ORDER BY SectionGroup">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceGridviewCourseSectionAssessmentTypes" runat="server"
                ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT CourseSectionAssessmentTypeID, CourseSectionID, AssessmentTypeID, CourseCategory, Description, Percentage FROM vw_CourseSectionAssessmentTypes WHERE (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID) AND (SectionCatalogID = @SectionCatalogID) AND (CourseSectionID = @CourseSectionID) ORDER BY CourseCategory, Description"
                UpdateCommand="UPDATE tbl_CourseSectionAssessmentTypes SET AssessmentTypeID = @AssessmentTypeID, Description = @Description, Percentage = @Percentage WHERE (CourseSectionAssessmentTypeID = @CourseSectionAssessmentTypeID)"
                DeleteCommand="DELETE FROM tbl_CourseSectionAssessmentTypes WHERE (CourseSectionAssessmentTypeID = @CourseSectionAssessmentTypeID)"
                InsertCommand="IF EXISTS (SELECT CourseSectionAssessmentTypeID FROM tbl_CourseSectionAssessmentTypes WHERE (CourseSectionID = @CourseSectionID) AND (AssessmentTypeID = @AssessmentTypeID)) UPDATE tbl_CourseSectionAssessmentTypes SET Description = @Description, Percentage = @Percentage WHERE (CourseSectionID = @CourseSectionID) AND (AssessmentTypeID = @AssessmentTypeID) ELSE INSERT INTO tbl_CourseSectionAssessmentTypes(CourseSectionID, AssessmentTypeID, Description, Percentage) VALUES (@CourseSectionID,@AssessmentTypeID,@Description,@Percentage)">
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
                    <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListSections" Name="SectionCatalogID" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListCourseSections" Name="CourseSectionID"
                        PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AssessmentTypeID" />
                    <asp:Parameter Name="Description" />
                    <asp:Parameter Name="Percentage" />
                    <asp:Parameter Name="CourseSectionAssessmentTypeID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceDropDownListAssessmentTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT AssessmentTypeID, AssessmentType FROM tbl_AssessmentTypes">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCheckBoxListCourseSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT CourseSectionID, CourseCategory + N' ' + SectionCatalog AS CourseSection, SectionGroup FROM vw_CourseSections WHERE (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID) AND (SectionCatalogID = @SectionCatalogID) ORDER BY SectionGroup, CourseCategory + N' ' + SectionCatalog">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListSections" Name="SectionCatalogID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceGridviewDropDownListCourseSections" runat="server"
                ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT CourseSectionID, SchoolName + N' / ' + SectionCatalog + N' / ' + CourseCategory AS CourseSection FROM vw_CourseSections ORDER BY CourseSection">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceGridviewDropDownListAssessmentTypes" runat="server"
                ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT [AssessmentTypeID], [AssessmentType] FROM [tbl_AssessmentTypes]">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT DISTINCT CourseCategory FROM vw_CourseSections WHERE (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID) ORDER BY CourseCategory">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
