Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Data

Partial Class NewUserAccount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("StaffSD") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub ListBoxStudents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxStudents.DataBound
        Try

            If ListBoxStudents.Items.Count > 0 Then

                'ListBoxStudents.SelectedIndex = 0

                FormViewStudentsBasicInformation.DataBind()
                FormViewStudentsAdditionalInformation.DataBind()
                FormViewStudentsEnrollmentDetails.DataBind()
                FormViewParentsGuardianDetails.DataBind()
                FormViewParentsParentsInformation.DataBind()

            End If

            LabelTotal.Text = ListBoxStudents.Items.Count.ToString + " Student(s)"

        Catch ex As Exception

            WebMessageBoxStudents.Show("Sorry, The Following Error Occured: " & ex.ToString, "Error")

        End Try
    End Sub

    Protected Sub ListBoxStudents_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxStudents.SelectedIndexChanged
        LabelStatus.Text = ""
    End Sub

    Protected Sub DropDownListSections_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSections.SelectedIndexChanged
        SqlDataSourceListBoxStudents.DataBind()
        ListBoxStudents.DataBind()

        LabelStatus.Text = ""
    End Sub

    Protected Sub SqlDataSourceListBoxStudents_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSourceListBoxStudents.Selecting
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
                SqlDataSourceListBoxStudents.FilterExpression = "CurrentSectionID={0} "
            Else
                SqlDataSourceListBoxStudents.FilterExpression = ""
            End If

        Catch ex As Exception

            WebMessageBoxStudents.Show("Sorry, The Following Error Occured: " & ex.ToString, "Error")

        End Try
    End Sub

    Protected Sub CheckBoxSD_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxSD.CheckedChanged
        If CheckBoxSD.Checked = True Then
            SqlDataSourceListBoxStudents.SelectParameters("IsSD").DefaultValue = "SD"
        Else
            SqlDataSourceListBoxStudents.SelectParameters("IsSD").DefaultValue = ""
        End If
    End Sub

    Protected Sub CheckBoxSMA_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxSMA.CheckedChanged
        If CheckBoxSMA.Checked = True Then
            SqlDataSourceListBoxStudents.SelectParameters("IsSMA").DefaultValue = "SMA"
        Else
            SqlDataSourceListBoxStudents.SelectParameters("IsSMA").DefaultValue = ""
        End If
    End Sub

    Protected Sub CheckBoxSMP_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxSMP.CheckedChanged

        If CheckBoxSMP.Checked = True Then
            SqlDataSourceListBoxStudents.SelectParameters("IsSMP").DefaultValue = "SMP"
        Else
            SqlDataSourceListBoxStudents.SelectParameters("IsSMP").DefaultValue = ""
        End If

    End Sub

    Protected Sub CheckBoxFilter_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxFilter.CheckedChanged
        If CheckBoxFilter.Checked = True Then
            DropDownListSections.Enabled = True

            CheckBoxSD.Checked = True
            CheckBoxSD.Enabled = False
            'CheckBoxSMP.Checked = True
            'CheckBoxSMP.Enabled = False
            'CheckBoxSMA.Checked = True
            'CheckBoxSMA.Enabled = False

            SqlDataSourceListBoxStudents.FilterExpression = "CurrentSectionID={0} "
        Else
            DropDownListSections.Enabled = False

            CheckBoxSD.Enabled = True
            'CheckBoxSMP.Enabled = True
            'CheckBoxSMA.Enabled = True

            SqlDataSourceListBoxStudents.FilterExpression = ""
        End If
    End Sub

    Protected Sub FormViewStudents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormViewStudentsBasicInformation.DataBound, FormViewStudentsAdditionalInformation.DataBound, FormViewStudentsEnrollmentDetails.DataBound, FormViewParentsGuardianDetails.DataBound, FormViewParentsParentsInformation.DataBound
        Try
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")
            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")

            Dim FormViewStudents As FormView = DirectCast(sender, FormView)

            'Check for its current mode
            If FormViewStudents.CurrentMode = FormViewMode.Edit Then

                'Check the RowType to where the Control is placed
                If FormViewStudents.Row.RowType = DataControlRowType.DataRow Then

                    Dim ButtonSave As Button = DirectCast(FormViewStudents.FindControl("ButtonUpdate"), Button)

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
            WebMessageBoxStudents.Show("Sorry, The Following Error Occured: " & ex.ToString, "Error")
        End Try
    End Sub

    Protected Sub FormViewStudents_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormViewStudentsBasicInformation.ItemUpdated, FormViewStudentsEnrollmentDetails.ItemUpdated, FormViewStudentsAdditionalInformation.ItemUpdated, FormViewParentsParentsInformation.ItemUpdated, FormViewParentsGuardianDetails.ItemUpdated

        ' Use the Exception property to determine whether an exception
        ' occurred during the update operation.

        If e.Exception Is Nothing Then

            If e.AffectedRows > 0 Then
                'Record Inserted Successfully.

                WebMessageBoxStudents.Show("Records Updated Successfully!", "Success")
            Else
                WebMessageBoxStudents.Show("An error occurred during the insert operation.", "Error")
            End If
        Else
            LabelStatus.Text = e.Exception.Message
            e.ExceptionHandled = True
        End If

    End Sub

    Protected Sub FormViewStudents_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormViewStudentsBasicInformation.ItemUpdating
        e.NewValues("CurrentSectionID") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListCurrentGrade"), DropDownList).SelectedValue
    End Sub

    Protected Sub FormViewStudentsEnrollmentDetails_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormViewStudentsEnrollmentDetails.ItemUpdating
        e.NewValues("StartingAcademicTermID") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListStartingTerm"), DropDownList).SelectedValue
        e.NewValues("StartingSectionID") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListStartingSection"), DropDownList).SelectedValue
        e.NewValues("LevelEng") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListLevelEnglish"), DropDownList).SelectedValue
        e.NewValues("LevelTr") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListLevelTurkce"), DropDownList).SelectedValue
    End Sub

    Protected Sub FormViewStudentsAdditionalInformation_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormViewStudentsAdditionalInformation.ItemUpdating
        e.NewValues("BloodType") = DirectCast(DirectCast(sender, FormView).FindControl("DropDownListBloodType"), DropDownList).SelectedValue
    End Sub

End Class
