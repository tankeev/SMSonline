Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Partial Class Staff
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("CoordinatorSD") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ListBoxStaff_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxStaff.SelectedIndexChanged
        Try
            If ListBoxStaff.Items.Count > 0 Then

                FormViewStaffOverview.DataBind()
                FormViewStaffAdditional.DataBind()
                FormViewStaffAcademic.DataBind()

                CheckBoxListRoles.DataBind()

                Dim dv As New System.Data.DataView
                Dim dt As New System.Data.DataTable

                dv = SqlDataSourceRolesEdit.Select(DataSourceSelectArguments.Empty)
                dt = dv.ToTable()

                For Each item As ListItem In CheckBoxListRoles.Items

                    For Each dr As Data.DataRow In dt.Rows

                        If item.Value = dr.Item(1).ToString Then
                            item.Selected = True
                        End If

                    Next
                Next
            End If

            LabelTotal.Text = ListBoxStaff.Items.Count.ToString + " Staff"

        Catch ex As Exception
            WebMessageBoxStaff.Show("The following error occured: " & ex.Message, "Error")
        End Try

    End Sub

    Protected Sub FormViewStaff_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormViewStaffAdditional.ItemUpdating
        e.NewValues("BloodType") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListBloodType"), DropDownList).SelectedValue
    End Sub

    Protected Sub FormViewStaffOverview_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormViewStaffOverview.ItemUpdating
        e.NewValues("SchoolCode") = DirectCast(DirectCast(sender, FormView).FindControl("SchoolCode"), DropDownList).SelectedValue
        e.NewValues("MaritalStatus") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListMaritalStatus"), DropDownList).SelectedValue
        e.NewValues("Gender") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListGender"), DropDownList).SelectedValue
    End Sub

    Protected Sub FormViewStudents_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewStaffOverview.ItemUpdated, FormViewStaffAdditional.ItemUpdated, FormViewStaffAcademic.ItemUpdated

        ' Use the Exception property to determine whether an exception
        ' occurred during the update operation.

        If e.Exception Is Nothing Then

            If e.AffectedRows > 0 Then
                'Record Inserted Successfully.

                WebMessageBoxStaff.Show("Records Updated Successfully!", "Success")
            Else
                WebMessageBoxStaff.Show("An error occurred during the insert operation.", "Error")
            End If
        Else

            WebMessageBoxStaff.Show("The following error occured: " & e.Exception.Message, "Error")
            e.ExceptionHandled = True
        End If

    End Sub

    Protected Sub UpdateRoles_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpdateRoles.Click
        Try
            For Each item As ListItem In CheckBoxListRoles.Items
                If item.Selected = True Then
                    SqlDataSourceRolesEdit.UpdateParameters.Clear()
                    SqlDataSourceRolesEdit.UpdateParameters.Add("UserID", ListBoxStaff.SelectedValue.ToString)
                    SqlDataSourceRolesEdit.UpdateParameters.Add("RoleID", item.Value)
                    SqlDataSourceRolesEdit.Update()
                ElseIf item.Selected = False Then
                    SqlDataSourceRolesEdit.DeleteParameters.Clear()
                    SqlDataSourceRolesEdit.DeleteParameters.Add("UserID", ListBoxStaff.SelectedValue.ToString)
                    SqlDataSourceRolesEdit.DeleteParameters.Add("RoleID", item.Value)
                    SqlDataSourceRolesEdit.Delete()
                End If
            Next
            WebMessageBoxStaff.Show("Records Updated Successfully!", "Success")
        Catch ex As Exception
            WebMessageBoxStaff.Show("The following error occured: " & ex.Message, "Error")
        End Try
    End Sub

    Protected Sub ButtonUploadPhoto_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim FileUploadPhoto As FileUpload = FormViewStaffOverview.FindControl("FileUploadPhoto")
        Dim LabelStatusPhoto As Label = FormViewStaffOverview.FindControl("LabelStatusPhoto")
        Dim TextBoxPhotoURL As TextBox = FormViewStaffOverview.FindControl("TextBoxPhotoURL")
        Dim ImagePhoto As Image = FormViewStaffOverview.FindControl("ImagePhoto")

        If FileUploadPhoto.HasFile Then
            Try
                If FileUploadPhoto.PostedFile.ContentType = "image/jpeg" Or FileUploadPhoto.PostedFile.ContentType = "image/png" Or FileUploadPhoto.PostedFile.ContentType = "image/gif" Or FileUploadPhoto.PostedFile.ContentType = "image/bmp" Then

                    If FileUploadPhoto.PostedFile.ContentLength < 512000 Then

                        Dim filename As String = Path.GetFileName(FileUploadPhoto.FileName)

                        FileUploadPhoto.SaveAs(Server.MapPath("~/SchoolData/UploadedPhotos/") & filename)

                        TextBoxPhotoURL.Text = filename

                        ImagePhoto.ImageUrl = "~/SchoolData/UploadedPhotos/" & filename

                        LabelStatusPhoto.Text = "Upload Status: File uploaded!"

                    Else
                        LabelStatusPhoto.Text = "Upload Status: The file has to be less than 500 kb!"
                    End If
                Else
                    LabelStatusPhoto.Text = "Upload Status: Only JPEG, PNG, GIF, BMP files are accepted!"
                End If
            Catch ex As Exception
                LabelStatusPhoto.Text = "Upload Status: The file could not be uploaded. The following error occured: " + ex.Message
            End Try
        End If
    End Sub

End Class
