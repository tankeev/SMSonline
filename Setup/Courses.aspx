<%@ Page Title="Setup Courses" Language="VB" MasterPageFile="Setup.Master" AutoEventWireup="false"
    CodeFile="Courses.aspx.vb" Inherits="Courses" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <table class="content-table" width="675">
                <tr>
                    <td width="140" height="30">
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Course Category:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListCourseCategories" runat="server" DataSourceID="SqlDataSourceDropDownListCourses"
                            DataTextField="CourseCategory" DataValueField="CourseCategoryID" AutoPostBack="True"
                            Width="95%">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="GridViewCourseCatalog" runat="server" AutoGenerateColumns="False"
                DataKeyNames="CourseCatalogID" DataSourceID="SqlDataSourceCourseCatalog" ShowFooter="True"
                AllowPaging="True" Width="675px" PageSize="20">
                <Columns>
                    <asp:TemplateField InsertVisible="False" SortExpression="AcademicYearID">
                        <ItemTemplate>
                            <img alt="" src="Images/Row.gif" style="width: 16px; height: 16px" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="CourseCatalogID" HeaderText="ID" InsertVisible="False"
                        ReadOnly="True" SortExpression="CourseCatalogID">
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Course Category" SortExpression="CourseCategoryID">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownListCourseCategories" runat="server" DataSourceID="SqlDataSourceCourseCategories"
                                DataTextField="CourseCategory" DataValueField="CourseCategoryID" SelectedValue='<%# Bind("CourseCategoryID") %>'
                                Width="95%" AppendDataBoundItems="True">
                                <asp:ListItem Value="">Not Selected!</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Course Code" SortExpression="CourseCode">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxCourseCode" runat="server" Text='<%# Bind("CourseCode") %>'
                                Width="90%"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Course Catolog">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxCourseCategory" runat="server" Text='<%# Bind("CourseCatalog") %>'
                                Width="90%"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Periods" SortExpression="NumberofPeriods">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxPeriods" runat="server" Text='<%# Bind("NumberofPeriods") %>'
                                Width="40px"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="60px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Academic" SortExpression="IsAcademic">
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBoxIsAcademic" runat="server" Checked='<%# Bind("IsAcademic") %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonSave" runat="server" CommandName="Update" ImageUrl="~/Administrators/Images/save.gif"
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
                            <asp:ImageButton ID="ImageButtonDelete" runat="server" CommandName="Delete" ImageUrl="~/Administrators/Images/delete.gif"
                                ToolTip="Delete!" Enabled="False" />
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
            <asp:Button ID="ButtonUpdateAll" runat="server" Text="Update" Width="675px" />
            <br />
            <br />
            <asp:Label ID="LabelStatus" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            <br />
            <br />
            <asp:FormView ID="FormViewCourses" runat="server" DataKeyNames="WeekID" DataSourceID="SqlDataSourceCourseCatalog"
                DefaultMode="Insert" Width="675px">
                <EditItemTemplate>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="divRow">
                        <div class="divCellTitle">
                            <div class="divImage">
                                <table width="100%">
                                    <tr>
                                        <td height="25" width="20">
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td width="120">
                                            <asp:Label ID="LabelWeekNo4" runat="server" Text="Course Category:"></asp:Label>
                                        </td>
                                        <td width="250">
                                            <asp:DropDownList ID="DropDownListCourseCategories" runat="server" DataSourceID="SqlDataSourceCourseCategories"
                                                DataTextField="CourseCategory" DataValueField="CourseCategoryID" SelectedValue='<%# Bind("CourseCategoryID") %>'
                                                Width="95%" AppendDataBoundItems="True">
                                                <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="center" rowspan="7" valign="top">
                                            <asp:Image ID="ImageAcademicTerms" runat="server" ImageUrl="~/Administrators/Images/AcademicsTerms.png" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25" width="20">
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td width="120">
                                            <asp:Label ID="LabelWeekNo" runat="server" Text="Course Code:"></asp:Label>
                                        </td>
                                        <td width="250">
                                            <asp:TextBox ID="TextBoxCourseCode" runat="server" Text='<%# Bind("CourseCode") %>'
                                                Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelWeekNo0" runat="server" Text="Course Catalog:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxCourseCategory" runat="server" Text='<%# Bind("CourseCatalog") %>'
                                                Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelWeekNo5" runat="server" Text="No. Of Periods:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxCoursePeriods" runat="server" Text='<%# Bind("NumberofPeriods") %>'
                                                Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelWeekNo3" runat="server" Text="Is Academic:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckBoxIsAcademic" runat="server" Checked='<%# Bind("IsAcademic") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Button ID="ButtonAdd" runat="server" CommandName="Insert" Text="Add Course"
                                                ValidationGroup="AddWeek" Width="95%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="125">
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                </ItemTemplate>
            </asp:FormView>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSourceDropDownListCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT CourseCategoryID, CourseCategory FROM tbl_CourseCategories ORDER BY CourseCategory">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCourseCategories" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT CourseCategoryID, CourseCategory FROM tbl_CourseCategories ORDER BY CourseCategory">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCourseCatalog" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                DeleteCommand="DELETE FROM tbl_CourseCatalog WHERE (CourseCatalogID = @CourseCatalogID)"
                InsertCommand="INSERT INTO tbl_CourseCatalog(CourseCode, IsAcademic, CourseCategoryID, CourseCatalog, NumberofPeriods) VALUES (@CourseCode, @IsAcademic, @CourseCategoryID, @CourseCatalog, @NumberofPeriods)"
                SelectCommand="SELECT CourseCatalogID, CourseCode, CourseCatalog, IsAcademic, CourseCategoryID, NumberofPeriods FROM tbl_CourseCatalog WHERE (CourseCategoryID = @CourseCategoryID) ORDER BY CourseCode"
                UpdateCommand="UPDATE tbl_CourseCatalog SET CourseCode = @CourseCode, CourseCatalog = @CourseCatalog, CourseCategoryID = @CourseCategoryID, IsAcademic = @IsAcademic, NumberofPeriods = @NumberofPeriods WHERE (CourseCatalogID = @CourseCatalogID)">
                <DeleteParameters>
                    <asp:Parameter Name="CourseCatalogID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CourseCode" />
                    <asp:Parameter Name="IsAcademic" />
                    <asp:Parameter Name="CourseCategoryID" />
                    <asp:Parameter Name="CourseCatalog" />
                    <asp:Parameter Name="NumberofPeriods" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListCourseCategories" Name="CourseCategoryID"
                        PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CourseCode" />
                    <asp:Parameter Name="CourseCatalog" />
                    <asp:Parameter Name="CourseCategoryID" />
                    <asp:Parameter Name="IsAcademic" />
                    <asp:Parameter Name="NumberofPeriods" />
                    <asp:Parameter Name="CourseCatalogID" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
