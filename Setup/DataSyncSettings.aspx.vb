Imports System.Data.SqlClient
Imports System.Data

Partial Class ManageUsers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub


    Protected Sub ButtonSync_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSyncGroups.Click

        Try

            For Each CBLItem As ListItem In CheckBoxListGeneralTestsGroupsRanking.Items

                If CBLItem.Selected Then

                    'Archive Data to other MS SQL Server

                    'Select relevant records and put them into a Dataset

                    Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)

                    Dim commandGetRecords As New SqlCommand("SELECT GeneralTestGroupID, SchoolCode, CurrentSectionID, StudentID, GeneralScore  FROM vw_GeneralTestsGeneralScores WHERE (GeneralTestGroupID = @GeneralTestGroupID)", sqlconn)

                    Dim GeneralTestGroupID As New SqlParameter("GeneralTestGroupID", System.Data.OleDb.OleDbType.Integer)

                    GeneralTestGroupID.Value = CBLItem.Value

                    commandGetRecords.Parameters.Add(GeneralTestGroupID)

                    Dim ds As New DataSet
                    Dim sqlAdapter As New SqlDataAdapter(commandGetRecords)

                    sqlconn.Open()
                    sqlAdapter.Fill(ds)

                    sqlconn.Close()
                    commandGetRecords.Parameters.Clear()

                    'Write the dataset to the relevant table on the backup server

                    Dim Arcsqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)

                    Dim commandDelRecords As New SqlCommand("DELETE FROM tbl_GeneralTestsRanking WHERE (GeneralTestGroupID = @GeneralTestGroupID)", Arcsqlconn)

                    commandDelRecords.Parameters.Add(GeneralTestGroupID)

                    Arcsqlconn.Open()

                    commandDelRecords.ExecuteNonQuery()

                    Using bulkCopy As New SqlBulkCopy(Arcsqlconn)
                        bulkCopy.ColumnMappings.Add("GeneralTestGroupID", "GeneralTestGroupID")
                        bulkCopy.ColumnMappings.Add("SchoolCode", "SchoolCode")
                        bulkCopy.ColumnMappings.Add("CurrentSectionID", "CurrentSectionID")
                        bulkCopy.ColumnMappings.Add("StudentID", "StudentID")
                        bulkCopy.ColumnMappings.Add("GeneralScore", "GeneralScore")

                        bulkCopy.DestinationTableName = "tbl_GeneralTestsRanking"
                        bulkCopy.WriteToServer(ds.Tables(0).CreateDataReader)
                    End Using

                    Arcsqlconn.Close()

                    LabelStatusGroup.Text = "Done"
                End If
            Next
        Catch ex As Exception
            LabelStatusGroup.Text = ex.Message
        End Try
    End Sub

    Protected Sub ButtonSyncCodes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSyncCodes.Click
        Try

            For Each CBLItem As ListItem In CheckBoxListGeneralTestsCodes.Items

                If CBLItem.Selected Then

                    'Archive Data to other MS SQL Server

                    'Select relevant records and put them into a Dataset

                    Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)

                    Dim commandGetRecords As New SqlCommand("SELECT GeneralTestCodeID, SchoolCode, CourseCatalogID, CurrentSectionID, Score  FROM vw_GeneralTestsScores WHERE (GeneralTestCodeID = @GeneralTestCodeID)", sqlconn)

                    Dim GeneralTestCodeID As New SqlParameter("GeneralTestCodeID", System.Data.OleDb.OleDbType.Integer)

                    GeneralTestCodeID.Value = CBLItem.Value

                    commandGetRecords.Parameters.Add(GeneralTestCodeID)

                    Dim ds As New DataSet
                    Dim sqlAdapter As New SqlDataAdapter(commandGetRecords)

                    sqlconn.Open()
                    sqlAdapter.Fill(ds)

                    sqlconn.Close()
                    commandGetRecords.Parameters.Clear()

                    'Write the dataset to the relevant table on the backup server

                    Dim Arcsqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)

                    Dim commandDelRecords As New SqlCommand("DELETE FROM tbl_GeneralTestsCourses WHERE (GeneralTestCodeID = @GeneralTestCodeID)", Arcsqlconn)

                    commandDelRecords.Parameters.Add(GeneralTestCodeID)

                    Arcsqlconn.Open()

                    commandDelRecords.ExecuteNonQuery()

                    Using bulkCopy As New SqlBulkCopy(Arcsqlconn)
                        bulkCopy.ColumnMappings.Add("GeneralTestCodeID", "GeneralTestCodeID")
                        bulkCopy.ColumnMappings.Add("SchoolCode", "SchoolCode")
                        bulkCopy.ColumnMappings.Add("CourseCatalogID", "CourseCatalogID")
                        bulkCopy.ColumnMappings.Add("CurrentSectionID", "SectionCatalogID")
                        bulkCopy.ColumnMappings.Add("Score", "AverageScore")

                        bulkCopy.DestinationTableName = "tbl_GeneralTestsCourses"
                        bulkCopy.WriteToServer(ds.Tables(0).CreateDataReader)
                    End Using

                    Arcsqlconn.Close()

                    LabelStatusCode.Text = "Done"
                End If
            Next
        Catch ex As Exception
            LabelStatusCode.Text = ex.Message
        End Try
    End Sub

    Protected Sub ButtonSyncAssessmentsImport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSyncAssessmentsImport.Click
        Try

            For Each CBLItem As ListItem In CheckBoxListAssessmentsImport.Items

                If CBLItem.Selected Then

                    'Archive Data to other MS SQL Server

                    'Select relevant records and put them into a Dataset

                    Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)

                    Dim commandGetRecords As New SqlCommand("SELECT AssessmentID, StudentID, Score FROM vw_AssessmentsImportScores WHERE (AssessmentID = @AssessmentID)", sqlconn)

                    Dim AssessmentID As New SqlParameter("AssessmentID", System.Data.OleDb.OleDbType.Integer)

                    AssessmentID.Value = CBLItem.Value

                    commandGetRecords.Parameters.Add(AssessmentID)

                    Dim ds As New DataSet
                    Dim sqlAdapter As New SqlDataAdapter(commandGetRecords)

                    sqlconn.Open()
                    sqlAdapter.Fill(ds)

                    sqlconn.Close()
                    commandGetRecords.Parameters.Clear()

                    'Write the dataset to the relevant table on the backup server

                    Dim Arcsqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)

                    Dim commandDelRecords As New SqlCommand("DELETE FROM tbl_AssessmentMarks WHERE (AssessmentID = @AssessmentID)", Arcsqlconn)

                    commandDelRecords.Parameters.Add(AssessmentID)

                    Arcsqlconn.Open()

                    commandDelRecords.ExecuteNonQuery()

                    Using bulkCopy As New SqlBulkCopy(Arcsqlconn)
                        bulkCopy.ColumnMappings.Add("AssessmentID", "AssessmentID")
                        bulkCopy.ColumnMappings.Add("StudentID", "StudentID")
                        bulkCopy.ColumnMappings.Add("Score", "AssessmentMark")

                        bulkCopy.DestinationTableName = "tbl_AssessmentMarks"
                        bulkCopy.WriteToServer(ds.Tables(0).CreateDataReader)
                    End Using

                    Arcsqlconn.Close()

                    LabelStatusAssessments.Text = "Done"
                End If
            Next
        Catch ex As Exception
            LabelStatusAssessments.Text = ex.Message
        End Try
    End Sub

    Protected Sub ButtonSyncScores_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSyncScores.Click
        Try

            For Each CBLItem As ListItem In CheckBoxListGeneralTestsGroupsScores.Items

                If CBLItem.Selected Then

                    'Archive Data to other MS SQL Server
                    'Select relevant records and put them into a Dataset

                    Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)

                    Dim commandGetRecords As New SqlCommand("SELECT GeneralTestCodeID, GeneralTestGroupID, GeneralTestID, StudentID, Correct, Wrong, NotAnswered, Score, SchoolCode, CurrentSectionID, CourseCatalogID FROM vw_GeneralTestsScores  WHERE (GeneralTestID = @GeneralTestID) AND (SchoolCode=@SchoolCode)", sqlconn)

                    Dim GeneralTestID As New SqlParameter("GeneralTestID", System.Data.OleDb.OleDbType.Integer)
                    Dim SchoolCode As New SqlParameter("SchoolCode", System.Data.OleDb.OleDbType.Integer)

                    Dim DropDownListSchoolCodesMaster As DropDownList = Master.Master.FindControl("DropDownListSchoolCodesMaster")

                    GeneralTestID.Value = CBLItem.Value
                    SchoolCode.Value = DropDownListSchoolCodesMaster.SelectedValue

                    commandGetRecords.Parameters.Add(GeneralTestID)
                    commandGetRecords.Parameters.Add(SchoolCode)

                    Dim ds As New DataSet
                    Dim sqlAdapter As New SqlDataAdapter(commandGetRecords)

                    sqlconn.Open()
                    sqlAdapter.Fill(ds)

                    sqlconn.Close()
                    commandGetRecords.Parameters.Clear()

                    'Write the dataset to the relevant table on the backup server

                    Dim Arcsqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)

                    Dim commandDelRecords As New SqlCommand("DELETE FROM tbl_GeneralTestsScores WHERE (GeneralTestID = @GeneralTestID) AND (SchoolCode = @SchoolCode)", Arcsqlconn)

                    commandDelRecords.Parameters.Add(GeneralTestID)
                    commandDelRecords.Parameters.Add(SchoolCode)

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

                    LabelStatusScores.Text = "Done"
                End If
            Next
        Catch ex As Exception
            LabelStatusScores.Text = ex.Message
        End Try
    End Sub
End Class
