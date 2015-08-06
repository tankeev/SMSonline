Partial Class Assessment_Marks
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.IsInRole("StaffSD") Then
            Response.Redirect("~/Warning.aspx")
        End If
    End Sub

    Protected Sub ListBoxCourses_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxCourses.DataBound
        If ListBoxCourses.Items.Count > 0 Then
            ListBoxCourses.SelectedIndex = 0
        End If
    End Sub

    Protected Sub GridViewStudents_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewStudents.RowDataBound
        Try

            If e.Row.RowType = DataControlRowType.DataRow Then

                Dim GridViewStudentsRow As GridViewRow = e.Row

                Dim DataListAssessmentMarks As DataList = GridViewStudentsRow.FindControl("DataListAssessmentMarks")

                DataListAssessmentMarks.DataBind()

                If DataListAssessmentMarks.Items.Count > 0 Then

                    For Each DataListAssessmentMarksItem As DataListItem In DataListAssessmentMarks.Items
                        Dim PanelDataItem As Panel = DataListAssessmentMarksItem.FindControl("PanelDataItem")
                        Dim HiddenFieldColor As HiddenField = DataListAssessmentMarksItem.FindControl("HiddenFieldColor")
                        Dim HiddenFieldIsLocked As HiddenField = DataListAssessmentMarksItem.FindControl("HiddenFieldIsLocked")
                        Dim TextBoxAssessmentMark As TextBox = CType(DataListAssessmentMarksItem.FindControl("TextBoxAssessmentMark"), TextBox)

                        PanelDataItem.BackColor = System.Drawing.ColorTranslator.FromHtml(HiddenFieldColor.Value)

                        If HiddenFieldIsLocked.Value = True Then
                            TextBoxAssessmentMark.Enabled = False
                        Else
                            TextBoxAssessmentMark.Enabled = True
                        End If
                    Next
                End If

            End If
        Catch ex As Exception
            WebMessageBoxMarksAll.Show("Sorry, The Following Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub


    Protected Sub DatalistAssessmentMarks_DataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs)
        Try

            Dim DataListAssessmentMarks As DataList = DirectCast(sender, DataList)

            If DataListAssessmentMarks.Items.Count > 0 Then

                For Each DataListAssessmentMarksItem As DataListItem In DataListAssessmentMarks.Items
                    Dim PanelDataItem As Panel = DataListAssessmentMarksItem.FindControl("PanelDataItem")
                    Dim HiddenFieldColor As HiddenField = DataListAssessmentMarksItem.FindControl("HiddenFieldColor")
                    Dim HiddenFieldIsLocked As HiddenField = DataListAssessmentMarksItem.FindControl("HiddenFieldIsLocked")
                    Dim TextBoxAssessmentMark As TextBox = CType(DataListAssessmentMarksItem.FindControl("TextBoxAssessmentMark"), TextBox)

                    PanelDataItem.BackColor = System.Drawing.ColorTranslator.FromHtml(HiddenFieldColor.Value)

                    If HiddenFieldIsLocked.Value = True Then
                        TextBoxAssessmentMark.Enabled = False
                    Else
                        TextBoxAssessmentMark.Enabled = True
                    End If
                Next

            End If

        Catch ex As Exception
            WebMessageBoxMarksAll.Show("Sorry, The Following Error Occured: " & ex.Message.ToString, "Error")
        End Try

    End Sub

    Protected Sub DatalistAssessmentMarks_ItemCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs)

        Dim DataListAssessmentMarks As DataList = DirectCast(sender, DataList)

        If DataListAssessmentMarks.Items.Count = 0 Then

            If e.Item.ItemType = ListItemType.Footer Then

                Dim LabelEmpty As Label = e.Item.FindControl("LabelEmpty")

                LabelEmpty.Visible = True

            End If

        End If

    End Sub

    Protected Sub ImageButtonUpdateDataList_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Try
            Dim ImageButtonUpdateDataList As ImageButton = DirectCast(sender, ImageButton)
            Dim DataListAssessmentMarks As DataList = DirectCast(ImageButtonUpdateDataList.NamingContainer.FindControl("DataListAssessmentMarks"), DataList)
            Dim SqlDataSourceAssessmentsMarks As SqlDataSource = DirectCast(ImageButtonUpdateDataList.NamingContainer.FindControl("SqlDataSourceAssessmentsMarks"), SqlDataSource)
            Dim LabelSaved As Label = DirectCast(ImageButtonUpdateDataList.NamingContainer.FindControl("LabelSaved"), Label)

            For Each DataItem As DataListItem In DataListAssessmentMarks.Items

                Dim MarkID As Integer = Convert.ToInt32(DataListAssessmentMarks.DataKeys(DataItem.ItemIndex))
                Dim TextBoxAssessmentMark As TextBox = CType(DataItem.FindControl("TextBoxAssessmentMark"), TextBox)
                Dim Mark As Integer = Convert.ToInt32(TextBoxAssessmentMark.Text)


                SqlDataSourceAssessmentsMarks.UpdateParameters.Clear()
                SqlDataSourceAssessmentsMarks.UpdateParameters.Add("AssessmentMarkID", MarkID)
                SqlDataSourceAssessmentsMarks.UpdateParameters.Add("AssessmentMark", Mark)
                SqlDataSourceAssessmentsMarks.Update()

            Next
            WebMessageBoxMarksAll.Show("Records saved successfully!", "Success")
        Catch ex As Exception
            WebMessageBoxMarksAll.Show("Sorry, The Following Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub

    Protected Sub ButtonUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpdate.Click
        Try
            For Each DataRow As GridViewRow In GridViewStudents.Rows

                Dim DataListAssessmentMarks As DataList = DirectCast(DataRow.FindControl("DataListAssessmentMarks"), DataList)
                Dim SqlDataSourceAssessmentsMarks As SqlDataSource = DirectCast(DataRow.FindControl("SqlDataSourceAssessmentsMarks"), SqlDataSource)

                For Each ItemDataItem As DataListItem In DataListAssessmentMarks.Items

                    Dim MarkID As Integer = Convert.ToInt32(DataListAssessmentMarks.DataKeys(ItemDataItem.ItemIndex))
                    Dim TextBoxAssessmentMark As TextBox = CType(ItemDataItem.FindControl("TextBoxAssessmentMark"), TextBox)
                    Dim Mark As Integer = Convert.ToInt32(TextBoxAssessmentMark.Text)

                    SqlDataSourceAssessmentsMarks.UpdateParameters.Clear()
                    SqlDataSourceAssessmentsMarks.UpdateParameters.Add("AssessmentMarkID", MarkID)
                    SqlDataSourceAssessmentsMarks.UpdateParameters.Add("AssessmentMark", Mark)
                    SqlDataSourceAssessmentsMarks.Update()
                Next
            Next
            WebMessageBoxMarksAll.Show("Records saved successfully!", "Success")
        Catch ex As Exception
            WebMessageBoxMarksAll.Show("Sorry, The Following Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub

End Class

