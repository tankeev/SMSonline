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
            RadioButtonImageLoad(GridViewCourses)
        Else
            GridViewCourses.SelectedIndex = -1
        End If
    End Sub

    Protected Sub GridViewCourses_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewCourses.SelectedIndexChanged
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

                Dim FormViewIsReady As FormView = GridViewStudentsRow.FindControl("FormViewIsReady")
                FormViewIsReady.DataBind()

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

        Try

            If GridViewStudents.Rows.Count > 0 Then

                Dim LabelAverageI As Label = GridViewStudents.FooterRow.FindControl("LabelAverage")
                LabelAverageI.Visible = True
                Dim LabelAverageISum As Decimal = 0

                Dim LabelAverageII As Label = GridViewStudents.FooterRow.FindControl("LabelKnowledge")
                LabelAverageII.Visible = True
                Dim LabelAverageIISum As Decimal = 0

                For Each GridViewStudentsRow As GridViewRow In GridViewStudents.Rows
                    If GridViewStudentsRow.RowType = DataControlRowType.DataRow Then

                        Dim TextBoxAverageI As TextBox = GridViewStudentsRow.FindControl("TextBoxAverage")
                        LabelAverageISum += Convert.ToDecimal(TextBoxAverageI.Text)

                        Dim TextBoxAverageII As TextBox = GridViewStudentsRow.FindControl("TextBoxKnowledge")
                        LabelAverageIISum += Convert.ToDecimal(TextBoxAverageII.Text)

                    End If
                Next

                LabelAverageI.Text = Math.Round((LabelAverageISum / GridViewStudents.Rows.Count), 2, MidpointRounding.AwayFromZero).ToString
                If LabelAverageI.Text = 0 Then
                    LabelAverageI.Visible = False
                End If

                LabelAverageII.Text = Math.Round((LabelAverageIISum / GridViewStudents.Rows.Count), 2, MidpointRounding.AwayFromZero).ToString
                If LabelAverageII.Text = 0 Then
                    LabelAverageII.Visible = False
                End If
            End If

        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured:" & ex.Message, "Error")
        End Try

    End Sub

    Protected Sub ButtonSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSave.Click
        Try

            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            If RadioButtonListLocker.SelectedValue = 1 Then

                For Each GridViewStudentsRow As GridViewRow In GridViewStudents.Rows

                    Dim LabelSID As Label = GridViewStudentsRow.FindControl("LabelSID")
                    Dim LabelCSID As Label = GridViewStudentsRow.FindControl("LabelCSID")

                    Dim TextBoxAverage As TextBox = GridViewStudentsRow.FindControl("TextBoxAverage")
                    Dim TextBoxKnowledge As TextBox = GridViewStudentsRow.FindControl("TextBoxKnowledge")
                    Dim TextBoxPractice As TextBox = GridViewStudentsRow.FindControl("TextBoxPractice")

                    Dim DropDownListAttitude As DropDownList = GridViewStudentsRow.FindControl("DropDownListAttitude")

                    SqlDataSourceReportFinalAverages.InsertParameters.Clear()

                    SqlDataSourceReportFinalAverages.InsertParameters.Add("AcademicTermID", GridViewAcademicSemesters.SelectedDataKey.Values("AcademicTermID"))
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("CourseSectionID", 0)
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("CourseCatalogID", GridViewCourses.SelectedDataKey.Values("CourseCatalogID"))
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("AcademicSemesterID", GridViewAcademicSemesters.SelectedDataKey.Values("AcademicSemesterID"))
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("ReportTypeID", 2)
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("StudentID", LabelSID.Text)
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("CurrentSectionID", DropDownListSections.SelectedValue)
                    SqlDataSourceReportFinalAverages.InsertParameters.Add("CourseGroupingID", GridViewCourses.SelectedDataKey.Values("CourseGroupingID"))

                    'CourseCategoryID
                    Dim conStringGroupUsers As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
                    Dim dadGroupUsers As New SqlDataAdapter("SELECT CourseCategoryID FROM tbl_CourseCatalog Where CourseCatalogID=" & GridViewCourses.SelectedDataKey.Values("CourseCatalogID"), conStringGroupUsers)
                    Dim dtblGroupUsers As New DataTable()
                    dadGroupUsers.Fill(dtblGroupUsers)

                    '34 Computer, 52 Music, 55 Sports
                    If dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 34 Or dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 52 Or dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 55 Then
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

                GridViewStudents.DataBind()

            ElseIf RadioButtonListLocker.SelectedValue = 2 Then

                For Each GridViewStudentsRow As GridViewRow In GridViewStudents.Rows

                    Dim LabelSID As Label = GridViewStudentsRow.FindControl("LabelSID")
                    Dim LabelCSID As Label = GridViewStudentsRow.FindControl("LabelCSID")

                    SqlDataSourceReportFinalAverages.DeleteParameters.Clear()

                    SqlDataSourceReportFinalAverages.DeleteParameters.Add("ReportTypeID", 2)
                    SqlDataSourceReportFinalAverages.DeleteParameters.Add("CourseCatalogID", GridViewCourses.SelectedDataKey.Values("CourseCatalogID"))
                    SqlDataSourceReportFinalAverages.DeleteParameters.Add("AcademicSemesterID", GridViewAcademicSemesters.SelectedDataKey.Values("AcademicSemesterID"))
                    SqlDataSourceReportFinalAverages.DeleteParameters.Add("StudentID", LabelSID.Text)

                    SqlDataSourceReportFinalAverages.Delete()

                Next

                GridViewStudents.DataBind()
            End If


        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured:" & ex.Message, "Error")
        End Try
    End Sub

    Protected Sub ImageButtonLocked_Clicked(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Try

            Dim ImageButtonUnlocked As ImageButton = DirectCast(sender, ImageButton)
            Dim FormViewIsReady As FormView = DirectCast(ImageButtonUnlocked.NamingContainer, FormView)
            Dim GridViewStudentsRow As GridViewRow = DirectCast(FormViewIsReady.NamingContainer, GridViewRow)

            Dim LabelSID As Label = GridViewStudentsRow.FindControl("LabelSID")
            Dim LabelCSID As Label = GridViewStudentsRow.FindControl("LabelCSID")

            SqlDataSourceReportFinalAverages.DeleteParameters.Clear()

            SqlDataSourceReportFinalAverages.DeleteParameters.Add("ReportTypeID", 2)
            SqlDataSourceReportFinalAverages.DeleteParameters.Add("CourseCatalogID", GridViewCourses.SelectedDataKey.Values("CourseCatalogID"))
            SqlDataSourceReportFinalAverages.DeleteParameters.Add("AcademicSemesterID", GridViewAcademicSemesters.SelectedDataKey.Values("AcademicSemesterID"))
            SqlDataSourceReportFinalAverages.DeleteParameters.Add("StudentID", LabelSID.Text)

            SqlDataSourceReportFinalAverages.Delete()

            GridViewStudents.DataBind()

            WebMessageBoxCourseAverages.Show("Scores Have Been Unlocked Successfully!", "Success")

        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured:" & ex.Message, "Error")
        End Try

    End Sub

    Protected Sub ImageButtonUnlocked_Clicked(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Try

            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            Dim ImageButtonUnlocked As ImageButton = DirectCast(sender, ImageButton)
            Dim FormViewIsReady As FormView = DirectCast(ImageButtonUnlocked.NamingContainer, FormView)
            Dim GridViewStudentsRow As GridViewRow = DirectCast(FormViewIsReady.NamingContainer, GridViewRow)

            Dim LabelSID As Label = GridViewStudentsRow.FindControl("LabelSID")
            Dim LabelCSID As Label = GridViewStudentsRow.FindControl("LabelCSID")

            Dim TextBoxAverage As TextBox = GridViewStudentsRow.FindControl("TextBoxAverage")
            Dim TextBoxKnowledge As TextBox = GridViewStudentsRow.FindControl("TextBoxKnowledge")
            Dim TextBoxPractice As TextBox = GridViewStudentsRow.FindControl("TextBoxPractice")

            SqlDataSourceReportFinalAverages.InsertParameters.Clear()

            SqlDataSourceReportFinalAverages.InsertParameters.Add("AcademicTermID", GridViewAcademicSemesters.SelectedDataKey.Values("AcademicTermID"))
            SqlDataSourceReportFinalAverages.InsertParameters.Add("AcademicSemesterID", GridViewAcademicSemesters.SelectedDataKey.Values("AcademicSemesterID"))

            SqlDataSourceReportFinalAverages.InsertParameters.Add("CourseSectionID", 0)
            SqlDataSourceReportFinalAverages.InsertParameters.Add("CourseGroupingID", GridViewCourses.SelectedDataKey.Values("CourseGroupingID"))
            SqlDataSourceReportFinalAverages.InsertParameters.Add("CourseCatalogID", GridViewCourses.SelectedDataKey.Values("CourseCatalogID"))

            SqlDataSourceReportFinalAverages.InsertParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
            SqlDataSourceReportFinalAverages.InsertParameters.Add("CurrentSectionID", DropDownListSections.SelectedValue)

            SqlDataSourceReportFinalAverages.InsertParameters.Add("ReportTypeID", 2)
            SqlDataSourceReportFinalAverages.InsertParameters.Add("StudentID", LabelSID.Text)

            'CourseCategoryID
            Dim conStringGroupUsers As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
            Dim dadGroupUsers As New SqlDataAdapter("SELECT CourseCategoryID FROM tbl_CourseCatalog Where CourseCatalogID=" & GridViewCourses.SelectedDataKey.Values("CourseCatalogID"), conStringGroupUsers)
            Dim dtblGroupUsers As New DataTable()
            dadGroupUsers.Fill(dtblGroupUsers)

            '34 Computer, 52 Music, 55 Sports
            If dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 34 Or dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 52 Or dtblGroupUsers.Rows.Item(0).Item("CourseCategoryID") = 55 Then
                SqlDataSourceReportFinalAverages.InsertParameters.Add("Average", TextBoxKnowledge.Text)
            Else
                SqlDataSourceReportFinalAverages.InsertParameters.Add("Average", TextBoxAverage.Text)
            End If

            SqlDataSourceReportFinalAverages.InsertParameters.Add("Practice", TextBoxPractice.Text)

            SqlDataSourceReportFinalAverages.InsertParameters.Add("AddedBy", Session("UserID").ToString)
            SqlDataSourceReportFinalAverages.InsertParameters.Add("AddedDate", Date.UtcNow)
            SqlDataSourceReportFinalAverages.InsertParameters.Add("ApprovedByTeacher", 1)

            SqlDataSourceReportFinalAverages.Insert()

            GridViewStudents.DataBind()

            WebMessageBoxCourseAverages.Show("Scores Have Been Locked Successfully!", "Success")

        Catch ex As Exception
            WebMessageBoxCourseAverages.Show("An error occured:" & ex.Message, "Error")
        End Try

    End Sub

End Class
