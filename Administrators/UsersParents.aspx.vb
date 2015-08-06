Imports System.Data.SqlClient
Imports System.Data

Partial Class NewUserAccount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ListBoxParents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxParents.DataBound
        LabelTotal.Text = ListBoxParents.Items.Count.ToString + " Parent(s)"
    End Sub

    Protected Sub FormViewParents_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewParentsOverview.ItemUpdated, FormViewParentsAdditional.ItemUpdated, FormViewParentsNotes.ItemUpdated
        ' Use the Exception property to determine whether an exception
        ' occurred during the update operation.

        If e.Exception Is Nothing Then

            If e.AffectedRows > 0 Then
                'Record Inserted Successfully.

                WebMessageBoxParents.Show("Records Updated Successfully!", "Success")
            Else
                WebMessageBoxParents.Show("An error occurred during the insert operation.", "Error")
            End If
        Else

            WebMessageBoxParents.Show("The following error occured: " & e.Exception.Message, "Error")
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub FormViewParents_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormViewParentsOverview.ItemUpdating
        e.NewValues("SchoolCode") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListSchoolCodes"), DropDownList).SelectedValue
    End Sub

    Protected Sub ListBoxParents_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxParents.SelectedIndexChanged
        LabelStatus.Text = ""
    End Sub

    Protected Sub ButtonSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSearch.Click
        If Trim(TextBoxSearchUser.Text <> "") Then
            SqlDataSourceListBoxParents.FilterExpression = "ResponsibleParent LIKE '{0}%' "
        Else
            SqlDataSourceListBoxParents.FilterExpression = ""
        End If

        ListBoxParents.DataBind()
    End Sub
End Class
