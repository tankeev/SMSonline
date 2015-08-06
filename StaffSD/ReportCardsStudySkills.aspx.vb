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

    Protected Sub GridViewAcademicSemesters_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewAcademicSemesters.RowDataBound
        If GridViewAcademicSemesters.Rows.Count > 0 Then
            GridViewAcademicSemesters.SelectedIndex = 0
            RadioButtonImageLoad(GridViewAcademicSemesters)
        End If
    End Sub

    Protected Sub GridViewAcademicSemesters_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAcademicSemesters.SelectedIndexChanged
        RadioButtonImageLoad(GridViewAcademicSemesters)
    End Sub

    Protected Sub GridViewCourseSections_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewCourseSections.RowDataBound
        If GridViewCourseSections.Rows.Count > 0 Then
            GridViewCourseSections.SelectedIndex = 0
            RadioButtonImageLoad(GridViewCourseSections)
        End If
    End Sub

    Protected Sub GridViewCourseSections_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewCourseSections.SelectedIndexChanged
        RadioButtonImageLoad(GridViewCourseSections)
    End Sub

    Protected Sub GridViewStudySkills_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewStudySkills.RowDataBound
        Try
            Dim GridViewStudySkillsRow As GridViewRow = e.Row

            If GridViewStudySkillsRow.RowType = DataControlRowType.DataRow Then

                Dim FormViewStudySkills As FormView = GridViewStudySkillsRow.FindControl("FormViewStudySkills")
                FormViewStudySkills.DataBind()

            End If

        Catch ex As Exception
            WebMessageBoxStudySkills.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub

    Protected Sub ButtonInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            Dim ButtonInsert As Button = sender
            Dim FormViewStudySkills As FormView = ButtonInsert.NamingContainer

            Dim GridViewStudySkillsRow As GridViewRow = FormViewStudySkills.NamingContainer
            Dim HiddenFieldStudentID As HiddenField = GridViewStudySkillsRow.FindControl("HiddenFieldStudentID")

            If FormViewStudySkills.CurrentMode = FormViewMode.Insert Then

                Dim GridViewStudySkillsInsert As GridView = FormViewStudySkills.FindControl("GridViewStudySkillsInsert")
                Dim SqlDataSourceStudySkillsInsert As SqlDataSource = FormViewStudySkills.FindControl("SqlDataSourceStudySkillsInsert")

                For Each GridViewStudySkillsInsertRow As GridViewRow In GridViewStudySkillsInsert.Rows

                    Dim LabelSSID As Label = GridViewStudySkillsInsertRow.FindControl("LabelSSID")
                    Dim DropDownListResponsesInsert As DropDownList = GridViewStudySkillsInsertRow.FindControl("DropDownListResponsesInsert")

                    SqlDataSourceStudySkillsInsert.InsertParameters.Clear()
                    SqlDataSourceStudySkillsInsert.InsertParameters.Add("StudySkillID", LabelSSID.Text)
                    SqlDataSourceStudySkillsInsert.InsertParameters.Add("AcademicTermID", 0)
                    SqlDataSourceStudySkillsInsert.InsertParameters.Add("AcademicSemesterID", GridViewAcademicSemesters.SelectedDataKey.Values("AcademicSemesterID"))
                    SqlDataSourceStudySkillsInsert.InsertParameters.Add("ReportTypeID", RadioButtonListReportTypes.SelectedValue)
                    SqlDataSourceStudySkillsInsert.InsertParameters.Add("StudentID", HiddenFieldStudentID.Value)
                    SqlDataSourceStudySkillsInsert.InsertParameters.Add("Response", DropDownListResponsesInsert.SelectedValue)

                    SqlDataSourceStudySkillsInsert.Insert()
                Next
            End If

            FormViewStudySkills.ChangeMode(FormViewMode.ReadOnly)

        Catch ex As Exception
            WebMessageBoxStudySkills.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try

    End Sub

    Protected Sub ButtonEdit_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            Dim ButtonInsert As Button = sender
            Dim FormViewStudySkills As FormView = ButtonInsert.NamingContainer

            FormViewStudySkills.ChangeMode(FormViewMode.Edit)

        Catch ex As Exception
            WebMessageBoxStudySkills.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try

    End Sub

    Protected Sub ButtonUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            Dim ButtonInsert As Button = sender
            Dim FormViewStudySkills As FormView = ButtonInsert.NamingContainer

            Dim GridViewStudentsRow As GridViewRow = FormViewStudySkills.NamingContainer
            Dim HiddenFieldStudentID As HiddenField = GridViewStudentsRow.FindControl("HiddenFieldStudentID")

            If FormViewStudySkills.CurrentMode = FormViewMode.Edit Then

                Dim GridViewStudySkillsEdit As GridView = FormViewStudySkills.FindControl("GridViewStudySkillsEdit")
                Dim SqlDataSourceStudySkillsEdit As SqlDataSource = FormViewStudySkills.FindControl("SqlDataSourceStudySkillsEdit")

                For Each GridViewStudySkillsRow As GridViewRow In GridViewStudySkillsEdit.Rows

                    Dim LabelID As Label = GridViewStudySkillsRow.FindControl("LabelID")
                    Dim DropDownListResponsesEdit As DropDownList = GridViewStudySkillsRow.FindControl("DropDownListResponsesEdit")

                    SqlDataSourceStudySkillsEdit.UpdateParameters.Clear()
                    SqlDataSourceStudySkillsEdit.UpdateParameters.Add("ID", LabelID.Text)
                    SqlDataSourceStudySkillsEdit.UpdateParameters.Add("Response", DropDownListResponsesEdit.SelectedValue)

                    SqlDataSourceStudySkillsEdit.Update()
                Next
            End If

            FormViewStudySkills.ChangeMode(FormViewMode.ReadOnly)

        Catch ex As Exception
            WebMessageBoxStudySkills.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub

    Protected Sub ButtonNew_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            Dim ButtonNew As Button = sender
            Dim FormViewStudySkills As FormView = ButtonNew.NamingContainer

            FormViewStudySkills.ChangeMode(FormViewMode.Insert)

        Catch ex As Exception
            WebMessageBoxStudySkills.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub

End Class
