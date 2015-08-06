Imports System.Data.SqlClient

Partial Class CoursesUnitsTitles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub FormViewCourses_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewCourses.ItemInserted
        ' Use the Exception property to determine whether an exception
        ' occurred during the insert operation.
        If e.Exception Is Nothing Then

            ' Use the AffectedRows property to determine whether the
            ' record was inserted. Sometimes an error might occur that 
            ' does not raise an exception, but prevents the insert
            ' operation from completing.
            If e.AffectedRows = 1 Then

                LabelCoursesStatus.Text = "Record inserted successfully."

            Else

                LabelCoursesStatus.Text = "An error occurred during the insert operation."

                ' Use the KeepInInsertMode property to remain in insert mode
                ' when an error occurs during the insert operation.
                e.KeepInInsertMode = True

            End If

        Else

            ' Insert the code to handle the exception.
            LabelCoursesStatus.Text = e.Exception.Message

            ' Use the ExceptionHandled property to indicate that the 
            ' exception has already been handled.
            e.ExceptionHandled = True
            e.KeepInInsertMode = True

        End If
    End Sub

    Protected Sub FormViewCourseUnits_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewCourseUnits.ItemInserted

        ' Use the Exception property to determine whether an exception
        ' occurred during the insert operation.
        If e.Exception Is Nothing Then

            ' Use the AffectedRows property to determine whether the
            ' record was inserted. Sometimes an error might occur that 
            ' does not raise an exception, but prevents the insert
            ' operation from completing.
            If e.AffectedRows = 1 Then

                LabelUnitStatus.Text = "Record inserted successfully."

            Else

                LabelUnitStatus.Text = "An error occurred during the insert operation."

                ' Use the KeepInInsertMode property to remain in insert mode
                ' when an error occurs during the insert operation.
                e.KeepInInsertMode = True

            End If

        Else

            ' Insert the code to handle the exception.
            LabelUnitStatus.Text = e.Exception.Message

            ' Use the ExceptionHandled property to indicate that the 
            ' exception has already been handled.
            e.ExceptionHandled = True
            e.KeepInInsertMode = True

        End If

        'GridViewCoursesUnits.DataBind()
    End Sub

    Protected Sub FormViewUnitTitles_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewUnitTitles.ItemInserted
        ' Use the Exception property to determine whether an exception
        ' occurred during the insert operation.
        If e.Exception Is Nothing Then

            ' Use the AffectedRows property to determine whether the
            ' record was inserted. Sometimes an error might occur that 
            ' does not raise an exception, but prevents the insert
            ' operation from completing.
            If e.AffectedRows = 1 Then

                LabelTitleStatus.Text = "Record inserted successfully."

            Else

                LabelTitleStatus.Text = "An error occurred during the insert operation."

                ' Use the KeepInInsertMode property to remain in insert mode
                ' when an error occurs during the insert operation.
                e.KeepInInsertMode = True

            End If

        Else

            ' Insert the code to handle the exception.
            LabelTitleStatus.Text = e.Exception.Message

            ' Use the ExceptionHandled property to indicate that the 
            ' exception has already been handled.
            e.ExceptionHandled = True
            e.KeepInInsertMode = True

        End If

        'GridViewCourseUnitsTitles.DataBind()
    End Sub

    Protected Sub GridViewCoursesUnits_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewCoursesUnits.DataBound
        If GridViewCoursesUnits.Rows.Count > 0 Then
            GridViewCoursesUnits.SelectedIndex = 0
        End If
    End Sub

    Protected Sub ButtonUpdateCourses_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateCourses.Click
        Try
            For Each GridViewRow As GridViewRow In GridViewCourses.Rows

                Dim CourseCategoryID As Integer = Convert.ToInt32(GridViewCourses.DataKeys(GridViewRow.RowIndex).Value)
                Dim TextBoxCode As TextBox = GridViewRow.FindControl("TextBoxCode")
                Dim TextBoxOrder As TextBox = GridViewRow.FindControl("TextBoxOrder")
                Dim TextBoxCourse As TextBox = GridViewRow.FindControl("TextBoxCourse")
                Dim TextBoxGroup As TextBox = GridViewRow.FindControl("TextBoxGroup")
                Dim CheckBoxIsChild As CheckBox = GridViewRow.FindControl("CheckBoxIsChild")
                Dim TextBoxGroupName As TextBox = GridViewRow.FindControl("TextBoxGroupName")

                SqlDataSourceCourses.UpdateParameters.Clear()

                SqlDataSourceCourses.UpdateParameters.Add("CourseGroupName", TextBoxGroupName.Text)
                SqlDataSourceCourses.UpdateParameters.Add("CourseCategoryID", CourseCategoryID)
                SqlDataSourceCourses.UpdateParameters.Add("CourseGroupingID", TextBoxGroup.Text)
                SqlDataSourceCourses.UpdateParameters.Add("CourseCategoryCode", TextBoxCode.Text)
                SqlDataSourceCourses.UpdateParameters.Add("CourseReportOrder", TextBoxOrder.Text)
                SqlDataSourceCourses.UpdateParameters.Add("CourseCategory", TextBoxCourse.Text)
                SqlDataSourceCourses.UpdateParameters.Add("CourseGroupingIsChild", CheckBoxIsChild.Checked)

                SqlDataSourceCourses.Update()

            Next

            GridViewCourses.DataBind()

        Catch ex As Exception
            LabelCoursesStatus.Text = "Update Error: " + ex.Message
        End Try
    End Sub
End Class
