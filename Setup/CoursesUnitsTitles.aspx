<%@ Page Title="Setup Course Units Titles" Language="VB" MasterPageFile="Setup.Master"
    CodeFile="CoursesUnitsTitles.aspx.vb" Inherits="CoursesUnitsTitles" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ChildHead">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridViewCourses" runat="server" AutoGenerateColumns="False" DataKeyNames="CourseCategoryID"
                DataSourceID="SqlDataSourceCourses" Width="100%" AllowPaging="True" PageSize="5">
                <Columns>
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Development/Images/edit.png"
                        ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:CommandField>
                    <asp:TemplateField HeaderText="ID" SortExpression="CourseCategoryID">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxID" runat="server" Text='<%# Bind("CourseCategoryID") %>'
                                Width="30px"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Code" SortExpression="CourseCategoryCode">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxCode" runat="server" Text='<%# Bind("CourseCategoryCode") %>'
                                Width="30px"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Order" SortExpression="CourseReportOrder">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxOrder" runat="server" Text='<%# Bind("CourseReportOrder") %>'
                                Width="30px"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Group" SortExpression="CourseGroupingID">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxGroup" runat="server" Text='<%# Bind("CourseGroupingID") %>'
                                Width="30px"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Course" SortExpression="CourseCategory">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxCourse" runat="server" Text='<%# Bind("CourseCategory") %>'
                                Width="90%"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Group Name" SortExpression="CourseGroupName">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxGroupName" runat="server" Text='<%# Bind("CourseGroupName") %>'
                                Width="90%"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBoxIsChild" runat="server" Checked='<%# Bind("CourseGroupingIsChild") %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Update" ImageUrl="~/Setup/Images/save.gif" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonDelCourse" runat="server" CausesValidation="False"
                                CommandName="Delete" ImageUrl="~/Development/Images/delete.gif" Text="Delete" />
                            <asp:ConfirmButtonExtender ID="ImageButtonDelCourse_ConfirmButtonExtender" runat="server"
                                ConfirmText="Are You Sure?" Enabled="True" TargetControlID="ImageButtonDelCourse">
                            </asp:ConfirmButtonExtender>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div align="center">
                        <br />
                        <asp:Image ID="Image42" runat="server" ImageUrl="~/Administrators/Images/warning.png" />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="Label21" runat="server" Font-Bold="True" Text="Sorry, No Courses Available!"></asp:Label>
                        <br />
                        <br />
                    </div>
                </EmptyDataTemplate>
                <RowStyle Height="28px" />
                <SelectedRowStyle BackColor="#FFFFCC" />
            </asp:GridView>
            <br />
            <asp:Button ID="ButtonUpdateCourses" runat="server" Text="Update" Width="100%" />
            <br />
            <br />
            <asp:FormView ID="FormViewCourses" runat="server" DataKeyNames="CourseUnitID" DataSourceID="SqlDataSourceCourses"
                DefaultMode="Insert" Width="100%">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td width="35">
                                <asp:Image ID="Image43" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />
                            </td>
                            <td width="150">
                                Course Code
                            </td>
                            <td>
                                <asp:TextBox ID="CourseUnitCodeTextBox0" runat="server" Text='<%# Bind("CourseCategoryCode") %>'
                                    Width="90%" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="Image44" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />
                            </td>
                            <td>
                                Course
                            </td>
                            <td>
                                <asp:TextBox ID="CourseUnitTextBox0" runat="server" Text='<%# Bind("CourseCategory") %>'
                                    Width="90%" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />
                            </td>
                            <td>
                                Group
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CourseGroupName") %>' Width="90%" />
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="ButtonAdd0" runat="server" CommandName="Insert" Text="Add Record"
                                    Width="92%" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
            </asp:FormView>
            <br />
            <asp:Label ID="LabelCoursesStatus" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridViewCoursesUnits" runat="server" AutoGenerateColumns="False"
                DataKeyNames="CourseUnitID" DataSourceID="SqlDataSourceCoursesUnits" Width="100%"
                AllowPaging="True" PageSize="5">
                <Columns>
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Development/Images/edit.png"
                        ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:CommandField>
                    <asp:TemplateField HeaderText="Course Catalog" SortExpression="CourseCategoryID">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownListCourses" runat="server" DataSourceID="SqlDataSourceCourses"
                                DataTextField="CourseCategory" DataValueField="CourseCategoryID" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "CourseCategoryID") %>'
                                Width="90%" AppendDataBoundItems="True">
                                <asp:ListItem Value="">Not Selected!</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                        <ItemStyle Width="180px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Unit Code" SortExpression="CourseUnitCode">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxUnitCode" runat="server" Text='<%# Bind("CourseUnitCode") %>'
                                Width="90%"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CourseUnit" SortExpression="CourseUnit">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxUnit" runat="server" Text='<%# Bind("CourseUnit") %>' Width="90%"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonDelUnit" runat="server" CausesValidation="False"
                                CommandName="Delete" ImageUrl="~/Development/Images/delete.gif" Text="Delete" />
                            <asp:ConfirmButtonExtender ID="ImageButtonDelUnit_ConfirmButtonExtender" runat="server"
                                ConfirmText="Are You Sure?" Enabled="True" TargetControlID="ImageButtonDelUnit">
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
                        <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Select A Course Please!"></asp:Label>
                        <br />
                        <br />
                    </div>
                </EmptyDataTemplate>
                <RowStyle Height="28px" />
                <SelectedRowStyle BackColor="#FFFFCC" />
            </asp:GridView>
            <br />
            <asp:Button ID="ButtonUpdateUnits" runat="server" Text="Update" Width="100%" />
            <br />
            <br />
            <asp:FormView ID="FormViewCourseUnits" runat="server" DataKeyNames="CourseUnitID"
                DataSourceID="SqlDataSourceCoursesUnits" DefaultMode="Insert" Width="100%">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td width="35">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />
                            </td>
                            <td width="150">
                                Course Unit Code
                            </td>
                            <td>
                                <asp:TextBox ID="CourseUnitCodeTextBox" runat="server" Text='<%# Bind("CourseUnitCode") %>'
                                    Width="90%" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />
                            </td>
                            <td>
                                Course Unit
                            </td>
                            <td>
                                <asp:TextBox ID="CourseUnitTextBox" runat="server" Text='<%# Bind("CourseUnit") %>'
                                    Width="90%" />
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="ButtonAdd" runat="server" CommandName="Insert" Text="Add Record"
                                    Width="92%" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
            </asp:FormView>
            <br />
            <asp:Label ID="LabelUnitStatus" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridViewCourseUnitsTitles" runat="server" AutoGenerateColumns="False"
                DataKeyNames="UnitTitleID" DataSourceID="SqlDataSourceCoursesUnitsTitles" Width="100%"
                AllowPaging="True" PageSize="5">
                <Columns>
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Development/Images/edit.png"
                        ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:CommandField>
                    <asp:TemplateField HeaderText="CourseUnitID" SortExpression="CourseUnitID">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownListUnits" runat="server" DataSourceID="SqlDataSourceCoursesUnits"
                                DataTextField="CourseUnit" DataValueField="CourseUnitID" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "CourseUnitID") %>'
                                Width="90%" AppendDataBoundItems="True">
                                <asp:ListItem Value="">Not Selected!</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                        <ItemStyle Width="180px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Title Code" SortExpression="UnitTitleCode">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxTitleCode" runat="server" Text='<%# Bind("UnitTitleCode") %>'
                                Width="90%"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="UnitTitle" SortExpression="UnitTitle">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxTitle" runat="server" Text='<%# Bind("UnitTitle") %>' Width="90%"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonDelTitle" runat="server" CausesValidation="False"
                                CommandName="Delete" ImageUrl="~/Development/Images/delete.gif" Text="Delete" />
                            <asp:ConfirmButtonExtender ID="ImageButtonDelTitle_ConfirmButtonExtender" runat="server"
                                ConfirmText="Are You Sure?" Enabled="True" TargetControlID="ImageButtonDelTitle">
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
                        <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Select A Unit Please!"></asp:Label>
                        <br />
                        <br />
                    </div>
                </EmptyDataTemplate>
                <RowStyle Height="28px" />
            </asp:GridView>
            <br />
            <asp:Button ID="ButtonUpdateTitles" runat="server" Text="Update" Width="100%" />
            <br />
            <br />
            <asp:FormView ID="FormViewUnitTitles" runat="server" DataKeyNames="UnitTitleID" DataSourceID="SqlDataSourceCoursesUnitsTitles"
                DefaultMode="Insert" Width="100%">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td width="35">
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />
                            </td>
                            <td width="150">
                                Unit Title Code
                            </td>
                            <td>
                                <asp:TextBox ID="UnitTitleCodeTextBox" runat="server" Text='<%# Bind("UnitTitleCode") %>'
                                    Width="90%" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/Development/Images/sub-menu-alt-24.png" />
                            </td>
                            <td>
                                Unit Title
                            </td>
                            <td>
                                <asp:TextBox ID="UnitTitleTextBox" runat="server" Text='<%# Bind("UnitTitle") %>'
                                    Width="90%" />
                            </td>
                        </tr>
                        <tr>
                            <td height="30">
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="ButtonAdd" runat="server" CommandName="Insert" Text="Add Record"
                                    Width="92%" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
            </asp:FormView>
            <br />
            <asp:Label ID="LabelTitleStatus" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT CourseCategoryID, CourseCategory, CourseCategoryCode, CourseReportOrder, CourseGroupingID, CourseGroupingIsChild, CourseGroupName FROM tbl_CourseCategories"
                UpdateCommand="UPDATE tbl_CourseCategories SET CourseCategoryCode = @CourseCategoryCode, CourseCategory = @CourseCategory, CourseReportOrder = @CourseReportOrder, CourseGroupingID = @CourseGroupingID, CourseGroupingIsChild = @CourseGroupingIsChild, CourseGroupName = @CourseGroupName WHERE (CourseCategoryID = @CourseCategoryID)"
                InsertCommand="INSERT INTO tbl_CourseCategories(CourseCategoryCode, CourseCategory, CourseReportOrder, CourseGroupingID, CourseGroupingIsChild, CourseGroupName) VALUES (@CourseCategoryCode, @CourseCategory, 0, 0, 0, @CourseGroupName)"
                DeleteCommand="DELETE FROM tbl_CourseCategories WHERE (CourseCategoryID = @CourseCategoryID)">
                <DeleteParameters>
                    <asp:Parameter Name="CourseCategoryID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CourseCategoryCode" />
                    <asp:Parameter Name="CourseCategory" />
                    <asp:Parameter Name="CourseGroupName" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CourseCategoryCode" />
                    <asp:Parameter Name="CourseCategory" />
                    <asp:Parameter Name="CourseReportOrder" />
                    <asp:Parameter Name="CourseGroupingID" />
                    <asp:Parameter Name="CourseGroupingIsChild" />
                    <asp:Parameter Name="CourseGroupName" />
                    <asp:Parameter Name="CourseCategoryID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCoursesUnits" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT CourseUnitID, CourseCategoryID, CourseUnitCode, CourseUnit FROM tbl_CourseUnits WHERE (CourseCategoryID = @CourseCategoryID)"
                InsertCommand="INSERT INTO tbl_CourseUnits(CourseCategoryID, CourseUnitCode, CourseUnit) VALUES (@CourseCategoryID, @CourseUnitCode, @CourseUnit)"
                DeleteCommand="DELETE FROM tbl_CourseUnits WHERE (CourseUnitID = @CourseUnitID)">
                <DeleteParameters>
                    <asp:Parameter Name="CourseUnitID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="GridViewCourses" Name="CourseCategoryID" PropertyName="SelectedValue" />
                    <asp:Parameter Name="CourseUnitCode" />
                    <asp:Parameter Name="CourseUnit" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewCourses" Name="CourseCategoryID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCoursesUnitsTitles" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT UnitTitleID, CourseUnitID, UnitTitleCode, UnitTitle FROM tbl_CourseUnitTitles WHERE (CourseUnitID = @CourseUnitID)"
                InsertCommand="INSERT INTO tbl_CourseUnitTitles(CourseUnitID, UnitTitleCode, UnitTitle) VALUES (@CourseUnitID, @UnitTitleCode, @UnitTitle)"
                DeleteCommand="DELETE FROM tbl_CourseUnitTitles WHERE (UnitTitleID = @UnitTitleID)">
                <DeleteParameters>
                    <asp:Parameter Name="UnitTitleID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="GridViewCoursesUnits" Name="CourseUnitID" PropertyName="SelectedValue" />
                    <asp:Parameter Name="UnitTitleCode" />
                    <asp:Parameter Name="UnitTitle" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewCoursesUnits" Name="CourseUnitID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
