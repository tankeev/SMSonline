Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration

Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.IsInRole("StaffSD") Then
            Response.Redirect("~/Warning.aspx")
        End If
    End Sub

    Protected Sub RadioButtonImageLoad(ByVal sender As Object)
        Dim gv As GridView = DirectCast(sender, GridView)
        For Each gvr As GridViewRow In gv.Rows
            Dim ImageButtonRadio As ImageButton = gvr.FindControl("ImageButtonRadio")
            If gvr.RowIndex <> gv.SelectedIndex Then
                ImageButtonRadio.ImageUrl = "~/StaffSD/Images/radiobutton.png"
            Else
                ImageButtonRadio.ImageUrl = "~/StaffSD/Images/radiobuttonchecked.png"
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

                Dim LabelMidTerm As Label = GridViewStudentsRow.FindControl("LabelMidTerm")
                Dim TextBoxMidAverage As TextBox = GridViewStudentsRow.FindControl("TextBoxMidAverage")

                Dim TextBoxPractice As TextBox = GridViewStudentsRow.FindControl("TextBoxPractice")

                'SectionCatalogID
                Dim conStringGroupUsers As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
                Dim dadGroupUsers As New SqlDataAdapter("SELECT SectionGroup FROM tbl_SectionCatalog WHERE (SectionCatalogID = " & GridViewCourses.SelectedDataKey.Values("SectionCatalogID") & ")", conStringGroupUsers)
                Dim dtblGroupUsers As New DataTable()
                dadGroupUsers.Fill(dtblGroupUsers)

                'Grade 1
                If dtblGroupUsers.Rows.Item(0).Item("SectionGroup") = 1 Then
                    TextBoxMidAverage.Text = Math.Round((Integer.Parse(LabelQuiz.Text) * 0.6 + Integer.Parse(LabelHomework.Text) * 0.4), 0)
                Else
                    TextBoxMidAverage.Text = Math.Round(((Integer.Parse(LabelQuiz.Text) * 0.25 + Integer.Parse(LabelHomework.Text) * 0.2 + Integer.Parse(LabelMidTerm.Text) * 0.25) / 70) * 100)
                End If

                If TextBoxMidAverage.Text < 75 Then
                    GridViewStudentsRow.Cells(5).BackColor = Drawing.Color.Red
                Else
                    GridViewStudentsRow.Cells(5).BackColor = Drawing.Color.Green
                End If

                If TextBoxPractice.Text < 75 Then
                    GridViewStudentsRow.Cells(6).BackColor = Drawing.Color.Red
                Else
                    GridViewStudentsRow.Cells(6).BackColor = Drawing.Color.Green
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

                Dim TextBoxPractice As TextBox = GridViewStudentsRow.FindControl("TextBoxPractice")
                Dim TextBoxMidAverage As TextBox = GridViewStudentsRow.FindControl("TextBoxMidAverage")

                Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

                SqlDataSourceReportMidTermAverages.InsertParameters.Clear()

                SqlDataSourceReportMidTermAverages.InsertParameters.Add("AcademicTermID", GridViewAcademicTerms.SelectedDataKey.Values("AcademicTermID"))
                SqlDataSourceReportMidTermAverages.InsertParameters.Add("CourseSectionID", GridViewCourses.SelectedDataKey.Values("CourseSectionID"))
                SqlDataSourceReportMidTermAverages.InsertParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
                SqlDataSourceReportMidTermAverages.InsertParameters.Add("ReportTypeID", 1)
                SqlDataSourceReportMidTermAverages.InsertParameters.Add("StudentID", LabelSID.Text)
                SqlDataSourceReportMidTermAverages.InsertParameters.Add("CurrentSectionID", GridViewCourses.SelectedDataKey.Values("SectionCatalogID"))
                SqlDataSourceReportMidTermAverages.InsertParameters.Add("CourseGroupingID", GridViewCourses.SelectedDataKey.Values("CourseGroupingID"))
                SqlDataSourceReportMidTermAverages.InsertParameters.Add("Average", TextBoxMidAverage.Text)
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

End Class
