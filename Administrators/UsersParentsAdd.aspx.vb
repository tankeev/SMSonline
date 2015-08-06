Imports System.Data.SqlClient

Partial Class NewUserAccount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
       
        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub CreateUserWizard_CreatedUser(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizardParent.CreatedUser
        Try

            ' Get the UserId of the just-added user
            Dim newUser As MembershipUser = Membership.GetUser(CreateUserWizardParent.UserName)
            Dim newUserId As Guid = DirectCast(newUser.ProviderUserKey, Guid)

            Dim newProfile As ProfileCommon = Profile.GetProfile(newUser.ToString)

            'Set the values to be stored, note the use of find control
            newProfile.SchoolCode = DirectCast(CreateUserWizardParent.CreateUserStep.ContentTemplateContainer.FindControl("SchoolCode"), DropDownList).SelectedValue

            'Save the profile
            newProfile.Save()

            'Get Profile Data Entered by user in CUW control

            Dim SchoolCode As String = DirectCast(CreateUserWizardParent.CreateUserStep.ContentTemplateContainer.FindControl("SchoolCode"), DropDownList).SelectedValue
            Dim ResponsibleParent As String = DirectCast(CreateUserWizardParent.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxResponsibleParent"), TextBox).Text
            Dim Gender As String = DirectCast(CreateUserWizardParent.CreateUserStep.ContentTemplateContainer.FindControl("RadioButtonListGender"), RadioButtonList).SelectedValue

            ' Insert a new record into User_Profile

            ' Get your Connection String from the web.config. MembershipConnectionString is the name I have in my web.config
            Dim SMSOnlineConnectionString As String = ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString

            Dim insertSql As String = "INSERT INTO tbl_Parents(ResponsibleParentID, SchoolCode, ResponsibleParent, ResponsibleParentGender) VALUES(@ResponsibleParentID, @SchoolCode, @ResponsibleParent, @ResponsibleParentGender)"
            Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                myConnection.Open()
                Dim myCommand As New SqlCommand(insertSql, myConnection)
                myCommand.Parameters.AddWithValue("@ResponsibleParentID", newUserId)
                myCommand.Parameters.AddWithValue("@SchoolCode", SchoolCode)
                myCommand.Parameters.AddWithValue("@ResponsibleParent", ResponsibleParent)
                myCommand.Parameters.AddWithValue("@ResponsibleParentGender", Gender)

                myCommand.ExecuteNonQuery()
                myConnection.Close()

            End Using

            Dim DropDownListRoles As DropDownList = DirectCast(CreateUserWizardParent.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListRoles"), DropDownList)

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

    Protected Sub CreateUserWizardParent_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizardParent.PreRender

        Dim DropDownListVar As DropDownList = CType(CreateUserWizardParent.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListRoles"), DropDownList)
        'DropDownListVar.DataSource = Roles.GetAllRoles
        DropDownListVar.DataSource = SqlDataSourceRoles
        DropDownListVar.DataTextField = "RoleName"
        DropDownListVar.DataValueField = "RoleID"

        DropDownListVar.DataBind()

        'DropDownListVar.Items.Remove(DropDownListVar.Items.FindByText("Administrator"))

        DropDownListVar.Items.FindByText("Parent").Selected = True


    End Sub
End Class
