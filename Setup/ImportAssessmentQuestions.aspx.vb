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
                Dim AssessmentID As Integer = GridViewRow.Cells(1).Text
                Dim AssessmentQuestionNo As Integer = GridViewRow.Cells(2).Text
                Dim AssessmentQuestionAnswer As String = GridViewRow.Cells(3).Text

                If CheckBox.Checked = True Then

                    ' Get your Connection String from the web.config. MembershipConnectionString is the name I have in my web.config
                    Dim SMSOnlineConnectionString As String = ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString

                    Dim deleteSql As String = "DELETE FROM tbl_AssessmentsQuestions WHERE (AssessmentID = @AssessmentID) and (AssessmentQuestionNo=@AssessmentQuestionNo)"

                    Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                        myConnection.Open()
                        Dim myCommand As New SqlCommand(deleteSql, myConnection)
                        myCommand.Parameters.AddWithValue("@AssessmentID", Trim(AssessmentID))
                        myCommand.Parameters.AddWithValue("@AssessmentQuestionNo", AssessmentQuestionNo)

                        myCommand.ExecuteNonQuery()
                        myConnection.Close()

                    End Using

                    Dim insertSql As String = "INSERT INTO tbl_AssessmentsQuestions(AssessmentID, AssessmentQuestionNo, AssessmentQuestionAnswer,  Publish) VALUES(@AssessmentID, @AssessmentQuestionNo, @AssessmentQuestionAnswer, @Publish)"
                    Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                        myConnection.Open()
                        Dim myCommand As New SqlCommand(insertSql, myConnection)
                        myCommand.Parameters.AddWithValue("@AssessmentID", AssessmentID)
                        myCommand.Parameters.AddWithValue("@AssessmentQuestionNo", AssessmentQuestionNo)
                        myCommand.Parameters.AddWithValue("@AssessmentQuestionAnswer", Trim(AssessmentQuestionAnswer))
                        myCommand.Parameters.AddWithValue("@Publish", 1)

                        myCommand.ExecuteNonQuery()
                        myConnection.Close()

                    End Using

                    ListBoxStatus.Items.Add(AssessmentQuestionNo & " Added to Table!")

                End If
            Next
        Catch ex As Exception
            ListBoxStatus.Items.Add(ex.Message)
        End Try
    End Sub

End Class
