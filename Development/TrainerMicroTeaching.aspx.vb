Imports System.Data.SqlClient
Imports AjaxControlToolkit

Partial Class TrainerTeaching
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ButtonAddRecords_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonAddRecords.Click
        Try
            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            If CheckBoxListTrainees.Items.Count > 0 Then

                For Each CheckBoxListTraineesItem As ListItem In CheckBoxListTrainees.Items

                    If CheckBoxListTraineesItem.Selected = True Then

                        'YENI ATTENDANCE KAYITLARI EKLENIYOR.
                        SqlDataSourceMicroTeaching.InsertParameters.Clear()
                        SqlDataSourceMicroTeaching.InsertParameters.Add("Date", DateTextBox.Text)
                        SqlDataSourceMicroTeaching.InsertParameters.Add("Notes", NotesTextBox.Text)
                        SqlDataSourceMicroTeaching.InsertParameters.Add("TraineeID", CheckBoxListTraineesItem.Value.ToString)
                        SqlDataSourceMicroTeaching.InsertParameters.Add("AcademicTermID", DropDownListAcademicTermsMaster.SelectedValue)
                        SqlDataSourceMicroTeaching.InsertParameters.Add("UnitTitleID", DropDownListTeachingTitle.SelectedValue)
                        SqlDataSourceMicroTeaching.InsertParameters.Add("SchoolCode", DropDownListSchoolCodesMaster.SelectedValue)
                        SqlDataSourceMicroTeaching.InsertParameters.Add("SectionCatalogID", DropDownListSchoolSections.SelectedValue)
                        SqlDataSourceMicroTeaching.InsertParameters.Add("SavedBy", Session("UserID").ToString)
                        SqlDataSourceMicroTeaching.Insert()

                    End If

                Next

                LabelMicroTeachingStatus.Text = "Added Successfully!"
            Else

                LabelMicroTeachingStatus.Text = "There is No Student on the List!"

            End If

        Catch ex As Exception
            LabelMicroTeachingStatus.Text = "Sorry, The Following Error Occured: " & ex.ToString
        End Try
    End Sub

    Protected Sub ButtonSend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSend.Click
        Try


            For Each GridViewObservationRow As GridViewRow In GridViewObservation.Rows

                If GridViewObservationRow.RowType = DataControlRowType.DataRow = True Then

                    Dim LabelOID As Label = GridViewObservationRow.FindControl("LabelOID")
                    Dim RatingObservation As Rating = GridViewObservationRow.FindControl("RatingObservation")
                    'YENI ATTENDANCE KAYITLARI EKLENIYOR.
                    SqlDataSourceMicroTeachingObservationForm.InsertParameters.Clear()
                    SqlDataSourceMicroTeachingObservationForm.InsertParameters.Add("TraineeID", DropDownListTrainees.SelectedValue)
                    SqlDataSourceMicroTeachingObservationForm.InsertParameters.Add("TraineerID", Session("UserID").ToString)
                    SqlDataSourceMicroTeachingObservationForm.InsertParameters.Add("ObservationID", LabelOID.Text)
                    SqlDataSourceMicroTeachingObservationForm.InsertParameters.Add("ObservationScore", RatingObservation.CurrentRating)
                    SqlDataSourceMicroTeachingObservationForm.InsertParameters.Add("Date", Date.UtcNow)

                    SqlDataSourceMicroTeachingObservationForm.Insert()

                End If

            Next

            LabelObservation.Text = "Observation Form Submitted Successfully!"

        Catch ex As Exception
            LabelObservation.Text = ex.Message
        End Try

    End Sub

    Protected Sub DropDownListTeachingUnits_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListTeachingUnits.DataBound
        DropDownListTeachingTitle.DataBind()
    End Sub
End Class
