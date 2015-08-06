Imports System.Data.SqlClient
Imports System.IO
Imports System.Data.OleDb
Imports System.Data

Partial Class General_Test_Scores
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Coordinator") Then
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

                LabelMPExamName.Text = "You are about to Upload " & DropDownListMPExams.SelectedItem.ToString & " Results."

                PanelStep1.Visible = False
                PanelStep2.Visible = True

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

        LabelCounter.Text = "Your Data Contains " & GridViewStudentAnswers.Rows.Count.ToString & " Students. The more student it contains, the longer time it takes."

        ListBoxStatus.Items.Add(" Results data added to Grid. Please check your content before submit!")

    End Sub

    Protected Sub ButtonSendResults_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSendResults.Click

        Try
            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            ButtonSendResults.Enabled = False

            For Each GridViewRow As GridViewRow In GridViewStudentAnswers.Rows

                Dim CheckBox As CheckBox = GridViewRow.Cells(0).FindControl("CheckBoxCheck")

                If CheckBox.Checked = True Then

                    Dim GeneralTestID As Integer = DropDownListMPExams.SelectedValue
                    Dim NISN As String = Trim(GridViewRow.Cells(1).Text)

                    Dim Username As MembershipUser = Membership.GetUser(NISN)

                    If Username Is Nothing Then

                        ListBoxStatus.Items.Add("User [" & NISN & " ] not found.")
                        ListBoxNotFound.Items.Add("[" & NISN & " ] not found.")
                    Else

                        ' Do whatever u want with the unique identifier.
                        Dim StudentID As Guid = DirectCast(Username.ProviderUserKey, Guid)

                        If CheckBox.Checked = True Then

                            For QuestionNo As Integer = 1 To GridViewRow.Cells.Count - 2

                                Dim StudentAnswer As String = Trim(GridViewRow.Cells(1 + QuestionNo).Text)

                                'If StudentAnswer = "&nbsp;" Then

                                If Not (StudentAnswer = "A" Or StudentAnswer = "a" Or StudentAnswer = "B" Or StudentAnswer = "b" Or StudentAnswer = "C" Or StudentAnswer = "c" Or StudentAnswer = "D" Or StudentAnswer = "d" Or StudentAnswer = "E" Or StudentAnswer = "e") Then
                                    StudentAnswer = "-"
                                End If

                                ' Get your Connection String from the web.config. MembershipConnectionString is the name I have in my web.config
                                Dim SMSOnlineConnectionString As String = ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
                                Dim insertSql As String = "UPDATE tbl_GeneralTestsStudentsAnswersTemp SET StudentAnswer = @StudentAnswer, AddedDate = @AddedDate WHERE (GeneralTestID = @GeneralTestID) AND (StudentID = @StudentID) AND (GeneralTestQuestionNo = @GeneralTestQuestionNo) IF @@ROWCOUNT = 0 INSERT INTO tbl_GeneralTestsStudentsAnswersTemp (GeneralTestID, GeneralTestQuestionNo, SchoolCode, StudentID, StudentAnswer, StaffID, Confirmed, AddedDate) VALUES (@GeneralTestID,@GeneralTestQuestionNo,@SchoolCode,@StudentID,@StudentAnswer,@StaffID,@Confirmed,@AddedDate)"

                                Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                                    myConnection.Open()
                                    Dim myCommand As New SqlCommand(insertSql, myConnection)
                                    myCommand.Parameters.AddWithValue("@GeneralTestID", GeneralTestID)
                                    myCommand.Parameters.AddWithValue("@GeneralTestQuestionNo", QuestionNo)
                                    myCommand.Parameters.AddWithValue("@SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
                                    myCommand.Parameters.AddWithValue("@StudentID", StudentID)
                                    myCommand.Parameters.AddWithValue("@StudentAnswer", StudentAnswer)
                                    myCommand.Parameters.AddWithValue("@StaffID", Session("UserID").ToString)
                                    myCommand.Parameters.AddWithValue("@Confirmed", 0)
                                    myCommand.Parameters.AddWithValue("@AddedDate", DateTime.UtcNow)
                                    myCommand.ExecuteNonQuery()
                                    myConnection.Close()

                                End Using

                                ListBoxStatus.Items.Add(" Student: " & NISN & " Question: " & QuestionNo & " Added to Table!")

                            Next

                        End If

                    End If

                Else
                    ListBoxStatus.Items.Add(GridViewRow.Cells(1).Text & " Cancelled by Administrator!")
                End If
            Next

            LabelStatus.Text = "Uploading Done! Check Status Table above."

            ButtonSendResults.Visible = False

            ButtonSendResults.Enabled = True

            ButtonDone.Visible = True

        Catch ex As Exception
            ListBoxStatus.Items.Add(ex.Message)
        End Try
    End Sub

    Protected Sub ButtonStep2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonStep2.Click
        PanelStep2.Visible = False
        PanelStep3.Visible = True
    End Sub

    Protected Sub ButtonDone_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonDone.Click
        Response.Redirect("http://www.mitrapasiad.com/Coordinators/MPEResultsUpload.aspx")
    End Sub
End Class
