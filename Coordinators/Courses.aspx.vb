
Partial Class UserList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Coordinator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonUpdateTeachers_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateTeachers.Click
        Try

            For Each GridViewRow As GridViewRow In GridViewCourseSections.Rows

                Dim CourseSectionID As Integer = Convert.ToInt32(GridViewCourseSections.DataKeys(GridViewRow.RowIndex).Value)
                Dim DropDownListStaff As DropDownList = GridViewRow.FindControl("DropDownListStaff")
                'Dim DropDownListCourses As DropDownList = GridViewRow.FindControl("DropDownListCourses")

                SqlDataSourceGridviewCourseSections.UpdateParameters.Clear()
                SqlDataSourceGridviewCourseSections.UpdateParameters.Add("StaffID", DropDownListStaff.SelectedValue)
                'SqlDataSourceGridviewCourseSections.UpdateParameters.Add("CourseCatalogID", DropDownListCourses.SelectedValue)
                SqlDataSourceGridviewCourseSections.UpdateParameters.Add("CourseSectionID", CourseSectionID)

                SqlDataSourceGridviewCourseSections.Update()

            Next

            GridViewCourseSections.DataBind()

            WebMessageBoxCourses.Show("Done! Records Have Been Successfully Updated!", "Success")

        Catch ex As Exception
            WebMessageBoxCourses.Show("Sorry, The Following Error Occured: " & ex.ToString, "Error")
        End Try
    End Sub

    Protected Sub ButtonUpdateCourses_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateCourses.Click
        Try

            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")
            If RadioButtonListSections.SelectedValue = Nothing Then

                WebMessageBoxCourses.Show("Please Select a Section First!", "Warning")

            Else
                SqlDataSourceGridviewCourseSections.InsertParameters.Clear()
                SqlDataSourceGridviewCourseSections.InsertParameters.Add("AcademicTermID", DropDownListAcademicTermsMaster.SelectedValue)
                SqlDataSourceGridviewCourseSections.InsertParameters.Add("SectionCatalogID", RadioButtonListSections.SelectedValue)
                SqlDataSourceGridviewCourseSections.InsertParameters.Add("CourseCatalogID", DropDownListCourses.SelectedValue)
                SqlDataSourceGridviewCourseSections.InsertParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
                SqlDataSourceGridviewCourseSections.InsertParameters.Add("StaffID", DropDownListCourseTeacher.SelectedValue)
                SqlDataSourceGridviewCourseSections.Insert()

                'LabelStatusAddCourse.Text = "Done! Records Have Been Successfully Updated!"
            End If
        Catch ex As Exception
            LabelStatusAddCourse.Text = ex.Message
        End Try
    End Sub

    Protected Sub RadioButtonListSections_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonListSections.SelectedIndexChanged
        LabelStatusAddCourse.Text = ""
    End Sub

    Protected Sub GridViewCourseSections_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridViewCourseSections.RowUpdating
        Try

            Dim row = GridViewCourseSections.Rows(e.RowIndex)

            e.NewValues("StaffID") = DirectCast(row.FindControl("DropDownListStaff"), DropDownList).SelectedValue

        Catch ex As Exception

            WebMessageBoxCourses.Show("Sorry, The Following Error Occured: " & ex.ToString, "Error")

        End Try
    End Sub

    Protected Sub ButtonShowCourses_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonShowCourses.Click
        If RadioButtonListSections.SelectedValue = Nothing Then
            WebMessageBoxCourses.Show("Please Select a Section First!", "Warning")
        Else
            MPAddCourses.Show()
        End If
    End Sub
End Class
