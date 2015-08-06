Imports System.Web.Configuration
Imports System.Data.SqlClient
Imports System.Data

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Trainee") Then
            Response.Redirect("~/Warning.aspx")
        End If

        Dim UserID As String = Membership.GetUser().ProviderUserKey.ToString()

        Session("UserID") = UserID

        'SESSION INFORMATION ================================================================
        Dim conStringSettings As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
        Dim dadSettings As New SqlDataAdapter("SELECT * FROM tbl_GlobalSettings ", conStringSettings)
        Dim dtblSettings As New DataTable()
        dadSettings.Fill(dtblSettings)

        Session("AcademicTermID") = dtblSettings.Rows.Item(0).Item("AcademicTermID")

    End Sub

    Protected Sub FormViewHelpDesk_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewHelpDesk.ItemInserted
        If e.Exception Is Nothing Then
            If e.AffectedRows > 0 Then
                'Record Inserted Successfully.
                LabelHelpDeskStatus.Text = "Thank you, Message Has Been Sent!"
            Else
                LabelHelpDeskStatus.Text = "An error occurred!"
                e.KeepInInsertMode = True
            End If
        Else
            LabelHelpDeskStatus.Text = e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInInsertMode = True
        End If
    End Sub

    Protected Sub FormViewHelpDesk_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormViewHelpDesk.ItemInserting
        e.Values("UserID") = Session("UserID").ToString
        e.Values("Date") = Date.Today.ToString
        e.Values("IsActive") = 1
    End Sub
End Class
