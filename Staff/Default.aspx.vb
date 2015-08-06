Imports System.Web.Configuration
Imports System.Data.SqlClient
Imports System.Data

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Staff") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    'Protected Overrides Function DeterminePostBackMode() As System.Collections.Specialized.NameValueCollection

    '    Try
    '        Return MyBase.DeterminePostBackMode()

    '        '            do the handling here

    '        UCWebMessageBoxDefault.Show("Sorry, An Error Occured while Saving! (1)", "Error")

    '    Catch ex As HttpRequestValidationException
    '        'UCWebMessageBoxDefault.Show("Sorry, An Error Occured while Saving! (2)", "Error")
    '    End Try

    '    Return Nothing

    'End Function

    Protected Sub FormViewHelpDesk_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewHelpDesk.ItemInserted

        If e.Exception Is Nothing Then
            If e.AffectedRows > 0 Then
                'Record Inserted Successfully.
                UCWebMessageBoxDefault.Show("Your Message has been received successfully!", "Success")
            Else
                UCWebMessageBoxDefault.Show("Sorry, An Error Occured while Saving!", "Error")
                e.KeepInInsertMode = True
            End If
        Else
            UCWebMessageBoxDefault.Show("Sorry, The Following Error Occured: " & e.Exception.Message, "Error")
            e.ExceptionHandled = True
            e.KeepInInsertMode = True
        End If

    End Sub

    Protected Sub FormViewHelpDesk_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormViewHelpDesk.ItemInserting
        Try

            e.Values("UserID") = Session("UserID").ToString
            e.Values("Date") = Date.Today.ToString
            e.Values("IsActive") = 1

        Catch ex As Exception
            UCWebMessageBoxDefault.Show("Sorry, The Following Error Occured: " & ex.ToString, "Error")
        End Try
    End Sub
End Class
