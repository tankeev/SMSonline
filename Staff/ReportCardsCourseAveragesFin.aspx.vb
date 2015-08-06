Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration

Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.IsInRole("Staff") Then
            Response.Redirect("~/Warning.aspx")
        End If
    End Sub

    Protected Sub RadioButtonImageLoad(ByVal sender As Object)
        Dim gv As GridView = DirectCast(sender, GridView)
        For Each gvr As GridViewRow In gv.Rows
            Dim ImageButtonRadio As ImageButton = gvr.FindControl("ImageButtonRadio")
            If gvr.RowIndex <> gv.SelectedIndex Then
                ImageButtonRadio.ImageUrl = "~/Staff/Images/radiobutton.png"
            Else
                ImageButtonRadio.ImageUrl = "~/Staff/Images/radiobuttonchecked.png"
            End If
        Next
    End Sub

    Protected Sub GridViewAcademicSemesters_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewAcademicSemesters.RowDataBound
        If GridViewAcademicSemesters.Rows.Count > 0 Then
            GridViewAcademicSemesters.SelectedIndex = 0
            RadioButtonImageLoad(GridViewAcademicSemesters)
        End If
    End Sub

    Protected Sub GridViewAcademicSemesters_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAcademicSemesters.SelectedIndexChanged
        RadioButtonImageLoad(GridViewAcademicSemesters)
    End Sub

    Protected Sub GridViewCourses_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewCourses.DataBound
        If GridViewCourses.Rows.Count > 0 Then
            GridViewCourses.SelectedIndex = 0
            SqlDataSourceAssessmentsFinalStudents.SelectParameters("SectionCatalogID").DefaultValue = GridViewCourses.SelectedDataKey.Values("SectionCatalogID")
            RadioButtonImageLoad(GridViewCourses)
        End If
    End Sub

    Protected Sub GridViewCourses_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewCourses.SelectedIndexChanged
        SqlDataSourceAssessmentsFinalStudents.SelectParameters("SectionCatalogID").DefaultValue = GridViewCourses.SelectedDataKey.Values("SectionCatalogID")
        RadioButtonImageLoad(GridViewCourses)
    End Sub

    Protected Sub GridViewStudents_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewStudents.RowDataBound
        Try

            If e.Row.RowType = DataControlRowType.DataRow Then

                Dim GridViewStudentsRow As GridViewRow = e.Row

                Dim LabelQuiz As Label = GridViewStudentsRow.FindControl("LabelQuiz")
                Dim LabelHomework As Label = GridViewStudentsRow.FindControl("LabelHomework")

                Dim LabelExam As Label = GridViewStudentsRow.FindControl("LabelExam")
                Dim LabelEvaluation As Label = GridViewStudentsRow.FindControl("LabelEvaluation")

                Dim TextBoxAverage As TextBox = GridViewStudentsRow.FindControl("TextBoxAverage")
                Dim TextBoxKnowledge As TextBox = GridViewStudentsRow.FindControl("TextBoxKnowledge")
                Dim TextBoxPractice As TextBox = GridViewStudentsRow.FindControl("TextBoxPractice")

                'CourseCategoryID
                Dim conStringGroupUsers As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
                Dim dadGroupUsers As New SqlDataAdapter("SELECT CourseCategoryID FROM tbl_CourseCatalog Where CourseCatalogID=" & GridViewCourses.SelectedDataKey.Values("CourseCatalogID"), conStringGroupUsers)
                Dim dtblGroupUsers As New DataTable()
                dadGroupUsers.Fill(dtblGroupUsers)

                '34 Computer, 52 Music, 55 Sports
                If dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 34 Or dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 52 Or dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 55 Then
                    TextBoxKnowledge.Visible = True
                    If TextBoxKnowledge.Text < 75 Then
                        GridViewStudentsRow.Cells(6).BackColor = Drawing.Color.Red
                    Else
                        GridViewStudentsRow.Cells(6).BackColor = Drawing.Color.Green
                    End If

                    TextBoxAverage.Visible = False
                Else

                    TextBoxAverage.Visible = True
                    TextBoxAverage.Text = Math.Round(Decimal.Parse(LabelExam.Text) * 0.3 + Decimal.Parse(LabelQuiz.Text) * 0.25 + Decimal.Parse(LabelHomework.Text) * 0.2 + Decimal.Parse(LabelEvaluation.Text) * 0.25, 0, MidpointRounding.AwayFromZero)

                    If TextBoxAverage.Text < 75 Then
                        GridViewStudentsRow.Cells(6).BackColor = Drawing.Color.Red
                    Else
                        GridViewStudentsRow.Cells(6).BackColor = Drawing.Color.Green
                    End If

                    TextBoxKnowledge.Visible = False
                End If

                If TextBoxPractice.Text < 75 Then
                    GridViewStudentsRow.Cells(7).BackColor = Drawing.Color.Red
                Else
                    GridViewStudentsRow.Cells(7).BackColor = Drawing.Color.Green
                End If

            End If

        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured:" & ex.Message, "Error")
        End Try
    End Sub

    Protected Sub GridViewStudents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewStudents.DataBound
        CheckData()
    End Sub

    Protected Sub ButtonReady_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonReady.Click
        Try

            For Each GridViewStudentsRow As GridViewRow In GridViewStudents.Rows

                Dim LabelSID As Label = GridViewStudentsRow.FindControl("LabelSID")

                Dim TextBoxAverage As TextBox = GridViewStudentsRow.FindControl("TextBoxAverage")
                Dim TextBoxKnowledge As TextBox = GridViewStudentsRow.FindControl("TextBoxKnowledge")
                Dim TextBoxPractice As TextBox = GridViewStudentsRow.FindControl("TextBoxPractice")

                Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")
                Dim DropDownListAttitude As DropDownList = GridViewStudentsRow.FindControl("DropDownListAttitude")

                SqlDataSourceReportFinalAverages.InsertParameters.Clear()

                SqlDataSourceReportFinalAverages.InsertParameters.Add("AcademicTermID", GridViewAcademicSemesters.SelectedDataKey.Values("AcademicTermID"))
                SqlDataSourceReportFinalAverages.InsertParameters.Add("CourseSectionID", 0)
                SqlDataSourceReportFinalAverages.InsertParameters.Add("AcademicSemesterID", GridViewAcademicSemesters.SelectedDataKey.Values("AcademicSemesterID"))
                SqlDataSourceReportFinalAverages.InsertParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
                SqlDataSourceReportFinalAverages.InsertParameters.Add("ReportTypeID", 2)
                SqlDataSourceReportFinalAverages.InsertParameters.Add("StudentID", LabelSID.Text)
                SqlDataSourceReportFinalAverages.InsertParameters.Add("CourseCatalogID", GridViewCourses.SelectedDataKey.Values("CourseCatalogID"))
                SqlDataSourceReportFinalAverages.InsertParameters.Add("CurrentSectionID", GridViewCourses.SelectedDataKey.Values("SectionCatalogID"))
                SqlDataSourceReportFinalAverages.InsertParameters.Add("CourseGroupingID", GridViewCourses.SelectedDataKey.Values("CourseGroupingID"))

                'CourseCategoryID
                Dim conStringGroupUsers As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
                Dim dadGroupUsers As New SqlDataAdapter("SELECT CourseCategoryID FROM tbl_CourseCatalog Where (CourseCatalogID = " & GridViewCourses.SelectedDataKey.Values("CourseCatalogID") & ")", conStringGroupUsers)
                Dim dtblGroupUsers As New DataTable()
                dadGroupUsers.Fill(dtblGroupUsers)

                If dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 45 Or dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 52 Or dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 55 Then
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("Average", TextBoxKnowledge.Text)
                Else
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("Average", TextBoxAverage.Text)
                End If

                SqlDataSourceReportFinalAverages.InsertParameters.Add("Practice", TextBoxPractice.Text)
                SqlDataSourceReportFinalAverages.InsertParameters.Add("AddedBy", Session("UserID").ToString)
                SqlDataSourceReportFinalAverages.InsertParameters.Add("AddedDate", Date.UtcNow)
                SqlDataSourceReportFinalAverages.InsertParameters.Add("ApprovedByTeacher", 1)
                SqlDataSourceReportFinalAverages.Insert()

                SqlDataSourceReportAttitude.InsertParameters.Clear()

                SqlDataSourceReportAttitude.InsertParameters.Add("AcademicTermID", GridViewAcademicSemesters.SelectedDataKey.Values("AcademicTermID"))
                SqlDataSourceReportAttitude.InsertParameters.Add("AcademicSemesterID", GridViewAcademicSemesters.SelectedDataKey.Values("AcademicSemesterID"))
                SqlDataSourceReportAttitude.InsertParameters.Add("StudentID", LabelSID.Text)
                SqlDataSourceReportAttitude.InsertParameters.Add("CourseSectionID", 0)
                SqlDataSourceReportAttitude.InsertParameters.Add("ReportTypeID", 2)
                SqlDataSourceReportAttitude.InsertParameters.Add("CurrentSectionID", GridViewCourses.SelectedDataKey.Values("SectionCatalogID"))
                SqlDataSourceReportAttitude.InsertParameters.Add("CourseCatalogID", GridViewCourses.SelectedDataKey.Values("CourseCatalogID"))
                SqlDataSourceReportAttitude.InsertParameters.Add("Attitude", DropDownListAttitude.SelectedValue)
                SqlDataSourceReportAttitude.Insert()

            Next

            CheckData()

            WebMessageBoxCourseAverages.Show("Records saved successfully!", "Success")

        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured:" & ex.Message, "Error")
        End Try
    End Sub
    
    Protected Sub CheckData()

        If GridViewCourses.Rows.Count > 0 Then

            Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)
            Dim commandGetRecords As New SqlCommand("SELECT ReportAverageID FROM tbl_ReportAverages WHERE (AcademicSemesterID = @AcademicSemesterID) AND (SchoolCode = @SchoolCode) AND (CourseCatalogID = @CourseCatalogID) AND (CurrentSectionID = @SectionCatalogID) AND (ReportTypeID = 2)", sqlconn)

            Dim AcademicSemesterID As New SqlParameter("AcademicSemesterID", System.Data.OleDb.OleDbType.Integer)
            AcademicSemesterID.Value = GridViewAcademicSemesters.SelectedDataKey.Values("AcademicSemesterID")
            commandGetRecords.Parameters.Add(AcademicSemesterID)

            Dim SchoolCode As New SqlParameter("SchoolCode", System.Data.OleDb.OleDbType.Integer)
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")
            SchoolCode.Value = DropDownListSchoolCodesMaster.SelectedValue
            commandGetRecords.Parameters.Add(SchoolCode)

            Dim CourseCatalogID As New SqlParameter("CourseCatalogID", System.Data.OleDb.OleDbType.Integer)
            CourseCatalogID.Value = GridViewCourses.SelectedDataKey.Values("CourseCatalogID")
            commandGetRecords.Parameters.Add(CourseCatalogID)

            Dim SectionCatalogID As New SqlParameter("SectionCatalogID", System.Data.OleDb.OleDbType.Integer)
            SectionCatalogID.Value = GridViewCourses.SelectedDataKey.Values("SectionCatalogID")
            commandGetRecords.Parameters.Add(SectionCatalogID)

            Dim ds As New DataSet
            Dim sqlAdapter As New SqlDataAdapter(commandGetRecords)

            sqlconn.Open()
            sqlAdapter.Fill(ds)

            If ds.Tables(0).Rows.Count > 0 Then
                PanelOutput.Visible = True
                PanelInput.Visible = False
            Else
                PanelInput.Visible = True
                PanelOutput.Visible = False
            End If

            sqlconn.Close()
            commandGetRecords.Parameters.Clear()

        End If

    End Sub

End Class
