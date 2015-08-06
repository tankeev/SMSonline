<%@ Page Title="SIS Add New Staff" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="UsersStaffAdd.aspx.vb" Inherits="NewUserAccount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuUsers.ascx" TagName="MenuUsers" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    STAFF</h2>
                <br />
                <uc1:MenuUsers ID="MenuUsers1" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td width="40">
                            <asp:HyperLink ID="HyperLinkAddNew" runat="server" ImageUrl="~/Coordinators/Images/menu_add.png"
                                NavigateUrl="~/Coordinators/StaffAdd.aspx" Enabled="False">Add New</asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Label24" runat="server" Text="Add New Staff" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    ADD STAFF</h2>
                <br />
                <div id="divChild">
                    <asp:CreateUserWizard ID="CreateUserWizardStaff" runat="server" ContinueDestinationPageUrl="~/CoordinatorsSD/Staff.aspx"
                        LoginCreatedUser="False" Width="100%">
                        <WizardSteps>
                            <asp:CreateUserWizardStep runat="server">
                                <ContentTemplate>
                                    <table id="CoordinatorsSDTable" width="100%">
                                        <tr>
                                            <td colspan="5" height="25">
                                                <asp:Label ID="Label21" runat="server" Font-Bold="True" Text="Sign Up for New Staff Account"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5" height="25">
                                                <asp:Label ID="Label22" runat="server" Text="Please use this form to add new Staff to the system."></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5" height="25">
                                                <asp:Label ID="Label23" runat="server" Text="For Login Name it is strongly recomended to use Citizen ID Number or Phone Number. Do not use space between characters."></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5" height="25">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="20" height="28">
                                                <asp:Image ID="Image15" runat="server" ImageUrl="~/CoordinatorsSD/Images/LeftArrow.png" />
                                            </td>
                                            <td width="120">
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Login Name:</asp:Label>
                                            </td>
                                            <td width="250">
                                                <asp:TextBox ID="UserName" runat="server" Width="220px" TabIndex="1"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                    ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizardStaff"
                                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td width="10">
                                            </td>
                                            <td rowspan="13" valign="top">
                                                <asp:Image ID="ImageStaff" runat="server" ImageUrl="~/CoordinatorsSD/Images/Staff.png"
                                                    Width="100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="28">
                                                <asp:Image ID="Image16" runat="server" ImageUrl="~/CoordinatorsSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="220px" TabIndex="2"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                    ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizardStaff"
                                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="28">
                                                <asp:Image ID="Image17" runat="server" ImageUrl="~/CoordinatorsSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" Width="220px"
                                                    TabIndex="3"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                                    ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required."
                                                    ValidationGroup="CreateUserWizardStaff" ForeColor="Red">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="28">
                                                <asp:Image ID="Image18" runat="server" ImageUrl="~/CoordinatorsSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Email" runat="server" TabIndex="4" Width="220px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                                    ErrorMessage="E-mail is required." ForeColor="Red" ToolTip="E-mail is required."
                                                    ValidationGroup="CreateUserWizardStaff">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="28">
                                                <asp:Image ID="Image24" runat="server" ImageUrl="~/CoordinatorsSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Question" runat="server" Enabled="False" TabIndex="5" Width="220px"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="28">
                                                <asp:Image ID="Image25" runat="server" ImageUrl="~/CoordinatorsSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Answer" runat="server" Enabled="False" TabIndex="6" Width="220px"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="28">
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/CoordinatorsSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label20" runat="server" meta:resourcekey="Label1Resource1" Text="School Name:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="SchoolCode" runat="server" DataSourceID="SqlDataSourceSchools"
                                                    DataTextField="SchoolName" DataValueField="SchoolCode" TabIndex="7" Width="240px">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="28">
                                                <asp:Image ID="Image26" runat="server" ImageUrl="~/CoordinatorsSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label29" runat="server" meta:resourcekey="Label1Resource1" Text="User Role:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListRoles" runat="server" TabIndex="8" Width="240px">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="28">
                                                <asp:Image ID="Image27" runat="server" ImageUrl="~/CoordinatorsSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="Full Name:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxFullName" runat="server" MaxLength="50" TabIndex="9" Width="220px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="FullNameRequired" runat="server" ControlToValidate="TextBoxFullName"
                                                    ErrorMessage="Full Name is required." ForeColor="Red" ToolTip="Full Name is required."
                                                    ValidationGroup="CreateUserWizardStaff">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="28">
                                                <asp:Image ID="Image28" runat="server" ImageUrl="~/CoordinatorsSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1" Text="Date of Birth:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxDateofBirth" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                                    Width="220px"></asp:TextBox>
                                                <asp:CalendarExtender ID="TextBoxDateofBirth_CalendarExtender" runat="server" TargetControlID="TextBoxDateofBirth">
                                                </asp:CalendarExtender>
                                                <asp:MaskedEditExtender ID="MaskedEditExtenderDateofBirth" runat="server" TargetControlID="TextBoxDateofBirth"
                                                    MaskType="Date" Mask="99/99/9999" CultureName="id-ID">
                                                </asp:MaskedEditExtender>
                                                <asp:RequiredFieldValidator ID="DateofBirthRequired" runat="server" ControlToValidate="TextBoxDateofBirth"
                                                    ErrorMessage="Security question is required." ForeColor="Red" ToolTip="Security question is required."
                                                    ValidationGroup="CreateUserWizardStaff">*</asp:RequiredFieldValidator>
                                                <asp:RangeValidator ID="RangeValidatorTextBoxDateofBirth" runat="server" ErrorMessage="*"
                                                    Type="Date" MinimumValue="1.1.1900" MaximumValue="1.1.2020" ControlToValidate="TextBoxDateofBirth"
                                                    SetFocusOnError="True" ValidationGroup="CreateUserWizardStaff"></asp:RangeValidator>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="28">
                                                <asp:Image ID="Image29" runat="server" ImageUrl="~/CoordinatorsSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label10" runat="server" Text="Place of Birth:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxPlaceofBirth" runat="server" MaxLength="50" TabIndex="11"
                                                    Width="220px"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="28">
                                                <asp:Image ID="Image30" runat="server" ImageUrl="~/CoordinatorsSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label7" runat="server" meta:resourcekey="Label7Resource1" Text="Gender:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="RadioButtonListGender" runat="server" RepeatDirection="Horizontal"
                                                    SelectedValue='<%# Bind("Gender") %>' TabIndex="12">
                                                    <asp:ListItem Selected="True">Male</asp:ListItem>
                                                    <asp:ListItem>Female</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="28">
                                                <asp:Image ID="Image31" runat="server" ImageUrl="~/CoordinatorsSD/Images/LeftArrow.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label30" runat="server" meta:resourcekey="Label7Resource1" Text="Blood Type:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListBloodType" runat="server" SelectedValue='<%# Bind("BloodType") %>'
                                                    Width="240px">
                                                    <asp:ListItem Value="-">Not Specified!</asp:ListItem>
                                                    <asp:ListItem>A</asp:ListItem>
                                                    <asp:ListItem>B</asp:ListItem>
                                                    <asp:ListItem>AB</asp:ListItem>
                                                    <asp:ListItem>0</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" height="50">
                                                &nbsp;
                                            </td>
                                            <td colspan="4">
                                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                                    ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                                                    ValidationGroup="CreateUserWizard"></asp:CompareValidator>
                                                <br />
                                                <br />
                                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:CreateUserWizardStep>
                            <asp:CompleteWizardStep runat="server">
                                <ContentTemplate>
                                    <br />
                                    <br />
                                    <br />
                                    <table width="100%">
                                        <tr>
                                            <td align="center" height="25">
                                                <asp:Image ID="Image22" runat="server" ImageUrl="~/CoordinatorsSD/Images/success-icon.png" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" height="25">
                                                &nbsp;<asp:Label ID="Label24" runat="server" Font-Bold="True" Text="Complete!"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" height="25">
                                                <asp:Label ID="Label25" runat="server" Font-Bold="True" Text="New Staff account has been successfully created. "></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" height="25">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue"
                                                    Text="Continue" ValidationGroup="CreateUserWizardStudent" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:CompleteWizardStep>
                        </WizardSteps>
                    </asp:CreateUserWizard>
                </div>
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSourceSchools" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SchoolCode, SchoolName FROM tbl_Schools WHERE (SchoolCode = @SchoolCode) ORDER BY SchoolName">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT RoleId, RoleName FROM aspnet_Roles"></asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
