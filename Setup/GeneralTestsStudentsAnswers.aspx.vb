Imports System.IO
Imports System.Data.OleDb
Imports System.Data
Imports System.Data.SqlClient

Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub FormViewGeneralTestsQuestions_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewGeneralTestsQuestions.ItemInserted
        If e.Exception Is Nothing Then
            If e.AffectedRows > 0 Then
                'Record Inserted Successfully.
                LabelStatus.Text = "Added Successfully!"
            Else

                LabelStatus.Text = "An error occurred during the insert operation."
                e.KeepInInsertMode = True
            End If
        Else

            LabelStatus.Text = e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInInsertMode = True
        End If
    End Sub

    Protected Sub ButtonUpdateAnswers_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAnswers.Click
        For Each GridViewRow As GridViewRow In GridViewGeneralTestQuestions.Rows

            Dim GeneralTestsStudentsAnswerID As Integer = Convert.ToInt32(GridViewGeneralTestQuestions.DataKeys(GridViewRow.RowIndex).Value)
            Dim TextBoxAnswer As TextBox = GridViewRow.FindControl("TextBoxAnswer")

            SqlDataSourceGeneralTestsQuestions.UpdateParameters.Clear()

            SqlDataSourceGeneralTestsQuestions.UpdateParameters.Add("GeneralTestsStudentsAnswerID", GeneralTestsStudentsAnswerID)
            SqlDataSourceGeneralTestsQuestions.UpdateParameters.Add("StudentAnswer", TextBoxAnswer.Text)

            SqlDataSourceGeneralTestsQuestions.Update()

        Next

        LabelStatus.Text = "Done!"

        GridViewGeneralTestQuestions.DataBind()

    End Sub

    Protected Sub ButtonChange_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonChange.Click
        Try

            For Each GridViewRow As GridViewRow In GridViewGeneralTestQuestions.Rows

                If GridViewRow.RowType = DataControlRowType.DataRow Then

                    Dim GeneralTestsStudentsAnswerID As Integer = Convert.ToInt32(GridViewGeneralTestQuestions.DataKeys(GridViewRow.RowIndex).Value)
                    Dim TextBoxGeneralTestID As TextBox = GridViewRow.FindControl("TextBoxGeneralTestID")
                    Dim CheckBoxCheck As CheckBox = GridViewRow.FindControl("CheckBoxCheck")

                    If CheckBoxCheck.Checked Then

                        SqlDataSourceDropDownListGeneralTests.UpdateParameters.Clear()

                        SqlDataSourceDropDownListGeneralTests.UpdateParameters.Add("GeneralTestsStudentsAnswerID", GeneralTestsStudentsAnswerID)
                        SqlDataSourceDropDownListGeneralTests.UpdateParameters.Add("GeneralTestID", TextBoxGeneralTestID.Text)

                        SqlDataSourceDropDownListGeneralTests.Update()

                    End If

                End If

            Next
            GridViewGeneralTestQuestions.DataBind()
            CheckBoxCheckAll.Checked = False

            LabelStatus.Text = "Done!"

        Catch ex As Exception

            LabelStatus.Text = ex.Message

        End Try

    End Sub

    Protected Sub DropDownListMPExams_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListMPExams.DataBound
        GridViewGeneralTestQuestions.DataBind()
    End Sub


    Protected Sub ButtonOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonOK.Click
        For Each GridViewRow As GridViewRow In GridViewGeneralTestQuestions.Rows
            If GridViewRow.RowType = DataControlRowType.DataRow Then
                Dim TextBoxGeneralTestID As TextBox = GridViewRow.FindControl("TextBoxGeneralTestID")
                TextBoxGeneralTestID.Text = DropDownListMPExamsHeader.SelectedValue
            End If
        Next
    End Sub

    Protected Sub CheckBoxCheckAll_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxCheckAll.CheckedChanged
        For Each GridViewRow As GridViewRow In GridViewGeneralTestQuestions.Rows
            If GridViewRow.RowType = DataControlRowType.DataRow Then
                Dim CheckBoxCheck As CheckBox = GridViewRow.FindControl("CheckBoxCheck")

                If CheckBoxCheckAll.Checked = True Then
                    CheckBoxCheck.Checked = True
                Else
                    CheckBoxCheck.Checked = False
                End If

            End If
        Next
    End Sub

    Protected Sub btnUpload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpload.Click
        If FileUploadStaffData.HasFile Then

            Try

                Dim FileName As String = Path.GetFileName(FileUploadStaffData.PostedFile.FileName)
                Dim Extension As String = Path.GetExtension(FileUploadStaffData.PostedFile.FileName)
                Dim FolderPath As String = ConfigurationManager.AppSettings("FolderPath")

                Dim FilePath As String = Server.MapPath(FolderPath + FileName)

                FileUploadStaffData.SaveAs(FilePath)

                Import_To_Grid(FilePath, Extension, rbHDR.SelectedItem.Text)

            Catch ex As Exception
                LabelStatus.Text = ex.Message
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

    End Sub

    Protected Sub ButtonAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAdd.Click

        Try

            Dim DropDownListSchoolCodesMaster As DropDownList = Master.Master.FindControl("DropDownListSchoolCodesMaster")

            For Each GridViewRow As GridViewRow In GridViewStudentAnswers.Rows

                Dim CheckBox As CheckBox = GridViewRow.Cells(0).FindControl("CheckBoxCheck")


                If CheckBox.Checked = True Then

                    Dim GeneralTestID As Integer = DropDownListMPExams.SelectedValue
                    Dim NISN As String = Trim(GridViewRow.Cells(1).Text)

                    Dim Username As MembershipUser = Membership.GetUser(NISN)

                    If Username Is Nothing Then

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
                                Dim insertSqlTemp As String = "UPDATE tbl_GeneralTestsStudentsAnswersTemp SET StudentAnswer = @StudentAnswer, AddedDate = @AddedDate WHERE (GeneralTestID = @GeneralTestID) AND (StudentID = @StudentID) AND (GeneralTestQuestionNo = @GeneralTestQuestionNo) IF @@ROWCOUNT = 0 INSERT INTO tbl_GeneralTestsStudentsAnswersTemp (GeneralTestID, GeneralTestQuestionNo, SchoolCode, StudentID, StudentAnswer, StaffID, Confirmed, AddedDate) VALUES (@GeneralTestID,@GeneralTestQuestionNo,@SchoolCode,@StudentID,@StudentAnswer,@StaffID,@Confirmed,@AddedDate)"

                                Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                                    myConnection.Open()
                                    Dim myCommand As New SqlCommand(insertSqlTemp, myConnection)
                                    myCommand.Parameters.AddWithValue("@GeneralTestID", GeneralTestID)
                                    myCommand.Parameters.AddWithValue("@GeneralTestQuestionNo", QuestionNo)
                                    myCommand.Parameters.AddWithValue("@SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
                                    myCommand.Parameters.AddWithValue("@StudentID", StudentID)
                                    myCommand.Parameters.AddWithValue("@StudentAnswer", StudentAnswer)
                                    myCommand.Parameters.AddWithValue("@StaffID", Session("UserID").ToString)
                                    myCommand.Parameters.AddWithValue("@Confirmed", 1)
                                    myCommand.Parameters.AddWithValue("@AddedDate", DateTime.UtcNow)
                                    myCommand.ExecuteNonQuery()
                                    myConnection.Close()

                                End Using

                                Dim insertSql As String = "UPDATE tbl_GeneralTestsStudentsAnswers SET StudentAnswer = @StudentAnswer WHERE (GeneralTestID = @GeneralTestID) AND (StudentID = @StudentID) AND (GeneralTestQuestionNo = @GeneralTestQuestionNo) IF @@ROWCOUNT = 0 INSERT INTO tbl_GeneralTestsStudentsAnswers (GeneralTestID, GeneralTestQuestionNo, SchoolCode, StudentID, StudentAnswer) VALUES (@GeneralTestID,@GeneralTestQuestionNo,@SchoolCode,@StudentID,@StudentAnswer)"

                                Using myConnection As New SqlConnection(SMSOnlineConnectionString)
                                    myConnection.Open()
                                    Dim myCommand As New SqlCommand(insertSql, myConnection)
                                    myCommand.Parameters.AddWithValue("@GeneralTestID", GeneralTestID)
                                    myCommand.Parameters.AddWithValue("@GeneralTestQuestionNo", QuestionNo)
                                    myCommand.Parameters.AddWithValue("@SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
                                    myCommand.Parameters.AddWithValue("@StudentID", StudentID)
                                    myCommand.Parameters.AddWithValue("@StudentAnswer", StudentAnswer)
                                    myCommand.ExecuteNonQuery()
                                    myConnection.Close()

                                End Using

                            Next

                        End If

                    End If

                Else

                End If
            Next

            LabelStatus.Text = "Uploading Done! Check Status Table above."



        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub

    Protected Sub ButtonDataSync_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonDataSync.Click
        Try

            'Archive Data to other MS SQL Server
            'Select relevant records and put them into a Dataset

            Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)

            Dim commandGetRecords As New SqlCommand("SELECT GeneralTestCodeID, GeneralTestGroupID, GeneralTestID, StudentID, Correct, Wrong, NotAnswered, Score, SchoolCode, CurrentSectionID, CourseCatalogID FROM vw_GeneralTestsScores  WHERE (GeneralTestID = @GeneralTestID) AND (SchoolCode=@SchoolCode) AND (StudentID=@StudentID)", sqlconn)

            Dim GeneralTestID As New SqlParameter("GeneralTestID", System.Data.OleDb.OleDbType.Integer)
            Dim SchoolCode As New SqlParameter("SchoolCode", System.Data.OleDb.OleDbType.Integer)
            Dim StudentID As New SqlParameter("StudentID", System.Data.OleDb.OleDbType.Guid)

            Dim DropDownListSchoolCodesMaster As DropDownList = Master.Master.FindControl("DropDownListSchoolCodesMaster")

            GeneralTestID.Value = DropDownListMPExams.SelectedValue
            SchoolCode.Value = DropDownListSchoolCodesMaster.SelectedValue
            StudentID.Value = GridViewStudents.SelectedValue.ToString

            commandGetRecords.Parameters.Add(GeneralTestID)
            commandGetRecords.Parameters.Add(SchoolCode)
            commandGetRecords.Parameters.Add(StudentID)

            Dim ds As New DataSet
            Dim sqlAdapter As New SqlDataAdapter(commandGetRecords)

            sqlconn.Open()
            sqlAdapter.Fill(ds)

            sqlconn.Close()
            commandGetRecords.Parameters.Clear()

            'Write the dataset to the relevant table on the backup server

            Dim Arcsqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)

            Dim commandDelRecords As New SqlCommand("DELETE FROM tbl_GeneralTestsScores WHERE (GeneralTestID = @GeneralTestID) AND (SchoolCode = @SchoolCode) AND (StudentID=@StudentID)", Arcsqlconn)

            commandDelRecords.Parameters.Add(GeneralTestID)
            commandDelRecords.Parameters.Add(SchoolCode)
            commandDelRecords.Parameters.Add(StudentID)

            Arcsqlconn.Open()

            commandDelRecords.ExecuteNonQuery()

            Using bulkCopy As New SqlBulkCopy(Arcsqlconn)
                bulkCopy.ColumnMappings.Add("GeneralTestCodeID", "GeneralTestCodeID")
                bulkCopy.ColumnMappings.Add("GeneralTestGroupID", "GeneralTestGroupID")
                bulkCopy.ColumnMappings.Add("GeneralTestID", "GeneralTestID")
                bulkCopy.ColumnMappings.Add("StudentID", "StudentID")
                bulkCopy.ColumnMappings.Add("SchoolCode", "SchoolCode")
                bulkCopy.ColumnMappings.Add("CurrentSectionID", "CurrentSectionID")
                bulkCopy.ColumnMappings.Add("CourseCatalogID", "CourseCatalogID")
                bulkCopy.ColumnMappings.Add("Correct", "Correct")
                bulkCopy.ColumnMappings.Add("Wrong", "Wrong")
                bulkCopy.ColumnMappings.Add("NotAnswered", "NotAnswered")
                bulkCopy.ColumnMappings.Add("Score", "Score")

                bulkCopy.DestinationTableName = "tbl_GeneralTestsScores"
                bulkCopy.WriteToServer(ds.Tables(0).CreateDataReader)
            End Using

            Arcsqlconn.Close()

            LabelStatus.Text = "Data Sync Done"
         
        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub
End Class
