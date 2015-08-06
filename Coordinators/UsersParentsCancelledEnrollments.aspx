<%@ Page Title="SIS Parents" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="UsersParentsCancelledEnrollments.aspx.vb" Inherits="NewUserAccount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuUsers.ascx" TagName="MenuUsers" TagPrefix="uc1" %>
<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uc2" %>
<%@ Register Src="EmptyTemplate.ascx" TagName="EmptyTemplate" TagPrefix="uc2" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="50" width="60">
                            <asp:HyperLink ID="HyperLinkParents" runat="server" 
                                ImageUrl="~/Coordinators/Images/menu_parents.png" 
                                NavigateUrl="~/Coordinators/UsersParents.aspx" ToolTip="Parent Details"></asp:HyperLink>
                        </td>
                        <td width="60">
                            <asp:HyperLink ID="HyperLinkAddNewParent" runat="server" 
                                ImageUrl="~/Coordinators/Images/menu_add.png" 
                                NavigateUrl="~/Coordinators/UsersParentsAddNewParent.aspx" 
                                ToolTip="Add New Parent"></asp:HyperLink>
                        </td>
                        <td width="60">
                            <asp:HyperLink ID="HyperLinkUsersCancel" runat="server" 
                                ImageUrl="~/Coordinators/Images/menu_remove.png" 
                                NavigateUrl="~/Coordinators/UsersParentsCancelledEnrollments.aspx" 
                                ToolTip="Cancelled Enrollments"></asp:HyperLink>
                        </td>
                        <td width="60">
                            &nbsp;</td>
                    </tr>
                </table>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28" width="33%">
                            <asp:CheckBox ID="CheckBoxSD" runat="server" AutoPostBack="True" Checked="True" Enabled="False"
                                Text="SD" />
                        </td>
                        <td height="30" width="33%">
                            <asp:CheckBox ID="CheckBoxSMP" runat="server" AutoPostBack="True" Checked="True"
                                Enabled="False" Text="SMP" />
                        </td>
                        <td height="30">
                            <asp:CheckBox ID="CheckBoxSMA" runat="server" AutoPostBack="True" Checked="True"
                                Enabled="False" Text="SMA" />
                        </td>
                    </tr>
                    <tr>
                        <td height="28" colspan="3">
                            <asp:CheckBox ID="CheckBoxFilter" runat="server" AutoPostBack="True" Checked="True"
                                Text="Filter Parents By Section?" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" height="28">
                            <asp:DropDownList ID="DropDownListSections" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceSections"
                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" Width="95%">
                                <asp:ListItem Value="">Select A School to Filter!</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28" colspan="3">
                            <asp:Label ID="Label134" runat="server" Text="Parent List:"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:ListBox ID="ListBoxParents" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceListBoxParents"
                                DataTextField="ResponsibleParent" DataValueField="ResponsibleParentID" Height="250px"
                                Width="95%"></asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" height="28">
                            <asp:Label ID="LabelTotal" runat="server"></asp:Label>
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content-right">
                <h2>
                    PARENT INFORMATION</h2>
                <br />
                <asp:TabContainer ID="TabContainerParents" runat="server" ActiveTabIndex="0" Width="680px"
                    CssClass="tab">
                    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                        <HeaderTemplate>
                            Overview
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:FormView ID="FormViewParentsOverview" runat="server" DataKeyNames="ResponsibleParentID"
                                DataSourceID="SqlDataSourceFormViewParentsOverview" DefaultMode="Edit" Width="100%">
                                <EditItemTemplate>
                                    <table id="StudentTable0" width="100%">
                                        <tr>
                                            <td height="30" width="20">
                                                <asp:Image ID="Image55" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td width="140">
                                                <asp:Label ID="Label84" runat="server" Font-Bold="True" meta:resourcekey="Label1Resource1"
                                                    Text="School Name:"></asp:Label>
                                            </td>
                                            <td width="240">
                                                <asp:DropDownList ID="DropDownListSchoolCodes" runat="server" DataSourceID="SqlDataSourceFormViewParentsSchoolCodes"
                                                    DataTextField="SchoolName" DataValueField="SchoolCode" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "SchoolCode") %>'
                                                    TabIndex="7" Width="230px">
                                                </asp:DropDownList>
                                            </td>
                                            <td width="20">
                                            </td>
                                            <td colspan="2" rowspan="7" width="130">
                                                <asp:Image ID="Image134" runat="server" ImageUrl="~/Staff/Images/parents.png" Width="200px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30" width="20">
                                                <asp:Image ID="Image65" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td width="140">
                                                <asp:Label ID="Label85" runat="server" Font-Bold="True" meta:resourcekey="Label2Resource1"
                                                    Text="Username:"></asp:Label>
                                            </td>
                                            <td width="180">
                                                <asp:TextBox ID="TextBoxUsername" runat="server" Font-Bold="True" ForeColor="Red"
                                                    MaxLength="50" meta:resourcekey="TextBoxSexResource1" Text='<%# Bind("UserName") %>'
                                                    Width="220px"></asp:TextBox>
                                            </td>
                                            <td width="20">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30" width="20">
                                            </td>
                                            <td width="140">
                                            </td>
                                            <td width="180">
                                            </td>
                                            <td width="20">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image57" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label86" runat="server" Font-Bold="True" meta:resourcekey="Label2Resource1"
                                                    Text="Contact Parent:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxResponsibleParent" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                                    Text='<%# Bind("ResponsibleParent") %>' Width="220px"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image59" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label88" runat="server" Font-Bold="True" meta:resourcekey="Label2Resource1"
                                                    Text="Current City:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxCurrentCity" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                                    Width="220px"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image63" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label87" runat="server" Font-Bold="True" meta:resourcekey="Label2Resource1"
                                                    Text="Contact Phone:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxContactPhone" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                    Text='<%# Bind("ContactPhone") %>' Width="220px"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image64" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label89" runat="server" Font-Bold="True" meta:resourcekey="Label2Resource1"
                                                    Text="Contact Email:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxContactEmail" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                    Text='<%# Bind("ContactEmail") %>' Width="220px"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="75" valign="top">
                                                <asp:Image ID="Image61" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td valign="top">
                                                <asp:Label ID="Label90" runat="server" Font-Bold="True" meta:resourcekey="Label5Resource1"
                                                    Text="Contact Address:"></asp:Label>
                                            </td>
                                            <td colspan="4" valign="top">
                                                <asp:TextBox ID="TextBoxContactAddress" runat="server" Height="60px" MaxLength="50"
                                                    meta:resourcekey="TextBoxSexResource1" Text='<%# Bind("ContactAddress") %>' TextMode="MultiLine"
                                                    Width="97%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image62" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label91" runat="server" Font-Bold="True" meta:resourcekey="Label5Resource1"
                                                    Text="Known Languages:"></asp:Label>
                                            </td>
                                            <td colspan="4">
                                                <asp:TextBox ID="TextBoxKnownLanguages" runat="server" meta:resourcekey="TextBoxSexResource1"
                                                    Text='<%# Bind("KnownLanguages") %>' Width="97%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                            </td>
                                            <td>
                                            </td>
                                            <td colspan="4">
                                                <asp:Button ID="ButtonUpdateParentsOverview" runat="server" CommandName="Update"
                                                    Text="Update Changes" Width="230px" />
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <uc2:EmptyTemplate ID="EmptyTemplate1" runat="server" />
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource ID="SqlDataSourceFormViewParentsOverview" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT tbl_Parents.ResponsibleParentID, tbl_Parents.SchoolCode, tbl_Parents.ContactPhone, tbl_Parents.ContactEmail, tbl_Parents.ContactAddress, tbl_Parents.KnownLanguages, tbl_Parents.CurrentCity, aspnet_Users.UserName, tbl_Parents.ResponsibleParent FROM tbl_Parents INNER JOIN aspnet_Users ON tbl_Parents.ResponsibleParentID = aspnet_Users.UserId WHERE (tbl_Parents.ResponsibleParentID = @ResponsibleParentID)"
                                UpdateCommand="UPDATE tbl_Parents SET SchoolCode = @SchoolCode, ContactPhone = @ContactPhone, ContactEmail = @ContactEmail, ContactAddress = @ContactAddress, KnownLanguages = @KnownLanguages, CurrentCity = @CurrentCity, ResponsibleParent = @ResponsibleParent WHERE (ResponsibleParentID = @ResponsibleParentID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ListBoxParents" Name="ResponsibleParentID" PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="SchoolCode" />
                                    <asp:Parameter Name="ContactPhone" />
                                    <asp:Parameter Name="ContactEmail" />
                                    <asp:Parameter Name="ContactAddress" />
                                    <asp:Parameter Name="KnownLanguages" />
                                    <asp:Parameter Name="CurrentCity" />
                                    <asp:Parameter Name="ResponsibleParent" />
                                    <asp:Parameter Name="ResponsibleParentID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceFormViewParentsSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT [SchoolCode], [SchoolName] FROM [tbl_Schools] ORDER BY [SchoolName]">
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                        <HeaderTemplate>
                            Additional
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:FormView ID="FormViewParentsAdditional" runat="server" DataKeyNames="ResponsibleParentID"
                                DataSourceID="SqlDataSourceFormViewParentsAdditional" DefaultMode="Edit" Width="100%">
                                <EditItemTemplate>
                                    <table id="StudentTable1" width="100%">
                                        <tr>
                                            <td height="30" width="20">
                                                <asp:Image ID="Image81" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td width="130">
                                                <asp:Label ID="Label108" runat="server" meta:resourcekey="Label7Resource1" Text="Father Name:"></asp:Label>
                                            </td>
                                            <td width="175">
                                                <asp:TextBox ID="TextBoxFatherName" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                    Text='<%# Bind("FatherName") %>' Width="150px"></asp:TextBox>
                                            </td>
                                            <td width="20">
                                                <asp:Image ID="Image82" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td width="130">
                                                <asp:Label ID="Label109" runat="server" meta:resourcekey="Label7Resource1" Text="Mother Name:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxMotherName" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                    Text='<%# Bind("MotherName") %>' Width="140px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image105" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label119" runat="server" meta:resourcekey="Label7Resource1" Text="Father E-Mail:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="xFatherEMail" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                                    Text='<%# Bind("FatherEmail") %>' Width="150px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Image ID="Image106" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label120" runat="server" meta:resourcekey="Label7Resource1" Text="Mother E-Mail:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="xMotherEMail" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                                    Text='<%# Bind("FatherEmail") %>' Width="140px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image110" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelStartingGrade9" runat="server" meta:resourcekey="LabelStartingGradeResource1"
                                                    Text="Father Handphone:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxFatherHandphone1" runat="server" MaxLength="30" meta:resourcekey="TextBoxStartingGradeResource1"
                                                    Text='<%# Bind("FatherHandPhone") %>' Width="150px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Image ID="Image109" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelStartingGrade10" runat="server" meta:resourcekey="LabelStartingGradeResource1"
                                                    Text="Mother Handphone:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxMotherHandphone1" runat="server" meta:resourcekey="TextBox2Resource1"
                                                    Text='<%# Bind("MotherHandPhone") %>' Width="140px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image89" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label115" runat="server" meta:resourcekey="Label7Resource1" Text="Father Company:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxFatherCompany" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                    Text='<%# Bind("FatherCompany") %>' Width="150px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Image ID="Image90" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label116" runat="server" meta:resourcekey="Label7Resource1" Text="Mother Company:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxMotherCompany" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                    Text='<%# Bind("MotherCompany") %>' Width="140px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image103" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label117" runat="server" meta:resourcekey="Label7Resource1" Text="Father Position:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxFatherPosition" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                    Text='<%# Bind("FatherPosition") %>' Width="150px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Image ID="Image104" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label118" runat="server" meta:resourcekey="Label7Resource1" Text="Mother Position:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxMotherPosition" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                    Text='<%# Bind("MotherPosition") %>' Width="140px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30" valign="top">
                                                <asp:Image ID="Image91" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td valign="top">
                                                <asp:Label ID="LabelStartingGrade7" runat="server" meta:resourcekey="LabelStartingGradeResource1"
                                                    Text="Father Occupation:"></asp:Label>
                                            </td>
                                            <td valign="top">
                                                <asp:TextBox ID="TextBoxFatherOccupation1" runat="server" Height="60px" MaxLength="100"
                                                    meta:resourcekey="TextBoxSexResource1" Text='<%# Bind("FatherOccupation") %>'
                                                    TextMode="MultiLine" Width="150px"></asp:TextBox>
                                            </td>
                                            <td valign="top">
                                                <asp:Image ID="Image92" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td valign="top">
                                                <asp:Label ID="LabelStartingGrade8" runat="server" meta:resourcekey="LabelStartingGradeResource1"
                                                    Text="Mother Occupation:"></asp:Label>
                                            </td>
                                            <td valign="top">
                                                <asp:TextBox ID="TextBoxMotherOccupation1" runat="server" Height="60px" MaxLength="100"
                                                    meta:resourcekey="TextBoxSexResource1" Text='<%# Bind("MotherOccupation") %>'
                                                    TextMode="MultiLine" Width="140px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30" valign="top">
                                                <asp:Image ID="Image107" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td valign="top">
                                                <asp:Label ID="LabelStartingGrade11" runat="server" meta:resourcekey="LabelStartingGradeResource1"
                                                    Text="Father Office:"></asp:Label>
                                            </td>
                                            <td valign="top">
                                                <asp:TextBox ID="TextBoxFatherOffice" runat="server" Height="60px" MaxLength="100"
                                                    meta:resourcekey="TextBoxSexResource1" Text='<%# Bind("FatherOfficeAddress") %>'
                                                    TextMode="MultiLine" Width="150px"></asp:TextBox>
                                            </td>
                                            <td valign="top">
                                                <asp:Image ID="Image108" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td valign="top">
                                                <asp:Label ID="LabelStartingGrade12" runat="server" meta:resourcekey="LabelStartingGradeResource1"
                                                    Text="Mother Office:"></asp:Label>
                                            </td>
                                            <td valign="top">
                                                <asp:TextBox ID="TextBoxMotherOffice" runat="server" Height="60px" MaxLength="100"
                                                    meta:resourcekey="TextBoxSexResource1" Text='<%# Bind("MotherOfficeAddress") %>'
                                                    TextMode="MultiLine" Width="140px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image93" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label110" runat="server" meta:resourcekey="Label13Resource1" Text="Father Date of Birth:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxFatherDateofBirth" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                                    Text='<%# Bind("FatherDateofBirth") %>' Width="150px"></asp:TextBox>
                                                <asp:CalendarExtender ID="TextBoxFatherDateofBirth_CalendarExtender1" runat="server"
                                                    TargetControlID="TextBoxFatherDateofBirth">
                                                </asp:CalendarExtender>
                                                <asp:MaskedEditExtender ID="MaskedEditExtenderTextBoxFatherDateofBirth1" runat="server"
                                                    CultureName="id-ID" Mask="99/99/9999" MaskType="Date" TargetControlID="TextBoxFatherDateofBirth">
                                                </asp:MaskedEditExtender>
                                                <asp:RangeValidator ID="RangeValidatorTextBoxFatherDateofBirth1" runat="server" ControlToValidate="TextBoxFatherDateofBirth"
                                                    ErrorMessage="*" MaximumValue="1.1.2020" MinimumValue="1.1.1900" SetFocusOnError="True"
                                                    Type="Date"></asp:RangeValidator>
                                            </td>
                                            <td>
                                                <asp:Image ID="Image94" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label111" runat="server" meta:resourcekey="Label14Resource1" Text="Mother Date of Birth:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxMotherDateofBirth" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                                    Text='<%# Bind("MotherDateofBirth") %>' Width="140px"></asp:TextBox>
                                                <asp:CalendarExtender ID="TextBoxMotherDateofBirth_CalendarExtender1" runat="server"
                                                    TargetControlID="TextBoxMotherDateofBirth">
                                                </asp:CalendarExtender>
                                                <asp:MaskedEditExtender ID="MaskedEditExtenderMotherDateofBirth1" runat="server"
                                                    CultureName="id-ID" Mask="99/99/9999" MaskType="Date" TargetControlID="TextBoxMotherDateofBirth">
                                                </asp:MaskedEditExtender>
                                                <asp:RangeValidator ID="RangeValidatorMotherDateofBirth1" runat="server" ControlToValidate="TextBoxMotherDateofBirth"
                                                    ErrorMessage="*" MaximumValue="1.1.2020" MinimumValue="1.1.1900" SetFocusOnError="True"
                                                    Type="Date"></asp:RangeValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image95" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label112" runat="server" meta:resourcekey="Label13Resource1" Text="Father Place of Birth:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="xFatherPlaceofBirth1" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                                    Text='<%# Bind("FatherPlaceofBirth") %>' Width="150px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Image ID="Image96" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label113" runat="server" meta:resourcekey="Label13Resource1" Text="Mother Place of Birth:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxMotherPlaceofBirth1" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                                    Text='<%# Bind("MotherPlaceofBirth") %>' Width="140px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image97" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelStartingTerm9" runat="server" meta:resourcekey="LabelStartingTermResource1"
                                                    Text="Father Origin:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxFatherOrigin1" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                                    Width="150px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Image ID="Image98" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelStartingTerm10" runat="server" meta:resourcekey="LabelStartingTermResource1"
                                                    Text="Mother Origin:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxMotherOrigin1" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                                    Width="140px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image99" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td height="28">
                                                <asp:Label ID="LabelStartingTerm11" runat="server" meta:resourcekey="LabelStartingTermResource1"
                                                    Text="Father Religion:"></asp:Label>
                                            </td>
                                            <td height="28">
                                                <asp:TextBox ID="TextBoxFatherReligion1" runat="server" meta:resourcekey="TextBoxStartingTermResource1"
                                                    Text='<%# Bind("FatherReligion") %>' Width="150px"></asp:TextBox>
                                            </td>
                                            <td height="28">
                                                <asp:Image ID="Image100" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td height="28" width="120">
                                                <asp:Label ID="Label114" runat="server" meta:resourcekey="Label4Resource1" Text="Mother Religion:"></asp:Label>
                                            </td>
                                            <td height="28">
                                                <asp:TextBox ID="TextBoxMotherReligion1" runat="server" meta:resourcekey="TextBox1Resource2"
                                                    Text='<%# Bind("MotherReligion") %>' Width="140px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                            </td>
                                            <td height="28">
                                            </td>
                                            <td height="28">
                                                <asp:Button ID="ButtonUpdateParentsAdditional" runat="server" CommandName="Update"
                                                    Text="Update Changes" Width="160px" />
                                            </td>
                                            <td height="28">
                                            </td>
                                            <td height="28" width="120">
                                            </td>
                                            <td height="28">
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <uc2:EmptyTemplate ID="EmptyTemplate1" runat="server" />
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource ID="SqlDataSourceFormViewParentsAdditional" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT ResponsibleParentID, FatherDateofBirth, FatherName, FatherPlaceofBirth, FatherHandPhone, FatherOccupation, FatherOrigin, FatherReligion, MotherName, MotherDateofBirth, MotherPlaceofBirth, MotherHandPhone, MotherOccupation, MotherReligion, MotherOrigin, FatherCompany, FatherPosition, FatherOfficeAddress, FatherEmail, MotherCompany, MotherPosition, MotherOfficeAddress, MotherEmail FROM tbl_Parents WHERE (ResponsibleParentID = @ResponsibleParentID)"
                                UpdateCommand="UPDATE tbl_Parents SET FatherDateofBirth = @FatherDateofBirth, FatherPlaceofBirth = @FatherPlaceofBirth, FatherHandPhone = @FatherHandPhone, FatherOrigin = @FatherOrigin, FatherReligion = @FatherReligion, MotherName = @MotherName, MotherDateofBirth = @MotherDateofBirth, MotherPlaceofBirth = @MotherPlaceofBirth, MotherHandPhone = @MotherHandPhone, MotherOccupation = @MotherOccupation, MotherOrigin = @MotherOrigin, MotherReligion = @MotherReligion, FatherName = @FatherName, FatherOccupation = @FatherOccupation, FatherCompany = @FatherCompany, FatherPosition = @FatherPosition, FatherOfficeAddress = @FatherOfficeAddress, FatherEmail = @FatherEmail, MotherCompany = @MotherCompany, MotherPosition = @MotherPosition, MotherOfficeAddress = @MotherOfficeAddress, MotherEmail = @MotherEmail WHERE (ResponsibleParentID = @ResponsibleParentID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ListBoxParents" Name="ResponsibleParentID" PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="FatherDateofBirth" />
                                    <asp:Parameter Name="FatherPlaceofBirth" />
                                    <asp:Parameter Name="FatherHandPhone" />
                                    <asp:Parameter Name="FatherOrigin" />
                                    <asp:Parameter Name="FatherReligion" />
                                    <asp:Parameter Name="MotherName" />
                                    <asp:Parameter Name="MotherDateofBirth" />
                                    <asp:Parameter Name="MotherPlaceofBirth" />
                                    <asp:Parameter Name="MotherHandPhone" />
                                    <asp:Parameter Name="MotherOccupation" />
                                    <asp:Parameter Name="MotherOrigin" />
                                    <asp:Parameter Name="MotherReligion" />
                                    <asp:Parameter Name="FatherName" />
                                    <asp:Parameter Name="FatherOccupation" />
                                    <asp:Parameter Name="FatherCompany" />
                                    <asp:Parameter Name="FatherPosition" />
                                    <asp:Parameter Name="FatherOfficeAddress" />
                                    <asp:Parameter Name="FatherEmail" />
                                    <asp:Parameter Name="MotherCompany" />
                                    <asp:Parameter Name="MotherPosition" />
                                    <asp:Parameter Name="MotherOfficeAddress" />
                                    <asp:Parameter Name="MotherEmail" />
                                    <asp:Parameter Name="ResponsibleParentID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
                        <HeaderTemplate>
                            Notes
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:FormView ID="FormViewParentsNotes" runat="server" DataKeyNames="ResponsibleParentID"
                                DataSourceID="SqlDataSourceFormViewParentsNotes" DefaultMode="Edit" Width="100%">
                                <EditItemTemplate>
                                    <table id="StudentTable2" width="100%">
                                        <tr>
                                            <td height="28" width="20">
                                            </td>
                                            <td width="140">
                                            </td>
                                            <td width="180">
                                            </td>
                                            <td width="20">
                                            </td>
                                            <td width="130">
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="75" valign="top">
                                                <asp:Image ID="Image129" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td valign="top">
                                                <asp:Label ID="LabelStartingTerm17" runat="server" meta:resourcekey="LabelStartingTermResource1"
                                                    Text="Home Visits:"></asp:Label>
                                            </td>
                                            <td colspan="4" height="28" valign="top">
                                                <asp:TextBox ID="TextBoxHomevisits" runat="server" Height="60px" meta:resourcekey="TextBox9Resource1"
                                                    placeholder="Home Visits" Text='<%# Bind("HomeVisits") %>' TextMode="MultiLine"
                                                    Width="97%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="75" valign="top">
                                                <asp:Image ID="Image130" runat="server" ImageUrl="~/Coordinators/Images/LeftArrow.png" />
                                            </td>
                                            <td valign="top">
                                                <asp:Label ID="LabelStartingTerm18" runat="server" meta:resourcekey="LabelStartingTermResource1"
                                                    Text="Teacher Notes:"></asp:Label>
                                            </td>
                                            <td colspan="4" height="28">
                                                <asp:TextBox ID="TextBoxNotes" runat="server" Height="60px" meta:resourcekey="TextBox4Resource1"
                                                    placeholder="Teacher Notes" Text='<%# Bind("Notes") %>' TextMode="MultiLine"
                                                    Width="97%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30" valign="top">
                                            </td>
                                            <td valign="top">
                                            </td>
                                            <td colspan="4" height="28">
                                                <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceGridviewStudents"
                                                    Width="98%">
                                                    <Columns>
                                                        <asp:BoundField DataField="SectionCatalog" HeaderText="Section" SortExpression="SectionCatalog">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        <br />
                                                        No Student Found!<br />
                                                        <br />
                                                    </EmptyDataTemplate>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30" valign="top">
                                            </td>
                                            <td valign="top">
                                            </td>
                                            <td colspan="4" height="28">
                                                <asp:CheckBox ID="CheckBoxContinue2" runat="server" Checked='<%# Bind("Continue") %>'
                                                    Text="Continue?" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30" valign="top">
                                            </td>
                                            <td valign="top">
                                            </td>
                                            <td colspan="4" height="28">
                                                <asp:Button ID="ButtonUpdateParentsNotes" runat="server" CommandName="Update" Text="Update Changes"
                                                    Width="230px" />
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <uc2:EmptyTemplate ID="EmptyTemplate1" runat="server" />
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource ID="SqlDataSourceFormViewParentsNotes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT ResponsibleParentID, Notes, HomeVisits, [Continue] FROM tbl_Parents WHERE (ResponsibleParentID = @ResponsibleParentID)"
                                UpdateCommand="UPDATE tbl_Parents SET Notes = @Notes, HomeVisits = @HomeVisits, [Continue] = @Continue WHERE (ResponsibleParentID = @ResponsibleParentID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ListBoxParents" Name="ResponsibleParentID" PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Notes" />
                                    <asp:Parameter Name="HomeVisits" />
                                    <asp:Parameter Name="Continue" />
                                    <asp:Parameter Name="ResponsibleParentID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceGridviewStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT tbl_SectionCatalog.SectionCatalog, tbl_Students.StudentName FROM tbl_Students INNER JOIN tbl_SectionCatalog ON tbl_Students.CurrentSectionID = tbl_SectionCatalog.SectionCatalogID WHERE (tbl_Students.ParentID = @ParentID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ListBoxParents" Name="ParentID" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SchoolCode, SchoolName FROM tbl_Schools WHERE (SchoolCode = @SchoolCode) ORDER BY SchoolName">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_SectionsMentors WHERE (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID) ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceListBoxParents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    FilterExpression="CurrentSectionID={0}" SelectCommand="SELECT ResponsibleParentID, ResponsibleParent, SectionCatalogID, AcademicTermID, SchoolCode, SectionSchool FROM vw_Parents WHERE (SchoolCode = @SchoolCode) AND (SectionSchool = @IsSD OR SectionSchool = @IsSMP OR SectionSchool = @IsSMA) AND (AcademicTermID = @AcademicTermID) ORDER BY ResponsibleParent">
                    <FilterParameters>
                        <asp:ControlParameter ControlID="DropDownListSections" DbType="Int32" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                    </FilterParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:Parameter Name="IsSD" DefaultValue="SD" />
                        <asp:Parameter Name="IsSMP" DefaultValue="SMP" />
                        <asp:Parameter Name="IsSMA" DefaultValue="SMA" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <uc2:WebMessageBox ID="WebMessageBoxParents" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
