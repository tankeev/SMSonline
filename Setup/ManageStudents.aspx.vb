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

            For Each GridViewRow As GridViewRow In GridViewStudents.Rows

                Dim StudentID As Guid = GridViewStudents.DataKeys(GridViewRow.RowIndex).Value
                Dim DropDownListSchoolCodes As DropDownList = GridViewRow.FindControl("DropDownListSchoolCodes")
                Dim DropDownListSections As DropDownList = GridViewRow.FindControl("DropDownListSections")
                Dim TextBoxNISN As TextBox = GridViewRow.FindControl("TextBoxNISN")
                Dim TextBoxStudentName As TextBox = GridViewRow.FindControl("TextBoxStudentName")
                Dim newUsername As String = TextBoxNISN.Text.Trim()

                SqlDataSourceStudents.UpdateParameters.Clear()
                SqlDataSourceStudents.UpdateParameters.Add("UserID", StudentID.ToString)
                SqlDataSourceStudents.UpdateParameters.Add("UserName", newUsername)
                SqlDataSourceStudents.UpdateParameters.Add("LoweredUserName", newUsername.ToLower)
                SqlDataSourceStudents.UpdateParameters.Add("StudentName", TextBoxStudentName.Text)
                SqlDataSourceStudents.UpdateParameters.Add("CurrentSectionID", DropDownListSections.SelectedValue)
                SqlDataSourceStudents.UpdateParameters.Add("SchoolCode", DropDownListSchoolCodes.SelectedValue)

                SqlDataSourceStudents.Update()

            Next

            LabelSuccess.Text = "Successfully Done!"

        Catch ex As Exception
            LabelSuccess.Text = ex.Message
        End Try
    End Sub

    'Protected Sub SqlDataSourceStudents_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSourceStudents.Selected
    '    LabelStatus.Text = "Total " & e.AffectedRows.ToString() & " Student(s) Found."
    'End Sub

    Protected Sub GridViewStudents_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewStudents.PreRender

        Dim dvsqllist As DataView = DirectCast(SqlDataSourceStudents.[Select](DataSourceSelectArguments.Empty), DataView)
        ' dvsqllist.RowFilter = SqlDataSourceStudents.FilterExpression
        Dim n As Integer = dvsqllist.Count

        LabelStatus.Text = "Total " & n.ToString & " Student(s) Found."

    End Sub

    Protected Sub ButtonSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSearch.Click
        LabelSuccess.Text = ""
    End Sub
End Class
