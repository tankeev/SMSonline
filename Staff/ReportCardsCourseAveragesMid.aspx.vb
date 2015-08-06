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

    Protected Sub GridViewAcademicTerms_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewAcademicTerms.RowDataBound
        If GridViewAcademicTerms.Rows.Count > 0 Then
            GridViewAcademicTerms.SelectedIndex = 0
            RadioButtonImageLoad(GridViewAcademicTerms)
        End If
    End Sub

    Protected Sub GridViewAcademicTerms_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAcademicTerms.SelectedIndexChanged
        RadioButtonImageLoad(GridViewAcademicTerms)
    End Sub

    Protected Sub GridViewCourses_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewCourses.DataBound
        If GridViewCourses.Rows.Count > 0 Then
            GridViewCourses.SelectedIndex = 0

            SqlDataSourceAssessmentsMidTermStudents.SelectParameters("CourseCatalogID").DefaultValue = GridViewCourses.SelectedDataKey.Values("CourseCatalogID")
            SqlDataSourceAssessmentsMidTermStudents.SelectParameters("SectionCatalogID").DefaultValue = GridViewCourses.SelectedDataKey.Values("SectionCatalogID")

            RadioButtonImageLoad(GridViewCourses)
        End If
    End Sub

    Protected Sub GridViewCourses_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewCourses.SelectedIndexChanged
        SqlDataSourceAssessmentsMidTermStudents.SelectParameters("CourseCatalogID").DefaultValue = GridViewCourses.SelectedDataKey.Values("CourseCatalogID")
        SqlDataSourceAssessmentsMidTermStudents.SelectParameters("SectionCatalogID").DefaultValue = GridViewCourses.SelectedDataKey.Values("SectionCatalogID")

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
                    TextBoxAverage.Text = Math.Round(Integer.Parse(LabelExam.Text) * 0.3 + Integer.Parse(LabelQuiz.Text) * 0.25 + Integer.Parse(LabelHomework.Text) * 0.2 + Integer.Parse(LabelEvaluation.Text) * 0.25, 0)

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

    Protected Sub CheckData()

        If GridViewCourses.Rows.Count > 0 Then

            Dim sqlconn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString)
            Dim commandGetRecords As New SqlCommand("SELECT ReportAverageID FROM tbl_ReportAverages WHERE (AcademicTermID = @AcademicTermID) AND (SchoolCode = @SchoolCode) AND (CourseCatalogID = @CourseCatalogID) AND (CurrentSectionID = @SectionCatalogID)", sqlconn)

            Dim AcademicTermID As New SqlParameter("AcademicTermID", System.Data.OleDb.OleDbType.Integer)
            AcademicTermID.Value = GridViewAcademicTerms.SelectedDataKey.Values("AcademicTermID")
            commandGetRecords.Parameters.Add(AcademicTermID)

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

    Protected Sub ButtonReady_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonReady.Click
        Try

            For Each GridViewStudentsRow As GridViewRow In GridViewStudents.Rows

                Dim LabelSID As Label = GridViewStudentsRow.FindControl("LabelSID")

                Dim TextBoxAverage As TextBox = GridViewStudentsRow.FindControl("TextBoxAverage")
                Dim TextBoxKnowledge As TextBox = GridViewStudentsRow.FindControl("TextBoxKnowledge")
                Dim TextBoxPractice As TextBox = GridViewStudentsRow.FindControl("TextBoxPractice")

                Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

                SqlDataSourceReportMidTermAverages.InsertParameters.Clear()

                SqlDataSourceReportMidTermAverages.InsertParameters.Add("AcademicSemesterID", GridViewAcademicTerms.SelectedDataKey.Values("AcademicSemesterID"))
                SqlDataSourceReportMidTermAverages.InsertParameters.Add("AcademicTermID", GridViewAcademicTerms.SelectedDataKey.Values("AcademicTermID"))
                SqlDataSourceReportMidTermAverages.InsertParameters.Add("CourseSectionID", GridViewCourses.SelectedDataKey.Values("CourseSectionID"))
                SqlDataSourceReportMidTermAverages.InsertParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
                SqlDataSourceReportMidTermAverages.InsertParameters.Add("ReportTypeID", 1)
                SqlDataSourceReportMidTermAverages.InsertParameters.Add("StudentID", LabelSID.Text)
                SqlDataSourceReportMidTermAverages.InsertParameters.Add("CurrentSectionID", GridViewCourses.SelectedDataKey.Values("SectionCatalogID"))
                SqlDataSourceReportMidTermAverages.InsertParameters.Add("CourseGroupingID", GridViewCourses.SelectedDataKey.Values("CourseGroupingID"))

                'CourseCategoryID
                Dim conStringGroupUsers As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
                Dim dadGroupUsers As New SqlDataAdapter("SELECT CourseCategoryID, CourseSectionID FROM vw_Courses Where CourseSectionID=" & GridViewCourses.SelectedDataKey.Values("CourseSectionID"), conStringGroupUsers)
                Dim dtblGroupUsers As New DataTable()
                dadGroupUsers.Fill(dtblGroupUsers)

                If dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 45 Or dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 52 Or dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 55 Then
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("Average", TextBoxKnowledge.Text)
                Else
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("Average", TextBoxAverage.Text)
                End If

                SqlDataSourceReportMidTermAverages.InsertParameters.Add("Practice", TextBoxPractice.Text)
                SqlDataSourceReportMidTermAverages.InsertParameters.Add("AddedBy", Session("UserID").ToString)
                SqlDataSourceReportMidTermAverages.InsertParameters.Add("AddedDate", Date.UtcNow)
                SqlDataSourceReportMidTermAverages.InsertParameters.Add("ApprovedByTeacher", 1)
                SqlDataSourceReportMidTermAverages.Insert()

            Next

            CheckData()

            WebMessageBoxCourseAverages.Show("Records saved successfully!", "Success")

        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured:" & ex.Message, "Error")
        End Try
    End Sub

End Class
