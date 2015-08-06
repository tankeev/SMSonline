
Partial Class UserList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonUpdateCourses_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateCourses.Click
        Try

            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            For Each item As ListItem In CheckBoxListCourses.Items

                If item.Selected = True Then
                    SqlDataSourceCheckBoxListCourses.InsertParameters.Clear()
                    SqlDataSourceCheckBoxListCourses.InsertParameters.Add("AcademicTermID", DropDownListAcademicTermsMaster.SelectedValue)
                    SqlDataSourceCheckBoxListCourses.InsertParameters.Add("SectionCatalogID", RadioButtonListSections.SelectedValue)
                    SqlDataSourceCheckBoxListCourses.InsertParameters.Add("CourseCatalogID", item.Value)
                    SqlDataSourceCheckBoxListCourses.InsertParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
                    SqlDataSourceCheckBoxListCourses.InsertParameters.Add("StaffID", DropDownListCourseTeacher.SelectedValue)
                    SqlDataSourceCheckBoxListCourses.Insert()

                ElseIf item.Selected = False Then
                    SqlDataSourceCheckBoxListCourses.DeleteParameters.Clear()
                    SqlDataSourceCheckBoxListCourses.DeleteParameters.Add("AcademicTermID", DropDownListAcademicTermsMaster.SelectedValue)
                    SqlDataSourceCheckBoxListCourses.DeleteParameters.Add("SectionCatalogID", RadioButtonListSections.SelectedValue)
                    SqlDataSourceCheckBoxListCourses.DeleteParameters.Add("CourseCatalogID", item.Value)
                    SqlDataSourceCheckBoxListCourses.DeleteParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
                    SqlDataSourceCheckBoxListCourses.Delete()
                End If

            Next

            LabelStatus.Text = "Successfully Done!"

            GridViewCourseSections.DataBind()

        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try

    End Sub

    Protected Sub ListBoxSchoolSections_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonListSections.SelectedIndexChanged
        Try

            CheckBoxListCourses.DataBind()

            Dim dv As New System.Data.DataView
            Dim dt As New System.Data.DataTable

            dv = SqlDataSourceCheckBoxListCourses.Select(DataSourceSelectArguments.Empty)
            dt = dv.ToTable()

            For Each item As ListItem In CheckBoxListCourses.Items
                For Each dr As Data.DataRow In dt.Rows
                    If item.Value = dr.Item(0).ToString Then
                        item.Selected = True
                    End If
                Next
            Next

            LabelStatus.Text = ""
            LabelGridStatus.Text = ""

        Catch ex As Exception
            LabelStatus.Text = "Selected Item Does not exists!"
        End Try

    End Sub

    Protected Sub GridViewCourseSections_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles GridViewCourseSections.RowUpdated
        LabelGridStatus.Text = "Record Updated Successfully!"
    End Sub

    Protected Sub GridViewCourseSections_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridViewCourseSections.RowUpdating
        Try

            Dim row = GridViewCourseSections.Rows(e.RowIndex)

            e.NewValues("StaffID") = DirectCast(row.FindControl("DropDownListStaff"), DropDownList).SelectedValue

        Catch ex As Exception

            LabelStatus.Text = ex.Message

        End Try

    End Sub

End Class
