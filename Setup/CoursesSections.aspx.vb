
Partial Class Courses_Sections
    Inherits System.Web.UI.Page

    Dim CourseSectionOldID As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub DropDownListSections_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListCourses.SelectedIndexChanged
        If CheckBoxCourseFilter.Checked = True Then
            SqlDataSourceGridviewCourseSections.FilterExpression = "CourseCategory='" & DropDownListCourses.SelectedValue.ToString & "'"
        Else
            SqlDataSourceGridviewCourseSections.FilterExpression = ""
        End If
        GridviewCourseSections.DataBind()

        LabelStatus.Text = ""
    End Sub

    Protected Sub CheckBoxCourseFilter_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxCourseFilter.CheckedChanged
        If CheckBoxCourseFilter.Checked = True Then
            SqlDataSourceGridviewCourseSections.FilterExpression = "CourseCategory='" & DropDownListCourses.SelectedValue.ToString & "'"
        Else
            SqlDataSourceGridviewCourseSections.FilterExpression = ""
        End If
        GridviewCourseSections.DataBind()
    End Sub

    Protected Sub FormViewCourseSections_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewCourseSections.ItemUpdated
        ' Use the Exception property to determine whether an exception
        ' occurred during the update operation.

        If e.Exception Is Nothing Then

            If e.AffectedRows = 1 Then
                'Record Inserted Successfully.
                LabelStatus.Text = "Updated Successfully!"

                GridviewCourseSections.DataBind()

            Else
                LabelStatus.Text = "An error occurred during the insert operation."
            End If
        Else
            LabelStatus.Text = e.Exception.Message
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub GridviewCourseSections_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridviewCourseSections.SelectedIndexChanged
        LabelStatus.Text = ""
    End Sub

    Protected Sub GridviewCourseSectionsSelectRow(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
        Try

            Dim SenderImageButton As ImageButton = DirectCast(sender, ImageButton)
            Dim GridviewCourseSectionsRow As GridViewRow = DirectCast(SenderImageButton.NamingContainer, GridViewRow)

            GridviewCourseSections.SelectedIndex = GridviewCourseSectionsRow.RowIndex

            MPCourseSections.Show()

        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub

    Protected Sub ButtonCopyCourses_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonCopyCourses.Click

        Try

            Dim DropDownListAcademicTermsMaster As DropDownList = Master.Master.FindControl("DropDownListAcademicTermsMaster")
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.Master.FindControl("DropDownListSchoolCodesMaster")

            For Each MarkRow As GridViewRow In GridviewCourseSections.Rows

                If MarkRow.RowType = DataControlRowType.DataRow Then

                    Dim CourseCatalogID As Label = CType(MarkRow.FindControl("LabelCCID"), Label)
                    Dim SectionCatalogID As Label = CType(MarkRow.FindControl("LabelSCID"), Label)
                    Dim StaffID As Label = CType(MarkRow.FindControl("LabelSID"), Label)
                    Dim CourseSectionID As Label = CType(MarkRow.FindControl("LabelCSID"), Label)

                    CourseSectionOldID = CourseSectionID.Text

                    SqlDataSourceGridviewCourseSections.InsertParameters.Item("AcademicTermID").DefaultValue = DropDownListAcademicTermsTo.SelectedValue
                    'SqlDataSourceGridviewCourseSections.InsertParameters.Item("CourseSectionID").DefaultValue = CourseSectionID.Text
                    SqlDataSourceGridviewCourseSections.InsertParameters.Item("CourseCatalogID").DefaultValue = CourseCatalogID.Text
                    SqlDataSourceGridviewCourseSections.InsertParameters.Item("SectionCatalogID").DefaultValue = SectionCatalogID.Text
                    SqlDataSourceGridviewCourseSections.InsertParameters.Item("StaffID").DefaultValue = StaffID.Text
                    SqlDataSourceGridviewCourseSections.InsertParameters.Item("SchoolCode").DefaultValue = DropDownListSchoolCodesMaster.SelectedValue
                    SqlDataSourceGridviewCourseSections.Insert()

                End If

            Next

            LabelStatus.Text = "Inserted Successfully!"

        Catch ex As Exception

            LabelStatus.Text = "Copy Course Error: " + ex.Message

        End Try

    End Sub

    Protected Sub SqlDataSourceGridviewCourseSections_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSourceGridviewCourseSections.Inserted
        Try
            SqlDataSourceCourseSectionsAssessmentTypes.FilterExpression = "CourseSectionID = '" & CourseSectionOldID & "'"

            Dim AssessmentTypes As New GridView
            AssessmentTypes.DataSource = SqlDataSourceCourseSectionsAssessmentTypes
            AssessmentTypes.DataBind()

            If Not AssessmentTypes.Rows.Count = 0 Then

                For Each AssessmentTypesRow As GridViewRow In AssessmentTypes.Rows

                    If AssessmentTypesRow.RowType = DataControlRowType.DataRow Then

                        SqlDataSourceCourseSectionsAssessmentTypes.InsertParameters.Clear()
                        SqlDataSourceCourseSectionsAssessmentTypes.InsertParameters.Add("CourseSectionID", e.Command.Parameters("@LastAddedID").Value)
                        SqlDataSourceCourseSectionsAssessmentTypes.InsertParameters.Add("AssessmentTypeID", AssessmentTypesRow.Cells(2).Text)
                        SqlDataSourceCourseSectionsAssessmentTypes.InsertParameters.Add("Description", AssessmentTypesRow.Cells(3).Text)
                        SqlDataSourceCourseSectionsAssessmentTypes.InsertParameters.Add("Percentage", AssessmentTypesRow.Cells(4).Text)
                        SqlDataSourceCourseSectionsAssessmentTypes.Insert()

                    End If
                Next

            End If

            SqlDataSourceCourseSectionsAssessmentTypes.FilterExpression = ""

        Catch ex As Exception
            LabelStatus.Text = "Add Assessment Types Error:" + ex.Message
        End Try
    End Sub

End Class
