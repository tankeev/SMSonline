<%@ Page Title="SIS HomeRoom Teachers" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="ClassesAdvisors.aspx.vb" Inherits="UserList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuClasses.ascx" TagName="MenuClasses" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuClasses ID="MenuClasses" runat="server" />
                <br />
                
                <br />
            </div>
            <div class="content-right">
                <h2>
                    CLASSROOM ADVISORS</h2>
                <br />
                <asp:GridView ID="GridViewClassesTeachers" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="SectionMentorID" OnRowUpdated="GridViewUpdateEventHandler" DataSourceID="SqlDataSourceClassesTeachers"
                    Width="100%" AllowPaging="True">
                    <Columns>
                        <asp:TemplateField HeaderText="SMID" InsertVisible="False" SortExpression="SectionMentorID"
                            Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="LabelSMID" runat="server" Text='<%# Bind("SectionMentorID") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("SectionMentorID") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/CoordinatorsSD/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <strong>
                                    <%# Container.DataItemIndex + 1 %>
                                </strong>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="45px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Section" SortExpression="SectionCatalog">
                            <ItemTemplate>
                                <asp:Label ID="LabelSection" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Eval("SectionCatalog") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="HomeRoom Teacher">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListStaff" runat="server" DataSourceID="SqlDataSourceStaff"
                                    DataTextField="StaffName" DataValueField="StaffID" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "StaffID") %>'
                                    Width="95%">
                                </asp:DropDownList>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sign?">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxSign" runat="server" Checked='<%# Bind("IsDefault") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Update" ImageUrl="~/Coordinators/Images/save.gif" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="../CoordinatorsSD/Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" Text="Sorry! No Student Found!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="30px" />
                </asp:GridView>
                <br />
                <asp:Button ID="ButtonUpdateAll" runat="server" Text="Update All Records" Width="100%" />
                <br />
                <br />
                <br />
                <asp:FormView ID="FormViewClassMentors" runat="server" DataKeyNames="SectionMentorID"
                    DataSourceID="SqlDataSourceClassesTeachers" DefaultMode="Insert" Width="100%">
                    <InsertItemTemplate>
                        <table width="100%" style="border: 1px solid #999999; background-color: #EFEFEF">
                            <tr>
                                <td width="35" align="center" height="35">
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/CoordinatorsSD/Images/Item.png" />
                                </td>
                                <td width="120">
                                    <asp:Label ID="Label30" runat="server" Font-Bold="True" Text="Select Section:"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListSections" runat="server" DataSourceID="SqlDataSourceSections"
                                        DataTextField="SectionCatalog" DataValueField="SectionCatalogID" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "SectionCatalogID") %>'
                                        Width="95%" AppendDataBoundItems="True">
                                        <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" height="35">
                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/CoordinatorsSD/Images/Item.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label29" runat="server" Font-Bold="True" Text="Select Staff:"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListStaff" runat="server" DataSourceID="SqlDataSourceStaff"
                                        DataTextField="StaffName" DataValueField="StaffID" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "StaffID") %>'
                                        Width="95%" AppendDataBoundItems="True">
                                        <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" height="35">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:CheckBox ID="CheckBox" runat="server" Checked='<%# Bind("IsDefault") %>' Text="Check this box, if this user has sign permission." />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" height="35">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Button ID="ButtonAdd" runat="server" CommandName="Insert" Text="Add Class Mentor" />
                                </td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                </asp:FormView>
                <br />
                <asp:Label ID="LabelTotal" runat="server" Font-Bold="True"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceClassesTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT tbl_SectionMentors.SectionMentorID, tbl_SectionMentors.AcademicTermID, tbl_SectionMentors.SectionCatalogID, tbl_SectionMentors.StaffID, tbl_SectionCatalog.SectionCatalog, tbl_SectionMentors.SchoolCode, tbl_SectionMentors.IsDefault FROM tbl_SectionMentors INNER JOIN tbl_SectionCatalog ON tbl_SectionMentors.SectionCatalogID = tbl_SectionCatalog.SectionCatalogID WHERE (tbl_SectionMentors.SchoolCode = @SchoolCode) AND (tbl_SectionMentors.AcademicTermID = @AcademicTermID) AND (tbl_SectionCatalog.SectionSchool = N'SD') ORDER BY tbl_SectionCatalog.SectionCatalog"
                    UpdateCommand="UPDATE tbl_SectionMentors SET StaffID = @StaffID, IsDefault = @IsDefault WHERE (SectionMentorID = @SectionMentorID)"
                    DeleteCommand="DELETE FROM tbl_SectionMentors WHERE (SectionMentorID = @SectionMentorID)"
                    InsertCommand="INSERT INTO tbl_SectionMentors(AcademicTermID, SchoolCode, SectionCatalogID, StaffID, IsDefault) VALUES (@AcademicTermID, @SchoolCode, @SectionCatalogID, @StaffID, @IsDefault)">
                    <DeleteParameters>
                        <asp:Parameter Name="SectionMentorID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode" PropertyName="SelectedValue" />
                        <asp:Parameter Name="SectionCatalogID" />
                        <asp:Parameter Name="StaffID" />
                        <asp:Parameter Name="IsDefault" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="StaffID" />
                        <asp:Parameter Name="IsDefault" />
                        <asp:Parameter Name="SectionMentorID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) AND (SectionSchool = N'SD') ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StaffID, StaffName FROM vw_UsersStaff WHERE (SchoolCode = @SchoolCode) ORDER BY StaffName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
