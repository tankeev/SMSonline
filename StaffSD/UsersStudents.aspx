<%@ Page Title="SIS Students" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    ValidateRequest="false" EnableEventValidation="false" CodeFile="UsersStudents.aspx.vb"
    Inherits="NewUserAccount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uswnb" %>
<%@ Register Src="MenuUsers.ascx" TagName="MenuUsers" TagPrefix="uc1" %>
<%@ Register Src="EmptyTemplate.ascx" TagName="EmptyTemplate" TagPrefix="uc2" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU
                </h2>
                <br />
                <uc1:MenuUsers ID="MenuUsers" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="33%" height="28">
                            <asp:CheckBox ID="CheckBoxSD" runat="server" AutoPostBack="True" Checked="True" Enabled="False"
                                Text="SD" />
                        </td>
                        <td width="33%">
                            <asp:CheckBox ID="CheckBoxSMP" runat="server" AutoPostBack="True" Enabled="False"
                                Text="SMP" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBoxSMA" runat="server" AutoPostBack="True" Enabled="False"
                                Text="SMA" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" height="28">
                            <asp:CheckBox ID="CheckBoxFilter" runat="server" AutoPostBack="True" Checked="True"
                                Text="Filter Students By Section?" />
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
                        <td colspan="3" height="28">
                            <asp:Label ID="Label83" runat="server" Text="Student List"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:ListBox ID="ListBoxStudents" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceListBoxStudents"
                                DataTextField="StudentName" DataValueField="StudentID" Height="250px" Width="95%">
                            </asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="28" colspan="3">
                            <asp:Label ID="LabelTotal" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" height="28">
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    STUDENTS</h2>
                <br />
                <asp:TabContainer ID="TabContainerStudents" runat="server" ActiveTabIndex="0" Width="675px"
                    CssClass="tab">
                    <asp:TabPanel ID="TabPanelBasic" runat="server" HeaderText="Student Information">
                        <HeaderTemplate>
                            Overview
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:FormView ID="FormViewStudentsBasicInformation" runat="server" DataSourceID="SqlDataSourceFormViewStudentsBasicInformation"
                                DefaultMode="Edit" DataKeyNames="StudentID" Width="100%">
                                <EditItemTemplate>
                                    <table id="tblBasicInformation" width="100%">
                                        <tr>
                                            <td height="30" width="20">
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td width="140">
                                                <asp:Label ID="Label22" runat="server" meta:resourceKey="Label1Resource1" Text="School No: (NISN)"
                                                    Font-Bold="True"></asp:Label>
                                            </td>
                                            <td width="240">
                                                <asp:TextBox ID="TextBoxUserName" runat="server" Enabled="False" meta:resourceKey="TextBox5Resource1"
                                                    Text='<%# Bind("UserName") %>' Width="220px"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td rowspan="15" valign="top">
                                                <img alt='<%# Eval("StudentName") %>' height="250" src="../SchoolData/StudentPhotos/000.jpg"
                                                    style="border: 3px solid #C0C0C0" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image29" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label19" runat="server" meta:resourceKey="Label1Resource1" Text="School No: (Induk)"
                                                    Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxSchoolNo" runat="server" meta:resourceKey="TextBox5Resource1"
                                                    Text='<%# Bind("SchoolNo") %>' Width="220px"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image11" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" Font-Bold="True" meta:resourceKey="Label2Resource1"
                                                    Text="Full Name:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxStudentName" runat="server" MaxLength="50" meta:resourceKey="TextBoxStudentNameResource1"
                                                    Text='<%# Bind("StudentName") %>' Width="220px"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image3" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label5" runat="server" meta:resourceKey="Label5Resource1" Text="Date of Birth:"
                                                    Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxDateofBirth" runat="server" MaxLength="50" meta:resourceKey="TextBoxStudentNameResource1"
                                                    Text='<%# Bind("DateofBirth", "{0:d}") %>' Width="220px"></asp:TextBox>
                                                <asp:CalendarExtender ID="TextBoxDateofBirth_CalendarExtender" runat="server" Enabled="True"
                                                    TargetControlID="TextBoxDateofBirth">
                                                </asp:CalendarExtender>
                                                <asp:MaskedEditExtender ID="MaskedEditExtenderDateofBirth" runat="server" Century="2000"
                                                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="Rp" CultureDateFormat="DMY"
                                                    CultureDatePlaceholder="/" CultureDecimalPlaceholder="," CultureName="id-ID"
                                                    CultureThousandsPlaceholder="." CultureTimePlaceholder=":" Enabled="True" Mask="99/99/9999"
                                                    MaskType="Date" TargetControlID="TextBoxDateofBirth">
                                                </asp:MaskedEditExtender>
                                            </td>
                                            <td>
                                                <asp:RangeValidator ID="RangeValidatorTextBoxDateofBirth" runat="server" ControlToValidate="TextBoxDateofBirth"
                                                    ErrorMessage="*" MaximumValue="1.1.2020" MinimumValue="1.1.1900" SetFocusOnError="True"
                                                    Type="Date"></asp:RangeValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image6" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label10" runat="server" meta:resourceKey="Label7Resource1" Text="Place of Birth:"
                                                    Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxBirthPlace" runat="server" MaxLength="50" meta:resourceKey="TextBoxSexResource1"
                                                    Text='<%# Bind("BirthPlace") %>' Width="220px"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image10" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label7" runat="server" meta:resourceKey="Label7Resource1" Text="Gender:"
                                                    Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListGender" runat="server" SelectedValue='<%# Bind("Gender") %>'
                                                    Width="230px">
                                                    <asp:ListItem Selected="True" Value="-">Not Specified!</asp:ListItem>
                                                    <asp:ListItem>Male</asp:ListItem>
                                                    <asp:ListItem>Female</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style1" height="30">
                                                <asp:Image ID="Image33" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td class="style1">
                                                <asp:Label ID="Label23" runat="server" meta:resourceKey="Label7Resource1" Text="Religion:"
                                                    Font-Bold="True"></asp:Label>
                                            </td>
                                            <td class="style1">
                                                <asp:TextBox ID="TextBoxReligion" runat="server" MaxLength="50" meta:resourceKey="TextBoxSexResource1"
                                                    Text='<%# Bind("Religion") %>' Width="220px"></asp:TextBox>
                                            </td>
                                            <td class="style3">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image28" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label21" runat="server" meta:resourceKey="Label7Resource1" Text="Current Section:"
                                                    Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListCurrentGrade" runat="server" AppendDataBoundItems="True"
                                                    DataSourceID="SqlDataSourceFormViewStudentsBasicInformationDropDownListSections"
                                                    DataTextField="SectionCatalog" DataValueField="SectionCatalogID" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "CurrentSectionID") %>'
                                                    Width="230px">
                                                    <asp:ListItem>Not Selected!</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBoxScholarship" runat="server" Checked='<%# Bind("IsScholarship") %>'
                                                    Text="Has Scholarship?" />
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image34" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelStartingGrade1" runat="server" meta:resourceKey="LabelStartingGradeResource1"
                                                    Text="Scholarship (%):" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxScholarshipPercentage" runat="server" MaxLength="50" Text='<%# Bind("ScholarshipPercentage") %>'
                                                    Width="220px"></asp:TextBox>
                                                <asp:SliderExtender ID="TextBoxPercentage_SliderExtender" runat="server" BoundControlID="TextBoxSliderValue"
                                                    Enabled="True" EnableHandleAnimation="True" Length="230" Maximum="100" Minimum="0"
                                                    TargetControlID="TextBoxScholarshipPercentage" TooltipText="Percentage: {0}">
                                                </asp:SliderExtender>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxSliderValue" runat="server" Width="30px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBoxOlympiad" runat="server" Checked='<%# Bind("IsOlympiad") %>'
                                                    Text="Is Olympiad Student?" />
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image16" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelStartingGrade0" runat="server" meta:resourceKey="LabelStartingGradeResource1"
                                                    Text="Olympiad Name:" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxOlympiadName" runat="server" MaxLength="30" meta:resourceKey="TextBoxStartingGradeResource1"
                                                    Text='<%# Bind("OlympiadName") %>' Width="220px"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update" Text="Update" Visible="False"
                                                    Width="220px" />
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <uc2:EmptyTemplate ID="EmptyTemplate1" runat="server" />
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource ID="SqlDataSourceFormViewStudentsBasicInformation" runat="server"
                                ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT tbl_Students.StudentID, aspnet_Users.UserName, tbl_Students.SchoolNo, tbl_Students.StudentName, tbl_Students.DateofBirth, tbl_Students.BirthPlace, tbl_Students.Gender, tbl_Students.IsOlympiad, tbl_Students.OlympiadName, tbl_Students.CurrentSectionID, tbl_Students.Religion, tbl_Students.IsScholarship, tbl_Students.ScholarshipPercentage FROM tbl_Students INNER JOIN aspnet_Users ON tbl_Students.StudentID = aspnet_Users.UserId WHERE (tbl_Students.StudentID = @StudentID)"
                                UpdateCommand="UPDATE tbl_Students SET SchoolNo = @SchoolNo, StudentName = @StudentName, DateofBirth = @DateofBirth, BirthPlace = @BirthPlace, Gender = @Gender, Religion = @Religion, IsOlympiad = @IsOlympiad, OlympiadName = @OlympiadName, IsScholarship = @IsScholarship, CurrentSectionID = @CurrentSectionID, ScholarshipPercentage = @ScholarshipPercentage WHERE (StudentID = @StudentID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ListBoxStudents" Name="StudentID" PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="SchoolNo" />
                                    <asp:Parameter Name="StudentName" />
                                    <asp:Parameter Name="DateofBirth" />
                                    <asp:Parameter Name="BirthPlace" />
                                    <asp:Parameter Name="Gender" />
                                    <asp:Parameter Name="Religion" />
                                    <asp:Parameter Name="IsOlympiad" />
                                    <asp:Parameter Name="OlympiadName" />
                                    <asp:Parameter Name="IsScholarship" />
                                    <asp:Parameter Name="CurrentSectionID" />
                                    <asp:Parameter Name="ScholarshipPercentage" />
                                    <asp:Parameter Name="StudentID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceFormViewStudentsBasicInformationDropDownListSections"
                                runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM tbl_SectionCatalog">
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabPanelAdditional" runat="server" HeaderText="TabPanel1">
                        <HeaderTemplate>
                            Additional
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:FormView ID="FormViewStudentsAdditionalInformation" runat="server" DataKeyNames="StudentID"
                                DataSourceID="SqlDataSourceFormViewStudentsAdditionalInformation" DefaultMode="Edit"
                                Width="100%">
                                <EditItemTemplate>
                                    <table id="tblAdditionalInformation" width="100%">
                                        <tr>
                                            <td height="30" width="20">
                                                <asp:Image ID="Image91" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td width="140">
                                                <asp:Label ID="Label52" runat="server" meta:resourceKey="Label4Resource1" Text="Mobile Phone 1:"
                                                    Font-Bold="True" Font-Italic="False"></asp:Label>
                                            </td>
                                            <td width="240">
                                                <asp:TextBox ID="TextBoxContactPhone1" runat="server" meta:resourceKey="TextBox1Resource2"
                                                    Text='<%# Bind("ContactPhone1") %>' Width="220px"></asp:TextBox>
                                            </td>
                                            <td width="35">
                                            </td>
                                            <td width="120">
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30" width="20">
                                                <asp:Image ID="Image92" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td width="120">
                                                <asp:Label ID="Label53" runat="server" meta:resourceKey="Label9Resource1" Text="Mobile Phone 2:"
                                                    Font-Bold="True" Font-Italic="False"></asp:Label>
                                            </td>
                                            <td width="180">
                                                <asp:TextBox ID="TextBoxContactPhone2" runat="server" meta:resourceKey="TextBox2Resource1"
                                                    Text='<%# Bind("ContactPhone2") %>' Width="220px"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td width="120">
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30" width="20">
                                                <asp:Image ID="Image93" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td width="120">
                                                <asp:Label ID="Label54" runat="server" meta:resourceKey="Label11Resource1" Text="Contact E-mail:"
                                                    Font-Bold="True" Font-Italic="False"></asp:Label>
                                            </td>
                                            <td width="180">
                                                <asp:TextBox ID="TextBoxContactEmail" runat="server" MaxLength="50" meta:resourceKey="TextBox3Resource1"
                                                    Text='<%# Bind("ContactEmail") %>' Width="220px"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td width="120">
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30" width="20">
                                                &nbsp;
                                            </td>
                                            <td width="120">
                                                &nbsp;
                                            </td>
                                            <td width="180">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td width="120">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30" width="20">
                                                <asp:Image ID="Image94" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td width="120">
                                                <asp:Label ID="Label55" runat="server" Font-Bold="True" Font-Italic="False" meta:resourceKey="Label15Resource1"
                                                    Text="Passport No:"></asp:Label>
                                            </td>
                                            <td width="180">
                                                <asp:TextBox ID="TextBoxPassportID" runat="server" MaxLength="50" meta:resourceKey="TextBox7Resource1"
                                                    Text='<%# Bind("PassportNo") %>' Width="220px"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td width="120">
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30" width="20">
                                                <asp:Image ID="Image95" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td width="120">
                                                <asp:Label ID="Label56" runat="server" meta:resourceKey="Label16Resource1" Text="Blood Type:"
                                                    Font-Bold="True" Font-Italic="False"></asp:Label>
                                            </td>
                                            <td width="180">
                                                <asp:DropDownList ID="DropDownListBloodType" runat="server" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "BloodType") %>'
                                                    Width="230px">
                                                    <asp:ListItem Selected="True" Value="-">Not Specified!</asp:ListItem>
                                                    <asp:ListItem>A</asp:ListItem>
                                                    <asp:ListItem>B</asp:ListItem>
                                                    <asp:ListItem>AB</asp:ListItem>
                                                    <asp:ListItem>0</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                            </td>
                                            <td width="120">
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30" width="20">
                                                &nbsp;
                                            </td>
                                            <td width="120">
                                                &nbsp;
                                            </td>
                                            <td width="180">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td width="120">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style1" valign="top" width="20">
                                                <asp:Image ID="Image126" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td class="style1" valign="top" width="120">
                                                <asp:Label ID="Label41" runat="server" meta:resourceKey="Label12Resource1" Text="Contact Address:"
                                                    Font-Bold="True" Font-Italic="False"></asp:Label>
                                            </td>
                                            <td class="style1" colspan="3">
                                                <asp:TextBox ID="TextBoxAddress" runat="server" Height="60px" meta:resourceKey="TextBox4Resource1"
                                                    Text='<%# Bind("ContactAddress") %>' TextMode="MultiLine" Width="98%"></asp:TextBox>
                                                &nbsp; &nbsp;
                                            </td>
                                            <td class="style1">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="28" valign="top" width="20">
                                                <asp:Image ID="Image127" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td valign="top" width="120">
                                                <asp:Label ID="LabelHealthIssues0" runat="server" meta:resourceKey="Label12Resource1"
                                                    Text="Healht Issues:" Font-Bold="True" Font-Italic="False"></asp:Label>
                                            </td>
                                            <td colspan="3">
                                                <asp:TextBox ID="TextBoxHealthIssues" runat="server" Height="60px" meta:resourceKey="TextBox9Resource1"
                                                    Text='<%# Bind("HealthIssues") %>' TextMode="MultiLine" Width="98%"></asp:TextBox>
                                                &nbsp; &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="28" valign="top" width="20">
                                                &nbsp;
                                            </td>
                                            <td valign="top" width="120">
                                                &nbsp;
                                            </td>
                                            <td colspan="3">
                                                <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update" Text="Update" Visible="False"
                                                    Width="98%" />
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <uc2:EmptyTemplate ID="EmptyTemplate1" runat="server" />
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource ID="SqlDataSourceFormViewStudentsAdditionalInformation" runat="server"
                                ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT StudentID, ContactPhone1, ContactPhone2, ContactEmail, ContactAddress, PassportNo, BloodType, HealthIssues FROM tbl_Students WHERE (StudentID = @StudentID)"
                                UpdateCommand="UPDATE tbl_Students SET ContactPhone1 = @ContactPhone1, ContactPhone2 = @ContactPhone2, ContactEmail = @ContactEmail, ContactAddress = @ContactAddress, PassportNo = @PassportNo, BloodType = @BloodType, HealthIssues = @HealthIssues WHERE (StudentID = @StudentID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ListBoxStudents" Name="StudentID" PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ContactPhone1" />
                                    <asp:Parameter Name="ContactPhone2" />
                                    <asp:Parameter Name="ContactEmail" />
                                    <asp:Parameter Name="ContactAddress" />
                                    <asp:Parameter Name="PassportNo" />
                                    <asp:Parameter Name="BloodType" />
                                    <asp:Parameter Name="HealthIssues" />
                                    <asp:Parameter Name="StudentID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabPanelEnrollment" runat="server" HeaderText="TabPanel2">
                        <HeaderTemplate>
                            Enrollment
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:FormView ID="FormViewStudentsEnrollmentDetails" runat="server" DataKeyNames="StudentID"
                                DataSourceID="SqlDataSourceFormViewStudentsEnrollmentDetails" DefaultMode="Edit"
                                Width="100%">
                                <EditItemTemplate>
                                    <table id="tblEnrollmentDetails0" width="100%">
                                        <tr>
                                            <td height="30" width="20">
                                                <asp:Image ID="Image66" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td width="140">
                                                <asp:Label ID="Label39" runat="server" meta:resourceKey="Label13Resource1" Text="Enrollment Date:"
                                                    Font-Bold="True"></asp:Label>
                                            </td>
                                            <td width="240">
                                                <asp:TextBox ID="TextBoxEnrollmentDate" runat="server" MaxLength="50" Text='<%# Bind("EnrollmentDate", "{0:d}") %>'
                                                    Width="220px"></asp:TextBox>
                                                <asp:CalendarExtender ID="CalendarExtenderTextBoxEnrollmentDate0" runat="server"
                                                    Enabled="True" TargetControlID="TextBoxEnrollmentDate">
                                                </asp:CalendarExtender>
                                                <asp:MaskedEditExtender ID="MaskedEditExtenderTextBoxEnrollmentDate0" runat="server"
                                                    Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="Rp"
                                                    CultureDateFormat="DMY" CultureDatePlaceholder="/" CultureDecimalPlaceholder=","
                                                    CultureName="id-ID" CultureThousandsPlaceholder="." CultureTimePlaceholder=":"
                                                    Enabled="True" Mask="99/99/9999" MaskType="Date" TargetControlID="TextBoxEnrollmentDate">
                                                </asp:MaskedEditExtender>
                                            </td>
                                            <td width="35">
                                                <asp:RangeValidator ID="RangeValidatorTextBoxEnrollmentDate0" runat="server" ControlToValidate="TextBoxEnrollmentDate"
                                                    ErrorMessage="*" MaximumValue="1.1.2020" MinimumValue="1.1.1900" SetFocusOnError="True"
                                                    Type="Date"></asp:RangeValidator>
                                            </td>
                                            <td width="120">
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image67" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label40" runat="server" Font-Bold="True" meta:resourceKey="Label14Resource1"
                                                    Text="Starting Term:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListStartingTerm" runat="server" AppendDataBoundItems="True"
                                                    DataSourceID="SqlDataSourceFormViewStudentsEnrollmentDetailsDropDownListAcademicTerms"
                                                    DataTextField="AcademicTerm" DataValueField="AcademicTermID" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "StartingAcademicTermID") %>'
                                                    Width="230px">
                                                    <asp:ListItem Value="0">Not Selected!</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image68" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelStartingGrade5" runat="server" meta:resourceKey="LabelStartingGradeResource1"
                                                    Text="Starting Grade:" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListStartingSection" runat="server" AppendDataBoundItems="True"
                                                    DataSourceID="SqlDataSourceFormViewStudentsEnrollmentDetailsDropDownListSections"
                                                    DataTextField="SectionCatalog" DataValueField="SectionCatalogID" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "StartingSectionID") %>'
                                                    Width="230px">
                                                    <asp:ListItem Value="0">Not Selected!</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                &nbsp;
                                            </td>
                                            <td height="25">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image81" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td height="25">
                                                <asp:Label ID="Label49" runat="server" Font-Bold="True" meta:resourceKey="Label14Resource1"
                                                    Text="Level ENG"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListLevelEnglish" runat="server" AppendDataBoundItems="True"
                                                    DataSourceID="SqlDataSourceFormViewStudentsEnrollmentDetailsDropDownListSectionsEng"
                                                    DataTextField="Description" DataValueField="SectionCatalogID" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "LevelEng") %>'
                                                    Width="230px">
                                                    <asp:ListItem Value="0">Not Selected!</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image82" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td height="25">
                                                <asp:Label ID="LabelStartingGrade6" runat="server" meta:resourceKey="LabelStartingGradeResource1"
                                                    Text="Level TR" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListLevelTurkce" runat="server" AppendDataBoundItems="True"
                                                    DataSourceID="SqlDataSourceFormViewStudentsEnrollmentDetailsDropDownListSectionsTur"
                                                    DataTextField="Description" DataValueField="SectionCatalogID" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "LevelTr") %>'
                                                    Width="230px">
                                                    <asp:ListItem Value="0">Not Selected!</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                &nbsp;
                                            </td>
                                            <td height="25">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp; &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="75" valign="top">
                                                <asp:Image ID="Image71" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td height="60" valign="top">
                                                <asp:Label ID="LabelReasonforJoin" runat="server" meta:resourceKey="LabelReasonforJoinResource1"
                                                    Text="Reason for Join:" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td colspan="3" valign="top">
                                                <asp:TextBox ID="TextBoxReasonforJoin" runat="server" Height="60px" meta:resourceKey="TextBox9Resource1"
                                                    Text='<%# Bind("ReasonForJoin") %>' TextMode="MultiLine" Width="98%"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="25" valign="top">
                                                <asp:Image ID="Image72" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td height="75" valign="top">
                                                <asp:Label ID="LabelReasonforLeave" runat="server" meta:resourceKey="LabelReasonforLeaveResource1"
                                                    Text="Reason for Leave:" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td colspan="3" valign="top">
                                                <asp:TextBox ID="TextBoxReasonforLeave" runat="server" Height="60px" meta:resourceKey="TextBox4Resource1"
                                                    Text='<%# Bind("ReasonForLeave") %>' TextMode="MultiLine" Width="98%"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                &nbsp;
                                            </td>
                                            <td height="25">
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBoxContinue0" runat="server" Checked='<%# Bind("Continue") %>'
                                                    Font-Bold="True" ForeColor="Red" Text="Still Our Student?" />
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                &nbsp;
                                            </td>
                                            <td height="25">
                                                &nbsp;
                                            </td>
                                            <td colspan="3">
                                                <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update" Text="Update" Visible="False"
                                                    Width="98%" />
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <uc2:EmptyTemplate ID="EmptyTemplate1" runat="server" />
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource ID="SqlDataSourceFormViewStudentsEnrollmentDetails" runat="server"
                                ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT StudentID, StartingAcademicTermID, StartingSectionID, EnrollmentDate, ReasonForJoin, ReasonForLeave, LevelTr, LevelEng, [Continue] FROM tbl_Students WHERE (StudentID = @StudentID)"
                                UpdateCommand="UPDATE tbl_Students SET EnrollmentDate = @EnrollmentDate, ReasonForJoin = @ReasonForJoin, ReasonForLeave = @ReasonForLeave, LevelTr = @LevelTr, LevelEng = @LevelEng, StartingSectionID = @StartingSectionID, StartingAcademicTermID = @StartingAcademicTermID, [Continue] = @Continue WHERE (StudentID = @StudentID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ListBoxStudents" Name="StudentID" PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="EnrollmentDate" />
                                    <asp:Parameter Name="ReasonForJoin" />
                                    <asp:Parameter Name="ReasonForLeave" />
                                    <asp:Parameter Name="LevelTr" />
                                    <asp:Parameter Name="LevelEng" />
                                    <asp:Parameter Name="StartingSectionID" />
                                    <asp:Parameter Name="StartingAcademicTermID" />
                                    <asp:Parameter Name="Continue" />
                                    <asp:Parameter Name="StudentID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceFormViewStudentsEnrollmentDetailsDropDownListAcademicTerms"
                                runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms">
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceFormViewStudentsEnrollmentDetailsDropDownListSections"
                                runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM tbl_SectionCatalog">
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceFormViewStudentsEnrollmentDetailsDropDownListSectionsEng"
                                runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT [SectionCatalogID], [Description] FROM [tbl_LevelClassesEng]">
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceFormViewStudentsEnrollmentDetailsDropDownListSectionsTur"
                                runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT [SectionCatalogID], [Description] FROM [tbl_LevelClassesTur]">
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabPanelGuardian" runat="server" HeaderText="Guardian Information">
                        <HeaderTemplate>
                            Guardian
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:FormView ID="FormViewParentsGuardianDetails" runat="server" DataSourceID="SqlDataSourceFormViewParentsGuardiansDetails"
                                DefaultMode="Edit" DataKeyNames="ResponsibleParentID" Width="100%">
                                <EditItemTemplate>
                                    <table id="tblGuardiansDetails0" width="100%">
                                        <tr>
                                            <td height="30" width="20">
                                                <asp:Image ID="Image96" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td width="130">
                                                <asp:Label ID="Label58" runat="server" meta:resourceKey="Label2Resource1" Text="Guradian's Name:"></asp:Label>
                                            </td>
                                            <td width="180">
                                                <asp:TextBox ID="TextBoxResponsibleParent" runat="server" MaxLength="50" meta:resourceKey="TextBoxStudentNameResource1"
                                                    Text='<%# Bind("ResponsibleParent") %>' Width="150px"></asp:TextBox>
                                            </td>
                                            <td width="20">
                                                <asp:Image ID="Image124" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td width="130">
                                                <asp:Label ID="Label59" runat="server" meta:resourceKey="Label2Resource1" Text="Contact Phone:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxContactPhone" runat="server" MaxLength="50" meta:resourceKey="TextBoxSexResource1"
                                                    Text='<%# Bind("ContactPhone") %>' Width="140px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image97" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label60" runat="server" meta:resourceKey="Label2Resource1" Text="Current City:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxCurrentCity" runat="server" MaxLength="50" meta:resourceKey="TextBoxStudentNameResource1"
                                                    Text='<%# Bind("CurrentCity") %>' Width="150px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Image ID="Image125" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label61" runat="server" meta:resourceKey="Label2Resource1" Text="Contact Email:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxContactEmail" runat="server" MaxLength="50" meta:resourceKey="TextBoxSexResource1"
                                                    Text='<%# Bind("ContactEmail") %>' Width="140px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="75" valign="top">
                                                <asp:Image ID="Image99" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td valign="top">
                                                <asp:Label ID="Label62" runat="server" meta:resourceKey="Label5Resource1" Text="Contact Address:"></asp:Label>
                                            </td>
                                            <td colspan="4" valign="top">
                                                <asp:TextBox ID="TextBoxContactAddress" runat="server" Height="60px" MaxLength="50"
                                                    meta:resourceKey="TextBoxSexResource1" Text='<%# Bind("ContactAddress") %>' TextMode="MultiLine"
                                                    Width="98%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <asp:Image ID="Image46" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label25" runat="server" meta:resourceKey="Label5Resource1" Text="Known Languages:"></asp:Label>
                                            </td>
                                            <td colspan="4">
                                                <asp:TextBox ID="TextBoxKnownLanguages" runat="server" meta:resourceKey="TextBoxSexResource1"
                                                    Text='<%# Bind("KnownLanguages") %>' Width="98%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td colspan="4">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="75" valign="top">
                                                <asp:Image ID="Image47" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td valign="top">
                                                <asp:Label ID="LabelStartingTerm2" runat="server" meta:resourceKey="LabelStartingTermResource1"
                                                    Text="Home Visits:"></asp:Label>
                                            </td>
                                            <td colspan="4" valign="top">
                                                <asp:TextBox ID="TextBoxHomevisits" runat="server" Height="60px" meta:resourceKey="TextBox9Resource1"
                                                    Text='<%# Bind("HomeVisits") %>' TextMode="MultiLine" Width="98%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="75" valign="top">
                                                <asp:Image ID="Image49" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td valign="top">
                                                <asp:Label ID="LabelStartingTerm3" runat="server" meta:resourceKey="LabelStartingTermResource1"
                                                    Text="Notes:"></asp:Label>
                                            </td>
                                            <td colspan="4">
                                                <asp:TextBox ID="TextBoxNotes" runat="server" Height="60px" meta:resourceKey="TextBox4Resource1"
                                                    Text='<%# Bind("Notes") %>' TextMode="MultiLine" Width="98%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30" valign="top">
                                                &nbsp;
                                            </td>
                                            <td valign="top">
                                                &nbsp;
                                            </td>
                                            <td colspan="4" height="28">
                                                <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update" Text="Update" Visible="False"
                                                    Width="98%" />
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <uc2:EmptyTemplate ID="EmptyTemplate1" runat="server" />
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource ID="SqlDataSourceFormViewParentsGuardiansDetails" runat="server"
                                ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT tbl_Students.StudentID, tbl_Parents.ResponsibleParentID, tbl_Parents.ResponsibleParentGender, tbl_Parents.ResponsibleParent, tbl_Parents.ContactPhone, tbl_Parents.ContactEmail, tbl_Parents.CurrentCity, tbl_Parents.ContactAddress, tbl_Parents.Notes, tbl_Parents.KnownLanguages, tbl_Parents.HomeVisits FROM tbl_Parents INNER JOIN tbl_Students ON tbl_Parents.ResponsibleParentID = tbl_Students.ParentID WHERE (tbl_Students.StudentID = @StudentID)"
                                UpdateCommand="UPDATE tbl_Parents SET ResponsibleParent = @ResponsibleParent, ContactPhone = @ContactPhone, ContactEmail = @ContactEmail, ContactAddress = @ContactAddress, KnownLanguages = @KnownLanguages, CurrentCity = @CurrentCity, HomeVisits = @HomeVisits, Notes = @Notes WHERE (ResponsibleParentID = @ResponsibleParentID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ListBoxStudents" Name="StudentID" PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ResponsibleParent" />
                                    <asp:Parameter Name="ContactPhone" />
                                    <asp:Parameter Name="ContactEmail" />
                                    <asp:Parameter Name="ContactAddress" />
                                    <asp:Parameter Name="KnownLanguages" />
                                    <asp:Parameter Name="CurrentCity" />
                                    <asp:Parameter Name="HomeVisits" />
                                    <asp:Parameter Name="Notes" />
                                    <asp:Parameter Name="ResponsibleParentID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabPanelParents" runat="server" HeaderText="TabPanelParents">
                        <HeaderTemplate>
                            Parents
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:FormView ID="FormViewParentsParentsInformation" runat="server" DataKeyNames="ResponsibleParentID"
                                DataSourceID="SqlDataSourceFormViewParentsParentsInformation" DefaultMode="Edit"
                                Width="100%">
                                <EditItemTemplate>
                                    <table id="StudentTable1" width="100%">
                                        <tr>
                                            <td height="30" width="20">
                                                <asp:Image ID="Image81" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td width="130">
                                                <asp:Label ID="Label108" runat="server" meta:resourcekey="Label7Resource1" Text="Father Name:"></asp:Label>
                                            </td>
                                            <td width="175">
                                                <asp:TextBox ID="TextBoxFatherName" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                    Text='<%# Bind("FatherName") %>' Width="150px"></asp:TextBox>
                                            </td>
                                            <td width="20">
                                                <asp:Image ID="Image82" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
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
                                                <asp:Image ID="Image105" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label119" runat="server" meta:resourcekey="Label7Resource1" Text="Father E-Mail:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="xFatherEMail" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                                    Text='<%# Bind("FatherEmail") %>' Width="150px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Image ID="Image106" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
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
                                                <asp:Image ID="Image110" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
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
                                                <asp:Image ID="Image109" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
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
                                                <asp:Image ID="Image89" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label115" runat="server" meta:resourcekey="Label7Resource1" Text="Father Company:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxFatherCompany" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                    Text='<%# Bind("FatherCompany") %>' Width="150px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Image ID="Image90" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
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
                                                <asp:Image ID="Image103" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label117" runat="server" meta:resourcekey="Label7Resource1" Text="Father Position:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxFatherPosition" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                    Text='<%# Bind("FatherPosition") %>' Width="150px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Image ID="Image104" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
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
                                                <asp:Image ID="Image91" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
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
                                                <asp:Image ID="Image92" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
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
                                                <asp:Image ID="Image107" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
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
                                                <asp:Image ID="Image108" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
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
                                                <asp:Image ID="Image93" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
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
                                                <asp:Image ID="Image94" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
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
                                                <asp:Image ID="Image95" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label112" runat="server" meta:resourcekey="Label13Resource1" Text="Father Place of Birth:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="xFatherPlaceofBirth1" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                                    Text='<%# Bind("FatherPlaceofBirth") %>' Width="150px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Image ID="Image96" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
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
                                                <asp:Image ID="Image97" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
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
                                                <asp:Image ID="Image98" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
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
                                                <asp:Image ID="Image99" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
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
                                                <asp:Image ID="Image100" runat="server" ImageUrl="~/StaffSD/Images/LeftArrow.png" />
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
                                                &nbsp;
                                            </td>
                                            <td height="28">
                                                &nbsp;
                                            </td>
                                            <td height="28">
                                                <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update" Text="Update" Visible="False"
                                                    Width="150px" />
                                            </td>
                                            <td height="28">
                                                &nbsp;
                                            </td>
                                            <td height="28" width="120">
                                                &nbsp;
                                            </td>
                                            <td height="28">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <uc2:EmptyTemplate ID="EmptyTemplate1" runat="server" />
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource ID="SqlDataSourceFormViewParentsParentsInformation" runat="server"
                                ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>" SelectCommand="SELECT tbl_Students.StudentID, tbl_Parents.ResponsibleParentID, tbl_Parents.FatherName, tbl_Parents.FatherOccupation, tbl_Parents.FatherCompany, tbl_Parents.FatherPosition, tbl_Parents.FatherOfficeAddress, tbl_Parents.FatherHandPhone, tbl_Parents.FatherEmail, tbl_Parents.FatherDateofBirth, tbl_Parents.FatherPlaceofBirth, tbl_Parents.FatherOrigin, tbl_Parents.FatherReligion, tbl_Parents.MotherName, tbl_Parents.MotherOccupation, tbl_Parents.MotherCompany, tbl_Parents.MotherPosition, tbl_Parents.MotherOfficeAddress, tbl_Parents.MotherHandPhone, tbl_Parents.MotherEmail, tbl_Parents.MotherDateofBirth, tbl_Parents.MotherPlaceofBirth, tbl_Parents.MotherOrigin, tbl_Parents.MotherReligion FROM tbl_Parents INNER JOIN tbl_Students ON tbl_Parents.ResponsibleParentID = tbl_Students.ParentID WHERE (tbl_Students.StudentID = @StudentID)"
                                UpdateCommand="UPDATE tbl_Parents SET ResponsibleParent = @ResponsibleParent, FatherName = @FatherName, FatherDateofBirth = @FatherDateofBirth, FatherPlaceofBirth = @FatherPlaceofBirth, FatherHandPhone = @FatherHandPhone, FatherOccupation = @FatherOccupation, FatherOrigin = @FatherOrigin, FatherReligion = @FatherReligion, MotherName = @MotherName, MotherDateofBirth = @MotherDateofBirth, MotherPlaceofBirth = @MotherPlaceofBirth, MotherHandPhone = @MotherHandPhone, MotherOccupation = @MotherOccupation, MotherOrigin = @MotherOrigin, MotherReligion = @MotherReligion WHERE (ResponsibleParentID = @ResponsibleParentID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ListBoxStudents" Name="StudentID" PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ResponsibleParent" />
                                    <asp:Parameter Name="FatherName" />
                                    <asp:Parameter Name="FatherDateofBirth" />
                                    <asp:Parameter Name="FatherPlaceofBirth" />
                                    <asp:Parameter Name="FatherHandPhone" />
                                    <asp:Parameter Name="FatherOccupation" />
                                    <asp:Parameter Name="FatherOrigin" />
                                    <asp:Parameter Name="FatherReligion" />
                                    <asp:Parameter Name="MotherName" />
                                    <asp:Parameter Name="MotherDateofBirth" />
                                    <asp:Parameter Name="MotherPlaceofBirth" />
                                    <asp:Parameter Name="MotherHandPhone" />
                                    <asp:Parameter Name="MotherOccupation" />
                                    <asp:Parameter Name="MotherOrigin" />
                                    <asp:Parameter Name="MotherReligion" />
                                    <asp:Parameter Name="ResponsibleParentID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
                <br />
                <asp:Label runat="server" Font-Bold="True" ForeColor="Red" ID="LabelStatus"></asp:Label>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) AND (SectionSchool = N'SD') ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceListBoxStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentID, StudentName, CurrentSectionID FROM vw_Students WHERE (SchoolCode = @SchoolCode) AND (SectionSchool = @IsSD OR SectionSchool = @IsSMP OR SectionSchool = @IsSMA) ORDER BY StudentName"
                    FilterExpression="CurrentSectionID={0}">
                    <FilterParameters>
                        <asp:ControlParameter ControlID="DropDownListSections" DbType="Int32" Name="CurrentSectionID"
                            PropertyName="SelectedValue" />
                    </FilterParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:Parameter Name="IsSD" />
                        <asp:Parameter Name="IsSMP" />
                        <asp:Parameter Name="IsSMA" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <uswnb:WebMessageBox ID="WebMessageBoxStudents" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
