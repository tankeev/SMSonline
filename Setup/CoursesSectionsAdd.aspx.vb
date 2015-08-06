
Partial Class Courses_Sections
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonAddCourseSection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddCourseSection.Click

        Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
        Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

        For Each listItem As ListItem In CheckBoxListAddSections.Items
            If listItem.Selected = True Then
                Try
                    SqlDataSourceGridviewCourseSections.InsertParameters.Item("AcademicTermID").DefaultValue = DropDownListAcademicTermsMaster.SelectedValue
                    SqlDataSourceGridviewCourseSections.InsertParameters.Item("StaffID").DefaultValue = DropDownListAddStaff.SelectedValue
                    SqlDataSourceGridviewCourseSections.InsertParameters.Item("CourseCatalogID").DefaultValue = DropDownListAddCourse.SelectedValue
                    SqlDataSourceGridviewCourseSections.InsertParameters.Item("SectionCatalogID").DefaultValue = listItem.Value
                    SqlDataSourceGridviewCourseSections.InsertParameters.Item("SchoolCode").DefaultValue = DropDownListSchoolCodesMaster.SelectedValue

                    SqlDataSourceGridviewCourseSections.Insert()

                    LabelStatus.Text = "Added Successfully!"

                Catch ex As Exception
                    LabelStatus.Text = "Insert Assessment Error:" + ex.Message
                End Try
            End If
        Next
    End Sub

End Class
