Imports System.Data.SqlClient

Partial Class NewUserAccount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("CoordinatorSD") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub CreateUserWizard_CreatedUser(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizardStaff.CreatedUser
        Try

            ' Get the UserId of the just-added user
            Dim newUser As MembershipUser = Membership.GetUser(CreateUserWizardStaff.UserName)
            Dim newUserId As Guid = DirectCast(newUser.ProviderUserKey, Guid)

            Dim newProfile As ProfileCommon = Profile.GetProfile(newUser.ToString)

            'Set the values to be stored, note the use of find control
            newProfile.SchoolCode = DirectCast(CreateUserWizardStaff.CreateUserStep.ContentTemplateContainer.FindControl("SchoolCode"), DropDownList).SelectedValue

            'Save the profile
            newProfile.Save()

            'Get Profile Data Entered by user in CUW control

            Dim SchoolCode As Integer = DirectCast(CreateUserWizardStaff.CreateUserStep.ContentTemplateContainer.FindControl("SchoolCode"), DropDownList).SelectedValue
            Dim FullName As String = DirectCast(CreateUserWizardStaff.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxFullName"), TextBox).Text
            Dim DateofBirth As Date = DirectCast(CreateUserWizardStaff.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxDateofBirth"), TextBox).Text
            Dim PlaceofBirth As String = DirectCast(CreateUserWizardStaff.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxPlaceofBirth"), TextBox).Text
            Dim Gender As String = DirectCast(CreateUserWizardStaff.CreateUserStep.ContentTemplateContainer.FindControl("RadioButtonListGender"), RadioButtonList).SelectedValue
            Dim BloodType As String = DirectCast(CreateUserWizardStaff.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListBloodType"), DropDownList).SelectedValue
            Dim PhotoURL As String = "NoPhoto.jpg"
            ' Insert a new record into User_Profile

            ' Get your Connection String from the web.config. MembershipConnectionString is the name I have in my web.config
            Dim SMSOnlineConnectionString As String = ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString

            Dim insertSql As String = "INSERT INTO tbl_Staff(StaffId, SchoolCode, StaffName, DateofBirth, PlaceofBirth, Gender, BloodType) VALUES(@StaffID, @SchoolCode, @StaffName, @DateofBirth, @PlaceofBirth, @Gender, @BloodType)"
            Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                myConnection.Open()
                Dim myCommand As New SqlCommand(insertSql, myConnection)
                myCommand.Parameters.AddWithValue("@StaffId", newUserId)
                myCommand.Parameters.AddWithValue("@SchoolCode", SchoolCode)
                myCommand.Parameters.AddWithValue("@StaffName", FullName)
                myCommand.Parameters.AddWithValue("@DateofBirth", DateofBirth)
                myCommand.Parameters.AddWithValue("@PlaceofBirth", PlaceofBirth)
                myCommand.Parameters.AddWithValue("@Gender", Gender)
                myCommand.Parameters.AddWithValue("@BloodType", BloodType)

                myCommand.ExecuteNonQuery()
                myConnection.Close()

            End Using


            Dim DropDownListRoles As DropDownList = DirectCast(CreateUserWizardStaff.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListRoles"), DropDownList)

            Dim insertRoleSql As String = "INSERT INTO aspnet_UsersInRoles(UserID, RoleID) VALUES(@UserID, @RoleID)"
            Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                myConnection.Open()
                Dim myCommand As New SqlCommand(insertRoleSql, myConnection)
                myCommand.Parameters.AddWithValue("@UserID", newUserId)
                myCommand.Parameters.AddWithValue("@RoleID", DropDownListRoles.SelectedValue)

                myCommand.ExecuteNonQuery()
                myConnection.Close()

            End Using


            Dim UpdateCodeSql As String = "UPDATE aspnet_Users SET SchoolCode = @SchoolCode, PhotoURL=@PhotoURL  WHERE (UserId = @UserId)"
            Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                myConnection.Open()
                Dim myCommand As New SqlCommand(UpdateCodeSql, myConnection)
                myCommand.Parameters.AddWithValue("@UserID", newUserId)
                myCommand.Parameters.AddWithValue("@SchoolCode", SchoolCode)
                myCommand.Parameters.AddWithValue("@PhotoURL", PhotoURL)
                myCommand.ExecuteNonQuery()
                myConnection.Close()

            End Using


        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try

    End Sub

    Protected Sub CreateUserWizardStaff_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizardStaff.PreRender

        Dim DropDownListVar As DropDownList = CType(CreateUserWizardStaff.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListRoles"), DropDownList)

        'DropDownListVar.DataSource = Roles.GetAllRoles
        DropDownListVar.DataSource = SqlDataSourceRoles
        DropDownListVar.DataTextField = "RoleName"
        DropDownListVar.DataValueField = "RoleID"

        DropDownListVar.DataBind()

        DropDownListVar.Items.Remove(DropDownListVar.Items.FindByText("Administrator"))
        DropDownListVar.Items.Remove(DropDownListVar.Items.FindByText("Parent"))
        DropDownListVar.Items.Remove(DropDownListVar.Items.FindByText("Student"))
        'DropDownListVar.Items.FindByText("Student").Selected = True


    End Sub
End Class
