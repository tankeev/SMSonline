Partial Class ManageUsers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub FormViewAttendanceTypes_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormViewAttendanceTypes.ItemInserted
        If e.Exception Is Nothing Then
            If e.AffectedRows > 0 Then
                'Record Inserted Successfully.

                'GridViewSchools.DataBind()

                LabelStatus.Text = "Added Successfully!"
            Else

                LabelStatus.Text = "An error occurred during the insert operation."
                e.KeepInInsertMode = True

                GridViewAttendanceTypes.DataBind()
            End If
        Else

            LabelStatus.Text = e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInInsertMode = True
        End If
    End Sub
End Class
