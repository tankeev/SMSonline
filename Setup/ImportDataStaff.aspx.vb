Imports System.Data.OleDb
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Partial Class ImportData
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
                Dim UserName As String = GridViewRow.Cells(2).Text
                Dim UserPass As String = GridViewRow.Cells(3).Text
                Dim FullName As String = GridViewRow.Cells(4).Text
                Dim Gender As String = GridViewRow.Cells(5).Text
                Dim MaritalStatus As String = GridViewRow.Cells(6).Text
                Dim Religion As String = GridViewRow.Cells(7).Text
                Dim DateofBirth As String = GridViewRow.Cells(8).Text
                Dim PlaceofBirth As String = GridViewRow.Cells(9).Text
                Dim Position As String = GridViewRow.Cells(10).Text
                Dim University As String = GridViewRow.Cells(11).Text
                Dim Department As String = GridViewRow.Cells(12).Text
                Dim ContactPhone As String = GridViewRow.Cells(13).Text
                Dim ContactAddress As String = GridViewRow.Cells(14).Text
                Dim BloodType As String = "-"
                Dim PhotoURL As String = "NoPhoto.jpg"

                If CheckBox.Checked = True Then

                    If Membership.GetUser(UserName) Is Nothing Then

                        Dim Status As System.Web.Security.MembershipCreateStatus

                        Membership.CreateUser(UserName, UserPass, UserName & "@mitrapasiad.com", "SecretQuestion", "SecretAnswer", True, Status)

                        ListBoxStatus.Items.Add(UserName + " Created Successfully!")

                        If Status = System.Web.Security.MembershipCreateStatus.Success Then

                            Roles.AddUserToRole(UserName, "Staff")

                            ListBoxStatus.Items.Add(UserName + " Added to Roles!")


                            Dim UserID As Guid = DirectCast(Membership.GetUser(UserName).ProviderUserKey, Guid)

                            Dim UserProfile As ProfileCommon = Profile.GetProfile(Membership.GetUser(UserName).ToString)

                            'Set the values to be stored, note the use of find control
                            UserProfile.SchoolCode = SchoolCode

                            'Save the profile
                            UserProfile.Save()

                            ListBoxStatus.Items.Add(UserName + " New Profile Saved!")

                            ' Get your Connection String from the web.config. MembershipConnectionString is the name I have in my web.config
                            Dim SMSOnlineConnectionString As String = ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString

                            Dim insertSql As String = "INSERT INTO tbl_Staff(StaffID, StaffName, SchoolCode, DateofBirth, PlaceofBirth, Gender, MaritalStatus, Religion, ContactPhone1, ContactAddress, University, Department, BloodType) VALUES (@StaffID, @StaffName, @SchoolCode, @DateofBirth, @PlaceofBirth, @Gender, @MaritalStatus, @Religion, @ContactPhone1, @ContactAddress, @University, @Department, @BloodType)"
                            Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                                myConnection.Open()
                                Dim myCommand As New SqlCommand(insertSql, myConnection)
                                myCommand.Parameters.AddWithValue("@StaffId", UserID)
                                myCommand.Parameters.AddWithValue("@StaffName", FullName)
                                myCommand.Parameters.AddWithValue("@SchoolCode", SchoolCode)
                                myCommand.Parameters.AddWithValue("@DateofBirth", DateofBirth)
                                myCommand.Parameters.AddWithValue("@PlaceofBirth", PlaceofBirth)
                                myCommand.Parameters.AddWithValue("@Gender", Gender)
                                myCommand.Parameters.AddWithValue("@MaritalStatus", MaritalStatus)
                                myCommand.Parameters.AddWithValue("@Religion", Religion)
                                myCommand.Parameters.AddWithValue("@Position", Position)
                                myCommand.Parameters.AddWithValue("@University", University)
                                myCommand.Parameters.AddWithValue("@Department", Department)
                                myCommand.Parameters.AddWithValue("@ContactPhone1", ContactPhone)
                                myCommand.Parameters.AddWithValue("@ContactAddress", ContactAddress)
                                myCommand.Parameters.AddWithValue("@BloodType", BloodType)
                                myCommand.ExecuteNonQuery()
                                myConnection.Close()

                            End Using

                            ListBoxStatus.Items.Add(UserName + " Added to Staff Table!")

                            Dim UpdateCodeSql As String = "UPDATE aspnet_Users SET SchoolCode = @SchoolCode, PhotoUrl=@PhotoUrl  WHERE (UserId = @UserId)"
                            Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                                myConnection.Open()
                                Dim myCommand As New SqlCommand(UpdateCodeSql, myConnection)
                                myCommand.Parameters.AddWithValue("@UserID", UserID)
                                myCommand.Parameters.AddWithValue("@SchoolCode", SchoolCode)
                                myCommand.Parameters.AddWithValue("@PhotoUrl", PhotoUrl)

                                myCommand.ExecuteNonQuery()
                                myConnection.Close()

                            End Using
                            ListBoxStatus.Items.Add(UserName + " Added to Asp.Net Users!")
                            ListBoxStatus.Items.Add(UserName + " DONE!")

                        Else
                            ListBoxStatus.Items.Add("Staff: " & GetErrorMessage(Status))

                        End If
                    Else
                        ListBoxStatus.Items.Add(UserName + " User Already Exists!")
                    End If

                Else
                    ListBoxStatus.Items.Add(UserName + " User Cancelled!")
                End If
            Next
        Catch ex As Exception
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
