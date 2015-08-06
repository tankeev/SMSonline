<%@ Page Title="SIS HomeRoom Teachers" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="ClassesAdvisors.aspx.vb" Inherits="UserList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuClasses.ascx" TagName="MenuClasses" TagPrefix="uc1" %>
<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uc2" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuClasses ID="MenuClasses" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td align="center" height="50">
                            <asp:Button ID="ButtonAddAdvisor" runat="server" Text="Add New Class &amp; Advisor"
                                Width="95%" />
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                        </td>
                    </tr>
                </table>
                <asp:ModalPopupExtender ID="MPCourseSections" runat="server" PopupControlID="PanelAddAdvisor"
                    TargetControlID="ButtonAddAdvisor" BackgroundCssClass="modalBackground" CancelControlID="ButtonClose">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelAddAdvisor" runat="server" CssClass="modalPopup" Width="520px"
                    Style="display: none;">
                    <asp:ImageButton ID="ButtonClose" runat="server" ImageUrl="~/Coordinators/Images/Message_Error.png"
                        CssClass="CloseButton" />
                    <asp:UpdatePanel ID="UpdatePanelSectionTypes" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:FormView ID="FormViewClassMentors" runat="server" DataKeyNames="SectionMentorID"
                                DataSourceID="SqlDataSourceClassesTeachers" DefaultMode="Insert" Width="485px">
                                <InsertItemTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td width="30" align="center" height="35">
                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                                            </td>
                                            <td width="100">
                                                <asp:Label ID="Label31" runat="server" Font-Bold="True" Text="Select Type:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="RadioButtonListSectionTypes" runat="server" AutoPostBack="True"
                                                    RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="0">Regular</asp:ListItem>
                                                    <asp:ListItem Value="1">English</asp:ListItem>
                                                    <asp:ListItem Value="2">Turkce</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" height="35">
                                                <asp:Image ID="Image4" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label30" runat="server" Font-Bold="True" Text="Select Section:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListSections" runat="server" DataSourceID="SqlDataSourceSections"
                                                    DataTextField="SectionCatalog" DataValueField="SectionCatalogID" Width="95%">
                                                    <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM tbl_SectionCatalog WHERE (SectionType = @SectionType) ORDER BY SectionGroup">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="RadioButtonListSectionTypes" Name="SectionType"
                                                            PropertyName="SelectedValue" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" height="35">
                                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label29" runat="server" Font-Bold="True" Text="Select Staff:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListStaff" runat="server" AppendDataBoundItems="False"
                                                    DataSourceID="SqlDataSourceStaff" DataTextField="StaffName" DataValueField="StaffID"
                                                    Width="95%">
                                                    <asp:ListItem Value="">Not Selected!</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" height="35">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBox" runat="server" Checked='<%# Bind("IsDefault") %>' Text="Check this box, if this user has sign permission." />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" height="35">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:Button ID="ButtonAdd" runat="server" CommandName="Insert" Text="Add Class Mentor"
                                                    Width="200px" />
                                            </td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
            </div>
            <div class="content-right">
                <h2>
                    CLASSROOM ADVISORS</h2>
                <br />
                <asp:GridView ID="GridViewClassesTeachers" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="SectionMentorID" OnRowUpdated="GridViewUpdateEventHandler" DataSourceID="SqlDataSourceClassesTeachers"
                    Width="675px" AllowPaging="True">
                    <Columns>
                        <asp:TemplateField HeaderText="SMID" InsertVisible="False" SortExpression="SectionMentorID"
                            Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="LabelSMID" runat="server" Text='<%# Bind("SectionMentorID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Type" SortExpression="SectionType">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListSectionTypes" runat="server" Width="90%" SelectedValue='<%# Bind("SectionType") %>'>
                                    <asp:ListItem Value="0">Regular</asp:ListItem>
                                    <asp:ListItem Value="1">English</asp:ListItem>
                                    <asp:ListItem Value="3">Turkce</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Section" SortExpression="SectionCatalog">
                            <ItemTemplate>
                                <asp:Label ID="LabelSection" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Eval("SectionCatalog") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Width="75px" HorizontalAlign="Center" />
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
                            <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
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
                <asp:Button ID="ButtonUpdateAll" runat="server" Text="Update All Records" Width="675px" />
                <br />
                <br />
                <uc2:WebMessageBox ID="WebMessageBoxAdvisors" runat="server" />
                <asp:SqlDataSource ID="SqlDataSourceClassesTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT tbl_SectionMentors.SectionMentorID, tbl_SectionMentors.AcademicTermID, tbl_SectionMentors.SectionCatalogID, tbl_SectionMentors.StaffID, tbl_SectionCatalog.SectionCatalog, tbl_SectionMentors.SchoolCode, tbl_SectionMentors.IsDefault, tbl_SectionCatalog.SectionGroup, tbl_SectionCatalog.SectionType FROM tbl_SectionMentors INNER JOIN tbl_SectionCatalog ON tbl_SectionMentors.SectionCatalogID = tbl_SectionCatalog.SectionCatalogID WHERE (tbl_SectionMentors.SchoolCode = @SchoolCode) AND (tbl_SectionMentors.AcademicTermID = @AcademicTermID) ORDER BY tbl_SectionCatalog.SectionGroup, tbl_SectionCatalog.SectionCatalog"
                    UpdateCommand="UPDATE tbl_SectionMentors SET StaffID = @StaffID, IsDefault = @IsDefault WHERE (SectionMentorID = @SectionMentorID)"
                    DeleteCommand="DELETE FROM tbl_SectionMentors WHERE (SectionMentorID = @SectionMentorID)"
                    InsertCommand="INSERT INTO tbl_SectionMentors(AcademicTermID, SchoolCode, SectionCatalogID, StaffID, IsDefault) VALUES (@AcademicTermID, @SchoolCode, @SectionCatalogID, @StaffID, @IsDefault)">
                    <DeleteParameters>
                        <asp:Parameter Name="SectionMentorID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:Parameter Name="SectionCatalogID" />
                        <asp:Parameter Name="StaffID" />
                        <asp:Parameter Name="IsDefault" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="StaffID" />
                        <asp:Parameter Name="IsDefault" />
                        <asp:Parameter Name="SectionMentorID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StaffID, StaffName FROM vw_UsersStaff WHERE (SchoolCode = @SchoolCode) AND ([Continue] = 1) ORDER BY StaffName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
