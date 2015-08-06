Imports System.Data.SqlClient
Imports System.Data

Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdate.Click
        Try
            For Each row As GridViewRow In GridViewStudents.Rows

                If row.RowType = DataControlRowType.DataRow Then

                    'Dim CheckBoxCheck = DirectCast(row.FindControl("CheckBoxCheck"), CheckBox)
                    Dim LabelTableID = DirectCast(row.FindControl("LabelTableID"), Label)
                    Dim TextBoxStudentAnswer As TextBox = DirectCast(row.FindControl("TextBoxStudentAnswer"), TextBox)

                    'If CheckBoxCheck.Checked Then

                    SqlDataSourceGridviewUploads.UpdateParameters.Clear()
                    SqlDataSourceGridviewUploads.UpdateParameters.Add("GeneralTestsStudentsAnswerID", LabelTableID.Text)
                    SqlDataSourceGridviewUploads.UpdateParameters.Add("StudentAnswer", TextBoxStudentAnswer.Text)

                    SqlDataSourceGridviewUploads.Update()

                    'End If
                End If

            Next

            LabelStatus.Text = "Row(s) Updated Successfully!"

        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub

    Protected Sub ButtonDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonDelete.Click
        Try
            For Each row As GridViewRow In GridViewStudents.Rows

                If row.RowType = DataControlRowType.DataRow Then

                    Dim CheckBoxCheck = DirectCast(row.FindControl("CheckBoxCheck"), CheckBox)
                    Dim LabelTableID = DirectCast(row.FindControl("LabelTestID"), Label)

                    If CheckBoxCheck.Checked Then

                        SqlDataSourceGridviewUploads.DeleteParameters.Clear()
                        SqlDataSourceGridviewUploads.DeleteParameters.Add("GeneralTestsStudentsAnswerID", LabelTableID.Text)

                        SqlDataSourceGridviewUploads.Delete()

                    End If
                End If

            Next

            LabelStatus.Text = "Deleted Successfully!"
        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub

    Protected Sub CheckBoxAll_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxAll.CheckedChanged

        If CheckBoxAll.Checked Then

            For Each row As GridViewRow In GridViewStudents.Rows
                Dim CheckBoxCheck = DirectCast(row.FindControl("CheckBoxCheck"), CheckBox)
                CheckBoxCheck.Checked = True
            Next

        Else

            For Each row As GridViewRow In GridViewStudents.Rows
                Dim CheckBoxCheck = DirectCast(row.FindControl("CheckBoxCheck"), CheckBox)
                CheckBoxCheck.Checked = False
            Next

        End If
    End Sub

    Protected Sub ButtonBatchCopy_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonBatchCopy.Click
        Try

            Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)
            Dim commandGetRecords As New SqlCommand("SELECT GeneralTestsStudentsAnswerID, GeneralTestID, SchoolCode, GeneralTestQuestionNo, StudentID, StudentAnswer FROM vw_GeneralTestsStudentsAnswersTemp WHERE (GeneralTestID = @GeneralTestID) AND (SchoolCode = @SchoolCode)", sqlconn)

            Dim GeneralTestID As New SqlParameter("GeneralTestID", System.Data.OleDb.OleDbType.Integer)
            Dim SchoolCode As New SqlParameter("SchoolCode", System.Data.OleDb.OleDbType.Integer)

            Dim DropDownListSchoolCodesMaster As DropDownList = Master.Master.FindControl("DropDownListSchoolCodesMaster")

            GeneralTestID.Value = DropDownListMPExams.SelectedValue
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

            Dim commandDelRecords As New SqlCommand("DELETE FROM tbl_GeneralTestsStudentsAnswers WHERE (GeneralTestID = @GeneralTestID) AND (SchoolCode=@SchoolCode)", Arcsqlconn)

            commandDelRecords.Parameters.Add(GeneralTestID)
            commandDelRecords.Parameters.Add(SchoolCode)

            Arcsqlconn.Open()

            commandDelRecords.ExecuteNonQuery()

            Using bulkCopy As New SqlBulkCopy(Arcsqlconn)
                bulkCopy.ColumnMappings.Add("GeneralTestID", "GeneralTestID")
                bulkCopy.ColumnMappings.Add("GeneralTestQuestionNo", "GeneralTestQuestionNo")
                bulkCopy.ColumnMappings.Add("StudentID", "StudentID")
                bulkCopy.ColumnMappings.Add("StudentAnswer", "StudentAnswer")
                bulkCopy.ColumnMappings.Add("SchoolCode", "SchoolCode")

                bulkCopy.DestinationTableName = "tbl_GeneralTestsStudentsAnswers"
                bulkCopy.WriteToServer(ds.Tables(0).CreateDataReader)
            End Using

            For Each row As DataRow In ds.Tables(0).Rows
                SqlDataSourceBatchCopy.UpdateParameters.Clear()
                SqlDataSourceBatchCopy.UpdateParameters.Add("GeneralTestsStudentsAnswerID", row.Item("GeneralTestsStudentsAnswerID").ToString)
                SqlDataSourceBatchCopy.UpdateParameters.Add("Confirmed", 1)

                SqlDataSourceBatchCopy.Update()
            Next

            Arcsqlconn.Close()

            GridViewStudents.DataBind()

            LabelStatus.Text = "Copied Successfully!"

        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub

    Protected Sub DropDownListMPExams_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListMPExams.SelectedIndexChanged
        LabelStatus.Text = ""
    End Sub

End Class
