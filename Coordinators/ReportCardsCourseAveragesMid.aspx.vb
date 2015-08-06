Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration

Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.IsInRole("Coordinator") Then
            Response.Redirect("~/Warning.aspx")
        End If
    End Sub

    Protected Sub RadioButtonImageLoad(ByVal sender As Object)
        Dim gv As GridView = DirectCast(sender, GridView)
        For Each gvr As GridViewRow In gv.Rows
            Dim ImageButtonRadio As ImageButton = gvr.FindControl("ImageButtonRadio")
            If gvr.RowIndex <> gv.SelectedIndex Then
                ImageButtonRadio.ImageUrl = "~/Coordinators/Images/radiobutton.png"
            Else
                ImageButtonRadio.ImageUrl = "~/Coordinators/Images/radiobuttonchecked.png"
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
            RadioButtonImageLoad(GridViewCourses)
        Else
            GridViewCourses.SelectedIndex = -1
        End If
    End Sub

    Protected Sub GridViewCourses_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewCourses.SelectedIndexChanged
        RadioButtonImageLoad(GridViewCourses)
    End Sub

    Protected Sub GridViewStudents_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewMidTermStudents.RowDataBound
        Try

            If e.Row.RowType = DataControlRowType.DataRow Then

                Dim GridViewMidTermStudentsRow As GridViewRow = e.Row

                Dim LabelQuiz As Label = GridViewMidTermStudentsRow.FindControl("LabelQuiz")
                Dim LabelHomework As Label = GridViewMidTermStudentsRow.FindControl("LabelHomework")

                Dim LabelExam As Label = GridViewMidTermStudentsRow.FindControl("LabelExam")
                Dim LabelEvaluation As Label = GridViewMidTermStudentsRow.FindControl("LabelEvaluation")

                Dim TextBoxAverage As TextBox = GridViewMidTermStudentsRow.FindControl("TextBoxAverage")
                Dim TextBoxKnowledge As TextBox = GridViewMidTermStudentsRow.FindControl("TextBoxKnowledge")
                Dim TextBoxPractice As TextBox = GridViewMidTermStudentsRow.FindControl("TextBoxPractice")

                'CourseCategoryID
                Dim conStringGroupUsers As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
                Dim dadGroupUsers As New SqlDataAdapter("SELECT CourseCategoryID FROM tbl_CourseCatalog Where CourseCatalogID=" & GridViewCourses.SelectedDataKey.Values("CourseCatalogID"), conStringGroupUsers)
                Dim dtblGroupUsers As New DataTable()
                dadGroupUsers.Fill(dtblGroupUsers)

                '34 Computer, 52 Music, 55 Sports
                If dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 34 Or dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 52 Or dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 55 Then
                    TextBoxKnowledge.Visible = True
                    If TextBoxKnowledge.Text < 75 Then
                        GridViewMidTermStudentsRow.Cells(6).BackColor = Drawing.Color.Red
                    Else
                        GridViewMidTermStudentsRow.Cells(6).BackColor = Drawing.Color.Green
                    End If

                    TextBoxAverage.Visible = False
                Else

                    TextBoxAverage.Visible = True
                    TextBoxAverage.Text = Math.Round(Integer.Parse(LabelExam.Text) * 0.3 + Integer.Parse(LabelQuiz.Text) * 0.25 + Integer.Parse(LabelHomework.Text) * 0.2 + Integer.Parse(LabelEvaluation.Text) * 0.25, 0)

                    If TextBoxAverage.Text < 75 Then
                        GridViewMidTermStudentsRow.Cells(6).BackColor = Drawing.Color.Red
                    Else
                        GridViewMidTermStudentsRow.Cells(6).BackColor = Drawing.Color.Green
                    End If
                    TextBoxKnowledge.Visible = False
                End If

                If TextBoxPractice.Text < 75 Then
                    GridViewMidTermStudentsRow.Cells(7).BackColor = Drawing.Color.Red
                Else
                    GridViewMidTermStudentsRow.Cells(7).BackColor = Drawing.Color.Green
                End If

                Dim FormViewIsReady As FormView = GridViewMidTermStudentsRow.FindControl("FormViewIsReady")
                FormViewIsReady.DataBind()

            End If

        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured:" & ex.Message, "Error")
        End Try
    End Sub

    Protected Sub GridViewStudents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewMidTermStudents.DataBound

        Try

            If GridViewMidTermStudents.Rows.Count > 0 Then

                Dim LabelAverage As Label = GridViewMidTermStudents.FooterRow.FindControl("LabelAverage")
                Dim Sum As Integer = 0

                For Each GridViewStudentsRow As GridViewRow In GridViewMidTermStudents.Rows

                    If GridViewStudentsRow.RowType = DataControlRowType.DataRow Then

                        Dim TextBoxAverage As TextBox = GridViewStudentsRow.FindControl("TextBoxAverage")

                        Sum += Convert.ToInt32(TextBoxAverage.Text)

                    End If

                Next

                LabelAverage.Text = Math.Round((Sum / GridViewMidTermStudents.Rows.Count), 0).ToString()

            End If

        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured:" & ex.Message, "Error")
        End Try

    End Sub

    Protected Sub ButtonSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSave.Click
        Try

            If RadioButtonListLocker.SelectedValue = 1 Then

                Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

                For Each GridViewStudentsRow As GridViewRow In GridViewMidTermStudents.Rows

                    Dim LabelSID As Label = GridViewStudentsRow.FindControl("LabelSID")
                    Dim TextBoxAverage As TextBox = GridViewStudentsRow.FindControl("TextBoxAverage")
                    Dim TextBoxKnowledge As TextBox = GridViewStudentsRow.FindControl("TextBoxKnowledge")
                    Dim TextBoxPractice As TextBox = GridViewStudentsRow.FindControl("TextBoxPractice")

                    SqlDataSourceReportMidTermAverages.InsertParameters.Clear()

                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("AcademicTermID", GridViewAcademicTerms.SelectedDataKey.Values("AcademicTermID"))
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("CourseSectionID", GridViewCourses.SelectedDataKey.Values("CourseSectionID"))
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("CourseCatalogID", GridViewCourses.SelectedDataKey.Values("CourseCatalogID"))
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("AcademicSemesterID", GridViewAcademicTerms.SelectedDataKey.Values("AcademicSemesterID"))
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("ReportTypeID", 1)
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("StudentID", LabelSID.Text)
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("CurrentSectionID", DropDownListSections.SelectedValue)
                    SqlDataSourceReportMidTermAverages.InsertParameters.Add("CourseGroupingID", GridViewCourses.SelectedDataKey.Values("CourseGroupingID"))

                    'CourseCategoryID
                    Dim conStringGroupUsers As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
                    Dim dadGroupUsers As New SqlDataAdapter("SELECT CourseCategoryID, CourseSectionID FROM vw_Courses Where CourseSectionID=" & GridViewCourses.SelectedDataKey.Values("CourseSectionID"), conStringGroupUsers)
                    Dim dtblGroupUsers As New DataTable()
                    dadGroupUsers.Fill(dtblGroupUsers)

                    '34 Computer, 52 Music, 55 Sports
                    If dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 34 Or dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 52 Or dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 55 Then
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

                GridViewMidTermStudents.DataBind()

            ElseIf RadioButtonListLocker.SelectedValue = 2 Then

                For Each GridViewStudentsRow As GridViewRow In GridViewMidTermStudents.Rows

                    Dim LabelSID As Label = GridViewStudentsRow.FindControl("LabelSID")

                    SqlDataSourceReportMidTermAverages.DeleteParameters.Clear()

                    SqlDataSourceReportMidTermAverages.DeleteParameters.Add("AcademicTermID", GridViewAcademicTerms.SelectedDataKey.Values("AcademicTermID"))
                    SqlDataSourceReportMidTermAverages.DeleteParameters.Add("CourseCatalogID", GridViewCourses.SelectedDataKey.Values("CourseCatalogID"))
                    SqlDataSourceReportMidTermAverages.DeleteParameters.Add("StudentID", LabelSID.Text)

                    SqlDataSourceReportMidTermAverages.Delete()

                Next

                GridViewMidTermStudents.DataBind()
            End If


        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured:" & ex.Message, "Error")
        End Try
    End Sub

End Class
