Imports System.Web.Configuration
Imports System.Data.SqlClient
Imports System.Data

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim UserID As String = Membership.GetUser().ProviderUserKey.ToString()

        Session("UserID") = UserID

        ''SESSION INFORMATION ================================================================
        'Dim conStringSettings As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
        'Dim dadSettings As New SqlDataAdapter("SELECT * FROM tbl_GlobalSettings ", conStringSettings)
        'Dim dtblSettings As New DataTable()
        'dadSettings.Fill(dtblSettings)

        'Session("AcademicTermID") = dtblSettings.Rows.Item(0).Item("AcademicTermID")

    End Sub
End Class
