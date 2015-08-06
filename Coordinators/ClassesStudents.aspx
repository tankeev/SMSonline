<%@ Page Title="SIS Class Students" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="ClassesStudents.aspx.vb" Inherits="UserList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuClasses.ascx" TagName="MenuClasses" TagPrefix="uc1" %>
<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uc2" %>
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
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="LabelTotal0" runat="server" Font-Bold="True">School Sections</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListSections" runat="server" DataSourceID="SqlDataSourceSections"
                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" RepeatColumns="4"
                                AutoPostBack="True" Width="95%">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28" width="150">
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                            <asp:Button ID="ButtonHidden" runat="server" Text="Hidden Button" Style="display: none;" />
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    CLASSROOM STUDENTS</h2>
                <br />
                <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID"
                    DataSourceID="SqlDataSourceStudents" Width="675px" ShowFooter="True">
                    <Columns>
                        <asp:TemplateField HeaderText="NO">
                            <ItemTemplate>
                                <strong>
                                    <%# Container.DataItemIndex + 1 %>
                                </strong>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student Name" SortExpression="StudentName">
                            <FooterTemplate>
                                <asp:CheckBox ID="CheckBoxGraduated" runat="server" Font-Bold="True" Font-Size="X-Small"
                                    ForeColor="Red" Text="Graduate Class!" />
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelStudentName" runat="server" Font-Size="X-Small" Text='<%# Bind("StudentName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="60px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UserName" HeaderText="NISN" SortExpression="UserName">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="StudentID" SortExpression="StudentID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="LabelStudentID" runat="server" Text='<%# Bind("StudentID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Section">
                            <HeaderTemplate>
                                <asp:DropDownList ID="DropDownListSectionsMaster" runat="server" DataSourceID="SqlDataSourceSectionsAll"
                                    DataTextField="SectionCatalog" DataValueField="SectionCatalogID" Width="90%"
                                    AutoPostBack="True" OnSelectedIndexChanged="DropDownListSectionsMaster_SelectedIndexChanged"
                                    AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Not Selected!</asp:ListItem>
                                </asp:DropDownList>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListSections" runat="server" DataSourceID="SqlDataSourceSections"
                                    DataTextField="SectionCatalog" DataValueField="SectionCatalogID" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "SectionCatalogID") %>'
                                    Width="90%">
                                </asp:DropDownList>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="120px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Save">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonSave" runat="server" CommandName="Update" ImageUrl="~/Coordinators/Images/Save-as-icon.png"
                                    ToolTip="Update This Student Only!" Width="18px" />
                                <asp:ConfirmButtonExtender ID="ImageButtonSave_ConfirmButtonExtender" runat="server"
                                    ConfirmText="Are you sure, Do you want to save?" TargetControlID="ImageButtonSave">
                                </asp:ConfirmButtonExtender>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:ImageButton ID="ImageButtonSaveFooter" runat="server" ImageUrl="~/Coordinators/Images/Save-as-icon.png"
                                    OnClick="GridViewStudentsGraduatedAll" ToolTip="Graduate This Class!" 
                                    Width="18px" />
                                <asp:ConfirmButtonExtender ID="ImageButtonSaveFooter_ConfirmButtonExtender" runat="server"
                                    ConfirmText="Are you sure, Do you want to save?" TargetControlID="ImageButtonSaveFooter">
                                </asp:ConfirmButtonExtender>
                            </FooterTemplate>
                            <HeaderTemplate>
                                <asp:ImageButton ID="ImageButtonSaveMaster" runat="server" ImageUrl="~/Coordinators/Images/Save-as-icon.png"
                                    Width="18px" Enabled="False" />
                                <asp:ConfirmButtonExtender ID="ImageButtonSaveMaster_ConfirmButtonExtender" runat="server"
                                    ConfirmText="Are you sure, Do you want to save?" TargetControlID="ImageButtonSaveMaster">
                                </asp:ConfirmButtonExtender>
                            </HeaderTemplate>
                            <FooterStyle HorizontalAlign="Center" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="40px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Del">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonDel" runat="server" CommandName="Delete" ImageUrl="~/Coordinators/Images/Delete_bin.gif"
                                    ToolTip="Remove Student!" />
                                <asp:ConfirmButtonExtender ID="ImageButtonDel_ConfirmButtonExtender" runat="server"
                                    ConfirmText="Are you sure?" TargetControlID="ImageButtonDel" Enabled="True">
                                </asp:ConfirmButtonExtender>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:ImageButton ID="ImageButtonDelFooter" runat="server" Enabled="False" ImageUrl="~/Coordinators/Images/Delete_bin.gif" />
                            </FooterTemplate>
                            <HeaderTemplate>
                                <asp:ImageButton ID="ImageButtonDelHeader" runat="server" Enabled="False" ImageUrl="~/Coordinators/Images/Delete_bin.gif" />
                            </HeaderTemplate>
                            <FooterStyle HorizontalAlign="Center" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Sorry! No Student Found!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="22px" />
                </asp:GridView>
                <br />
                <asp:Button ID="ButtonUpdateAll" runat="server" Text="Update All" Width="675px" />
                <asp:ConfirmButtonExtender ID="ButtonUpdateAll_ConfirmButtonExtender" runat="server"
                    ConfirmText="Are you sure?" Enabled="True" TargetControlID="ButtonUpdateAll">
                </asp:ConfirmButtonExtender>
                <br />
                <br />
                <asp:Label ID="LabelTotal" runat="server" Font-Bold="True"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_SectionsMentors WHERE (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID) ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSectionsAll" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM tbl_SectionCatalog ORDER BY SectionGroup">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName, Gender, UserName, SectionCatalogID FROM vw_AcademicTermsStudents WHERE (SectionCatalogID = @SectionCatalogID) AND (AcademicTermID = @AcademicTermID) AND (SchoolCode = @SchoolCode) ORDER BY StudentName"
                    UpdateCommand="UPDATE tbl_AcademicTermsStudents SET SectionCatalogID = @SectionCatalogID WHERE (StudentID = @StudentID) AND (AcademicTermID = @AcademicTermID)"
                    DeleteCommand="DELETE FROM tbl_AcademicTermsStudents WHERE (AcademicTermID = @AcademicTermID) AND (StudentID = @StudentID) AND (SectionCatalogID = @SectionCatalogID)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:Parameter Name="StudentID" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="SectionCatalogID"
                            PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="SectionCatalogID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SectionCatalogID" />
                        <asp:Parameter Name="StudentID" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStudentsGraduated" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT tbl_Students.StudentID, tbl_Students.StudentName, tbl_Students.Gender, aspnet_Users.UserName, tbl_Students.CurrentSectionID FROM tbl_Students INNER JOIN aspnet_Users ON tbl_Students.StudentID = aspnet_Users.UserId WHERE (tbl_Students.SchoolCode = @SchoolCode) AND (tbl_Students.CurrentSectionID = @CurrentSectionID) AND (tbl_Students.[Continue] = 1) ORDER BY tbl_Students.StudentName"
                    UpdateCommand="UPDATE tbl_Students SET [Continue] = @Continue WHERE (StudentID = @StudentID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Continue" />
                        <asp:Parameter Name="StudentID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <uc2:WebMessageBox ID="WebMessageBoxStudents" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
