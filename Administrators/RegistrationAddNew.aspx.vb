Imports System.Data.SqlClient

Partial Class NewUserAccount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

        If Not IsPostBack Then

            Dim UserName As TextBox = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("UserName"), TextBox)

            UserName.Text = GenerateRandomString(12, False)
        End If

    End Sub

    Public Function GenerateRandomString(ByRef len As Integer, ByRef upper As Boolean) As String
        Dim rand As New Random()
        Dim allowableChars() As Char = "abcdefghijklmnopqrstuvwxyz123456789".ToCharArray()
        Dim final As String = String.Empty
        For i As Integer = 0 To len - 1
            final += allowableChars(rand.Next(allowableChars.Length - 1))
        Next

        Return IIf(upper, final.ToUpper(), final)
    End Function


    Protected Sub CreateUserWizard_CreatedUser(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizardStudent.CreatedUser
        Try

            Dim SchoolCode As Integer = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListSchools"), DropDownList).SelectedValue
            Dim PUserName As String = "P" & DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("UserName"), TextBox).Text
            Dim PUserID As Guid

            ' Get your Connection String from the web.config. MembershipConnectionString is the name I have in my web.config
            Dim SMSOnlineConnectionString As String = ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString

            'ADD PARENT

            If Membership.GetUser(PUserName) Is Nothing Then

                Dim PStatus As System.Web.Security.MembershipCreateStatus

                Membership.CreateUser(PUserName, "12345678", PUserName & "@mitrapasiad.com", "SecretQuestion", "SecretAnswer", True, PStatus)

                If PStatus = System.Web.Security.MembershipCreateStatus.Success Then

                    Roles.AddUserToRole(PUserName, "Parent")

                    PUserID = DirectCast(Membership.GetUser(PUserName).ProviderUserKey, Guid)

                    Dim PUserProfile As ProfileCommon = Profile.GetProfile(Membership.GetUser(PUserName).ToString)

                    'Set the values to be stored, note the use of find control
                    PUserProfile.SchoolCode = SchoolCode

                    'Save the profile
                    PUserProfile.Save()

                    Dim insertParentSql As String = "INSERT INTO tbl_Parents(ResponsibleParentID, ResponsibleParentGender, SchoolCode, [Continue], FatherName, FatherOccupation, FatherCompany, FatherPosition, FatherOfficeAddress, FatherHandPhone, FatherEmail, FatherDateofBirth, FatherPlaceofBirth, FatherOrigin, FatherReligion, MotherName, MotherOccupation, MotherCompany, MotherPosition, MotherOfficeAddress, MotherHandPhone, MotherEmail, MotherDateofBirth, MotherPlaceofBirth, MotherOrigin, MotherReligion, ResponsibleParent, ContactPhone, ContactEmail, CurrentCity, ContactAddress, Notes, KnownLanguages) VALUES (@ResponsibleParentID, @ResponsibleParentGender, @SchoolCode, @Continue , @FatherName, @FatherOccupation, @FatherCompany, @FatherPosition, @FatherOfficeAddress, @FatherHandPhone, @FatherEmail, @FatherDateofBirth, @FatherPlaceofBirth, @FatherOrigin, @FatherReligion, @MotherName, @MotherOccupation, @MotherCompany, @MotherPosition, @MotherOfficeAddress, @MotherHandPhone, @MotherEmail, @MotherDateofBirth, @MotherPlaceofBirth, @MotherOrigin, @MotherReligion, @ResponsibleParent, @ContactPhone, @ContactEmail, @CurrentCity, @ContactAddress, @Notes, @KnownLanguages)"

                    Dim FatherName As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxFatherName"), TextBox).Text
                    Dim FatherOccupation As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxFatherOccupation"), TextBox).Text
                    Dim FatherCompany As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxFatherCompany"), TextBox).Text
                    Dim FatherPosition As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxFatherPosition"), TextBox).Text
                    Dim FatherOfficeAddress As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxFatherOfficeAddress"), TextBox).Text
                    Dim FatherHandPhone As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxFatherHandPhone"), TextBox).Text
                    Dim FatherEmail As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxFatherEMail"), TextBox).Text
                    Dim FatherDateofBirth As Date = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxFatherDateofBirth"), TextBox).Text
                    Dim FatherPlaceofBirth As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxFatherPlaceofBirth"), TextBox).Text
                    Dim FatherOrigin As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxFatherOrigin"), TextBox).Text
                    Dim FatherReligion As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxFatherReligion"), TextBox).Text

                    Dim MotherName As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxMotherName"), TextBox).Text
                    Dim MotherOccupation As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxMotherOccupation"), TextBox).Text
                    Dim MotherCompany As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxMotherCompany"), TextBox).Text
                    Dim MotherPosition As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxMotherPosition"), TextBox).Text
                    Dim MotherOfficeAddress As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxMotherOfficeAddress"), TextBox).Text
                    Dim MotherHandPhone As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxMotherHandPhone"), TextBox).Text
                    Dim MotherEmail As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxMotherEMail"), TextBox).Text
                    Dim MotherDateofBirth As Date = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxMotherDateofBirth"), TextBox).Text
                    Dim MotherPlaceofBirth As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxMotherPlaceofBirth"), TextBox).Text
                    Dim MotherOrigin As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxMotherOrigin"), TextBox).Text
                    Dim MotherReligion As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxMotherReligion"), TextBox).Text

                    Dim ResponsibleParent As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxResponsibleParent"), TextBox).Text
                    Dim ResponsibleParentGender As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListParentGender"), DropDownList).SelectedValue

                    Dim ContactPhone As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxContactPhone"), TextBox).Text
                    Dim ContactEmail As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxContactEmail"), TextBox).Text
                    Dim CurrentCity As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxCurrentCity"), TextBox).Text
                    Dim ContactAddress As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxContactAddress"), TextBox).Text
                    Dim KnownLanguages As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxKnownLanguages"), TextBox).Text
                    Dim Notes As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxNotes"), TextBox).Text

                    Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                        myConnection.Open()
                        Dim myCommand As New SqlCommand(insertParentSql, myConnection)

                        myCommand.Parameters.AddWithValue("@FatherName", FatherName)
                        myCommand.Parameters.AddWithValue("@FatherOccupation", FatherOccupation)
                        myCommand.Parameters.AddWithValue("@FatherCompany", FatherCompany)
                        myCommand.Parameters.AddWithValue("@FatherPosition", FatherPosition)
                        myCommand.Parameters.AddWithValue("@FatherOfficeAddress", FatherOfficeAddress)
                        myCommand.Parameters.AddWithValue("@FatherHandPhone", FatherHandPhone)
                        myCommand.Parameters.AddWithValue("@FatherEmail", FatherEmail)
                        myCommand.Parameters.AddWithValue("@FatherDateofBirth", FatherDateofBirth)
                        myCommand.Parameters.AddWithValue("@FatherPlaceofBirth", FatherPlaceofBirth)
                        myCommand.Parameters.AddWithValue("@FatherOrigin", FatherOrigin)
                        myCommand.Parameters.AddWithValue("@FatherReligion", FatherReligion)

                        myCommand.Parameters.AddWithValue("@MotherName", MotherName)
                        myCommand.Parameters.AddWithValue("@MotherOccupation", MotherOccupation)
                        myCommand.Parameters.AddWithValue("@MotherCompany", MotherCompany)
                        myCommand.Parameters.AddWithValue("@MotherPosition", MotherPosition)
                        myCommand.Parameters.AddWithValue("@MotherOfficeAddress", MotherOfficeAddress)
                        myCommand.Parameters.AddWithValue("@MotherHandPhone", MotherHandPhone)
                        myCommand.Parameters.AddWithValue("@MotherEmail", MotherEmail)
                        myCommand.Parameters.AddWithValue("@MotherDateofBirth", MotherDateofBirth)
                        myCommand.Parameters.AddWithValue("@MotherPlaceofBirth", MotherPlaceofBirth)
                        myCommand.Parameters.AddWithValue("@MotherOrigin", MotherOrigin)
                        myCommand.Parameters.AddWithValue("@MotherReligion", MotherReligion)

                        myCommand.Parameters.AddWithValue("@ResponsibleParentID", PUserID)
                        myCommand.Parameters.AddWithValue("@ResponsibleParent", ResponsibleParent)
                        myCommand.Parameters.AddWithValue("@ResponsibleParentGender", ResponsibleParentGender)
                        myCommand.Parameters.AddWithValue("@ContactPhone", ContactPhone)
                        myCommand.Parameters.AddWithValue("@ContactEmail", ContactEmail)
                        myCommand.Parameters.AddWithValue("@CurrentCity", CurrentCity)
                        myCommand.Parameters.AddWithValue("@ContactAddress", ContactAddress)
                        myCommand.Parameters.AddWithValue("@KnownLanguages", KnownLanguages)
                        myCommand.Parameters.AddWithValue("@Notes", Notes)

                        myCommand.Parameters.AddWithValue("@SchoolCode", SchoolCode)
                        myCommand.Parameters.AddWithValue("@Continue", 1)

                        myCommand.ExecuteNonQuery()
                        myConnection.Close()

                    End Using

                    Dim UpdateParentCodeSql As String = "UPDATE aspnet_Users SET SchoolCode = @SchoolCode  WHERE (UserID = @UserID)"
                    Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                        myConnection.Open()
                        Dim myCommand As New SqlCommand(UpdateParentCodeSql, myConnection)
                        myCommand.Parameters.AddWithValue("@UserID", PUserID)
                        myCommand.Parameters.AddWithValue("@SchoolCode", SchoolCode)

                        myCommand.ExecuteNonQuery()
                        myConnection.Close()

                    End Using

                End If

            End If

            ' Get the UserId of the just-added user
            Dim UserName As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("UserName"), TextBox).Text
            Dim NewUser As MembershipUser = Membership.GetUser(UserName)
            Dim NewUserId As Guid = DirectCast(NewUser.ProviderUserKey, Guid)

            'Get Profile Data Entered by user in CUW control

            Dim SchoolNo As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxSchoolNo"), TextBox).Text
            Dim StudentName As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxStudentName"), TextBox).Text
            Dim DateofBirth As Date = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxDateofBirth"), TextBox).Text
            Dim BirthPlace As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxPlaceofBirth"), TextBox).Text
            Dim Gender As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("RadioButtonListGender"), RadioButtonList).SelectedValue
            Dim Religion As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxReligion"), TextBox).Text

            Dim StartingAcademicTermID As Integer = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListAcademicTerms"), DropDownList).SelectedValue
            Dim StartingSectionID As Integer = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListSections"), DropDownList).SelectedValue
            Dim CurrentSectionID As Integer = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListSections"), DropDownList).SelectedValue

            Dim Email As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("Email"), TextBox).Text
            Dim IsOlympiad As Boolean = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("CheckBoxOlympiad"), CheckBox).Checked
            Dim OlympiadName As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxOlympiadName"), TextBox).Text
            Dim IsScholarship As Boolean = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("CheckBoxScholarship"), CheckBox).Checked
            Dim ScholarshipPercentage As Integer = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxScholarshipPercentage"), TextBox).Text
            Dim StudentContactPhone As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxStudentContactPhone"), TextBox).Text

            Dim insertSql As String = "INSERT INTO tbl_Students(StudentID, ParentID, StudentName, SchoolCode, StartingAcademicTermID, StartingSectionID, CurrentSectionID, SchoolNo, [Continue], DateofBirth, BirthPlace, Gender, Religion, ContactPhone1, ContactEmail, IsOlympiad, OlympiadName, IsScholarship, ScholarshipPercentage) VALUES (@StudentID, @ParentID, @StudentName, @SchoolCode, @StartingAcademicTermID, @StartingSectionID, @CurrentSectionID, @SchoolNo, @Continue , @DateofBirth, @BirthPlace, @Gender, @Religion, @ContactPhone1, @ContactEmail, @IsOlympiad, @OlympiadName, @IsScholarship, @ScholarshipPercentage)"

            Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                myConnection.Open()

                Dim myCommand As New SqlCommand(insertSql, myConnection)

                myCommand.Parameters.AddWithValue("@StudentID", NewUserId)
                myCommand.Parameters.AddWithValue("@ParentID", PUserID)
                myCommand.Parameters.AddWithValue("@SchoolNo", SchoolNo)
                myCommand.Parameters.AddWithValue("@SchoolCode", SchoolCode)
                myCommand.Parameters.AddWithValue("@StudentName", StudentName)
                myCommand.Parameters.AddWithValue("@DateofBirth", DateofBirth)
                myCommand.Parameters.AddWithValue("@BirthPlace", BirthPlace)
                myCommand.Parameters.AddWithValue("@Gender", Gender)
                myCommand.Parameters.AddWithValue("@Religion", Religion)
                myCommand.Parameters.AddWithValue("@StartingAcademicTermID", StartingAcademicTermID)
                myCommand.Parameters.AddWithValue("@StartingSectionID", StartingSectionID)
                myCommand.Parameters.AddWithValue("@CurrentSectionID", CurrentSectionID)
                myCommand.Parameters.AddWithValue("@IsOlympiad", IsOlympiad)
                myCommand.Parameters.AddWithValue("@OlympiadName", OlympiadName)
                myCommand.Parameters.AddWithValue("@IsScholarship", IsScholarship)
                myCommand.Parameters.AddWithValue("@ScholarshipPercentage", ScholarshipPercentage)
                myCommand.Parameters.AddWithValue("@ContactPhone1", StudentContactPhone)
                myCommand.Parameters.AddWithValue("@ContactEmail", Email)
                myCommand.Parameters.AddWithValue("@Continue", 1)

                myCommand.ExecuteNonQuery()
                myConnection.Close()
            End Using

            Dim DropDownListRoles As DropDownList = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListRoles"), DropDownList)

            Dim insertRoleSql As String = "INSERT INTO aspnet_UsersInRoles(UserID, RoleID) VALUES(@UserID, @RoleID)"
            Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                myConnection.Open()
                Dim myCommand As New SqlCommand(insertRoleSql, myConnection)
                myCommand.Parameters.AddWithValue("@UserID", NewUserId)
                myCommand.Parameters.AddWithValue("@RoleID", DropDownListRoles.SelectedValue)

                myCommand.ExecuteNonQuery()
                myConnection.Close()

            End Using

            Dim UpdateCodeSql As String = "UPDATE aspnet_Users SET SchoolCode = @SchoolCode  WHERE (UserId = @UserId)"
            Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                myConnection.Open()
                Dim myCommand As New SqlCommand(UpdateCodeSql, myConnection)
                myCommand.Parameters.AddWithValue("@UserID", NewUserId)
                myCommand.Parameters.AddWithValue("@SchoolCode", SchoolCode)

                myCommand.ExecuteNonQuery()
                myConnection.Close()

            End Using

            Dim insertAcademicTermSql As String = "INSERT INTO tbl_AcademicTermsStudents(AcademicTermID, SectionCatalogID, SchoolCode, StudentID) VALUES (@AcademicTermID, @SectionCatalogID, @SchoolCode, @StudentID)"
            Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                myConnection.Open()
                Dim myCommand As New SqlCommand(insertAcademicTermSql, myConnection)
                myCommand.Parameters.AddWithValue("@AcademicTermID", StartingAcademicTermID)
                myCommand.Parameters.AddWithValue("@SectionCatalogID", StartingSectionID)
                myCommand.Parameters.AddWithValue("@SchoolCode", SchoolCode)
                myCommand.Parameters.AddWithValue("@StudentID", NewUserId)
                myCommand.ExecuteNonQuery()
                myConnection.Close()

            End Using

        Catch ex As Exception
            LabelStatus.Text += ex.Message
        End Try

    End Sub


    Protected Sub CreateUserWizardStudent_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizardStudent.PreRender

        Dim DropDownListVar As DropDownList = CType(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListRoles"), DropDownList)
        'DropDownListVar.DataSource = Roles.GetAllRoles
        DropDownListVar.DataSource = SqlDataSourceRoles
        DropDownListVar.DataTextField = "RoleName"
        DropDownListVar.DataValueField = "RoleID"

        DropDownListVar.DataBind()

        'DropDownListVar.Items.Remove(DropDownListVar.Items.FindByText("Administrator"))
        DropDownListVar.Items.FindByText("Student").Selected = True
    End Sub
End Class
