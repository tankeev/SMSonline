<%@ Page Title="SIS Staff" Language="VB" MasterPageFile="~/Site.Master" CodeFile="UsersStaff.aspx.vb"
    Inherits="Staff" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuUsers.ascx" TagName="MenuUsers" TagPrefix="uc2" %>
<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="content-left">
        <h2>
            MENU
            <br />
        </h2>
        <br />
        <uc2:MenuUsers ID="MenuUsers" runat="server" />
        <br />
        <table class="content-table" width="240">
            <tr>
                <td width="40">
                    <asp:HyperLink ID="HyperLinkStaffAdd" runat="server" ImageUrl="~/Administrators/Images/menu_add.png"
                        NavigateUrl="~/Administrators/StaffAdd.aspx" ToolTip="Add New Staff"></asp:HyperLink>
                </td>
                <td>
                    <asp:Label ID="Label73" runat="server" Text="Add New Staff"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table class="content-table" width="240">
            <tr>
                <td height="28">
                    <asp:Label ID="Label31" runat="server" Font-Bold="True" Text="Select Staff:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:ListBox ID="ListBoxStaff" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceListBoxStaff"
                        DataTextField="StaffName" DataValueField="StaffID" Height="240px" Width="95%">
                    </asp:ListBox>
                </td>
            </tr>
            <tr>
                <td height="28">
                    <asp:Label ID="LabelTotal" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="28">
                    <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                </td>
            </tr>
        </table>
        <br />
    </div>
    <div class="content-right">
        <h2>
            STAFF INFORMATION</h2>
        <br />
        <asp:TabContainer ID="TabContainerStudents" runat="server" ActiveTabIndex="0" CssClass="tab"
            Width="680px">
            <asp:TabPanel ID="TabPanelBasic" runat="server" HeaderText="Student Information">
                <HeaderTemplate>
                    Overview
                </HeaderTemplate>
                <ContentTemplate>
                    <asp:FormView ID="FormViewStaffOverview" runat="server" DataKeyNames="StaffID" DataSourceID="SqlDataSourceFormViewStaffOverview"
                        DefaultMode="Edit" Width="100%">
                        <EditItemTemplate>
                            <table id="StudentTable" width="100%">
                                <tr>
                                    <td height="30" width="20">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td width="140">
                                        <asp:Label ID="Label33" runat="server" Font-Bold="True" meta:resourcekey="Label1Resource1"
                                            Text="Staff ID:"></asp:Label>
                                    </td>
                                    <td width="240">
                                        <asp:TextBox ID="TextBoxUserID" runat="server" Enabled="False" Text='<%# Bind("UserId") %>'
                                            Width="220px"></asp:TextBox>
                                    </td>
                                    <td width="20">
                                        
                                    </td>
                                    <td rowspan="15" valign="top">
                                        <asp:Label ID="Label27" runat="server" Font-Bold="True" Text="Default System Photo:"></asp:Label>
                                        <br />
                                        <br />
                                        <img alt='<%# Eval("StaffName") %>' src='../SchoolData/StaffPhotos/<%# Eval("Username") %>.jpg'
                                            style="border: 3px solid #C0C0C0" width="95%" />
                                        <br />
                                        <br />
                                        <br />
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30" width="20">
                                        <asp:Image ID="Image51" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label19" runat="server" Font-Bold="True" meta:resourcekey="Label1Resource1"
                                            Text="School Name:"></asp:Label>
                                    </td>
                                    <td width="240">
                                        <asp:DropDownList ID="SchoolCode" runat="server" DataSourceID="SqlDataSourceFormViewStaffSchoolCodes"
                                            DataTextField="SchoolName" DataValueField="SchoolCode" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "SchoolCode") %>'
                                            TabIndex="7" Width="230px">
                                        </asp:DropDownList>
                                    </td>
                                    <td width="20">
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30" width="20">
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td width="240">
                                        
                                    </td>
                                    <td width="20">
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30" width="20">
                                        <asp:Image ID="Image47" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td width="120">
                                        <asp:Label ID="Label23" runat="server" Font-Bold="True" meta:resourcekey="Label1Resource1"
                                            Text="User Name:"></asp:Label>
                                    </td>
                                    <td width="240">
                                        <asp:TextBox ID="TextBoxStaffUserName" runat="server" Enabled="False" MaxLength="50"
                                            meta:resourcekey="TextBoxStudentNameResource1" Text='<%# Bind("UserName") %>'
                                            Width="220px"></asp:TextBox>
                                    </td>
                                    <td width="20">
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:Image ID="Image11" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" meta:resourcekey="Label2Resource1"
                                            Text="Staff Name:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxStaffName" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                            Text='<%# Bind("StaffName") %>' Width="220px"></asp:TextBox>
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
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" meta:resourcekey="Label5Resource1"
                                            Text="Date of Birth:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxDateofBirth" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                            Text='<%# Bind("DateofBirth", "{0:d}") %>' Width="220px"></asp:TextBox>
                                        <asp:CalendarExtender ID="TextBoxDateofBirth_CalendarExtender" runat="server" TargetControlID="TextBoxDateofBirth">
                                        </asp:CalendarExtender>
                                        <asp:MaskedEditExtender ID="MaskedEditExtenderDateofBirth" runat="server" CultureName="id-ID"
                                            Mask="99/99/9999" MaskType="Date" TargetControlID="TextBoxDateofBirth">
                                        </asp:MaskedEditExtender>
                                        <asp:RangeValidator ID="RangeValidatorTextBoxDateofBirth" runat="server" ControlToValidate="TextBoxDateofBirth"
                                            ErrorMessage="*" MaximumValue="1.1.2020" MinimumValue="1.1.1900" SetFocusOnError="True"
                                            Type="Date"></asp:RangeValidator>
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:Image ID="Image6" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label10" runat="server" Font-Bold="True" meta:resourcekey="Label7Resource1"
                                            Text="Place of Birth:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxBirthPlace" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                            Text='<%# Bind("PlaceofBirth") %>' Width="220px"></asp:TextBox>
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
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:Image ID="Image10" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" Font-Bold="True" meta:resourcekey="Label7Resource1"
                                            Text="Gender:"></asp:Label>
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
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:Image ID="Image28" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="LabelStartingGrade0" runat="server" Font-Bold="True" meta:resourcekey="LabelStartingGradeResource1"
                                            Text="Marital Status:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownListMaritalStatus" runat="server" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "MaritalStatus") %>'
                                            TabIndex="7" Width="230px">
                                            <asp:ListItem Value="-">Not Specified!</asp:ListItem>
                                            <asp:ListItem>Single</asp:ListItem>
                                            <asp:ListItem>Married</asp:ListItem>
                                            <asp:ListItem>Other</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:Image ID="Image48" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="LabelStartingGrade1" runat="server" Font-Bold="True" meta:resourcekey="LabelStartingGradeResource1"
                                            Text="Religion:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxReligion" runat="server" Text='<%# Bind("Religion") %>' Width="220px"></asp:TextBox>
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
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:Image ID="Image49" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="LabelStartingGrade2" runat="server" Font-Bold="True" meta:resourcekey="LabelStartingGradeResource1"
                                            Text="Position:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxPosition" runat="server" Text='<%# Bind("Position") %>' Width="220px"></asp:TextBox>
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
                                        <asp:Button ID="ButtonUpdateStaffOverview" runat="server" CommandName="Update" Text="Update Changes"
                                            Width="230px" />
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <div align="center">
                                <br />
                                <img alt="" src="Images/no-data.png" />
                                <br />
                                <br />
                                <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Please Select a Staff from the List to see the Records!"
                                    Font-Size="Medium" ForeColor="Red"></asp:Label>
                                <br />
                                <br />
                            </div>
                        </EmptyDataTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSourceFormViewStaffOverview" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT aspnet_Users.UserId, tbl_Staff.SchoolCode, tbl_Staff.DateofBirth, tbl_Staff.MaritalStatus, tbl_Staff.Gender, tbl_Staff.PlaceofBirth, tbl_Staff.StaffID, tbl_Staff.StaffName, tbl_Staff.Religion, tbl_Staff.Position, aspnet_Users.UserName, aspnet_Users.PhotoUrl FROM tbl_Staff INNER JOIN aspnet_Users ON tbl_Staff.StaffID = aspnet_Users.UserId WHERE (tbl_Staff.StaffID = @StaffID)"
                        UpdateCommand="UPDATE tbl_Staff SET SchoolCode = @SchoolCode, StaffName = @StaffName, DateofBirth = @DateofBirth, PlaceofBirth = @PlaceofBirth, MaritalStatus = @MaritalStatus, Gender = @Gender, Religion = @Religion, Position = @Position WHERE (StaffID = @StaffID) UPDATE aspnet_Users SET PhotoUrl = @PhotoURL WHERE (UserId = @StaffID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ListBoxStaff" Name="StaffID" PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SchoolCode" />
                            <asp:Parameter Name="StaffName" />
                            <asp:Parameter Name="DateofBirth" />
                            <asp:Parameter Name="PlaceofBirth" />
                            <asp:Parameter Name="MaritalStatus" />
                            <asp:Parameter Name="Gender" />
                            <asp:Parameter Name="Religion" />
                            <asp:Parameter Name="Position" />
                            <asp:Parameter Name="StaffID" />
                            <asp:Parameter Name="PhotoURL" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceFormViewStaffSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT [SchoolCode], [SchoolName] FROM [tbl_Schools] WHERE (Show = 1) ORDER BY [SchoolName]">
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanelAdditional" runat="server" HeaderText="TabPanel1">
                <HeaderTemplate>
                    Additional
                </HeaderTemplate>
                <ContentTemplate>
                    <asp:FormView ID="FormViewStaffAdditional" runat="server" DataKeyNames="StaffID"
                        DataSourceID="SqlDataSourceFormViewStaffAdditional" DefaultMode="Edit" Width="100%">
                        <EditItemTemplate>
                            <table id="StudentTable0" width="100%">
                                <tr>
                                    <td height="30" width="20">
                                        <asp:Image ID="Image55" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td width="140">
                                        <asp:Label ID="Label45" runat="server" meta:resourcekey="Label4Resource1" Text="Mobile Phone 1:"
                                            Font-Bold="True" Font-Italic="False"></asp:Label>
                                    </td>
                                    <td width="240">
                                        <asp:TextBox ID="TextBoxContactPhone1" runat="server" meta:resourcekey="TextBox1Resource2"
                                            Text='<%# Bind("ContactPhone1") %>' Width="220px"></asp:TextBox>
                                    </td>
                                    <td width="20">
                                        
                                    </td>
                                    <td rowspan="10" valign="top">
                                        <asp:Label ID="Label37" runat="server" Font-Bold="True" Text="User Uploaded Photo:"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:UpdatePanel ID="UpdatePanelPhoto" runat="server">
                                            <ContentTemplate>
                                                <asp:Image ID="ImagePhoto" runat="server" ImageUrl='<%#"~/SchoolData/UploadedPhotos/"+Eval("PhotoURL") %>'
                                                    Width="95%" />
                                                <br />
                                                <br />
                                                <asp:FileUpload ID="FileUploadPhoto" runat="server" Width="210px" />
                                                <br />
                                                <br />
                                                <asp:Button ID="ButtonUploadPhoto" runat="server" OnClick="ButtonUploadPhoto_Click"
                                                    Text="Upload Photo" Width="210px" />
                                                <br />
                                                <br />
                                                <asp:Label ID="LabelStatusPhoto" runat="server" ForeColor="Red"></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="Label38" runat="server" ForeColor="Red" Text="After Uploading Please UPDATE!"></asp:Label>
                                                <br />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="ButtonUploadPhoto" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:Image ID="Image66" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label46" runat="server" meta:resourcekey="Label9Resource1" Text="Mobile Phone 2:"
                                            Font-Bold="True" Font-Italic="False"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxContactPhone2" runat="server" meta:resourcekey="TextBox2Resource1"
                                            Text='<%# Bind("ContactPhone2") %>' Width="220px"></asp:TextBox>
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
                                </tr>
                                <tr>
                                    <td height="40">
                                        <asp:Image ID="Image67" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label47" runat="server" meta:resourcekey="Label11Resource1" Text="Contact E-mail"
                                            Font-Bold="True" Font-Italic="False"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxContactEmail" runat="server" MaxLength="50" meta:resourcekey="TextBox3Resource1"
                                            Text='<%# Bind("ContactEmail") %>' Width="220px"></asp:TextBox>
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="75" valign="top">
                                        <asp:Image ID="Image92" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                        
                                    </td>
                                    <td valign="top">
                                        <asp:Label ID="Label68" runat="server" Font-Bold="True" Font-Italic="False" meta:resourcekey="Label16Resource1"
                                            Text="Contact Address:"></asp:Label>
                                    </td>
                                    <td height="28" valign="top">
                                        <asp:TextBox ID="TextBoxContactAddress" runat="server" Height="60px" meta:resourcekey="TextBox9Resource1"
                                            placeholder="Contact Address" Text='<%# Bind("ContactAddress") %>' TextMode="MultiLine"
                                            Width="98%"></asp:TextBox>
                                    </td>
                                    <td height="28">
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:Image ID="Image73" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label50" runat="server" meta:resourcekey="Label15Resource1" Text="Passport No:"
                                            Font-Bold="True" Font-Italic="False"></asp:Label>
                                    </td>
                                    <td height="28">
                                        <asp:TextBox ID="TextBoxPassportID" runat="server" MaxLength="50" meta:resourcekey="TextBox7Resource1"
                                            Text='<%# Bind("PassportNo") %>' Width="220px"></asp:TextBox>
                                    </td>
                                    <td height="28">
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:Image ID="Image74" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label51" runat="server" meta:resourcekey="Label16Resource1" Text="Blood Type:"
                                            Font-Bold="True" Font-Italic="False"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownListBloodType" runat="server" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "BloodType") %>'
                                            Width="230px">
                                            <asp:ListItem Value="-">Not Specified!</asp:ListItem>
                                            <asp:ListItem>A</asp:ListItem>
                                            <asp:ListItem>B</asp:ListItem>
                                            <asp:ListItem>AB</asp:ListItem>
                                            <asp:ListItem>0</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td height="28">
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:Image ID="Image75" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label52" runat="server" meta:resourcekey="Label16Resource1" Text="Photo URL:"
                                            Font-Bold="True" Font-Italic="False"></asp:Label>
                                    </td>
                                    <td height="28">
                                        <asp:TextBox ID="TextBoxPhotoURL" runat="server" MaxLength="50" meta:resourcekey="TextBox7Resource1"
                                            Text='<%# Bind("PhotoUrl") %>' Width="220px"></asp:TextBox>
                                    </td>
                                    <td height="28">
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td height="28">
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="75" valign="top">
                                        <asp:Image ID="Image94" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td valign="top">
                                        <asp:Label ID="Label69" runat="server" Font-Bold="True" Font-Italic="False" meta:resourcekey="Label16Resource1"
                                            Text="Health Issues:"></asp:Label>
                                    </td>
                                    <td valign="top">
                                        <asp:TextBox ID="TextBoxHealthIssues" runat="server" Height="60px" meta:resourcekey="TextBox4Resource1"
                                            placeholder="Health Issues" Text='<%# Bind("HealthIssues") %>' TextMode="MultiLine"
                                            Width="98%"></asp:TextBox>
                                    </td>
                                    <td height="28">
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28">
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        <asp:Button ID="ButtonUpdateStaffOverview" runat="server" CommandName="Update" Text="Update Changes"
                                            Width="230px" />
                                    </td>
                                    <td height="28">
                                        
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <div align="center">
                                <br />
                                <img alt="" src="Images/no-data.png" />
                                <br />
                                <br />
                                <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                    Text="Please Select a Staff from the List to see the Records!"></asp:Label>
                                <br />
                                <br />
                            </div>
                        </EmptyDataTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSourceFormViewStaffAdditional" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT aspnet_Users.UserId, tbl_Staff.ContactPhone1, tbl_Staff.ContactPhone2, tbl_Staff.ContactEmail, tbl_Staff.ContactAddress, tbl_Staff.PassportNo, tbl_Staff.BloodType, tbl_Staff.HealthIssues, tbl_Staff.StaffID, aspnet_Users.UserName, aspnet_Users.PhotoUrl, tbl_Staff.[Continue] FROM tbl_Staff INNER JOIN aspnet_Users ON tbl_Staff.StaffID = aspnet_Users.UserId WHERE (tbl_Staff.StaffID = @StaffID)"
                        UpdateCommand="UPDATE tbl_Staff SET ContactPhone1 = @ContactPhone1, ContactPhone2 = @ContactPhone2, ContactEmail = @ContactEmail, ContactAddress = @ContactAddress, PassportNo = @PassportNo, BloodType = @BloodType, HealthIssues = @HealthIssues WHERE (StaffID = @StaffID) UPDATE aspnet_Users SET PhotoUrl = @PhotoURL WHERE (UserId = @StaffID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ListBoxStaff" Name="StaffID" PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ContactPhone1" />
                            <asp:Parameter Name="ContactPhone2" />
                            <asp:Parameter Name="ContactEmail" />
                            <asp:Parameter Name="ContactAddress" />
                            <asp:Parameter Name="PassportNo" />
                            <asp:Parameter Name="BloodType" />
                            <asp:Parameter Name="HealthIssues" />
                            <asp:Parameter Name="StaffID" />
                            <asp:Parameter Name="PhotoURL" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanelEnrollment" runat="server" HeaderText="TabPanel2">
                <HeaderTemplate>
                    Academic
                </HeaderTemplate>
                <ContentTemplate>
                    <asp:FormView ID="FormViewStaffAcademic" runat="server" DataKeyNames="StaffID" DataSourceID="SqlDataSourceFormViewStaffAcademic"
                        DefaultMode="Edit" Width="100%">
                        <EditItemTemplate>
                            <table id="StudentTable1" width="100%">
                                <tr>
                                    <td height="30" width="20">
                                        <asp:Image ID="Image55" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td width="140">
                                        <asp:Label ID="LabelStartingTerm1" runat="server" meta:resourcekey="LabelStartingTermResource1"
                                            Text="University:" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td width="240">
                                        <asp:TextBox ID="TextBoxUniversity" runat="server" meta:resourcekey="TextBoxStartingTermResource1"
                                            Text='<%# Bind("University") %>' Width="220px"></asp:TextBox>
                                    </td>
                                    <td width="35">
                                        
                                    </td>
                                    <td rowspan="7" valign="top">
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:Image ID="Image66" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="LabelStartingTerm2" runat="server" meta:resourcekey="LabelStartingTermResource1"
                                            Text="Department:" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxDepartment" runat="server" meta:resourcekey="TextBoxStartingTermResource1"
                                            Text='<%# Bind("Department") %>' Width="220px"></asp:TextBox>
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:Image ID="Image67" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="LabelStartingGrade6" runat="server" meta:resourcekey="LabelStartingGradeResource1"
                                            Text="Degree:" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxDegree" runat="server" MaxLength="30" meta:resourcekey="TextBoxStartingGradeResource1"
                                            Text='<%# Bind("Degree") %>' Width="220px"></asp:TextBox>
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
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:Image ID="Image68" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label48" runat="server" Font-Bold="True" meta:resourcekey="Label13Resource1"
                                            Text="Contract Start:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxContractStart" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                            Text='<%# Bind("ContractStartDate", "{0:d}") %>' Width="220px"></asp:TextBox>
                                        <asp:CalendarExtender ID="TextBoxContractStart_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="TextBoxContractStart">
                                        </asp:CalendarExtender>
                                    </td>
                                    <td>
                                        <asp:RangeValidator ID="RangeValidatorStart" runat="server" ControlToValidate="TextBoxContractStart"
                                            ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" MaximumValue="1.1.2020" MinimumValue="1.1.1990"
                                            Type="Date" ValidationGroup="Academic">(*)</asp:RangeValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <asp:Image ID="Image69" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label49" runat="server" Font-Bold="True" meta:resourcekey="Label14Resource1"
                                            Text="Contract Expire:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxContractExpire" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                            Text='<%# Bind("ContractExpDate", "{0:d}") %>' Width="220px"></asp:TextBox>
                                        <asp:CalendarExtender ID="TextBoxContractExpire_CalendarExtender" runat="server"
                                            Enabled="True" TargetControlID="TextBoxContractExpire">
                                        </asp:CalendarExtender>
                                    </td>
                                    <td>
                                        <asp:RangeValidator ID="RangeValidatorStart0" runat="server" ControlToValidate="TextBoxContractExpire"
                                            ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" MaximumValue="1.1.2020" MinimumValue="1.1.1990"
                                            Type="Date" ValidationGroup="Academic">(*)</asp:RangeValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="CheckBoxContinue0" runat="server" Checked='<%# Bind("Continue") %>'
                                            Font-Bold="True" ForeColor="Red" Text="Still Working with Us?" />
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                            </table>
                            <table id="StudentDetails1" width="100%">
                                <tr>
                                    <td valign="top" width="20" height="30">
                                        
                                    </td>
                                    <td valign="top" width="140">
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" height="75">
                                        <asp:Image ID="Image70" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td valign="top">
                                        <asp:Label ID="Label70" runat="server" Font-Bold="True" meta:resourcekey="Label16Resource1"
                                            Text="Work Experience:"></asp:Label>
                                    </td>
                                    <td valign="top">
                                        <asp:TextBox ID="TextBoxWorkExperience" runat="server" Height="60px" placeholder="Work Experiences"
                                            Text='<%# Bind("WorkExperiences") %>' TextMode="MultiLine" Width="98%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <asp:Image ID="Image71" runat="server" ImageUrl="~/Administrators/Images/LeftArrow.png" />
                                    </td>
                                    <td valign="top">
                                        <asp:Label ID="Label71" runat="server" meta:resourcekey="Label16Resource1" Text="Given Courses:"
                                            Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:GridView ID="GridViewGivenSubjects" runat="server" AutoGenerateColumns="False"
                                            DataSourceID="SqlDataSourceFormViewStaffGivenSubjects" Width="100%">
                                            <Columns>
                                                <asp:BoundField DataField="SectionCatalog" HeaderText="Section" SortExpression="SectionCatalog">
                                                    <ItemStyle Width="75px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="CourseCatalog" HeaderText="Course Name" SortExpression="CourseCatalog" />
                                                <asp:BoundField DataField="NumberofPeriods" HeaderText="Periods" SortExpression="NumberofPeriods">
                                                    <ItemStyle HorizontalAlign="Center" Width="75px" />
                                                </asp:BoundField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <div align="center">
                                                    <br />
                                                    <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="LabelWarning1" runat="server" Font-Bold="True" Text="No Courses Assigned for This User."></asp:Label>
                                                    <br />
                                                    <br />
                                                </div>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" valign="top">
                                        
                                    </td>
                                    <td valign="top">
                                        
                                    </td>
                                    <td>
                                        <asp:Button ID="ButtonUpdateStaffOverview" runat="server" CommandName="Update" Text="Update Changes"
                                            Width="230px" ValidationGroup="Academic" />
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <div align="center">
                                <br />
                                <img alt="" src="Images/no-data.png" />
                                <br />
                                <br />
                                <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Please Select a Staff from the List to see the Records!"
                                    Font-Size="Medium" ForeColor="Red"></asp:Label>
                                <br />
                                <br />
                            </div>
                        </EmptyDataTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSourceFormViewStaffGivenSubjects" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT SectionCatalog, CourseCatalog, AcademicTermID, StaffID, NumberofPeriods FROM vw_UsersGivenCourses WHERE (AcademicTermID = @AcademicTermID) AND (StaffID = @StaffID)">
                        <SelectParameters>
                            <asp:SessionParameter Name="AcademicTermID" SessionField="AcademicTermID" />
                            <asp:ControlParameter ControlID="ListBoxStaff" Name="StaffID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceFormViewStaffAcademic" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        SelectCommand="SELECT aspnet_Users.UserId, tbl_Staff.ContractStartDate, tbl_Staff.ContractExpDate, tbl_Staff.University, tbl_Staff.Degree, tbl_Staff.WorkExperiences, tbl_Staff.StaffID, tbl_Staff.Department, aspnet_Users.UserName, aspnet_Users.PhotoUrl, tbl_Staff.[Continue] FROM tbl_Staff INNER JOIN aspnet_Users ON tbl_Staff.StaffID = aspnet_Users.UserId WHERE (tbl_Staff.StaffID = @StaffID)"
                        UpdateCommand="UPDATE tbl_Staff SET ContractStartDate = @ContractStartDate, ContractExpDate = @ContractExpDate, University = @University, Degree = @Degree, WorkExperiences = @WorkExperiences, Department = @Department, [Continue] = @Continue WHERE (StaffID = @StaffID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ListBoxStaff" Name="StaffID" PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ContractStartDate" />
                            <asp:Parameter Name="ContractExpDate" />
                            <asp:Parameter Name="University" />
                            <asp:Parameter Name="Degree" />
                            <asp:Parameter Name="WorkExperiences" />
                            <asp:Parameter Name="Department" />
                            <asp:Parameter Name="Continue" />
                            <asp:Parameter Name="StaffID" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                <HeaderTemplate>
                    User Roles
                </HeaderTemplate>
                <ContentTemplate>
                    <asp:Panel ID="PanelRoles" runat="server" Visible="False">
                        <table width="500">
                            <tr>
                                <td height="25">
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Assigned Roles for User:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBoxList ID="CheckBoxListRoles" runat="server" DataSourceID="SqlDataSourceRoles"
                                        DataTextField="RoleName" DataValueField="RoleId" Width="100%" RepeatColumns="2">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                            <tr>
                                <td height="35">
                                    <asp:Button ID="UpdateRoles" runat="server" Text="Update Roles" Width="100%" />
                                </td>
                            </tr>
                            <tr>
                                <td height="35">
                                    <asp:Label ID="LabelRoles" runat="server" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </asp:Panel>
                    <asp:Panel ID="PanelEmpty" runat="server">
                        <div align="center">
                            <br />
                            <img alt="" src="Images/no-data.png" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning2" runat="server" Font-Bold="True" Font-Size="Medium"
                                ForeColor="Red" Text="Please Select a Staff from the List to see the Records!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </asp:Panel>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        InsertCommand="INSERT INTO aspnet_Roles(RoleName) VALUES (@RoleName)" SelectCommand="SELECT RoleId, RoleName FROM aspnet_Roles">
                        <InsertParameters>
                            <asp:Parameter Name="RoleName" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceRolesEdit" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                        DeleteCommand="DELETE FROM aspnet_UsersInRoles WHERE (UserID = @UserID) AND (RoleID = @RoleID)"
                        InsertCommand="INSERT INTO aspnet_Roles(RoleName) VALUES (@RoleName)" SelectCommand="SELECT UserId, RoleId FROM aspnet_UsersInRoles WHERE (UserId = @UserId)"
                        UpdateCommand="IF NOT EXISTS 
(
SELECT UserID, RoleID FROM aspnet_UsersInRoles WHERE (UserID = @UserID) AND (RoleID = @RoleID)
)

INSERT INTO aspnet_UsersInRoles (UserID, RoleID) VALUES (@UserID,@RoleID)">
                        <DeleteParameters>
                            <asp:Parameter Name="UserID" />
                            <asp:Parameter Name="RoleID" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="RoleName" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ListBoxStaff" Name="UserId" PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="UserID" />
                            <asp:Parameter Name="RoleID" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>
        <br />
        <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <br />
        <asp:SqlDataSource ID="SqlDataSourceListBoxStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            SelectCommand="SELECT StaffID, StaffName FROM tbl_Staff WHERE (SchoolCode = @SchoolCode) ORDER BY StaffName">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <uc1:WebMessageBox ID="WebMessageBoxStaff" runat="server" />
        <br />
        <br />
        <br />
    </div>
</asp:Content>
