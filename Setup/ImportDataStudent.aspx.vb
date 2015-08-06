Imports System.Data.OleDb
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Partial Class ImportDataStudent
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub btnUpload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUploadStafftoExcel.Click

        If FileUploadStaffData.HasFile Then

            Try

                Dim FileName As String = Path.GetFileName(FileUploadStaffData.PostedFile.FileName)
                Dim Extension As String = Path.GetExtension(FileUploadStaffData.PostedFile.FileName)
                Dim FolderPath As String = ConfigurationManager.AppSettings("FolderPath")

                Dim FilePath As String = Server.MapPath(FolderPath + FileName)

                FileUploadStaffData.SaveAs(FilePath)

                Import_To_Grid(FilePath, Extension, rbHDR.SelectedItem.Text)

                ButtonAddStaff.Visible = True

                ListBoxStatus.Items.Add(FilePath + " Success!")

            Catch ex As Exception
                ListBoxStatus.Items.Add(ex.Message)
            End Try

        End If

    End Sub

    Private Sub Import_To_Grid(ByVal FilePath As String, ByVal Extension As String, ByVal isHDR As String)

        Dim conStr As String = ""

        Select Case Extension
            Case ".xls"
                'Excel 97-03
                conStr = ConfigurationManager.ConnectionStrings("Excel03ConString").ConnectionString()
                Exit Select
            Case ".xlsx"
                'Excel 07
                conStr = ConfigurationManager.ConnectionStrings("Excel07ConString").ConnectionString()
                Exit Select
        End Select

        conStr = String.Format(conStr, FilePath, isHDR)

        Dim connExcel As New OleDbConnection(conStr)
        Dim cmdExcel As New OleDbCommand()
        Dim oda As New OleDbDataAdapter()
        Dim dt As New DataTable()

        cmdExcel.Connection = connExcel

        'Get the name of First Sheet

        connExcel.Open()

        Dim dtExcelSchema As DataTable

        dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing)

        Dim SheetName As String = dtExcelSchema.Rows(0)("TABLE_NAME").ToString()

        connExcel.Close()

        'Read Data from First Sheet

        connExcel.Open()
        cmdExcel.CommandText = "SELECT * From [" & SheetName & "]"
        oda.SelectCommand = cmdExcel
        oda.Fill(dt)

        connExcel.Close()

        'Bind Data to GridView

        GridViewStaff.Caption = Path.GetFileName(FilePath)
        GridViewStaff.DataSource = dt
        GridViewStaff.DataBind()

    End Sub

    Protected Sub GridViewStaff_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridViewStaff.PageIndexChanging

        Dim FolderPath As String = ConfigurationManager.AppSettings("FolderPath")

        Dim FileName As String = GridViewStaff.Caption

        Dim Extension As String = Path.GetExtension(FileName)

        Dim FilePath As String = Server.MapPath(FolderPath + FileName)

        Import_To_Grid(FilePath, Extension, rbHDR.SelectedItem.Text)

        GridViewStaff.PageIndex = e.NewPageIndex

        GridViewStaff.DataBind()

    End Sub

    Protected Sub ButtonAddStaff_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddStaff.Click

        Try

            For Each GridViewRow As GridViewRow In GridViewStaff.Rows

                Dim CheckBox As CheckBox = GridViewRow.Cells(0).FindControl("CheckBoxCheck")
                Dim SchoolCode As Integer = GridViewRow.Cells(1).Text
                Dim CurrentSectionID As Integer = GridViewRow.Cells(2).Text
                Dim StartingSectionID As Integer = 0
                Dim NISN As String = GridViewRow.Cells(4).Text
                Dim UserPass As String = GridViewRow.Cells(5).Text
                Dim NIS As String = GridViewRow.Cells(6).Text
                Dim StudentName As String = GridViewRow.Cells(7).Text
                Dim Gender As String = GridViewRow.Cells(8).Text
                Dim BirthPlace As String = GridViewRow.Cells(9).Text
                Dim DateofBirth As Date = GridViewRow.Cells(10).Text
                Dim Religion As String = GridViewRow.Cells(11).Text
                Dim PNISN As String = "P" & GridViewRow.Cells(4).Text
                Dim PUserPass As String = "P" & GridViewRow.Cells(5).Text
                Dim ContactPhone As String = GridViewRow.Cells(12).Text
                Dim ContactAddress As String = GridViewRow.Cells(13).Text
                Dim FatherName As String = GridViewRow.Cells(14).Text
                Dim MotherName As String = GridViewRow.Cells(15).Text
                Dim FatherOccupation As String = GridViewRow.Cells(16).Text
                Dim MotherOccupation As String = GridViewRow.Cells(17).Text
                Dim FatherHP As String = GridViewRow.Cells(18).Text
                Dim MotherHP As String = GridViewRow.Cells(19).Text
                Dim BloodType As String = "-"
                Dim PUserID As Guid

                If CheckBox.Checked = True Then

                    'ADD PARENT

                    If Membership.GetUser(PNISN) Is Nothing Then

                        Dim PStatus As System.Web.Security.MembershipCreateStatus

                        Membership.CreateUser(PNISN, PUserPass, PNISN & "@mitrapasiad.com", "SecretQuestion", "SecretAnswer", True, PStatus)

                        If PStatus = System.Web.Security.MembershipCreateStatus.Success Then

                            ListBoxStatus.Items.Add(PNISN + " Created Successfully!")

                            Roles.AddUserToRole(PNISN, "Parent")

                            ListBoxStatus.Items.Add(PNISN + " Added to Roles!")

                            PUserID = DirectCast(Membership.GetUser(PNISN).ProviderUserKey, Guid)

                            Dim PUserProfile As ProfileCommon = Profile.GetProfile(Membership.GetUser(PNISN).ToString)

                            'Set the values to be stored, note the use of find control
                            PUserProfile.SchoolCode = SchoolCode

                            'Save the profile
                            PUserProfile.Save()

                            ListBoxStatus.Items.Add(PNISN + " New Profile Saved!")

                            ' Get your Connection String from the web.config. MembershipConnectionString is the name I have in my web.config
                            Dim SMSOnlineConnectionString As String = ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString

                            Dim insertSql As String = " INSERT INTO tbl_Parents(ResponsibleParentID, SchoolCode, [Continue], ResponsibleParent, FatherName, FatherHandPhone, FatherOccupation, MotherName, MotherHandPhone, MotherOccupation, ContactAddress, ContactPhone) VALUES (@ResponsibleParentID, @SchoolCode, @Continue , @ResponsibleParent, @FatherName, @FatherHandPhone, @FatherOccupation, @MotherName, @MotherHandPhone, @MotherOccupation, @ContactAddress, @ContactPhone)"


                            Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                                myConnection.Open()
                                Dim myCommand As New SqlCommand(insertSql, myConnection)

                                myCommand.Parameters.AddWithValue("@ResponsibleParentID", PUserID)
                                myCommand.Parameters.AddWithValue("@ResponsibleParent", FatherName)
                                myCommand.Parameters.AddWithValue("@FatherName", FatherName)
                                myCommand.Parameters.AddWithValue("@SchoolCode", SchoolCode)
                                myCommand.Parameters.AddWithValue("@FatherHandPhone", FatherHP)
                                myCommand.Parameters.AddWithValue("@FatherOccupation", FatherOccupation)
                                myCommand.Parameters.AddWithValue("@Continue", 1)
                                myCommand.Parameters.AddWithValue("@MotherName", MotherName)
                                myCommand.Parameters.AddWithValue("@MotherHandPhone", MotherHP)
                                myCommand.Parameters.AddWithValue("@MotherOccupation", MotherOccupation)
                                myCommand.Parameters.AddWithValue("@ContactAddress", ContactAddress)
                                myCommand.Parameters.AddWithValue("@ContactPhone", ContactPhone)
                                myCommand.ExecuteNonQuery()
                                myConnection.Close()

                            End Using

                            ListBoxStatus.Items.Add(PNISN + " Added to Parents Table!")

                            Dim UpdateCodeSql As String = "UPDATE aspnet_Users SET SchoolCode = @SchoolCode  WHERE (UserID = @UserID)"
                            Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                                myConnection.Open()
                                Dim myCommand As New SqlCommand(UpdateCodeSql, myConnection)
                                myCommand.Parameters.AddWithValue("@UserID", PUserID)
                                myCommand.Parameters.AddWithValue("@SchoolCode", SchoolCode)

                                myCommand.ExecuteNonQuery()
                                myConnection.Close()

                            End Using
                            ListBoxStatus.Items.Add(NISN + " Added to Asp.Net Users!")
                            ListBoxStatus.Items.Add(NISN + " DONE!")
                        Else
                            ListBoxStatus.Items.Add("Parent: " & GetErrorMessage(PStatus))
                        End If

                    End If

           

                'ADD STUDENT

                If Membership.GetUser(NISN) Is Nothing Then

                    Dim Status As System.Web.Security.MembershipCreateStatus

                    Membership.CreateUser(NISN, UserPass, NISN & "@mitrapasiad.com", "SecretQuestion", "SecretAnswer", True, Status)

                    ListBoxStatus.Items.Add(NISN + " Created Successfully!")

                    If Status = System.Web.Security.MembershipCreateStatus.Success Then

                        Roles.AddUserToRole(NISN, "Student")

                        ListBoxStatus.Items.Add(NISN + " Added to Roles!")

                        Dim UserID As Guid = DirectCast(Membership.GetUser(NISN).ProviderUserKey, Guid)

                        Dim UserProfile As ProfileCommon = Profile.GetProfile(Membership.GetUser(NISN).ToString)

                        'Set the values to be stored, note the use of find control
                        UserProfile.SchoolCode = SchoolCode

                        'Save the profile
                        UserProfile.Save()

                        ListBoxStatus.Items.Add(NISN + " New Profile Saved!")

                        ' Get your Connection String from the web.config. MembershipConnectionString is the name I have in my web.config
                        Dim SMSOnlineConnectionString As String = ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString

                            Dim insertSql As String = "INSERT INTO tbl_Students (StudentID, ParentID, StudentName, SchoolCode, CurrentSectionID, SchoolNo, [Continue], DateofBirth, BirthPlace, Gender, IsOlympiad, IsScholarship, Religion, BloodType, StartingSectionID) VALUES (@StudentID, @ParentID, @StudentName,@SchoolCode,@CurrentSectionID,@SchoolNo,@Continue,@DateofBirth,@BirthPlace,@Gender,@IsOlympiad,@IsScholarship,@Religion, @BloodType, @StartingSectionID)"

                            Using myConnection As New SqlConnection(SMSOnlineConnectionString)

                                myConnection.Open()

                                Dim myCommand As New SqlCommand(insertSql, myConnection)

                                myCommand.Parameters.AddWithValue("@StudentID", UserID)
                                myCommand.Parameters.AddWithValue("@ParentID", PUserID)
                                myCommand.Parameters.AddWithValue("@StudentName", StudentName)
                                myCommand.Parameters.AddWithValue("@SchoolCode", SchoolCode)
                                myCommand.Parameters.AddWithValue("@CurrentSectionID", CurrentSectionID)
                                myCommand.Parameters.AddWithValue("@StartingSectionID", StartingSectionID)
                                myCommand.Parameters.AddWithValue("@SchoolNo", NIS)
                                myCommand.Parameters.AddWithValue("@Continue", 1)
                                myCommand.Parameters.AddWithValue("@DateofBirth", DateofBirth)
                                myCommand.Parameters.AddWithValue("@BirthPlace", BirthPlace)
                                myCommand.Parameters.AddWithValue("@Gender", Gender)
                                myCommand.Parameters.AddWithValue("@IsOlympiad", 0)
                                myCommand.Parameters.AddWithValue("@IsScholarship", 0)
                                myCommand.Parameters.AddWithValue("@Religion", Religion)
                                myCommand.Parameters.AddWithValue("@BloodType", BloodType)
                                myCommand.ExecuteNonQuery()
                                myConnection.Close()

                            End Using

                            ListBoxStatus.Items.Add(NISN + " Added to Students Table!")

                        Dim UpdateCodeSql As String = "UPDATE aspnet_Users SET SchoolCode = @SchoolCode  WHERE (UserID = @UserID)"
                        Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                            myConnection.Open()
                            Dim myCommand As New SqlCommand(UpdateCodeSql, myConnection)
                            myCommand.Parameters.AddWithValue("@UserID", UserID)
                            myCommand.Parameters.AddWithValue("@SchoolCode", SchoolCode)

                            myCommand.ExecuteNonQuery()
                            myConnection.Close()

                        End Using
                        ListBoxStatus.Items.Add(NISN + " Added to Asp.Net Users!")

                            Dim DropDownListAcademicTermsMaster As DropDownList = Master.Master.FindControl("DropDownListAcademicTermsMaster")

                            Dim UpdateCodeAcademicSql As String = "IF NOT EXISTS (SELECT * FROM tbl_AcademicTermsStudents WHERE AcademicTermID = @AcademicTermID AND StudentID= @StudentID AND SectionCatalogID = @SectionCatalogID) INSERT INTO tbl_AcademicTermsStudents(AcademicTermID, SchoolCode, StudentID, SectionCatalogID) VALUES (@AcademicTermID, @SchoolCode, @StudentID, @SectionCatalogID)"
                            Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                                myConnection.Open()
                                Dim myCommand As New SqlCommand(UpdateCodeAcademicSql, myConnection)

                                myCommand.Parameters.AddWithValue("@AcademicTermID", DropDownListAcademicTermsMaster.SelectedValue)
                                myCommand.Parameters.AddWithValue("@StudentID", UserID)
                                myCommand.Parameters.AddWithValue("@SectionCatalogID", CurrentSectionID)
                                myCommand.Parameters.AddWithValue("@SchoolCode", SchoolCode)

                                myCommand.ExecuteNonQuery()
                                myConnection.Close()

                            End Using
                            ListBoxStatus.Items.Add(NISN + " Added to AcademicTerm Students!")
                            ListBoxStatus.Items.Add(NISN + " DONE!")

                    Else
                        ListBoxStatus.Items.Add("Student: " & GetErrorMessage(Status))
                    End If
                Else
                        ListBoxStatus.Items.Add(NISN + " User Already Exist!")
                End If

                    Else
                    ListBoxStatus.Items.Add(NISN + " User Cancelled!")
                End If

            Next

        Catch ex As MembershipCreateUserException
            ListBoxStatus.Items.Add(GetErrorMessage(ex.StatusCode))
        Catch ex As HttpException
            ListBoxStatus.Items.Add(ex.Message)
        End Try
    End Sub

    Public Function GetErrorMessage(ByVal status As MembershipCreateStatus) As String

        Select Case status
            Case MembershipCreateStatus.DuplicateUserName
                Return "Username already exists. Please enter a different user name."

            Case MembershipCreateStatus.DuplicateEmail
                Return "A username for that e-mail address already exists. Please enter a different e-mail address."

            Case MembershipCreateStatus.InvalidPassword
                Return "The password provided is invalid. Please enter a valid password value."

            Case MembershipCreateStatus.InvalidEmail
                Return "The e-mail address provided is invalid. Please check the value and try again."

            Case MembershipCreateStatus.InvalidAnswer
                Return "The password retrieval answer provided is invalid. Please check the value and try again."

            Case MembershipCreateStatus.InvalidQuestion
                Return "The password retrieval question provided is invalid. Please check the value and try again."

            Case MembershipCreateStatus.InvalidUserName
                Return "The user name provided is invalid. Please check the value and try again."

            Case MembershipCreateStatus.ProviderError
                Return "The authentication provider Returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator."

            Case MembershipCreateStatus.UserRejected
                Return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator."

            Case Else
                Return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator."
        End Select

    End Function

End Class
