Imports System.Data.SqlClient
Imports System.IO

Partial Class EditProfile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserID") Is Nothing Then
            Response.Redirect("Default.aspx")
        End If

        If User.IsInRole("Student") Or User.IsInRole("StudentSD") Then
            PanelStudents.Visible = True

        ElseIf User.IsInRole("Staff") Or User.IsInRole("StaffSD") Or User.IsInRole("Trainee") Then
            PanelStaff.Visible = True

        Else
            PaneNoProfile.Visible = True
        End If
    End Sub

    Protected Sub FormViewStudents_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewStudents.ItemUpdated

        ' Use the Exception property to determine whether an exception
        ' occurred during the update operation.

        If e.Exception Is Nothing Then

            If e.AffectedRows > 0 Then
                'Record Inserted Successfully.
                LabelStatus.Text = "Updated Successfully!"
            Else
                LabelStatus.Text = "An error occurred during the insert operation."
            End If
        Else
            LabelStatus.Text = e.Exception.Message
            e.ExceptionHandled = True
        End If

    End Sub

    Protected Sub FormViewStaff_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewStaff.ItemUpdated
        ' Use the Exception property to determine whether an exception
        ' occurred during the update operation.

        If e.Exception Is Nothing Then

            If e.AffectedRows > 0 Then
                'Record Inserted Successfully.
                LabelStatus.Text = "Updated Successfully!"
            Else
                LabelStatus.Text = "An error occurred during the insert operation."
            End If
        Else
            LabelStatus.Text = e.Exception.Message
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub ButtonUpdateStaff_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim FileUploadPhoto As FileUpload = FormViewStaff.FindControl("FileUploadPhotoStaff")
        Dim LabelStatusPhoto As Label = FormViewStaff.FindControl("LabelStatusPhotoStaff")
        Dim TextBoxPhotoURL As TextBox = FormViewStaff.FindControl("TextBoxPhotoURLStaff")
        Dim ImagePhoto As Image = FormViewStaff.FindControl("ImagePhotoStaff")

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

    Protected Sub ButtonUpdateStudent_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim FileUploadPhoto As FileUpload = FormViewStudents.FindControl("FileUploadPhotoStudent")
        Dim LabelStatusPhoto As Label = FormViewStudents.FindControl("LabelStatusPhotoStudent")
        Dim TextBoxPhotoURL As TextBox = FormViewStudents.FindControl("TextBoxPhotoURLStudent")
        Dim ImagePhoto As Image = FormViewStudents.FindControl("ImagePhotoStudent")

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
