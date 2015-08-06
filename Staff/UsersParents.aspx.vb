Imports System.Data.SqlClient
Imports System.Data
Imports System.Web.Configuration

Partial Class Users_Parents
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Staff") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ListBoxParents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxParents.DataBound
        LabelTotal.Text = ListBoxParents.Items.Count.ToString + " Parent(s)"
    End Sub

    Protected Sub FormViewParents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormViewParentsOverview.DataBound, FormViewParentsAdditional.DataBound, FormViewParentsNotes.DataBound
        Try
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")
            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
            Dim FormViewParents As FormView = DirectCast(sender, FormView)

            'Check for its current mode
            If FormViewParents.CurrentMode = FormViewMode.Edit Then

                'Check the RowType to where the Control is placed
                If FormViewParents.Row.RowType = DataControlRowType.DataRow Then

                    Dim ButtonSave As Button = DirectCast(FormViewParents.FindControl("ButtonUpdate"), Button)

                    Dim conStringStudent As String = WebConfigurationManager.ConnectionStrings("SMSOnlineConnectionString").ConnectionString
                    Dim dadStudent As New SqlDataAdapter("SELECT StaffID FROM vw_CourseSections where CourseCategory= 'Guidance' and SchoolCode=" & DropDownListSchoolCodesMaster.SelectedValue & " and AcademicTermID=" & DropDownListAcademicTermsMaster.SelectedValue & " and SectionCatalogID=" & DropDownListSections.SelectedValue & "", conStringStudent)
                    Dim dtblStudent As New DataTable()
                    dadStudent.Fill(dtblStudent)

                    If dtblStudent.Rows.Count > 0 Then
                        If Session("UserID").ToString = Convert.ToString(dtblStudent.Rows.Item(0).Item("StaffID")) Then
                            ButtonSave.Visible = True
                        End If
                    Else
                        ButtonSave.Visible = False
                    End If

                End If

            End If

        Catch ex As Exception
            UCWebMessageBoxParents.Show("Sorry, The Following Error Occured: " & ex.ToString, "Error")
        End Try
    End Sub

    Protected Sub FormViewParents_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewParentsOverview.ItemUpdated, FormViewParentsAdditional.ItemUpdated, FormViewParentsNotes.ItemUpdated
        ' Use the Exception property to determine whether an exception
        ' occurred during the update operation.

        If e.Exception Is Nothing Then

            If e.AffectedRows = 1 Then
                'Record Inserted Successfully.
                LabelStatus.Text = "Updated Successfully!"

                'GridViewStaff.DataBind()
            Else
                LabelStatus.Text = "An error occurred during the insert operation."
            End If
        Else
            LabelStatus.Text = e.Exception.Message
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub FormViewParents_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormViewParentsOverview.ItemUpdating
        e.NewValues("SchoolCode") = DirectCast(DirectCast(sender, FormView).FindControl("SchoolCode"), DropDownList).SelectedValue
    End Sub

    Protected Sub SqlDataSourceListBoxStudents_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSourceListBoxParents.Selecting
        Try

            If CheckBoxSD.Checked = True Then
                e.Command.Parameters("@IsSD").Value = "SD"
            Else
                e.Command.Parameters("@IsSD").Value = ""
            End If

            If CheckBoxSMP.Checked = True Then
                e.Command.Parameters("@IsSMP").Value = "SMP"
            Else
                e.Command.Parameters("@IsSMP").Value = ""
            End If

            If CheckBoxSMA.Checked = True Then
                e.Command.Parameters("@IsSMA").Value = "SMA"
            Else
                e.Command.Parameters("@IsSMA").Value = ""
            End If

            If CheckBoxFilter.Checked = True Then
                SqlDataSourceListBoxParents.FilterExpression = "SectionCatalogID={0}"
            Else
                SqlDataSourceListBoxParents.FilterExpression = ""
            End If

        Catch ex As Exception

            UCWebMessageBoxParents.Show("Sorry, The Following Error Occured: " & ex.ToString, "Error")

        End Try
    End Sub

    Protected Sub CheckBoxSD_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxSD.CheckedChanged
        If CheckBoxSD.Checked = True Then
            SqlDataSourceListBoxParents.SelectParameters("IsSD").DefaultValue = "SD"
        Else
            SqlDataSourceListBoxParents.SelectParameters("IsSD").DefaultValue = ""
        End If
    End Sub

    Protected Sub CheckBoxSMA_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxSMA.CheckedChanged
        If CheckBoxSMA.Checked = True Then
            SqlDataSourceListBoxParents.SelectParameters("IsSMA").DefaultValue = "SMA"
        Else
            SqlDataSourceListBoxParents.SelectParameters("IsSMA").DefaultValue = ""
        End If
    End Sub

    Protected Sub CheckBoxSMP_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxSMP.CheckedChanged

        If CheckBoxSMP.Checked = True Then
            SqlDataSourceListBoxParents.SelectParameters("IsSMP").DefaultValue = "SMP"
        Else
            SqlDataSourceListBoxParents.SelectParameters("IsSMP").DefaultValue = ""
        End If

    End Sub

    Protected Sub CheckBoxFilter_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxFilter.CheckedChanged
        If CheckBoxFilter.Checked = True Then

            DropDownListSections.Enabled = True

            CheckBoxSD.Checked = True
            CheckBoxSD.Enabled = False
            CheckBoxSMP.Checked = True
            CheckBoxSMP.Enabled = False
            CheckBoxSMA.Checked = True
            CheckBoxSMA.Enabled = False

            SqlDataSourceListBoxParents.FilterExpression = "SectionCatalogID={0}"
        Else
            DropDownListSections.Enabled = False

            CheckBoxSD.Enabled = True
            CheckBoxSMP.Enabled = True
            CheckBoxSMA.Enabled = True

            SqlDataSourceListBoxParents.FilterExpression = ""
        End If
    End Sub

    Protected Sub DropDownListSections_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSections.SelectedIndexChanged

        SqlDataSourceListBoxParents.DataBind()
        SqlDataSourceListBoxParents.DataBind()

        LabelStatus.Text = ""
    End Sub
End Class
