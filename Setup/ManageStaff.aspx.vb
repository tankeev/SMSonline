Imports System.Data

Partial Class Courses
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ButtonUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdate.Click

        Try

            For Each GridViewRow As GridViewRow In GridViewStaff.Rows

                Dim StaffID As Guid = GridViewStaff.DataKeys(GridViewRow.RowIndex).Value
                Dim DropDownListSchoolCodes As DropDownList = GridViewRow.FindControl("DropDownListSchoolCodes")

                Dim TextBoxUsername As TextBox = GridViewRow.FindControl("TextBoxUsername")
                Dim TextBoxStaffName As TextBox = GridViewRow.FindControl("TextBoxStaffName")
                Dim newUsername As String = TextBoxUsername.Text.Trim()

                SqlDataSourceStaff.UpdateParameters.Clear()
                SqlDataSourceStaff.UpdateParameters.Add("UserID", StaffID.ToString)
                SqlDataSourceStaff.UpdateParameters.Add("UserName", newUsername)
                SqlDataSourceStaff.UpdateParameters.Add("LoweredUserName", newUsername.ToLower)
                SqlDataSourceStaff.UpdateParameters.Add("StaffName", TextBoxStaffName.Text)
                SqlDataSourceStaff.UpdateParameters.Add("SchoolCode", DropDownListSchoolCodes.SelectedValue)

                SqlDataSourceStaff.Update()

            Next

            LabelSuccess.Text = "Successfully Done!"

        Catch ex As Exception
            LabelSuccess.Text = ex.Message
        End Try
    End Sub

    'Protected Sub SqlDataSourceStudents_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSourceStudents.Selected
    '    LabelStatus.Text = "Total " & e.AffectedRows.ToString() & " Student(s) Found."
    'End Sub

    Protected Sub GridViewStudents_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewStaff.PreRender

        Dim dvsqllist As DataView = DirectCast(SqlDataSourceStaff.[Select](DataSourceSelectArguments.Empty), DataView)
        ' dvsqllist.RowFilter = SqlDataSourceStudents.FilterExpression
        Dim n As Integer = dvsqllist.Count

        LabelStatus.Text = "Total " & n.ToString & " Staff Found."

    End Sub

    Protected Sub ButtonSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSearch.Click
        LabelSuccess.Text = ""
    End Sub
End Class
