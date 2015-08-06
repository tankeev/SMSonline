
Partial Class UserList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Coordinator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub GridViewStudents_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridViewClassesTeachers.RowUpdating
        e.NewValues("StaffID") = DirectCast(GridViewClassesTeachers.Rows(e.RowIndex).FindControl("DropDownListStaff"), DropDownList).SelectedValue
    End Sub

    Protected Sub GridViewUpdateEventHandler(ByVal sender As [Object], ByVal e As GridViewUpdatedEventArgs)
        If e.Exception IsNot Nothing Then
            'etc
            WebMessageBoxAdvisors.Show("An error occurred during the insert operation.", "Error")
        Else
            WebMessageBoxAdvisors.Show("Records Updated Successfully!", "Success")
        End If
    End Sub

    Protected Sub FormViewClassMentors_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewClassMentors.ItemInserted

        ' Use the Exception property to determine whether an exception
        ' occurred during the update operation.

        'If e.Exception Is Nothing Then

        '    If e.AffectedRows > 0 Then
        '        'Record Inserted Successfully.

        '        'LabelTotal.Text = "Records Inserted Successfully!"

        '        WebMessageBoxAdvisors.Show("Records Updated Successfully!", "Success")
        '    Else
        '        WebMessageBoxAdvisors.Show("An error occurred during the insert operation.", "Error")
        '    End If
        'Else

        '    WebMessageBoxAdvisors.Show("An error occurred during the insert operation.", "Error")

        '    e.ExceptionHandled = True
        'End If
    End Sub

    Protected Sub FormViewClassMentors_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormViewClassMentors.ItemInserting
        e.Values("StaffID") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListStaff"), DropDownList).SelectedValue
        e.Values("SectionCatalogID") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListSections"), DropDownList).SelectedValue
    End Sub

    Protected Sub ButtonUpdateAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAll.Click
        Try
            For Each GridViewClassesTeachersRow As GridViewRow In GridViewClassesTeachers.Rows
                Dim DropDownListStaff As DropDownList = GridViewClassesTeachersRow.FindControl("DropDownListStaff")
                Dim CheckBoxSign As CheckBox = GridViewClassesTeachersRow.FindControl("CheckBoxSign")
                Dim LabelSMID As Label = GridViewClassesTeachersRow.FindControl("LabelSMID")

                SqlDataSourceClassesTeachers.UpdateParameters.Clear()
                SqlDataSourceClassesTeachers.UpdateParameters.Add("SectionMentorID", LabelSMID.Text)
                SqlDataSourceClassesTeachers.UpdateParameters.Add("StaffID", DropDownListStaff.SelectedValue.ToString)
                SqlDataSourceClassesTeachers.UpdateParameters.Add("IsDefault", CheckBoxSign.Checked)
                SqlDataSourceClassesTeachers.Update()
            Next
            WebMessageBoxAdvisors.Show("Records Updated Successfully!", "Success")
        Catch ex As Exception
            WebMessageBoxAdvisors.Show("An error occurred during the insert operation.", "Error")
        End Try

    End Sub
End Class
