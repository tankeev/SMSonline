
Partial Class Courses
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub FormViewAcademicTerms_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewCourses.ItemInserted
        ' Use the Exception property to determine whether an exception
        ' occurred during the insert operation.
        If e.Exception Is Nothing Then

            ' Use the AffectedRows property to determine whether the
            ' record was inserted. Sometimes an error might occur that 
            ' does not raise an exception, but prevents the insert
            ' operation from completing.
            If e.AffectedRows = 1 Then

                LabelStatus.Text = "Record inserted successfully."

            Else

                LabelStatus.Text = "An error occurred during the insert operation."

                ' Use the KeepInInsertMode property to remain in insert mode
                ' when an error occurs during the insert operation.
                e.KeepInInsertMode = True

            End If

        Else

            ' Insert the code to handle the exception.
            LabelStatus.Text = e.Exception.Message

            ' Use the ExceptionHandled property to indicate that the 
            ' exception has already been handled.
            e.ExceptionHandled = True
            e.KeepInInsertMode = True

        End If

        'GridViewCourseUnitsTitles.DataBind()
    End Sub

    Protected Sub ButtonUpdateAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAll.Click
        Try

            For Each GridViewRow As GridViewRow In GridViewCourseCatalog.Rows

                Dim CourseCatalogID As Integer = GridViewCourseCatalog.DataKeys(GridViewRow.RowIndex).Value
                Dim DropDownListCourseCategories As DropDownList = GridViewRow.FindControl("DropDownListCourseCategories")
                Dim TextBoxCourseCode As TextBox = GridViewRow.FindControl("TextBoxCourseCode")
                Dim TextBoxPeriods As TextBox = GridViewRow.FindControl("TextBoxPeriods")
                Dim TextBoxCourseCategory As TextBox = GridViewRow.FindControl("TextBoxCourseCategory")
                Dim CheckBoxIsAcademic As CheckBox = GridViewRow.FindControl("CheckBoxIsAcademic")

                SqlDataSourceCourseCatalog.UpdateParameters.Clear()
                SqlDataSourceCourseCatalog.UpdateParameters.Add("CourseCode", TextBoxCourseCode.Text)
                SqlDataSourceCourseCatalog.UpdateParameters.Add("NumberofPeriods", TextBoxPeriods.Text)
                SqlDataSourceCourseCatalog.UpdateParameters.Add("CourseCatalog", TextBoxCourseCategory.Text)
                SqlDataSourceCourseCatalog.UpdateParameters.Add("CourseCategoryID", DropDownListCourseCategories.SelectedValue)
                SqlDataSourceCourseCatalog.UpdateParameters.Add("IsAcademic", CheckBoxIsAcademic.Checked)
                SqlDataSourceCourseCatalog.UpdateParameters.Add("CourseCatalogID", CourseCatalogID)

                SqlDataSourceCourseCatalog.Update()

            Next

            [LabelStatus].Text = "Successfully Done!"

        Catch ex As Exception
            [LabelStatus].Text = ex.Message
        End Try
    End Sub

    Protected Sub DropDownListCourseCategories_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListCourseCategories.SelectedIndexChanged
        LabelStatus.Text = ""
    End Sub
End Class
