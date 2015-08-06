<%@ Page Title="SIS Edit Profile" Language="VB" MasterPageFile="Profile.Master" AutoEventWireup="false"
    CodeFile="Profile.aspx.vb" Inherits="EditProfile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanelInbox" runat="server">
        <ContentTemplate>
            <br />
            <asp:Panel ID="PanelStaff" runat="server" Visible="False" Width="680px">
                <asp:FormView ID="FormViewStaff" runat="server" DataSourceID="SqlDataSourceFormViewStaff"
                    DefaultMode="Edit" DataKeyNames="StaffID" Width="100%">
                    <EditItemTemplate>
                        <table id="StaffTable1" width="100%">
                            <tr>
                                <td width="20" height="28">
                                    <asp:Image ID="Image51" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td width="120">
                                    <asp:Label ID="Label23" runat="server" meta:resourcekey="Label1Resource1" Text="User Name:"></asp:Label>
                                </td>
                                <td width="245">
                                    <asp:TextBox ID="TextBoxStaffUserName" runat="server" Enabled="False" MaxLength="50"
                                        meta:resourcekey="TextBoxStudentNameResource1" Text='<%# Bind("UserName") %>'
                                        Width="220px"></asp:TextBox>
                                </td>
                                <td width="40">
                                    &nbsp;
                                </td>
                                <td rowspan="19" valign="top">
                                    <asp:UpdatePanel ID="UpdatePanelPhoto" runat="server">
                                        <ContentTemplate>
                                            <asp:Image ID="ImagePhotoStaff" runat="server" ImageUrl='<%#"~/SchoolData/UploadedPhotos/"+Eval("PhotoURL") %>'
                                                Width="210px" />
                                            <br />
                                            <br />
                                            <asp:FileUpload ID="FileUploadPhotoStaff" runat="server" Width="210px" />
                                            <br />
                                            <br />
                                            <asp:Button ID="ButtonUploadPhotoStaff" runat="server" Text="Upload Photo" Width="210px"
                                                OnClick="ButtonUpdateStaff_Click" />
                                            <br />
                                            <br />
                                            <asp:Label ID="LabelStatusPhotoStaff" runat="server" ForeColor="Red"></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label ID="Label26" runat="server" ForeColor="Red" Text="After Uploading Please UPDATE!"></asp:Label>
                                            <br />
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="ButtonUploadPhotoStaff" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                                <td rowspan="19" valign="top" width="30">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="28" width="20">
                                    <asp:Image ID="Image47" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td width="120">
                                    <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="Full Name:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxStaffName" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                        Text='<%# Bind("StaffName") %>' Width="220px" ValidationGroup="Profile"></asp:TextBox>
                                </td>
                                <td width="20">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxStaffName"
                                        ErrorMessage="(*) Full Name is Required!" Font-Bold="True" ForeColor="Red" ValidationGroup="Profile">(*)</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1" Text="Date of Birth:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxDateofBirth" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                        Text='<%# Bind("DateofBirth", "{0:d}") %>' Width="220px" ValidationGroup="Profile"></asp:TextBox>
                                    <asp:CalendarExtender ID="TextBoxDateofBirth_CalendarExtender" runat="server" TargetControlID="TextBoxDateofBirth">
                                    </asp:CalendarExtender>
                                    <asp:MaskedEditExtender ID="MaskedEditExtenderTextBoxDateofBirth" runat="server"
                                        TargetControlID="TextBoxDateofBirth" MaskType="Date" Mask="99/99/9999" CultureName="id-ID">
                                    </asp:MaskedEditExtender>
                                    <asp:RangeValidator ID="RangeValidatorTextBoxDateofBirth" runat="server" ErrorMessage="*"
                                        Type="Date" MinimumValue="1.1.1900" MaximumValue="1.1.2020" ControlToValidate="TextBoxDateofBirth"
                                        SetFocusOnError="True"></asp:RangeValidator>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxDateofBirth"
                                        ErrorMessage="(*) Date of Birth is Required!" Font-Bold="True" ForeColor="Red"
                                        ValidationGroup="Profile">(*)</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image6" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label10" runat="server" meta:resourcekey="Label7Resource1" Text="Place of Birth:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxBirthPlace" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                        Text='<%# Bind("PlaceofBirth") %>' Width="220px" ValidationGroup="Profile"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxBirthPlace"
                                        ErrorMessage="(*) Place of Birth is Required!" Font-Bold="True" ForeColor="Red"
                                        ValidationGroup="Profile">(*)</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image10" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label7" runat="server" meta:resourcekey="Label7Resource1" Text="Gender:"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListGender" runat="server" SelectedValue='<%# Bind("Gender") %>'
                                        Width="230px">
                                        <asp:ListItem Value="-">Not Specified!</asp:ListItem>
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownListGender"
                                        ErrorMessage="(*) Gender is Required!" Font-Bold="True" ForeColor="Red" ValidationGroup="Profile">(*)</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image28" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td>
                                    <asp:Label ID="LabelStartingGrade0" runat="server" meta:resourcekey="LabelStartingGradeResource1"
                                        Text="Marital Status:"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListMaritalStatus" runat="server" SelectedValue='<%# Bind("MaritalStatus") %>'
                                        Width="230px">
                                        <asp:ListItem Value="-">Not Specified!</asp:ListItem>
                                        <asp:ListItem>Married</asp:ListItem>
                                        <asp:ListItem>Single</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownListMaritalStatus"
                                        ErrorMessage="(*) Marital Status is Required!" Font-Bold="True" ForeColor="Red"
                                        ValidationGroup="Profile">(*)</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 28px">
                                    <asp:Image ID="Image48" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td style="height: 28px">
                                    <asp:Label ID="LabelStartingGrade1" runat="server" meta:resourcekey="LabelStartingGradeResource1"
                                        Text="Religion:"></asp:Label>
                                </td>
                                <td style="height: 28px">
                                    <asp:TextBox ID="TextBoxReligion" runat="server" Text='<%# Bind("Religion") %>' Width="220px"
                                        ValidationGroup="Profile"></asp:TextBox>
                                </td>
                                <td style="height: 28px">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxReligion"
                                        ErrorMessage="(*) Religion is Required!" Font-Bold="True" ForeColor="Red" ValidationGroup="Profile">(*)</asp:RequiredFieldValidator>
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
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image41" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="Contact Phone 1:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxContactPhone1" runat="server" meta:resourcekey="TextBox1Resource2"
                                        Text='<%# Bind("ContactPhone1") %>' Width="220px" ValidationGroup="Profile"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxContactPhone1"
                                        ErrorMessage="(*) Contact Phone 1 is Required!" Font-Bold="True" ForeColor="Red"
                                        ValidationGroup="Profile">(*)</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image52" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label24" runat="server" meta:resourcekey="Label4Resource1" Text="Contact Phone 2:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxContactPhone2" runat="server" meta:resourcekey="TextBox1Resource2"
                                        Text='<%# Bind("ContactPhone2") %>' Width="220px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image43" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label11" runat="server" meta:resourcekey="Label11Resource1" Text="Contact E-mail"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxContactEmail" runat="server" MaxLength="50" meta:resourcekey="TextBox3Resource1"
                                        Text='<%# Bind("ContactEmail") %>' Width="220px" ValidationGroup="Profile"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBoxContactEmail"
                                        ErrorMessage=" (*) Contact E-Mail is Required!" Font-Bold="True" ForeColor="Red"
                                        ValidationGroup="Profile">(*)</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxContactEmail"
                                        ErrorMessage="(*) Not a Valid EMail Address!" Font-Bold="True" ForeColor="Red"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Profile">(*)</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    &nbsp;
                                </td>
                                <td height="28">
                                    &nbsp;
                                </td>
                                <td height="28">
                                    &nbsp;
                                </td>
                                <td height="28">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image35" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td height="28">
                                    <asp:Label ID="LabelStartingTerm" runat="server" meta:resourcekey="LabelStartingTermResource1"
                                        Text="University:"></asp:Label>
                                </td>
                                <td height="28">
                                    <asp:TextBox ID="TextBoxUniversity" runat="server" meta:resourcekey="TextBoxStartingTermResource1"
                                        Text='<%# Bind("University") %>' Width="220px" ValidationGroup="Profile"></asp:TextBox>
                                </td>
                                <td height="28">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBoxUniversity"
                                        ErrorMessage="(*) University is Required!" Font-Bold="True" ForeColor="Red" ValidationGroup="Profile">(*)</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image50" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td height="28">
                                    <asp:Label ID="LabelStartingTerm0" runat="server" meta:resourcekey="LabelStartingTermResource1"
                                        Text="Department:"></asp:Label>
                                </td>
                                <td height="28">
                                    <asp:TextBox ID="TextBoxDepartment" runat="server" meta:resourcekey="TextBoxStartingTermResource1"
                                        Text='<%# Bind("Department") %>' Width="220px" ValidationGroup="Profile"></asp:TextBox>
                                </td>
                                <td height="28">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBoxDepartment"
                                        ErrorMessage="(*) Department is Required!" Font-Bold="True" ForeColor="Red" ValidationGroup="Profile">(*)</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image36" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td height="28">
                                    <asp:Label ID="LabelStartingGrade" runat="server" meta:resourcekey="LabelStartingGradeResource1"
                                        Text="Degree:"></asp:Label>
                                </td>
                                <td height="28">
                                    <asp:TextBox ID="TextBoxDegree" runat="server" MaxLength="30" meta:resourcekey="TextBoxStartingGradeResource1"
                                        Text='<%# Bind("Degree") %>' Width="220px" ValidationGroup="Profile"></asp:TextBox>
                                </td>
                                <td height="28">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBoxDegree"
                                        ErrorMessage="(*) Degree is Required!" Font-Bold="True" ForeColor="Red" ValidationGroup="Profile">(*)</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    &nbsp;
                                </td>
                                <td height="28">
                                    &nbsp;
                                </td>
                                <td height="28">
                                    &nbsp;
                                </td>
                                <td height="28">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image37" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td height="28">
                                    <asp:Label ID="Label15" runat="server" meta:resourcekey="Label15Resource1" Text="Passport No:"></asp:Label>
                                </td>
                                <td height="28">
                                    <asp:TextBox ID="TextBoxPassportID" runat="server" MaxLength="50" meta:resourcekey="TextBox7Resource1"
                                        Text='<%# Bind("PassportNo") %>' Width="220px"></asp:TextBox>
                                </td>
                                <td height="28">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="35">
                                    <asp:Image ID="Image32" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td height="28">
                                    <asp:Label ID="Label16" runat="server" meta:resourcekey="Label16Resource1" Text="Blood Type:"></asp:Label>
                                </td>
                                <td height="28">
                                    <asp:DropDownList ID="DropDownListBloodType" runat="server" SelectedValue='<%# Bind("BloodType") %>'
                                        Width="230px">
                                        <asp:ListItem Value="-">Not Specified!</asp:ListItem>
                                        <asp:ListItem>A</asp:ListItem>
                                        <asp:ListItem>B</asp:ListItem>
                                        <asp:ListItem>AB</asp:ListItem>
                                        <asp:ListItem>0</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td height="28">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image53" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td height="28">
                                    <asp:Label ID="Label25" runat="server" meta:resourcekey="Label16Resource1" Text="Photo URL:"></asp:Label>
                                </td>
                                <td height="28">
                                    <asp:TextBox ID="TextBoxPhotoURLStaff" runat="server" Enabled="False" MaxLength="50"
                                        meta:resourcekey="TextBox7Resource1" Text='<%# Bind("PhotoUrl") %>' Width="220px"></asp:TextBox>
                                </td>
                                <td height="28">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <table id="StaffTable2" width="100%">
                            <tr>
                                <td height="75" width="20" valign="top">
                                    <asp:Image ID="Image44" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td height="25" valign="top" width="120">
                                    <asp:Label ID="Label20" runat="server" meta:resourcekey="Label16Resource1" Text="Contact Address:"></asp:Label>
                                </td>
                                <td valign="top">
                                    <asp:TextBox ID="TextBoxContactAdress" placeholder="Contact Address" runat="server"
                                        Height="50px" meta:resourcekey="TextBox9Resource1" Text='<%# Bind("ContactAddress") %>'
                                        TextMode="MultiLine" Width="98%"></asp:TextBox>
                                </td>
                                <td valign="top" width="30">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="75" valign="top">
                                    <asp:Image ID="Image46" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td height="25" valign="top">
                                    <asp:Label ID="Label22" runat="server" meta:resourcekey="Label16Resource1" Text="Work Experience:"></asp:Label>
                                </td>
                                <td valign="top">
                                    <asp:TextBox ID="TextBoxWorkExperiences" runat="server" placeholder="Work Experiences"
                                        Height="50px" Text='<%# Bind("WorkExperiences") %>' TextMode="MultiLine" Width="98%"></asp:TextBox>
                                </td>
                                <td valign="top">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="35" valign="top">
                                    &nbsp;
                                </td>
                                <td height="25" valign="top">
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update" Height="30px" Text="Update"
                                        Width="100%" ValidationGroup="Profile" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="35" valign="top">
                                    &nbsp;
                                </td>
                                <td height="25" valign="top">
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Profile"
                                        Font-Bold="True" ForeColor="Red" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <asp:Image ID="Image41" runat="server" ImageUrl="~/Profile/Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Select A Staff Please!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSourceFormViewStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT tbl_Staff.DateofBirth, tbl_Staff.MaritalStatus, tbl_Staff.Gender, tbl_Staff.ContactPhone1, tbl_Staff.ContactPhone2, tbl_Staff.ContactEmail, tbl_Staff.ContactAddress, tbl_Staff.PassportNo, tbl_Staff.BloodType, tbl_Staff.University, tbl_Staff.Degree, tbl_Staff.MobilePhone, tbl_Staff.HealthIssues, tbl_Staff.WorkExperiences, tbl_Staff.PlaceofBirth, tbl_Staff.StaffID, tbl_Staff.StaffName, tbl_Staff.Religion, tbl_Staff.Department, aspnet_Users.UserName, aspnet_Users.PhotoUrl FROM tbl_Staff INNER JOIN aspnet_Users ON tbl_Staff.StaffID = aspnet_Users.UserId WHERE (tbl_Staff.StaffID = @StaffID)"
                    UpdateCommand="UPDATE tbl_Staff SET StaffName = @StaffName, DateofBirth = @DateofBirth, PlaceofBirth = @PlaceofBirth, MaritalStatus = @MaritalStatus, Gender = @Gender, ContactPhone1 = @ContactPhone1, ContactPhone2 = @ContactPhone2, ContactEmail = @ContactEmail, ContactAddress = @ContactAddress, PassportNo = @PassportNo, BloodType = @BloodType, University = @University, Degree = @Degree, MobilePhone = @MobilePhone, HealthIssues = @HealthIssues, WorkExperiences = @WorkExperiences, Religion = @Religion, Department = @Department WHERE (StaffID = @StaffID) UPDATE aspnet_Users SET PhotoUrl = @PhotoURL WHERE (UserId = @StaffID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="StaffName" />
                        <asp:Parameter Name="DateofBirth" />
                        <asp:Parameter Name="PlaceofBirth" />
                        <asp:Parameter Name="MaritalStatus" />
                        <asp:Parameter Name="Gender" />
                        <asp:Parameter Name="ContactPhone1" />
                        <asp:Parameter Name="ContactPhone2" />
                        <asp:Parameter Name="ContactEmail" />
                        <asp:Parameter Name="ContactAddress" />
                        <asp:Parameter Name="PassportNo" />
                        <asp:Parameter Name="BloodType" />
                        <asp:Parameter Name="University" />
                        <asp:Parameter Name="Degree" />
                        <asp:Parameter Name="MobilePhone" />
                        <asp:Parameter Name="HealthIssues" />
                        <asp:Parameter Name="WorkExperiences" />
                        <asp:Parameter Name="Religion" />
                        <asp:Parameter Name="Department" />
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                        <asp:Parameter Name="PhotoURL" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:Panel>
            <asp:Panel ID="PanelStudents" runat="server" Visible="False" Width="680px">
                <asp:FormView ID="FormViewStudents" runat="server" DataSourceID="SqlDataSourceFormViewStudents"
                    DefaultMode="Edit" DataKeyNames="StudentID" Width="100%">
                    <EditItemTemplate>
                        <table id="StudentTable1" width="100%">
                            <tr>
                                <td width="20" height="28">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td width="120">
                                    <asp:Label ID="Label22" runat="server" meta:resourcekey="Label1Resource1" Text="School No: (NISN)"></asp:Label>
                                </td>
                                <td width="245">
                                    <asp:TextBox ID="TextBoxUserName" runat="server" Enabled="False" meta:resourcekey="TextBox5Resource1"
                                        Text='<%# Bind("UserName") %>' Width="220px"></asp:TextBox>
                                </td>
                                <td width="40">
                                    &nbsp;
                                </td>
                                <td rowspan="14" valign="top">
                                    <asp:UpdatePanel ID="UpdatePanelPhoto" runat="server">
                                        <ContentTemplate>
                                            <asp:Image ID="ImagePhotoStudent" runat="server" ImageUrl='<%#"~/SchoolData/UploadedPhotos/"+Eval("PhotoURL") %>'
                                                Width="210px" />
                                            <br />
                                            <br />
                                            <asp:FileUpload ID="FileUploadPhotoStudent" runat="server" Width="210px" />
                                            <br />
                                            <br />
                                            <asp:Button ID="ButtonUploadPhotoStudent" runat="server" Text="Upload Photo" Width="210px"
                                                OnClick="ButtonUpdateStudent_Click" />
                                            <br />
                                            <br />
                                            <asp:Label ID="LabelStatusPhotoStudent" runat="server" ForeColor="Red"></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="After Uploading Please UPDATE!"></asp:Label>
                                            <br />
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="ButtonUploadPhotoStudent" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                                <td rowspan="14" valign="top" width="30">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="28" width="20">
                                    <asp:Image ID="Image29" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label19" runat="server" meta:resourcekey="Label1Resource1" Text="School No: (Induk)"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxSchoolNo" runat="server" Enabled="False" meta:resourcekey="TextBox5Resource1"
                                        Text='<%# Bind("SchoolNo") %>' Width="220px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image11" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="Full Name:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxStudentName" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                        Text='<%# Bind("StudentName") %>' Width="220px" ValidationGroup="Student"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBoxStudentName"
                                        ErrorMessage="(*) Full Name is Required!" Font-Bold="True" ForeColor="Red" ValidationGroup="Student">(*)</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1" Text="Date of Birth:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxDateofBirthStudent" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                        Text='<%# Bind("DateofBirth", "{0:d}") %>' Width="220px" ValidationGroup="Student"></asp:TextBox>
                                    <asp:CalendarExtender ID="TextBoxDateofBirthStudent_CalendarExtender" runat="server"
                                        TargetControlID="TextBoxDateofBirthStudent">
                                    </asp:CalendarExtender>
                                    <asp:MaskedEditExtender ID="MaskedEditExtenderTextBoxDateofBirthStudent" runat="server"
                                        TargetControlID="TextBoxDateofBirthStudent" MaskType="Date" Mask="99/99/9999"
                                        CultureName="id-ID">
                                    </asp:MaskedEditExtender>
                                    <asp:RangeValidator ID="RangeValidatorTextBoxDateofBirthStudent" runat="server" ErrorMessage="*"
                                        Type="Date" MinimumValue="1.1.1900" MaximumValue="1.1.2020" ControlToValidate="TextBoxDateofBirthStudent"
                                        SetFocusOnError="True"></asp:RangeValidator>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TextBoxDateofBirthStudent"
                                        ErrorMessage="(*) Date of Birth is Required!" Font-Bold="True" ForeColor="Red"
                                        ValidationGroup="Student">(*)</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image33" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label10" runat="server" meta:resourcekey="Label7Resource1" Text="Place of Birth:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxBirthPlace" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                        Text='<%# Bind("BirthPlace") %>' Width="220px" ValidationGroup="Student"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="TextBoxBirthPlace"
                                        ErrorMessage="(*) Place of Birth is Required!" Font-Bold="True" ForeColor="Red"
                                        ValidationGroup="Student">(*)</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image6" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label7" runat="server" meta:resourcekey="Label7Resource1" Text="Gender:"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListGender" runat="server" SelectedValue='<%# Bind("Gender") %>'
                                        Width="230px">
                                        <asp:ListItem Value="-">Not Specified!</asp:ListItem>
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image35" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label24" runat="server" meta:resourcekey="Label7Resource1" Text="Religion:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxReligion" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                        Text='<%# Bind("Religion") %>' ValidationGroup="Student" Width="220px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="TextBoxBirthPlace"
                                        ErrorMessage="(*) Religion is Required!" Font-Bold="True" ForeColor="Red" ValidationGroup="Student">(*)</asp:RequiredFieldValidator>
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
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image28" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="Contact Phone 1:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxContactPhone1" runat="server" meta:resourcekey="TextBox1Resource2"
                                        Text='<%# Bind("ContactPhone1") %>' Width="220px" ValidationGroup="Student"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="TextBoxContactPhone1"
                                        ErrorMessage="(*) Contact Phone is Required!" Font-Bold="True" ForeColor="Red"
                                        ValidationGroup="Student">(*)</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td height="28">
                                    <asp:Image ID="Image34" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label23" runat="server" meta:resourcekey="Label4Resource1" Text="Contact Phone 2:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxContactPhone2" runat="server" meta:resourcekey="TextBox1Resource2"
                                        Text='<%# Bind("ContactPhone2") %>' Width="220px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="30">
                                    <asp:Image ID="Image10" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label11" runat="server" meta:resourcekey="Label11Resource1" Text="Contact E-mail:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxContactEmailStudent" runat="server" MaxLength="50" meta:resourcekey="TextBox3Resource1"
                                        Text='<%# Bind("ContactEmail") %>' Width="220px" ValidationGroup="Student"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxContactEmailStudent"
                                        ErrorMessage="(*) Not a Valid EMail Address!" Font-Bold="True" ForeColor="Red"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Profile">(*)</asp:RegularExpressionValidator>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="TextBoxContactEmailStudent"
                                        ErrorMessage="(*) Contact Email is Required!" Font-Bold="True" ForeColor="Red"
                                        ValidationGroup="Student">(*)</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td height="30">
                                    <asp:Image ID="Image36" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label25" runat="server" meta:resourcekey="Label11Resource1" Text="Passport No:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxPassportNo" runat="server" MaxLength="50" meta:resourcekey="TextBox3Resource1"
                                        Text='<%# Bind("PassportNo") %>' ValidationGroup="Student" Width="220px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td height="30">
                                    <asp:Image ID="Image37" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label26" runat="server" meta:resourcekey="Label11Resource1" Text="Blood Type:"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListBloodTypeStudent" runat="server" SelectedValue='<%# Bind("BloodType") %>'
                                        Width="230px">
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
                                <td height="30">
                                    <asp:Image ID="Image46" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td>
                                    <asp:Label ID="Label27" runat="server" meta:resourcekey="Label16Resource1" Text="Photo URL:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxPhotoURLStudent" runat="server" Enabled="False" MaxLength="50"
                                        meta:resourcekey="TextBox7Resource1" Text='<%# Bind("PhotoUrl") %>' Width="220px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <table id="StudentTable2" width="100%">
                            <tr>
                                <td width="20" height="28" valign="top">
                                    <asp:Image ID="Image31" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                                </td>
                                <td width="120" valign="top">
                                    <asp:Label ID="Label20" runat="server" meta:resourcekey="Label12Resource1" Text="Contact Address:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxAddress" runat="server" Height="50px" meta:resourcekey="TextBox4Resource1"
                                        Text='<%# Bind("ContactAddress") %>' TextMode="MultiLine" Width="98%"></asp:TextBox>
                                </td>
                                <td width="30">
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
                                    <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update" Text="Update Data"
                                        Width="100%" ValidationGroup="Student" />
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
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" ForeColor="Red"
                                        ValidationGroup="Student" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <asp:Image ID="Image41" runat="server" ImageUrl="~/Profile/Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="No Student Found!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSourceFormViewStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT tbl_Students.StudentID, aspnet_Users.UserName, tbl_Students.SchoolNo, tbl_Students.StudentName, tbl_Students.DateofBirth, tbl_Students.BirthPlace, tbl_Students.Gender, tbl_Students.ContactPhone1, tbl_Students.ContactPhone2, tbl_Students.ContactEmail, tbl_Students.ContactAddress, tbl_Students.PassportNo, tbl_Students.BloodType, tbl_Students.Religion, aspnet_Users.PhotoUrl FROM tbl_Students INNER JOIN aspnet_Users ON tbl_Students.StudentID = aspnet_Users.UserId WHERE (tbl_Students.StudentID = @UserID)"
                    UpdateCommand="UPDATE tbl_Students SET StudentName = @StudentName, DateofBirth = @DateofBirth, BirthPlace = @BirthPlace, Gender = @Gender, ContactPhone1 = @ContactPhone1, ContactPhone2 = @ContactPhone2, ContactEmail = @ContactEmail, ContactAddress = @ContactAddress, Religion = @Religion, PassportNo = @PassportNo WHERE (StudentID = @UserID) UPDATE aspnet_Users SET PhotoUrl = @PhotoURL WHERE (UserId = @UserID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserID" SessionField="UserID" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="StudentName" />
                        <asp:Parameter Name="DateofBirth" />
                        <asp:Parameter Name="BirthPlace" />
                        <asp:Parameter Name="Gender" />
                        <asp:Parameter Name="ContactPhone1" />
                        <asp:Parameter Name="ContactPhone2" />
                        <asp:Parameter Name="ContactEmail" />
                        <asp:Parameter Name="ContactAddress" />
                        <asp:Parameter Name="Religion" />
                        <asp:Parameter Name="PassportNo" />
                        <asp:SessionParameter Name="UserID" SessionField="UserID" />
                        <asp:Parameter Name="PhotoURL" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:Panel>
            <asp:Panel ID="PaneNoProfile" runat="server" BackColor="White" BorderColor="#999999"
                BorderWidth="1px" Visible="False" Width="680px">
                <div align="center">
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Image ID="Image3" runat="server" ImageUrl="Images/Error.png" />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Sorry No Profile Section Available for this Account."></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label28" runat="server" Font-Bold="True" ForeColor="Red" Text="Students, Teachers and Parents have profile settings only."></asp:Label>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
            </asp:Panel>
            <br />
            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
