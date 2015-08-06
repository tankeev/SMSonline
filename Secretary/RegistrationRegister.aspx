<%@ Page Title="SIS Add New Student" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="RegistrationRegister.aspx.vb" Inherits="NewUserAccount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="../CoordinatorsSD/MenuUsers.ascx" TagName="MenuUsers" TagPrefix="uc1" %>
<%@ Register Src="MenuRegistration.ascx" TagName="MenuRegistration" TagPrefix="uc2" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>SIS Add New Student</title>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc2:MenuRegistration ID="MenuRegistration" runat="server" />
                <br />
            </div>
            <div class="content-right">
                <h2>
                    ADMISSION FORM</h2>
                <br />
                <asp:CreateUserWizard ID="CreateUserWizardStudent" runat="server" ContinueDestinationPageUrl="~/Secretary/StudentsAdd.aspx"
                    LoginCreatedUser="False" Width="680px">
                    <WizardSteps>
                        <asp:CreateUserWizardStep runat="server">
                            <ContentTemplate>
                                <asp:Label ID="Label3" runat="server" Text="Secretary INFORMATION" Font-Bold="True"
                                    ForeColor="Maroon"></asp:Label>
                                <br />
                                <br />
                                <table id="SecretaryTable" width="100%">
                                    <tr>
                                        <td width="20" height="28">
                                            <asp:Image ID="Image15" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td width="140">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name (NISN):</asp:Label>
                                        </td>
                                        <td width="250">
                                            <asp:TextBox ID="UserName" runat="server" Width="220px" TabIndex="1" Font-Bold="True"
                                                ForeColor="Red"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizardStudent"
                                                ForeColor="Red">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td rowspan="8" valign="top">
                                            <asp:Image ID="ImageStaff" runat="server" ImageUrl="~/Secretary/Images/Students.png"
                                                Width="200px" />
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image16" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="220px" TabIndex="2"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizardStudent"
                                                ForeColor="Red">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image17" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
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
                                        <td height="28">
                                            <asp:Image ID="Image18" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">Student&#39;s E-mail:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Email" runat="server" Width="220px" TabIndex="4"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                                ErrorMessage="E-mail is required." ForeColor="Red" ToolTip="E-mail is required."
                                                ValidationGroup="CreateUserWizardStudent">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image19" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Question" runat="server" Width="220px" Enabled="False" TabIndex="5"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image20" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Answer" runat="server" Width="220px" Enabled="False" TabIndex="6"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image26" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label29" runat="server" meta:resourcekey="Label1Resource1" Text="User Role:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListRoles" runat="server" TabIndex="8" Width="240px"
                                                Enabled="False">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="50">
                                            &nbsp;
                                        </td>
                                        <td colspan="2">
                                            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                                ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                                                ValidationGroup="CreateUserWizard"></asp:CompareValidator>
                                            <br />
                                            <br />
                                            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:Label ID="Label18" runat="server" Text="STUDENT INFORMATION" Font-Bold="True"
                                    ForeColor="Maroon"></asp:Label>
                                <br />
                                <br />
                                <table id="SecretaryTable0" width="100%">
                                    <tr>
                                        <td width="20" height="28">
                                            <asp:Image ID="Image56" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td width="140">
                                            <asp:Label ID="Label35" runat="server" meta:resourcekey="Label1Resource1" Text="School No: (Induk)"></asp:Label>
                                        </td>
                                        <td width="250">
                                            <asp:TextBox ID="TextBoxSchoolNo" runat="server" TabIndex="7" Width="220px"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image57" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label36" runat="server" Text="School Name:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListSchools" runat="server" DataSourceID="SqlDataSourceSchools"
                                                DataTextField="SchoolName" DataValueField="SchoolCode" Enabled="False" TabIndex="8"
                                                Width="240px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image112" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" meta:resourcekey="Label2Resource1" Text="Full Name:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxStudentName" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                                Text='<%# Bind("StudentName") %>' Width="220px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="FullNameRequired" runat="server" ControlToValidate="TextBoxStudentName"
                                                ErrorMessage="Full Name is required." ForeColor="Red" ToolTip="Full Name is required."
                                                ValidationGroup="CreateUserWizardStudent">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image113" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" meta:resourcekey="Label5Resource1" Text="Date of Birth:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxDateofBirth" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                                Text='<%# Bind("DateofBirth", "{0:d}") %>' Width="220px"></asp:TextBox>
                                            <asp:CalendarExtender ID="TextBoxDateofBirth_CalendarExtender" runat="server" TargetControlID="TextBoxDateofBirth">
                                            </asp:CalendarExtender>
                                            <asp:MaskedEditExtender ID="MaskedEditExtenderTextBoxDateofBirth" runat="server"
                                                TargetControlID="TextBoxDateofBirth" MaskType="Date" Mask="99/99/9999" CultureName="id-ID">
                                            </asp:MaskedEditExtender>
                                            <asp:RangeValidator ID="RangeValidatorDateofBirth" runat="server" ErrorMessage="*"
                                                Type="Date" MinimumValue="1.1.1900" MaximumValue="1.1.2020" ControlToValidate="TextBoxDateofBirth"
                                                SetFocusOnError="True"></asp:RangeValidator>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image114" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label10" runat="server" meta:resourcekey="Label7Resource1" Text="Place of Birth:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxPlaceofBirth" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                Text='<%# Bind("BirthPlace") %>' Width="220px"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image115" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label7" runat="server" meta:resourcekey="Label7Resource1" Text="Gender:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="RadioButtonListGender" runat="server" RepeatDirection="Horizontal">
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
                                            <asp:Image ID="Image116" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label43" runat="server" Text="Religion:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxReligion" runat="server" MaxLength="50" TabIndex="11" Width="220px"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image58" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label37" runat="server" Text="Starting Section:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListSections" runat="server" DataSourceID="SqlDataSourceSections"
                                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" TabIndex="8"
                                                Width="240px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image100" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label44" runat="server" Text="Academic Term:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" DataSourceID="SqlDataSourceAcademicTerms"
                                                DataTextField="AcademicTerm" DataValueField="AcademicTermID" TabIndex="8" Width="240px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckBoxOlympiad" runat="server" Checked='<%# Bind("IsOlympiad") %>'
                                                Text="Is Olympiad Student?" />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image101" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label82" runat="server" Text="Olympiad Name:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxOlympiadName" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                Text='<%# Bind("BirthPlace") %>' Width="220px"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckBoxScholarship" runat="server" Checked='<%# Bind("IsScholarship") %>'
                                                Text="Has Scholarship?" />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image117" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label83" runat="server" Text="Scholarship Percentage:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxScholarshipPercentage" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                Text='<%# Bind("BirthPlace") %>' Width="220px"></asp:TextBox>
                                            <asp:SliderExtender ID="TextBoxPercentage_SliderExtender" runat="server" Enabled="True"
                                                Maximum="100" Minimum="0" TargetControlID="TextBoxScholarshipPercentage" BoundControlID="TextBoxSliderValue"
                                                TooltipText="Percentage: {0}" Length="240" EnableHandleAnimation="True">
                                            </asp:SliderExtender>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxSliderValue" runat="server" Width="35px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image118" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label85" runat="server" Text="Contact Phone:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxStudentContactPhone" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                Text='<%# Bind("BirthPlace") %>' Width="220px"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image120" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label86" runat="server" meta:resourcekey="Label16Resource1" Text="Blood Type:"></asp:Label>
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
                                </table>
                                <br />
                                <asp:Label ID="Label45" runat="server" Font-Bold="True" ForeColor="Maroon" Text="PARENT INFORMATION"></asp:Label>
                                <br />
                                <br />
                                <table id="StudentTable" width="100%">
                                    <tr>
                                        <td width="20" height="28">
                                            <asp:Image ID="Image59" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td width="140">
                                            <asp:Label ID="Label12" runat="server" meta:resourcekey="Label7Resource1" Text="Father Name:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxFatherName" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                Text='<%# Bind("FatherName") %>' Width="130px"></asp:TextBox>
                                        </td>
                                        <td width="20">
                                            <asp:Image ID="Image65" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td width="140">
                                            <asp:Label ID="Label13" runat="server" meta:resourcekey="Label7Resource1" Text="Mother Name:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxMotherName" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                Text='<%# Bind("MotherName") %>' Width="130px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image60" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" meta:resourcekey="LabelStartingGradeResource1"
                                                Text="Father Occupation:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxFatherOccupation" runat="server" MaxLength="100" meta:resourcekey="TextBoxSexResource1"
                                                Text='<%# Bind("FatherOccupation") %>' Width="130px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image66" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" meta:resourcekey="LabelStartingGradeResource1"
                                                Text="Mother Occupation:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxMotherOccupation" runat="server" MaxLength="100" meta:resourcekey="TextBoxSexResource1"
                                                Text='<%# Bind("MotherOccupation") %>' Width="130px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label52" runat="server" meta:resourcekey="Label7Resource1" Text="Father Company:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxFatherCompany" runat="server" meta:resourcekey="TextBox2Resource1"
                                                Text='<%# Bind("MotherHandPhone") %>' Width="130px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label53" runat="server" meta:resourcekey="Label7Resource1" Text="Mother Company:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxMotherCompany" runat="server" meta:resourcekey="TextBox2Resource1"
                                                Text='<%# Bind("MotherHandPhone") %>' Width="130px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image61" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label48" runat="server" meta:resourcekey="Label7Resource1" Text="Father Position:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxFatherPosition" runat="server" meta:resourcekey="TextBox2Resource1"
                                                Text='<%# Bind("MotherHandPhone") %>' Width="130px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image67" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label49" runat="server" meta:resourcekey="Label7Resource1" Text="Mother Position:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxMotherPosition" runat="server" meta:resourcekey="TextBox2Resource1"
                                                Text='<%# Bind("MotherHandPhone") %>' Width="130px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image62" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label50" runat="server" meta:resourcekey="Label7Resource1" Text="Father Office Address:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxFatherOfficeAddress" runat="server" meta:resourcekey="TextBox2Resource1"
                                                Text='<%# Bind("MotherHandPhone") %>' Width="130px" Height="60px" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image68" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label51" runat="server" meta:resourcekey="Label7Resource1" Text="Mother Office Address:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxMotherOfficeAddress" runat="server" meta:resourcekey="TextBox2Resource1"
                                                Text='<%# Bind("MotherHandPhone") %>' Width="130px" Height="60px" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image63" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelStartingGrade" runat="server" meta:resourcekey="LabelStartingGradeResource1"
                                                Text="Father Handphone:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxFatherHandphone" runat="server" MaxLength="30" meta:resourcekey="TextBoxStartingGradeResource1"
                                                Text='<%# Bind("FatherHandPhone") %>' Width="130px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image69" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelStartingGrade2" runat="server" meta:resourcekey="LabelStartingGradeResource1"
                                                Text="Mother Handphone:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxMotherHandphone" runat="server" meta:resourcekey="TextBox2Resource1"
                                                Text='<%# Bind("MotherHandPhone") %>' Width="130px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image8" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelStartingGrade3" runat="server" meta:resourcekey="LabelStartingGradeResource1"
                                                Text="Father E-mail:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxFatherEMail" runat="server" meta:resourcekey="TextBox2Resource1"
                                                Text='<%# Bind("MotherHandPhone") %>' Width="130px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image41" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelStartingGrade4" runat="server" meta:resourcekey="LabelStartingGradeResource1"
                                                Text="Mother E-mail:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxMotherEMail" runat="server" meta:resourcekey="TextBox2Resource1"
                                                Text='<%# Bind("MotherHandPhone") %>' Width="130px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image64" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label14" runat="server" meta:resourcekey="Label13Resource1" Text="Father Date of Birth:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxFatherDateofBirth" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                                Text='<%# Bind("FatherDateofBirth") %>' Width="130px"></asp:TextBox>
                                            <asp:CalendarExtender ID="CalendarExtenderFatherDateofBirth" runat="server" TargetControlID="TextBoxFatherDateofBirth">
                                            </asp:CalendarExtender>
                                            <asp:MaskedEditExtender ID="MaskedEditExtenderFatherDateofBirth" runat="server" TargetControlID="TextBoxFatherDateofBirth"
                                                MaskType="Date" Mask="99/99/9999" CultureName="id-ID">
                                            </asp:MaskedEditExtender>
                                            <asp:RequiredFieldValidator ID="FatherDateofBirthRequired" runat="server" ControlToValidate="TextBoxFatherDateofBirth"
                                                ErrorMessage="Father Date of Birth is required." ForeColor="Red" ToolTip="Responsible Parent is required."
                                                ValidationGroup="CreateUserWizardStudent">*</asp:RequiredFieldValidator>
                                            <asp:RangeValidator ID="RangeValidatorFatherDateofBirth" runat="server" ErrorMessage="*"
                                                Type="Date" MinimumValue="1.1.1900" MaximumValue="1.1.2020" ControlToValidate="TextBoxFatherDateofBirth"
                                                SetFocusOnError="True"></asp:RangeValidator>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image43" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label15" runat="server" meta:resourcekey="Label14Resource1" Text="Mother Date of Birth:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxMotherDateofBirth" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                                Text='<%# Bind("MotherDateofBirth") %>' Width="130px"></asp:TextBox>
                                            <asp:CalendarExtender ID="CalendarExtenderMotherDateofBirth" runat="server" TargetControlID="TextBoxMotherDateofBirth">
                                            </asp:CalendarExtender>
                                            <asp:MaskedEditExtender ID="MaskedEditExtenderMotherDateofBirth" runat="server" TargetControlID="TextBoxMotherDateofBirth"
                                                MaskType="Date" Mask="99/99/9999" CultureName="id-ID">
                                            </asp:MaskedEditExtender>
                                            <asp:RequiredFieldValidator ID="MotherDateofBirthRequired" runat="server" ControlToValidate="TextBoxMotherDateofBirth"
                                                ErrorMessage="Mother Date of Birth is required." ForeColor="Red" ToolTip="Responsible Parent is required."
                                                ValidationGroup="CreateUserWizardStudent">*</asp:RequiredFieldValidator>
                                            <asp:RangeValidator ID="RangeValidatorMotherDateofBirth" runat="server" ErrorMessage="*"
                                                Type="Date" MinimumValue="1.1.1900" MaximumValue="1.1.2020" ControlToValidate="TextBoxMotherDateofBirth"
                                                SetFocusOnError="True"></asp:RangeValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image33" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label16" runat="server" meta:resourcekey="Label13Resource1" Text="Father Place of Birth:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxFatherPlaceofBirth" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                                Text='<%# Bind("FatherPlaceofBirth") %>' Width="130px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image44" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label24" runat="server" meta:resourcekey="Label13Resource1" Text="Mother Place of Birth:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxMotherPlaceofBirth" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                                Text='<%# Bind("MotherPlaceofBirth") %>' Width="130px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image34" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelStartingTerm" runat="server" meta:resourcekey="LabelStartingTermResource1"
                                                Text="Father Origin:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxFatherOrigin" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                                Width="130px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image45" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelStartingTerm0" runat="server" meta:resourcekey="LabelStartingTermResource1"
                                                Text="Mother Origin:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxMotherOrigin" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                                Width="130px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image35" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td height="28">
                                            <asp:Label ID="LabelStartingTerm1" runat="server" meta:resourcekey="LabelStartingTermResource1"
                                                Text="Father Religion:"></asp:Label>
                                        </td>
                                        <td height="28">
                                            <asp:TextBox ID="TextBoxFatherReligion" runat="server" meta:resourcekey="TextBoxStartingTermResource1"
                                                Text='<%# Bind("FatherReligion") %>' Width="130px"></asp:TextBox>
                                        </td>
                                        <td height="28">
                                            <asp:Image ID="Image38" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td height="28" width="120">
                                            <asp:Label ID="Label17" runat="server" meta:resourcekey="Label4Resource1" Text="Mother Religion:"></asp:Label>
                                        </td>
                                        <td height="28">
                                            <asp:TextBox ID="TextBoxMotherReligion" runat="server" meta:resourcekey="TextBox1Resource2"
                                                Text='<%# Bind("MotherReligion") %>' Width="130px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:Label ID="Label75" runat="server" Font-Bold="True" ForeColor="Maroon" Text="CONTACT INFORMATION"></asp:Label>
                                <br />
                                <br />
                                <table id="StudentTable0" width="100%">
                                    <tr>
                                        <td height="28" width="20">
                                            <asp:Image ID="Image70" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td width="140">
                                            <asp:Label ID="Label69" runat="server" meta:resourcekey="Label2Resource1" Text="Responsible Parent:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxResponsibleParent" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                                Text='<%# Bind("ResponsibleParent") %>' Width="130px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ResponsibleParentNameRequired" runat="server" ControlToValidate="TextBoxResponsibleParent"
                                                ErrorMessage="Responsible Parent Name is required." ForeColor="Red" ToolTip="Responsible Parent is required."
                                                ValidationGroup="CreateUserWizardStudent">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td width="20">
                                            <asp:Image ID="Image71" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td width="140">
                                            <asp:Label ID="Label84" runat="server" meta:resourcekey="Label2Resource1" Text="Parent Gender:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListParentGender" runat="server" Width="130px">
                                                <asp:ListItem>Male</asp:ListItem>
                                                <asp:ListItem>Female</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28" width="20">
                                            <asp:Image ID="Image119" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td width="140">
                                            <asp:Label ID="Label70" runat="server" meta:resourcekey="Label2Resource1" Text="Contact Phone:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxContactPhone" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                Text='<%# Bind("ContactPhone") %>' Width="130px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ResponsibleParentContactPhoneRequired" runat="server"
                                                ControlToValidate="TextBoxResponsibleParent" ErrorMessage="Responsible Parent Contact Phone is required."
                                                ForeColor="Red" ToolTip="Responsible Parent Contact Phone is required." ValidationGroup="CreateUserWizardStudent">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td width="20">
                                            &nbsp;
                                        </td>
                                        <td width="140">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image102" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td height="28">
                                            <asp:Label ID="Label71" runat="server" meta:resourcekey="Label2Resource1" Text="Current City:"></asp:Label>
                                        </td>
                                        <td height="28">
                                            <asp:TextBox ID="TextBoxCurrentCity" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                                Width="130px"></asp:TextBox>
                                        </td>
                                        <td height="28">
                                            <asp:Image ID="Image103" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td height="28">
                                            <asp:Label ID="Label72" runat="server" meta:resourcekey="Label2Resource1" Text="Contact Email:"></asp:Label>
                                        </td>
                                        <td height="28">
                                            <asp:TextBox ID="TextBoxContactEmail" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                Text='<%# Bind("ContactEmail") %>' Width="130px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="75">
                                            <asp:Image ID="Image96" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label73" runat="server" meta:resourcekey="Label5Resource1" Text="Contact Address:"></asp:Label>
                                        </td>
                                        <td colspan="4">
                                            <asp:TextBox ID="TextBoxContactAddress" runat="server" Height="60px" MaxLength="50"
                                                meta:resourcekey="TextBoxSexResource1" Text='<%# Bind("ContactAddress") %>' TextMode="MultiLine"
                                                Width="98%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                            <asp:Image ID="Image97" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label74" runat="server" meta:resourcekey="Label5Resource1" Text="Known Languages:"></asp:Label>
                                        </td>
                                        <td colspan="4">
                                            <asp:TextBox ID="TextBoxKnownLanguages" runat="server" meta:resourcekey="TextBoxSexResource1"
                                                Text='<%# Bind("KnownLanguages") %>' Width="98%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="75" valign="top">
                                            <asp:Image ID="Image99" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td valign="top">
                                            <asp:Label ID="LabelStartingTerm8" runat="server" meta:resourcekey="LabelStartingTermResource1"
                                                Text="Additional Notes:"></asp:Label>
                                        </td>
                                        <td colspan="4" height="28">
                                            <asp:TextBox ID="TextBoxNotes" runat="server" Height="60px" meta:resourcekey="TextBox4Resource1"
                                                placeholder="Health Issues" Text='<%# Bind("Notes") %>' TextMode="MultiLine"
                                                Width="98%"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:Label ID="Label76" runat="server" Font-Bold="True" ForeColor="Maroon" Text="EDUCATIONAL BACKGROUND"></asp:Label>
                                <br />
                                <br />
                                <table id="StudentTable1" width="100%">
                                    <tr>
                                        <td height="28" width="20">
                                            <asp:Image ID="Image104" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td width="140">
                                            <asp:Label ID="Label77" runat="server" meta:resourcekey="Label2Resource1" Text="Previous School:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxSchoolName" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                                Text='<%# Bind("ResponsibleParent") %>' Width="130px"></asp:TextBox>
                                        </td>
                                        <td width="20">
                                            <asp:Image ID="Image105" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td width="140">
                                            &nbsp;<asp:Label ID="Label78" runat="server" meta:resourcekey="Label2Resource1" Text="School Contact Phone:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxSchoolPhone" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                                Text='<%# Bind("ContactPhone") %>' Width="130px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="75">
                                            <asp:Image ID="Image108" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label81" runat="server" meta:resourcekey="Label5Resource1" Text="School Address:"></asp:Label>
                                        </td>
                                        <td colspan="4">
                                            <asp:TextBox ID="TextBoxSchoolAddress" runat="server" Height="60px" MaxLength="50"
                                                meta:resourcekey="TextBoxSexResource1" Text='<%# Bind("ContactAddress") %>' TextMode="MultiLine"
                                                Width="98%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="75" valign="top">
                                            <asp:Image ID="Image110" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td valign="top">
                                            <asp:Label ID="LabelStartingTerm9" runat="server" meta:resourcekey="LabelStartingTermResource1"
                                                Text="Report Marks:"></asp:Label>
                                        </td>
                                        <td colspan="4" height="28" valign="top">
                                            <asp:TextBox ID="TextBoxReportMarks" runat="server" Height="60px" meta:resourcekey="TextBox9Resource1"
                                                placeholder="Contact Address" Text='<%# Bind("HomeVisits") %>' TextMode="MultiLine"
                                                Width="98%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="75" valign="top">
                                            <asp:Image ID="Image111" runat="server" ImageUrl="~/Secretary/Images/LeftArrow.png" />
                                        </td>
                                        <td valign="top">
                                            <asp:Label ID="LabelStartingTerm10" runat="server" meta:resourcekey="LabelStartingTermResource1"
                                                Text="Achievements:"></asp:Label>
                                        </td>
                                        <td colspan="4" height="28">
                                            <asp:TextBox ID="TextBoxAchievements" runat="server" Height="60px" meta:resourcekey="TextBox4Resource1"
                                                placeholder="Health Issues" Text='<%# Bind("Notes") %>' TextMode="MultiLine"
                                                Width="98%"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:ValidationSummary ID="ValidationSummary" runat="server" Font-Bold="True" ValidationGroup="CreateUserWizardStudent" />
                                <br />
                                <br />
                            </ContentTemplate>
                        </asp:CreateUserWizardStep>
                        <asp:CompleteWizardStep runat="server">
                            <ContentTemplate>
                                <table width="100%">
                                    <tr>
                                        <td align="center" height="25">
                                            <asp:Image ID="Image22" runat="server" ImageUrl="~/Secretary/Images/success-icon.png" />
                                            &nbsp;
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
                                            &nbsp;
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
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSourceSchools" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT [SchoolCode], [SchoolName] FROM [tbl_Schools] ORDER BY [SchoolName]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT RoleId, RoleName FROM aspnet_Roles"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    InsertCommand="INSERT INTO aspnet_UsersInRoles(UserId, RoleId) VALUES (@UserId, @RoleId)"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM tbl_SectionCatalog">
                    <InsertParameters>
                        <asp:Parameter Name="UserId" />
                        <asp:Parameter Name="RoleId" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    InsertCommand="INSERT INTO aspnet_UsersInRoles(UserId, RoleId) VALUES (@UserId, @RoleId)"
                    SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms">
                    <InsertParameters>
                        <asp:Parameter Name="UserId" />
                        <asp:Parameter Name="RoleId" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
