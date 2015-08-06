Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.IsInRole("CoordinatorSD") Then
            Response.Redirect("~/Warning.aspx")
        End If
    End Sub

    Protected Sub RadioButtonImageLoad(ByVal sender As Object)
        Dim gv As GridView = DirectCast(sender, GridView)
        For Each gvr As GridViewRow In gv.Rows
            Dim ImageButtonRadio As ImageButton = gvr.FindControl("ImageButtonRadio")
            If gvr.RowIndex <> gv.SelectedIndex Then
                ImageButtonRadio.ImageUrl = "~/CoordinatorsSD/Images/radiobutton.png"
            Else
                ImageButtonRadio.ImageUrl = "~/CoordinatorsSD/Images/radiobuttonchecked.png"
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

    Protected Sub RadioButtonListReportTypes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonListReportTypes.SelectedIndexChanged
        If RadioButtonListReportTypes.SelectedValue = 1 Then
            SqlDataSourceSectionsCourses.FilterExpression = "CourseCategory='Guidance'"
        ElseIf RadioButtonListReportTypes.SelectedValue = 2 Then
            SqlDataSourceSectionsCourses.FilterExpression = ""
        End If
        GridViewCourseSections.DataBind()
        GridViewStudents.DataBind()
    End Sub

    Protected Sub GridViewCourseSections_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewCourseSections.RowDataBound
        If GridViewCourseSections.Rows.Count > 0 Then
            GridViewCourseSections.SelectedIndex = 0
            RadioButtonImageLoad(GridViewCourseSections)
        End If
    End Sub

    Protected Sub GridViewCourseSections_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewCourseSections.SelectedIndexChanged
        RadioButtonImageLoad(GridViewCourseSections)

        GridViewStudents.DataBind()
    End Sub

    Protected Sub GridViewStudents_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewStudents.RowDataBound
        Try
            Dim GridViewStudentsRow As GridViewRow = e.Row

            If GridViewStudentsRow.RowType = DataControlRowType.DataRow Then

                Dim SqlDataSourceReportComments As SqlDataSource = GridViewStudentsRow.FindControl("SqlDataSourceReportComments")
                SqlDataSourceReportComments.SelectParameters("CourseCatalogID").DefaultValue = GridViewCourseSections.SelectedDataKey.Values("CourseCatalogID")

                Dim FormViewReportComments As FormView = GridViewStudentsRow.FindControl("FormViewReportComments")
                FormViewReportComments.DataBind()

            End If

        Catch ex As Exception
            WebMessageBoxComments.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub

    Protected Sub FormViewReportComments_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs)
        Dim FormViewReportComments As FormView = DirectCast(sender, FormView)
        Dim GridViewCommentsRow As GridViewRow = DirectCast(FormViewReportComments.NamingContainer, GridViewRow)
        Dim SqlDataSourceReportComments As SqlDataSource = GridViewCommentsRow.FindControl("SqlDataSourceReportComments")

        SqlDataSourceReportComments.InsertParameters("CourseCatalogID").DefaultValue = GridViewCourseSections.SelectedDataKey.Values("CourseCatalogID")
        SqlDataSourceReportComments.InsertParameters("CourseSectionID").DefaultValue = 0
        SqlDataSourceReportComments.InsertParameters("AcademicTermID").DefaultValue = GridViewAcademicSemesters.SelectedDataKey.Values("AcademicTermID")
    End Sub

End Class
