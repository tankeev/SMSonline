Imports System.Data.SqlClient
Imports System.IO
Imports System.Data.OleDb
Imports System.Data

Partial Class General_Test_Scores
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonAddAssessment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddAssessment.Click

        If FileUploadMPEResults.HasFile Then

            Try

                Dim FileName As String = Path.GetFileName(FileUploadMPEResults.PostedFile.FileName)
                Dim Extension As String = Path.GetExtension(FileUploadMPEResults.PostedFile.FileName)
                Dim FolderPath As String = ConfigurationManager.AppSettings("FolderPath")

                Dim FilePath As String = Server.MapPath(FolderPath + FileName)

                FileUploadMPEResults.SaveAs(FilePath)

                ListBoxStatus.Items.Add(FilePath + "  File Uploaded Successfully!")

                Import_To_Grid(FilePath, Extension, "Yes")

                PanelWarning.Visible = False
                PanelResults.Visible = True

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

        GridViewStudentAnswers.Caption = Path.GetFileName(FilePath)
        GridViewStudentAnswers.DataSource = dt
        GridViewStudentAnswers.DataBind()

        LabelCounter.Text = "Your Data Contains " & GridViewStudentAnswers.Rows.Count.ToString & " Students. The more students it contains, the longer time it takes."

        ListBoxStatus.Items.Add(" Results data added to Grid. Please check your content before submit!")

    End Sub

    Protected Sub ButtonSendResults_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSendResults.Click
        Try
            For Each GridViewRow As GridViewRow In GridViewStudentAnswers.Rows

                Dim CheckBox As CheckBox = GridViewRow.Cells(0).FindControl("CheckBoxCheck")

                If CheckBox.Checked = True Then

                    Dim GeneralTestID As Integer = GridViewRow.Cells(1).Text
                    Dim NISN As String = GridViewRow.Cells(2).Text

                    Dim Username As MembershipUser = Membership.GetUser(NISN)

                    If Username Is Nothing Then

                        ListBoxStatus.Items.Add("User [" & GridViewRow.Cells(2).Text & " ] not found.")

                    Else

                        ' Do whatever u want with the unique identifier.
                        Dim StudentID As Guid = DirectCast(Username.ProviderUserKey, Guid)

                        If CheckBox.Checked = True Then

                            For QuestionNo As Integer = 1 To GridViewRow.Cells.Count - 3

                                Dim StudentAnswer As String = GridViewRow.Cells(2 + QuestionNo).Text

                                If StudentAnswer = "&nbsp;" Then
                                    StudentAnswer = ""
                                End If

                                ' Get your Connection String from the web.config. MembershipConnectionString is the name I have in my web.config
                                Dim SMSOnlineConnectionString As String = ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString

                                Dim insertSql As String = "IF EXISTS (SELECT GeneralTestsStudentsAnswerID FROM  tbl_GeneralTestsStudentsAnswersTemp WHERE (GeneralTestID = @GeneralTestID) AND (StudentID = @StudentID) AND (GeneralTestQuestionNo=@GeneralTestQuestionNo)) UPDATE tbl_GeneralTestsStudentsAnswersTemp SET StudentAnswer = @StudentAnswer WHERE (GeneralTestID = @GeneralTestID) AND (StudentID = @StudentID) AND (GeneralTestQuestionNo = @GeneralTestQuestionNo) else INSERT INTO tbl_GeneralTestsStudentsAnswersTemp (GeneralTestID, GeneralTestQuestionNo, StudentID, StudentAnswer, StaffID) VALUES (@GeneralTestID, @GeneralTestQuestionNo, @StudentID, @StudentAnswer, @StaffID)"
                                Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                                    myConnection.Open()
                                    Dim myCommand As New SqlCommand(insertSql, myConnection)
                                    myCommand.Parameters.AddWithValue("@GeneralTestID", Trim(DropDownListMPExams.SelectedValue))
                                    myCommand.Parameters.AddWithValue("@GeneralTestQuestionNo", Trim(QuestionNo))
                                    myCommand.Parameters.AddWithValue("@StudentID", StudentID)
                                    myCommand.Parameters.AddWithValue("@StudentAnswer", Trim(StudentAnswer))
                                    myCommand.Parameters.AddWithValue("@StaffID", Session("UserID").ToString)
                                    myCommand.ExecuteNonQuery()
                                    myConnection.Close()

                                End Using

                                ListBoxStatus.Items.Add(" Student: " & NISN & " Question: " & QuestionNo & " Added to Table!")

                            Next

                        End If

                    End If

                Else
                    ListBoxStatus.Items.Add(GridViewRow.Cells(2).Text & " Cancelled by Administrator!")
                End If
            Next

            LabelStatus.Text = "Uploading Done! Check Status Table above. Thank you."

        Catch ex As Exception
            ListBoxStatus.Items.Add(ex.Message)
        End Try
    End Sub

End Class
