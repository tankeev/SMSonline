Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html.simpleparser

Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Student") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Sub Item_DataBound(ByVal sender As Object, ByVal e As DataListItemEventArgs)
        Try

            If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then

                ' Retrieve the Label control in the current DataListItem.
                Dim LabelAnswer As Label = CType(e.Item.FindControl("LabelAnswer"), Label)
                Dim LabelKey As Label = CType(e.Item.FindControl("LabelKey"), Label)

                If LabelAnswer.Text.ToLower = LabelKey.Text.ToLower Then
                    LabelAnswer.ForeColor = Drawing.Color.DarkGreen
                Else
                    LabelAnswer.ForeColor = Drawing.Color.DarkRed
                    LabelAnswer.Font.Underline = True
                End If

            End If
        Catch ex As Exception
            LabelCheck.Text = ex.Message
        End Try
    End Sub

    Protected Sub DataListGeneralTestsStudentsRanking_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs)
        Try
            If (e.CommandName = "ShowAnswers") Then

                'source oncommand event fired by the LinkButton so we get it like this
                Dim LinkButtonShowAnswers As LinkButton = DirectCast(e.CommandSource, LinkButton)

                'the naming container of the LinkButton is DataListItem
                Dim ParentDataListItem As DataListItem = TryCast(LinkButtonShowAnswers.NamingContainer, DataListItem)

                'NamingContainer can be replaced by Parent.Parent. ie
                'GridViewRow childGridViewRow = clickedButton.Parent.Parent as GridViewRow;
                'the naming container of child gridview row is the child gridview

                Dim ParentDataList As DataList = TryCast(ParentDataListItem.NamingContainer, DataList)


                'finally the naming container of the chid gridview is the parent gridviewrow
                Dim ParentRow As GridViewRow = TryCast(ParentDataList.NamingContainer, GridViewRow)
                '-------End demo---------------------------------------------------------

                'lets wrap it up into a single step.
                'Dim optimisedParentRow As GridViewRow = TryCast(DirectCast(e.CommandSource, ImageButton).NamingContainer.NamingContainer.NamingContainer, GridViewRow)

                Dim CourseCategoryLabel As Label = ParentRow.FindControl("CourseCategoryLabel")

                CourseCategoryLabel.Text = e.CommandArgument.ToString

                Dim DataListGeneralTestStudentAnswers As DataList = ParentRow.FindControl("DataListGeneralTestStudentAnswers")

                Dim SqlDataSourceGeneralTestStudentAnswers As SqlDataSource = ParentRow.FindControl("SqlDataSourceGeneralTestStudentAnswers")

                SqlDataSourceGeneralTestStudentAnswers.SelectParameters("CourseCategory").DefaultValue = e.CommandArgument.ToString

                DataListGeneralTestStudentAnswers.DataBind()

            End If
        Catch ex As Exception
            LabelCheck.Text = ex.Message
        End Try

    End Sub

    Protected Sub GridViewGeneralTestsStudents_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewGeneralTestsStudents.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim DataListGeneralTestStudentAnswers As DataList = e.Row.FindControl("DataListGeneralTestStudentAnswers")

            DataListGeneralTestStudentAnswers.DataBind()

        End If

    End Sub

    Protected Sub ListBoxMPExams_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxMPExams.DataBound

        If ListBoxMPExams.Items.Count > 0 Then
            ListBoxMPExams.SelectedIndex = 0
            GridViewGeneralTestsStudents.DataBind()
        End If

    End Sub
End Class
