<%@ Page Title="Setup All Students" Language="VB" MasterPageFile="Setup.Master" AutoEventWireup="false"
    CodeFile="Students.aspx.vb" Inherits="Assignments" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <table class="content-table" width="675">
                <tr>
                    <td width="150">
                        <asp:Label ID="Label26" runat="server" Font-Bold="True" Text="Search Student Name:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxSearchName" runat="server" Width="95%"></asp:TextBox>
                    </td>
                    <td width="50">
                        <asp:Button ID="ButtonFind" runat="server" Text="Find!" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:Label ID="Label27" runat="server" Text="This page, allows you to do search in Student Data Table."
                Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridViewStudents" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                DataKeyNames="StudentID" DataSourceID="SqlDataSourceGridViewStudents" Width="675px">
                <Columns>
                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName">
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="60px" />
                    </asp:BoundField>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/Setup/Images/info.png">
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:CommandField>
                </Columns>
                <SelectedRowStyle BackColor="#FFFFCC" />
            </asp:GridView>
            <br />
            <asp:FormView ID="FormViewStudents" runat="server" DataKeyNames="StudentID" DataSourceID="SqlDataSourceFormViewStudents"
                DefaultMode="Edit" Width="675px">
                <EditItemTemplate>
                    <table id="StudentTable" width="100%">
                        <tr>
                            <td width="20" height="28">
                                <asp:Image ID="Image33" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td width="120">
                                <asp:Label ID="Label23" runat="server" meta:resourcekey="Label1Resource1" Text="School Code:"></asp:Label>
                            </td>
                            <td width="250">
                                <asp:TextBox ID="TextBoxSchoolCode" runat="server" meta:resourcekey="TextBox5Resource1"
                                    Text='<%# Bind("SchoolCode") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td width="50">
                            </td>
                            <td rowspan="15" valign="top">
                                <img alt='<%# Eval("StudentName") %>' height="250" src="../SchoolData/StudentPhotos/000.jpg"
                                    style="border: 3px solid #C0C0C0" />
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Image ID="Image29" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td>
                                <asp:Label ID="Label19" runat="server" meta:resourcekey="Label1Resource1" Text="School No: (Induk)"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxSchoolNo" runat="server" meta:resourcekey="TextBox5Resource1"
                                    Text='<%# Bind("SchoolNo") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Image ID="Image38" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td>
                                <asp:Label ID="Label26" runat="server" meta:resourcekey="Label2Resource1" Text="Student ID:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxStudentID" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                    Text='<%# Bind("StudentID") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Image ID="Image37" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td>
                                <asp:Label ID="Label25" runat="server" meta:resourcekey="Label2Resource1" Text="Parent ID:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxParentID" runat="server" MaxLength="50" meta:resourcekey="TextBoxStudentNameResource1"
                                    Text='<%# Bind("ParentID") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Image ID="Image39" runat="server" 
                                    ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td>
                                <asp:Label ID="Label27" runat="server" meta:resourcekey="Label2Resource1" 
                                    Text="UserName:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxUsername" runat="server" MaxLength="50" 
                                    meta:resourcekey="TextBoxStudentNameResource1" Text='<%# Bind("UserName") %>' 
                                    Width="220px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Image ID="Image11" runat="server" 
                                    ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" 
                                    Text="Full Name:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxStudentName" runat="server" MaxLength="50" 
                                    meta:resourcekey="TextBoxStudentNameResource1" 
                                    Text='<%# Bind("StudentName") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td>
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
                                    Text='<%# Bind("DateofBirth", "{0:d}") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Image ID="Image6" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td>
                                <asp:Label ID="Label10" runat="server" meta:resourcekey="Label7Resource1" Text="Birth Place:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxBirthPlace" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                    Text='<%# Bind("BirthPlace") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td>
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
                                <asp:TextBox ID="TextBoxGender" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                    Text='<%# Bind("Gender") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Image ID="Image34" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td>
                                <asp:Label ID="Label24" runat="server" meta:resourcekey="Label7Resource1" Text="Religion:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxReligion" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                    Text='<%# Bind("Religion") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Image ID="Image28" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td>
                                <asp:Label ID="Label21" runat="server" meta:resourcekey="Label7Resource1" Text="Current Section ID:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxCurrentSectionID" runat="server" MaxLength="50" meta:resourcekey="TextBoxSexResource1"
                                    Text='<%# Bind("CurrentSectionID") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBoxContinue" runat="server" Checked='<%# Bind("Continue") %>'
                                    Text="Continue?" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="25">
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
                            <td height="25">
                                <asp:Image ID="Image36" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td>
                                <asp:Label ID="LabelStartingGrade1" runat="server" meta:resourcekey="LabelStartingGradeResource1"
                                    Text="Scholarship (%):"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxScholarshipPercentage" runat="server" MaxLength="50" Text='<%# Bind("ScholarshipPercentage") %>'
                                    Width="220px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
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
                            <td height="28">
                                <asp:Image ID="Image35" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td>
                                <asp:Label ID="LabelStartingGrade0" runat="server" meta:resourcekey="LabelStartingGradeResource1"
                                    Text="Olympiad Name:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxOlympiadName" runat="server" MaxLength="30" meta:resourcekey="TextBoxStartingGradeResource1"
                                    Text='<%# Bind("OlympiadName") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                    <table id="StudentDetails" width="100%">
                        <tr>
                            <td width="20" height="28">
                                <asp:Image ID="Image16" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td width="120">
                                <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="Mobile Phone 1:"></asp:Label>
                            </td>
                            <td width="250">
                                <asp:TextBox ID="TextBoxContactPhone1" runat="server" meta:resourcekey="TextBox1Resource2"
                                    Text='<%# Bind("ContactPhone1") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td width="20">
                            </td>
                            <td width="120">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="28" width="20">
                                <asp:Image ID="Image18" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td width="120">
                                <asp:Label ID="Label9" runat="server" meta:resourcekey="Label9Resource1" Text="Mobile Phone 2:"></asp:Label>
                            </td>
                            <td width="180">
                                <asp:TextBox ID="TextBoxContactPhone2" runat="server" meta:resourcekey="TextBox2Resource1"
                                    Text='<%# Bind("ContactPhone2") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td width="20">
                            </td>
                            <td width="120">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="28" width="20">
                                <asp:Image ID="Image19" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td width="120">
                                <asp:Label ID="Label11" runat="server" meta:resourcekey="Label11Resource1" Text="Contact E-mail"></asp:Label>
                            </td>
                            <td width="180">
                                <asp:TextBox ID="TextBoxContactEmail" runat="server" MaxLength="50" meta:resourcekey="TextBox3Resource1"
                                    Text='<%# Bind("ContactEmail") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td width="20">
                            </td>
                            <td width="120">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="28" width="20">
                                <asp:Image ID="Image20" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td width="120">
                                <asp:Label ID="Label15" runat="server" meta:resourcekey="Label15Resource1" Text="Passport ID:"></asp:Label>
                            </td>
                            <td width="180">
                                <asp:TextBox ID="TextBoxPassportID" runat="server" MaxLength="50" meta:resourcekey="TextBox7Resource1"
                                    Text='<%# Bind("PassportNo") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td width="20">
                            </td>
                            <td width="120">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="28" width="20">
                                <asp:Image ID="Image21" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td width="120">
                                <asp:Label ID="Label16" runat="server" meta:resourcekey="Label16Resource1" Text="Blood Type:"></asp:Label>
                            </td>
                            <td width="180">
                                <asp:TextBox ID="TextBoxBloodType" runat="server" MaxLength="50" meta:resourcekey="TextBox7Resource1"
                                    Text='<%# Bind("BloodType") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td width="20">
                            </td>
                            <td width="120">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="28" width="20">
                                <asp:Image ID="Image12" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td width="120">
                                <asp:Label ID="Label13" runat="server" meta:resourcekey="Label13Resource1" Text="Enrollment Date:"></asp:Label>
                            </td>
                            <td width="180">
                                <asp:TextBox ID="TextBoxEnrollmentDate" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                    Text='<%# Bind("EnrollmentDate","{0:d}") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td width="20">
                            </td>
                            <td width="120">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Image ID="Image13" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td height="25">
                                <asp:Label ID="Label14" runat="server" meta:resourcekey="Label14Resource1" Text="Starting Term ID:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxStartingTermID" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                    Text='<%# Bind("StartingAcademicTermID") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                                <asp:Image ID="Image15" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td height="25">
                                <asp:Label ID="LabelStartingGrade" runat="server" meta:resourcekey="LabelStartingGradeResource1"
                                    Text="Starting Grade ID:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxStartingSectionID" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                    Text='<%# Bind("StartingSectionID") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td height="28">
                            </td>
                            <td height="25">
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
                            <td height="60" valign="top">
                                <asp:Image ID="Image31" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td height="25" valign="top">
                                <asp:Label ID="Label20" runat="server" meta:resourcekey="Label12Resource1" Text="Contact Address:"></asp:Label>
                            </td>
                            <td colspan="4">
                                <asp:TextBox ID="TextBoxAddress" runat="server" Height="50px" meta:resourcekey="TextBox4Resource1"
                                    Text='<%# Bind("ContactAddress") %>' TextMode="MultiLine" Width="98%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td height="60" valign="top">
                                <asp:Image ID="Image30" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td height="25" valign="top">
                                <asp:Label ID="LabelHealthIssues" runat="server" meta:resourcekey="Label12Resource1"
                                    Text="Healht Issues:"></asp:Label>
                            </td>
                            <td colspan="4">
                                <asp:TextBox ID="TextBoxHealthIssues" runat="server" Height="50px" meta:resourcekey="TextBox9Resource1"
                                    Text='<%# Bind("HealthIssues") %>' TextMode="MultiLine" Width="98%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td height="60" valign="top">
                                <asp:Image ID="Image32" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td height="25" valign="top">
                                <asp:Label ID="LabelReasonforJoin" runat="server" meta:resourcekey="LabelReasonforJoinResource1"
                                    Text="Reason for Join:"></asp:Label>
                            </td>
                            <td colspan="4">
                                <asp:TextBox ID="TextBoxReasonforJoin" runat="server" Height="50px" meta:resourcekey="TextBoxReasonforJoinResource1"
                                    Text='<%# Bind("ReasonForJoin") %>' TextMode="MultiLine" Width="98%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td height="60" valign="top">
                                <asp:Image ID="Image25" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td height="25" valign="top">
                                <asp:Label ID="LabelReasonforLeave" runat="server" meta:resourcekey="LabelReasonforLeaveResource1"
                                    Text="Reason for Leave:"></asp:Label>
                            </td>
                            <td colspan="4">
                                <asp:TextBox ID="TextBoxReasonforLeave" runat="server" Height="50px" meta:resourcekey="TextBoxReasonforLeaveResource1"
                                    Text='<%# Bind("ReasonForLeave") %>' TextMode="MultiLine" Width="98%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="Image24" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td height="25">
                                <asp:Label ID="LabelReasonForLeaveFromXSchool0" runat="server" meta:resourcekey="LabelReasonForLeaveFromXSchoolResource1"
                                    Text="Level Turkce:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxStartingSectionID0" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                    Text='<%# Bind("LevelTr") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="Image27" runat="server" ImageUrl="~/Membership/Images/LeftArrow.png" />
                            </td>
                            <td height="25">
                                <asp:Label ID="LabelReasonForLeaveFromXSchool1" runat="server" meta:resourcekey="LabelReasonForLeaveFromXSchoolResource1"
                                    Text="Level English:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxLevelEng" runat="server" meta:resourcekey="TextBoxStartingGradeResource1"
                                    Text='<%# Bind("LevelEng") %>' Width="220px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update" Text="Update Data"
                        Width="98%" /><br />
                    <br />
                </EditItemTemplate>
            </asp:FormView>
            <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSourceGridViewStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT StudentID, ParentID, StudentName, SchoolCode, StartingAcademicTermID, StartingSectionID, CurrentSectionID, SchoolNo, [Continue], DateofBirth, BirthPlace, Gender, Religion, Photo, ContactPhone1, ContactPhone2, ContactEmail, ContactAddress, PassportNo, BloodType, IsOlympiad, OlympiadName, IsScholarship, ScholarshipPercentage, EnrollmentDate, ReasonForJoin, ReasonForLeave, HealthIssues, LevelTr, LevelEng FROM tbl_Students ORDER BY StudentName"
                UpdateCommand="UPDATE tbl_Students SET ParentID = @ParentID, StudentName = @StudentName, SchoolCode = @SchoolCode, StartingAcademicTermID = @StartingAcademicTermID, StartingSectionID = @StartingSectionID, CurrentSectionID = @CurrentSectionID, SchoolNo = @SchoolNo, [Continue] = @Continue , DateofBirth = @DateofBirth, BirthPlace = @BirthPlace, Gender = @Gender, Religion = @Religion, ContactPhone1 = @ContactPhone1, ContactPhone2 = @ContactPhone2, ContactEmail = @ContactEmail, ContactAddress = @ContactAddress, PassportNo = @PassportNo, BloodType = @BloodType, IsOlympiad = @IsOlympiad, OlympiadName = @OlympiadName, IsScholarship = @IsScholarship, ScholarshipPercentage = @ScholarshipPercentage, EnrollmentDate = @EnrollmentDate, ReasonForJoin = @ReasonForJoin, ReasonForLeave = @ReasonForLeave, HealthIssues = @HealthIssues, LevelTr = @LevelTr, LevelEng = @LevelEng WHERE (StudentID = @StudentID)"
                FilterExpression="StudentName like '%{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter ControlID="TextBoxSearchName" Name="SearchName" PropertyName="Text" />
                </FilterParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ParentID" />
                    <asp:Parameter Name="StudentName" />
                    <asp:Parameter Name="SchoolCode" />
                    <asp:Parameter Name="StartingAcademicTermID" />
                    <asp:Parameter Name="StartingSectionID" />
                    <asp:Parameter Name="CurrentSectionID" />
                    <asp:Parameter Name="SchoolNo" />
                    <asp:Parameter Name="Continue" />
                    <asp:Parameter Name="DateofBirth" />
                    <asp:Parameter Name="BirthPlace" />
                    <asp:Parameter Name="Gender" />
                    <asp:Parameter Name="Religion" />
                    <asp:Parameter Name="ContactPhone1" />
                    <asp:Parameter Name="ContactPhone2" />
                    <asp:Parameter Name="ContactEmail" />
                    <asp:Parameter Name="ContactAddress" />
                    <asp:Parameter Name="PassportNo" />
                    <asp:Parameter Name="BloodType" />
                    <asp:Parameter Name="IsOlympiad" />
                    <asp:Parameter Name="OlympiadName" />
                    <asp:Parameter Name="IsScholarship" />
                    <asp:Parameter Name="ScholarshipPercentage" />
                    <asp:Parameter Name="EnrollmentDate" />
                    <asp:Parameter Name="ReasonForJoin" />
                    <asp:Parameter Name="ReasonForLeave" />
                    <asp:Parameter Name="HealthIssues" />
                    <asp:Parameter Name="LevelTr" />
                    <asp:Parameter Name="LevelEng" />
                    <asp:Parameter Name="StudentID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceFormViewStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT tbl_Students.StudentID, tbl_Students.ParentID, tbl_Students.StudentName, tbl_Students.SchoolCode, tbl_Students.StartingAcademicTermID, tbl_Students.StartingSectionID, tbl_Students.CurrentSectionID, tbl_Students.SchoolNo, tbl_Students.[Continue], tbl_Students.DateofBirth, tbl_Students.BirthPlace, tbl_Students.Gender, tbl_Students.Religion, tbl_Students.Photo, tbl_Students.ContactPhone1, tbl_Students.ContactPhone2, tbl_Students.ContactEmail, tbl_Students.ContactAddress, tbl_Students.PassportNo, tbl_Students.BloodType, tbl_Students.IsOlympiad, tbl_Students.OlympiadName, tbl_Students.IsScholarship, tbl_Students.ScholarshipPercentage, tbl_Students.EnrollmentDate, tbl_Students.ReasonForJoin, tbl_Students.ReasonForLeave, tbl_Students.HealthIssues, tbl_Students.LevelTr, tbl_Students.LevelEng, aspnet_Users.UserName FROM tbl_Students INNER JOIN aspnet_Users ON tbl_Students.StudentID = aspnet_Users.UserId WHERE (tbl_Students.StudentID = @StudentID)"
                
                UpdateCommand="UPDATE tbl_Students SET ParentID = @ParentID, StudentName = @StudentName, SchoolCode = @SchoolCode, StartingAcademicTermID = @StartingAcademicTermID, StartingSectionID = @StartingSectionID, CurrentSectionID = @CurrentSectionID, SchoolNo = @SchoolNo, [Continue] = @Continue , DateofBirth = @DateofBirth, BirthPlace = @BirthPlace, Gender = @Gender, Religion = @Religion, ContactPhone1 = @ContactPhone1, ContactPhone2 = @ContactPhone2, ContactEmail = @ContactEmail, ContactAddress = @ContactAddress, PassportNo = @PassportNo, BloodType = @BloodType, IsOlympiad = @IsOlympiad, OlympiadName = @OlympiadName, IsScholarship = @IsScholarship, ScholarshipPercentage = @ScholarshipPercentage, EnrollmentDate = @EnrollmentDate, ReasonForJoin = @ReasonForJoin, ReasonForLeave = @ReasonForLeave, HealthIssues = @HealthIssues, LevelTr = @LevelTr, LevelEng = @LevelEng WHERE (StudentID = @StudentID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewStudents" Name="StudentID" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ParentID" />
                    <asp:Parameter Name="StudentName" />
                    <asp:Parameter Name="SchoolCode" />
                    <asp:Parameter Name="StartingAcademicTermID" />
                    <asp:Parameter Name="StartingSectionID" />
                    <asp:Parameter Name="CurrentSectionID" />
                    <asp:Parameter Name="SchoolNo" />
                    <asp:Parameter Name="Continue" />
                    <asp:Parameter Name="DateofBirth" />
                    <asp:Parameter Name="BirthPlace" />
                    <asp:Parameter Name="Gender" />
                    <asp:Parameter Name="Religion" />
                    <asp:Parameter Name="ContactPhone1" />
                    <asp:Parameter Name="ContactPhone2" />
                    <asp:Parameter Name="ContactEmail" />
                    <asp:Parameter Name="ContactAddress" />
                    <asp:Parameter Name="PassportNo" />
                    <asp:Parameter Name="BloodType" />
                    <asp:Parameter Name="IsOlympiad" />
                    <asp:Parameter Name="OlympiadName" />
                    <asp:Parameter Name="IsScholarship" />
                    <asp:Parameter Name="ScholarshipPercentage" />
                    <asp:Parameter Name="EnrollmentDate" />
                    <asp:Parameter Name="ReasonForJoin" />
                    <asp:Parameter Name="ReasonForLeave" />
                    <asp:Parameter Name="HealthIssues" />
                    <asp:Parameter Name="LevelTr" />
                    <asp:Parameter Name="LevelEng" />
                    <asp:Parameter Name="StudentID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="ContentHeader" runat="server" ContentPlaceHolderID="ChildHead">
</asp:Content>
