<%@ Page Title="SIS Add New Parent" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="UsersParentsAdd.aspx.vb" Inherits="NewUserAccount" %>

<%@ Register Src="MenuUsers.ascx" TagName="MenuUsers" TagPrefix="uc2" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    PARENTS</h2>
                <br />
                <uc2:MenuUsers ID="MenuUsers" runat="server" />
                <br />
            </div>
            <div class="content-right">
                <h2>
                    ADD PARENT</h2>
                <br />
                <asp:CreateUserWizard ID="CreateUserWizardParent" runat="server" ContinueDestinationPageUrl="~/Administrators/Parents.aspx"
                    LoginCreatedUser="False" Width="100%">
                    <WizardSteps>
                        <asp:CreateUserWizardStep runat="server">
                            <ContentTemplate>
                                <table id="AdministratorsTable" width="680">
                                    <tr>
                                        <td colspan="5" height="25">
                                            <asp:Label ID="Label21" runat="server" Font-Bold="True" Text="Sign Up for New Parent Account"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" height="25">
                                            <asp:Label ID="Label22" runat="server" Text="Please use this form to add new parents to the system."></asp:Label>
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
                                            <asp:Image ID="Image15" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td width="130">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Login Name:</asp:Label>
                                        </td>
                                        <td width="240">
                                            <asp:TextBox ID="UserName" runat="server" Width="220px" TabIndex="1"></asp:TextBox>
                                        </td>
                                        <td width="35">
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                ErrorMessage="User Name is required." ForeColor="Red" ToolTip="User Name is required."
                                                ValidationGroup="CreateUserWizardParent">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td rowspan="10" valign="top">
                                            <asp:Image ID="ImageStaff" runat="server" ImageUrl="~/Administrators/Images/Staff.png"
                                                Width="100%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image16" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="220px" TabIndex="2"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                ErrorMessage="Password is required." ForeColor="Red" ToolTip="Password is required."
                                                ValidationGroup="CreateUserWizardParent">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image17" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" Width="220px"
                                                TabIndex="3"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                                ErrorMessage="Confirm Password is required." ForeColor="Red" ToolTip="Confirm Password is required."
                                                ValidationGroup="CreateUserWizardParent">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image18" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Email" runat="server" TabIndex="4" Width="220px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                                ErrorMessage="E-mail is required." ForeColor="Red" ToolTip="E-mail is required."
                                                ValidationGroup="CreateUserWizardParent">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image24" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Question" runat="server" Enabled="False" TabIndex="5" Width="220px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
                                                ErrorMessage="Security question is required." ForeColor="Red" ToolTip="Security question is required."
                                                ValidationGroup="CreateUserWizardParent">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image25" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Answer" runat="server" Enabled="False" TabIndex="6" Width="220px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                                ErrorMessage="Security answer is required." ForeColor="Red" ToolTip="Security answer is required."
                                                ValidationGroup="CreateUserWizardParent">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label20" runat="server" meta:resourcekey="Label1Resource1" Text="School Name:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="SchoolCode" runat="server" DataSourceID="SqlDataSourceSchools"
                                                DataTextField="SchoolName" DataValueField="SchoolCode" TabIndex="7" Width="230px"
                                                Enabled="False">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            
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
                                        <td>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image27" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="Parent Full Name:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxResponsibleParent" runat="server" MaxLength="50" TabIndex="9"
                                                Width="220px"></asp:TextBox>
                                        </td>
                                        <td>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="28">
                                            <asp:Image ID="Image30" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
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
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" height="50">
                                            
                                        </td>
                                        <td colspan="4">
                                            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                                ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                                                ValidationGroup="CreateUserWizard"></asp:CompareValidator>
                                            <br />
                                            <br />
                                            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                            
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
                                            <asp:Label ID="Label25" runat="server" Font-Bold="True" Text="New Parent Account has been successfully created. "></asp:Label>
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
                <asp:SqlDataSource ID="SqlDataSourceSchools" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT [SchoolCode], [SchoolName] FROM [tbl_Schools] ORDER BY [SchoolName]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT RoleId, RoleName FROM aspnet_Roles"></asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
