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

            For Each GridViewRow As GridViewRow In GridViewParents.Rows

                Dim ResponsibleParentID As Guid = GridViewParents.DataKeys(GridViewRow.RowIndex).Value
                Dim DropDownListSchoolCodes As DropDownList = GridViewRow.FindControl("DropDownListSchoolCodes")
                Dim CheckBoxContinue As CheckBox = GridViewRow.FindControl("CheckBoxContinue")
                Dim TextBoxUserName As TextBox = GridViewRow.FindControl("TextBoxUserName")
                Dim TextBoxFatherName As TextBox = GridViewRow.FindControl("TextBoxFatherName")
                Dim TextBoxMotherName As TextBox = GridViewRow.FindControl("TextBoxMotherName")
                Dim newUsername As String = TextBoxUsername.Text.Trim()

                SqlDataSourceParents.UpdateParameters.Clear()
                SqlDataSourceParents.UpdateParameters.Add("ResponsibleParentID", ResponsibleParentID.ToString)
                SqlDataSourceParents.UpdateParameters.Add("UserName", newUsername)
                SqlDataSourceParents.UpdateParameters.Add("LoweredUserName", newUsername.ToLower)
                SqlDataSourceParents.UpdateParameters.Add("Continue", CheckBoxContinue.Checked)
                SqlDataSourceParents.UpdateParameters.Add("FatherName", TextBoxFatherName.Text)
                SqlDataSourceParents.UpdateParameters.Add("MotherName", TextBoxMotherName.Text)
                SqlDataSourceParents.UpdateParameters.Add("SchoolCode", DropDownListSchoolCodes.SelectedValue)

                SqlDataSourceParents.Update()

            Next

            LabelSuccess.Text = "Successfully Done!"

        Catch ex As Exception
            LabelSuccess.Text = ex.Message
        End Try
    End Sub

    Protected Sub GridViewStudents_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewParents.PreRender

        Dim dvsqllist As DataView = DirectCast(SqlDataSourceParents.[Select](DataSourceSelectArguments.Empty), DataView)
        ' dvsqllist.RowFilter = SqlDataSourceStudents.FilterExpression
        Dim n As Integer = dvsqllist.Count

        LabelStatus.Text = "Total " & n.ToString & " Parent(s) Found."

    End Sub

    Protected Sub ButtonSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSearch.Click
        LabelSuccess.Text = ""
    End Sub
End Class
