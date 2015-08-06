Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Data

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Public Sub ConStringsEncryption()
        Try

            ' Config dosyasını aç        
            Dim config As Configuration = WebConfigurationManager.OpenWebConfiguration("~")

            ' ConnectionStrings tagına ulaş        
            Dim connectionStringsSection As ConnectionStringsSection = DirectCast(config.GetSection("connectionStrings"), ConnectionStringsSection)

            If Not connectionStringsSection.SectionInformation.IsProtected Then
                ' Daha önce şifrelenip şifrelenmediği kontrol ediliyor                
                '            * * Eğer daha önce şifrelenmediyse bu süslü parantezler içerisine girilir ve şifrelenme yapılır
                connectionStringsSection.SectionInformation.ProtectSection("DataProtectionConfigurationProvider")
            End If

            ' Config dosyasını kaydet   
            config.Save()

            LabelStatus.Text = "Done!"

        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try

    End Sub

    'Public Sub ConStringsDecryption()

    '    ' Config dosyasını aç     
    '    Dim config As Configuration = WebConfigurationManager.OpenWebConfiguration("~")

    '    ' ConnectionStrings tagına ulaş       
    '    Dim connectionStringsSection As ConnectionStringsSection = DirectCast(config.GetSection("connectionStrings"), ConnectionStringsSection)

    '    If connectionStringsSection.SectionInformation.IsProtected Then
    '        ' Daha önce şifrelenip şifrelenmediği kontrol ediliyor             
    '        '          * * Eğer daha önce şifrelendiyse bu süslü parantezler içerisine girilir ve şifrelenme çözülür          
    '        connectionStringsSection.SectionInformation.UnprotectSection()
    '    End If

    '    ' Config dosyasını kaydet   
    '    config.Save()

    '    LabelStatus.Text = "Done!"
    'End Sub

    Protected Sub ButtonEncyrpt_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonEncyrpt.Click
        ConStringsEncryption()
    End Sub
End Class
