Imports System.Data.SqlClient
Imports System.IO

Partial Class NewUserAccount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim filePaths() As String = Directory.GetFiles(Server.MapPath("~/SchoolData/Departments/"))
            Dim files As List(Of ListItem) = New List(Of ListItem)
            For Each filePath As String In filePaths
                files.Add(New ListItem(Path.GetFileName(filePath), filePath))
            Next
            GridViewFileList.DataSource = files
            GridViewFileList.DataBind()
        End If
    End Sub

    Protected Sub UploadFile(ByVal sender As Object, ByVal e As EventArgs) Handles btnUpload.Click
        Try
            Dim fileName As String = Path.GetFileName(FileUploadDepartment.PostedFile.FileName)
            FileUploadDepartment.PostedFile.SaveAs((Server.MapPath("~/SchoolData/Departments/") + fileName))
            Response.Redirect(Request.Url.AbsoluteUri)

        Catch ex As Exception
            LabelTotal.Text = ex.Message
        End Try
    End Sub

    Protected Sub DownloadFile(ByVal sender As Object, ByVal e As EventArgs)
        Try
            Dim filePath As String = CType(sender, ImageButton).CommandArgument
            Response.ContentType = ContentType
            Response.AppendHeader("Content-Disposition", ("attachment; filename=" + Path.GetFileName(filePath)))
            Response.WriteFile(filePath)
            Response.End()

        Catch ex As Exception
            LabelTotal.Text = ex.Message
        End Try
    End Sub


    Protected Sub DeleteFile(ByVal sender As Object, ByVal e As EventArgs)
        Try
            Dim filePath As String = CType(sender, ImageButton).CommandArgument
            File.Delete(filePath)
            Response.Redirect(Request.Url.AbsoluteUri)

        Catch ex As Exception
            LabelTotal.Text = ex.Message
        End Try
    End Sub

End Class
