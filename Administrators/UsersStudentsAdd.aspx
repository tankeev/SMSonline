<%@ Page Title="SIS Add New Student" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="UsersStudentsAdd.aspx.vb" Inherits="NewUserAccount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuUsers.ascx" TagName="MenuUsers" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuUsers ID="MenuUsers1" runat="server" />
                <br />
            </div>
            <div class="content-right">
                <h2>
                    ADD NEW STUDENT</h2>
                <br />
                <asp:CreateUserWizard ID="CreateUserWizardStudent" runat="server" ContinueDestinationPageUrl="~/Administrators/Students.aspx"
                    LoginCreatedUser="False" Width="100%">
                    <WizardSteps>
                        <asp:CreateUserWizardStep runat="server">
                            <ContentTemplate>
                                <asp:Label ID="Label21" runat="server" Font-Bold="True" Text="Sign Up for New Student Account"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label22" runat="server" Text="Please use this form to add new students to the system."></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label23" runat="server" Text="For Login Name it is strongly recomended to use Citizen ID Number or NISN or Phone Number. "></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="Do not use space between characters."></asp:Label>
                                <br />
                                <br />
                                <table id="AdministratorsTable" width="100%">
                                    <tr>
                                        <td width="20" height="25">
                                            <asp:Image ID="Image15" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td width="150">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Font-Bold="True">User Name (NISN):</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server" Width="220px" TabIndex="1"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizardStudent"
                                                ForeColor="Red">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td rowspan="16" valign="top" width="220">
                                            <asp:Image ID="ImageStaff" runat="server" ImageUrl="~/Administrators/Images/Students.png"
                                                Width="220px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <asp:Image ID="Image16" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Font-Bold="True">Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="220px" TabIndex="2"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizardStudent"
                                                ForeColor="Red">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <asp:Image ID="Image17" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword"
                                                Font-Bold="True">Confirm Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" Width="220px"
                                                TabIndex="3"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                                ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required."
                                                ValidationGroup="CreateUserWizardStudent" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <asp:Image ID="Image18" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email" Font-Bold="True">E-mail:</asp:Label>
                                            
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Email" runat="server" Width="220px" TabIndex="4"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                                ErrorMessage="E-mail is required." ForeColor="Red" ToolTip="E-mail is required."
                                                ValidationGroup="CreateUserWizardStudent">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Image ID="Image19" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Question" runat="server" Width="220px" Enabled="False" TabIndex="5"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <asp:Image ID="Image20" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Answer" runat="server" Width="220px" Enabled="False" TabIndex="6"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="20">
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label19" runat="server" meta:resourcekey="Label1Resource1" Text="School No: (Induk)"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxSchoolNo" runat="server" Width="220px" TabIndex="7"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <asp:Image ID="Image21" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label20" runat="server" Text="School Name:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListSchools" runat="server" DataSourceID="SqlDataSourceSchools"
                                                DataTextField="SchoolName" DataValueField="SchoolCode" Width="230px" TabIndex="8">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="Academic Term:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" DataSourceID="SqlDataSourceAcademicTerms"
                                                DataTextField="AcademicTerm" DataValueField="AcademicTermID" TabIndex="8" Width="230px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image27" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label30" runat="server" Text="Current Section:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListSections" runat="server" DataSourceID="SqlDataSourceSections"
                                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" TabIndex="8"
                                                Width="230px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image26" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label29" runat="server" meta:resourcekey="Label1Resource1" Text="User Role:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListRoles" runat="server" TabIndex="8" Width="230px"
                                                Enabled="False">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Image ID="Image11" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="Student Name:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxStudentName" runat="server" MaxLength="50" Width="220px"
                                                TabIndex="9"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1" Text="Date of Birth:"
                                                Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxDateofBirth" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                                Width="220px"></asp:TextBox>
                                            <asp:CalendarExtender ID="TextBoxDateofBirth_CalendarExtender" runat="server" TargetControlID="TextBoxDateofBirth">
                                            </asp:CalendarExtender>
                                            <asp:MaskedEditExtender ID="MaskedEditExtenderDateofBirth" runat="server" TargetControlID="TextBoxDateofBirth"
                                                MaskType="Date" Mask="99/99/9999" CultureName="id-ID">
                                            </asp:MaskedEditExtender>
                                            <asp:RangeValidator ID="RangeValidatorTextBoxDateofBirth" runat="server" ErrorMessage="*"
                                                Type="Date" MinimumValue="1.1.1900" MaximumValue="1.1.2020" ControlToValidate="TextBoxDateofBirth"
                                                SetFocusOnError="True"></asp:RangeValidator>
                                            <asp:RequiredFieldValidator ID="DateofBirthRequired" runat="server" ControlToValidate="TextBoxDateofBirth"
                                                ErrorMessage="Security question is required." ForeColor="Red" ToolTip="Security question is required."
                                                ValidationGroup="CreateUserWizardStudent">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <asp:Image ID="Image6" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label10" runat="server" meta:resourcekey="Label7Resource1" Text="Birth Place:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxBirthPlace" runat="server" MaxLength="50" Width="220px" TabIndex="11"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <asp:Image ID="Image10" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
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
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <asp:Image ID="Image28" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label31" runat="server" meta:resourcekey="Label7Resource1" Text="Blood Type:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListBloodType" runat="server" SelectedValue='<%# Bind("BloodType") %>'
                                                Width="230px">
                                                <asp:ListItem Value="-">Not Specified!</asp:ListItem>
                                                <asp:ListItem>A</asp:ListItem>
                                                <asp:ListItem>B</asp:ListItem>
                                                <asp:ListItem>AB</asp:ListItem>
                                                <asp:ListItem>0</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                    ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                                    ValidationGroup="CreateUserWizard"></asp:CompareValidator>
                                <br />
                                <br />
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                <br />
                            </ContentTemplate>
                        </asp:CreateUserWizardStep>
                        <asp:CompleteWizardStep runat="server">
                            <ContentTemplate>
                                <table width="100%">
                                    <tr>
                                        <td align="center" height="25">
                                            <asp:Image ID="Image22" runat="server" ImageUrl="~/Administrators/Images/success-icon.png" />
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" height="25">
                                            <asp:Label ID="Label24" runat="server" Font-Bold="True" Text="Complete!"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" height="25">
                                            <asp:Label ID="Label25" runat="server" Font-Bold="True" Text="New Student Account has been successfully created. "></asp:Label>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" height="25">
                                            
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
                                            
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:CompleteWizardStep>
                    </WizardSteps>
                </asp:CreateUserWizard>
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSchools" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT [SchoolCode], [SchoolName] FROM [tbl_Schools] WHERE (Show = 1) ORDER BY [SchoolName]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT RoleId, RoleName FROM aspnet_Roles"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    InsertCommand="INSERT INTO aspnet_UsersInRoles(UserId, RoleId) VALUES (@UserId, @RoleId)"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog, SectionGroup FROM tbl_SectionCatalog ORDER BY SectionGroup">
                    <InsertParameters>
                        <asp:Parameter Name="UserId" />
                        <asp:Parameter Name="RoleId" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
