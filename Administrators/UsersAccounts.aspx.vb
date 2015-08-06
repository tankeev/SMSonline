Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Data

Partial Class ManageUsers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonUpdateAllParents_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAllParents.Click
        Try

            For Each GridViewRow As GridViewRow In GridviewParents.Rows

                Dim ResponsibleParentID As Guid = GridviewParents.DataKeys(GridViewRow.RowIndex).Value
                Dim DropDownListGender As DropDownList = GridViewRow.FindControl("DropDownListGender")
                Dim TextBoxUserName As TextBox = GridViewRow.FindControl("TextBoxUserName")
                Dim TextBoxResponsibleParent As TextBox = GridViewRow.FindControl("TextBoxResponsibleParent")
                Dim newUsername As String = TextBoxUserName.Text.Trim()

                SqlDataSourceParents.UpdateParameters.Clear()
                SqlDataSourceParents.UpdateParameters.Add("ResponsibleParentID", ResponsibleParentID.ToString)
                SqlDataSourceParents.UpdateParameters.Add("ResponsibleParent", TextBoxResponsibleParent.Text)
                SqlDataSourceParents.UpdateParameters.Add("UserName", newUsername)
                SqlDataSourceParents.UpdateParameters.Add("LoweredUserName", newUsername.ToLower)
                SqlDataSourceParents.UpdateParameters.Add("ResponsibleParentGender", DropDownListGender.SelectedValue)

                SqlDataSourceParents.Update()

            Next

            LabelStatusParents.Text = "Successfully Done!"

        Catch ex As Exception
            LabelStatusParents.Text = ex.Message
        End Try
    End Sub

    Protected Sub ButtonUpdateAllStudents_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAllStudents.Click
        Try

            For Each GridViewRow As GridViewRow In GridviewStudents.Rows

                Dim StudentID As Guid = GridviewStudents.DataKeys(GridViewRow.RowIndex).Value
                Dim DropDownListGender As DropDownList = GridViewRow.FindControl("DropDownListGender")
                Dim TextBoxUserName As TextBox = GridViewRow.FindControl("TextBoxUserName")
                Dim TextBoxStudentName As TextBox = GridViewRow.FindControl("TextBoxStudentName")
                Dim newUsername As String = TextBoxUserName.Text.Trim()

                SqlDataSourceStudents.UpdateParameters.Clear()
                SqlDataSourceStudents.UpdateParameters.Add("StudentID", StudentID.ToString)
                SqlDataSourceStudents.UpdateParameters.Add("StudentName", TextBoxStudentName.Text)
                SqlDataSourceStudents.UpdateParameters.Add("UserName", newUsername)
                SqlDataSourceStudents.UpdateParameters.Add("LoweredUserName", newUsername.ToLower)
                SqlDataSourceStudents.UpdateParameters.Add("Gender", DropDownListGender.SelectedValue)

                SqlDataSourceStudents.Update()

            Next

            LabelStatusStudents.Text = "Successfully Done!"

        Catch ex As Exception
            LabelStatusStudents.Text = ex.Message
        End Try
    End Sub

    Protected Sub ButtonUpdateAllStaff_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateAllStaff.Click
        Try

            For Each GridViewRow As GridViewRow In GridviewStaff.Rows

                Dim StaffID As Guid = GridviewStaff.DataKeys(GridViewRow.RowIndex).Value
                Dim DropDownListGender As DropDownList = GridViewRow.FindControl("DropDownListGender")
                Dim TextBoxUserName As TextBox = GridViewRow.FindControl("TextBoxUserName")
                Dim TextBoxStaffName As TextBox = GridViewRow.FindControl("TextBoxStaffName")
                Dim newUsername As String = TextBoxUserName.Text.Trim()

                SqlDataSourceStaff.UpdateParameters.Clear()
                SqlDataSourceStaff.UpdateParameters.Add("StaffID", StaffID.ToString)
                SqlDataSourceStaff.UpdateParameters.Add("StaffName", TextBoxStaffName.Text)
                SqlDataSourceStaff.UpdateParameters.Add("UserName", newUsername)
                SqlDataSourceStaff.UpdateParameters.Add("LoweredUserName", newUsername.ToLower)
                SqlDataSourceStaff.UpdateParameters.Add("Gender", DropDownListGender.SelectedValue)

                SqlDataSourceStaff.Update()

            Next

            LabelStatusStaff.Text = "Successfully Done!"

        Catch ex As Exception
            LabelStatusStaff.Text = ex.Message
        End Try
    End Sub

End Class
