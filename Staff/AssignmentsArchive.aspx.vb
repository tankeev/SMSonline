Imports System.Data.SqlClient

Partial Class NewUserAccount

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserID") Is Nothing Then
            Response.Redirect("Default.aspx")
        End If

        If Not User.IsInRole("Staff") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub GridViewAssignmentsStudentsProgress_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewAssignmentsStudentsProgress.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim row As GridViewRow = e.Row

            Dim LabelMCTotal As Label = row.FindControl("LabelMCTotal")
            Dim LabelTFTotal As Label = row.FindControl("LabelTFTotal")
            Dim LabelSATotal As Label = row.FindControl("LabelSATotal")

            'Dim LabelTotal As Label = row.FindControl("LabelTotal")

            Dim Total As Integer = 0

            Dim GridViewMC As GridView = row.FindControl("GridViewMC")
            GridViewMC.DataBind()

            Dim MCTotalPoints As Integer = 0

            For Each MCRow As GridViewRow In GridViewMC.Rows

                Dim LabelPointMC As Label = MCRow.FindControl("LabelMCPoint")

                MCTotalPoints += Convert.ToInt32(LabelPointMC.Text)

            Next

            LabelMCTotal.Text = MCTotalPoints


            Dim GridViewTF As GridView = row.FindControl("GridViewTF")
            GridViewTF.DataBind()

            Dim TFTotalPoints As Integer = 0

            For Each TFRow As GridViewRow In GridViewTF.Rows

                Dim LabelPointTF As Label = TFRow.FindControl("LabelTFPoint")

                TFTotalPoints += Convert.ToInt32(LabelPointTF.Text)

            Next

            LabelTFTotal.Text = TFTotalPoints


            Dim GridViewSA As GridView = row.FindControl("GridViewSA")
            GridViewSA.DataBind()

            Dim SATotalPoints As Integer = 0

            For Each SARow As GridViewRow In GridViewSA.Rows

                Dim LabelPointSA As Label = SARow.FindControl("LabelSAPoint")

                SATotalPoints += Convert.ToInt32(LabelPointSA.Text)

            Next

            LabelSATotal.Text = SATotalPoints

            Total = Convert.ToInt32(MCTotalPoints) + Convert.ToInt32(TFTotalPoints) + Convert.ToInt32(SATotalPoints)

            Dim LabelScore As Label = row.FindControl("LabelScore")

            LabelScore.Text = Total
        End If
    End Sub

    Protected Sub FormViewSAItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs)

        'Dim FormViewSA As FormView = DirectCast(sender, FormView)
        'Dim GridViewSARow As GridViewRow = DirectCast(FormViewSA.NamingContainer, GridViewRow)
        'Dim GridViewSA As GridView = DirectCast(GridViewSARow.NamingContainer, GridView)

        GridViewAssignmentsStudentsProgress.DataBind()
        'GridViewSA.DataBind()

    End Sub

    Protected Sub GridViewSA_RowData_Bound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)

        If e.Row.RowType = DataControlRowType.DataRow Then


            Dim GridViewSARow As GridViewRow = e.Row

            Dim FormViewSA As FormView = GridViewSARow.FindControl("FormViewSACheck")

            FormViewSA.DataBind()

        End If
    End Sub

    Protected Sub ListBoxAssignments_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxAssignments.DataBound
        If ListBoxAssignments.Items.Count > 0 Then
            ListBoxAssignments.SelectedIndex = 0

            GridViewAssignmentsStudentsProgress.DataBind()
        End If
    End Sub

    Protected Sub CheckBoxCheckAll_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxCheckAll.CheckedChanged
        If CheckBoxCheckAll.Checked Then
            For Each listItem As ListItem In CheckBoxListStudents.Items
                listItem.Selected = True
            Next
        Else
            For Each listItem As ListItem In CheckBoxListStudents.Items
                listItem.Selected = False
            Next
        End If

        MPAssignStudents.Show()
    End Sub

    Protected Sub ButtonUpdateStudents_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdateStudents.Click
        Try

            If Not (DropDownListAssignments.SelectedValue = Nothing) Then

                For Each listItem As ListItem In CheckBoxListStudents.Items

                    If listItem.Selected = True Then

                        SqlDataSourceAssignmentsStudents.InsertParameters.Clear()
                        SqlDataSourceAssignmentsStudents.InsertParameters.Add("AssignmentID", DropDownListAssignments.SelectedValue)
                        SqlDataSourceAssignmentsStudents.InsertParameters.Add("StudentID", listItem.Value)

                        SqlDataSourceAssignmentsStudents.Insert()

                    End If

                Next

                LabelStatusStudents.Text = "Updated Successfully!"

                ListBoxAssignments.DataBind()

            Else
                LabelStatusStudents.Text = "No Assignment Selected!"
            End If

            MPAssignStudents.Show()



        Catch ex As Exception
            LabelStatusStudents.Text = ex.Message
        End Try
    End Sub

    Protected Sub CheckBoxListStudents_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxListStudents.DataBound

        If CheckBoxListStudents.Items.Count > 0 Then

            Dim dv As New System.Data.DataView
            Dim dt As New System.Data.DataTable

            If Not SqlDataSourceAssignmentsStudents.Select(DataSourceSelectArguments.Empty) Is Nothing Then

                dv = SqlDataSourceAssignmentsStudents.Select(DataSourceSelectArguments.Empty)
                dt = dv.ToTable()

                For Each item As ListItem In CheckBoxListStudents.Items
                    For Each dr As Data.DataRow In dt.Rows
                        If item.Value = dr.Item(0).ToString Then
                            item.Selected = True
                        End If
                    Next
                Next
            End If
        End If

    End Sub

    Protected Sub DropDownListSectionsAssign_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSectionsAssign.SelectedIndexChanged
        CheckBoxListStudents.DataBind()
        MPAssignStudents.Show()
    End Sub

    Protected Sub DropDownListAssignments_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListAssignments.SelectedIndexChanged
        LabelStatusStudents.Text = ""
        CheckBoxListStudents.DataBind()
        MPAssignStudents.Show()
    End Sub
End Class
