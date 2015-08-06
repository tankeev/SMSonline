Imports System.Data.SqlClient

Partial Class NewUserAccount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("CoordinatorSD") Then
            Response.Redirect("~/Warning.aspx")
        End If

        If Not IsPostBack Then

            Dim DropDownListAcademicTerms As DropDownList = CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListAcademicTerms")
            DropDownListAcademicTerms.SelectedValue = Session("AcademicTermID")

        End If

    End Sub


    Protected Sub CreateUserWizard_CreatedUser(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizardStudent.CreatedUser
        Try

            ' Get the UserId of the just-added user
            Dim newUser As MembershipUser = Membership.GetUser(CreateUserWizardStudent.UserName)
            Dim newUserId As Guid = DirectCast(newUser.ProviderUserKey, Guid)

            'Get Profile Data Entered by user in CUW control

            Dim SchoolNo As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxSchoolNo"), TextBox).Text
            Dim StudentName As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxStudentName"), TextBox).Text
            Dim DateofBirth As Date = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxDateofBirth"), TextBox).Text
            Dim BirthPlace As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxBirthPlace"), TextBox).Text
            Dim Gender As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("RadioButtonListGender"), RadioButtonList).SelectedValue
            Dim SchoolCode As Integer = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListSchools"), DropDownList).SelectedValue
            Dim CurrentSectionID As Integer = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListSections"), DropDownList).SelectedValue
            Dim BloodType As String = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListBloodType"), DropDownList).SelectedValue
            Dim StartingAcademicTermID As Integer = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListAcademicTerms"), DropDownList).SelectedValue
            ' Insert a new record into User_Profile

            ' Get your Connection String from the web.config. MembershipConnectionString is the name I have in my web.config
            Dim SMSOnlineConnectionString As String = ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString

            Dim insertSql As String = "INSERT INTO tbl_Students(StudentID, SchoolNo, SchoolCode, StudentName, DateofBirth, BirthPlace, Gender, CurrentSectionID, BloodType, StartingAcademicTermID, StartingSectionID) VALUES (@StudentID, @SchoolNo, @SchoolCode, @StudentName, @DateofBirth, @BirthPlace, @Gender, @CurrentSectionID, @BloodType, @StartingAcademicTermID, @StartingSectionID)"
            Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                myConnection.Open()

                Dim myCommand As New SqlCommand(insertSql, myConnection)

                myCommand.Parameters.AddWithValue("@StudentID", newUserId)
                myCommand.Parameters.AddWithValue("@SchoolNo", SchoolNo)
                myCommand.Parameters.AddWithValue("@SchoolCode", SchoolCode)
                myCommand.Parameters.AddWithValue("@CurrentSectionID", CurrentSectionID)
                myCommand.Parameters.AddWithValue("@StudentName", StudentName)
                myCommand.Parameters.AddWithValue("@DateofBirth", DateofBirth)
                myCommand.Parameters.AddWithValue("@BirthPlace", BirthPlace)
                myCommand.Parameters.AddWithValue("@Gender", Gender)
                myCommand.Parameters.AddWithValue("@BloodType", BloodType)
                myCommand.Parameters.AddWithValue("@StartingSectionID", CurrentSectionID)
                myCommand.Parameters.AddWithValue("@StartingAcademicTermID", StartingAcademicTermID)

                myCommand.ExecuteNonQuery()
                myConnection.Close()
            End Using

            Dim DropDownListRoles As DropDownList = DirectCast(CreateUserWizardStudent.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListRoles"), DropDownList)

            Dim insertRoleSql As String = "INSERT INTO aspnet_UsersInRoles(UserID, RoleID) VALUES(@UserID, @RoleID)"
            Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                myConnection.Open()
                Dim myCommand As New SqlCommand(insertRoleSql, myConnection)
                myCommand.Parameters.AddWithValue("@UserID", newUserId)
                myCommand.Parameters.AddWithValue("@RoleID", DropDownListRoles.SelectedValue)

                myCommand.ExecuteNonQuery()
                myConnection.Close()

            End Using

            Dim UpdateCodeSql As String = "UPDATE aspnet_Users SET SchoolCode = @SchoolCode  WHERE (UserId = @UserId)"
            Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                myConnection.Open()
                Dim myCommand As New SqlCommand(UpdateCodeSql, myConnection)
                myCommand.Parameters.AddWithValue("@UserID", newUserId)
                myCommand.Parameters.AddWithValue("@SchoolCode", SchoolCode)

                myCommand.ExecuteNonQuery()
                myConnection.Close()

            End Using

        Catch ex As Exception
            LabelStatus.Text = ex.Message
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
