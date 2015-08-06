Imports System.Web.Configuration
Imports System.Data.SqlClient
Imports System.Data

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Secretary") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub FormViewRegistration_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormViewRegistration.DataBound
        Try

            If FormViewRegistration.CurrentMode = FormViewMode.Edit Then

                Dim LabelTotalRD As Label = DirectCast(FormViewRegistration.FindControl("LabelTotalRD"), Label)
                Dim RD1 As TextBox = DirectCast(FormViewRegistration.FindControl("RD1"), TextBox)
                Dim RD2 As TextBox = DirectCast(FormViewRegistration.FindControl("RD2"), TextBox)
                Dim RD3 As TextBox = DirectCast(FormViewRegistration.FindControl("RD3"), TextBox)
                Dim RD4 As TextBox = DirectCast(FormViewRegistration.FindControl("RD4"), TextBox)
                Dim RD5 As TextBox = DirectCast(FormViewRegistration.FindControl("RD5"), TextBox)
                LabelTotalRD.Text = Convert.ToInt32(RD1.Text) + Convert.ToInt32(RD2.Text) + Convert.ToInt32(RD3.Text) + Convert.ToInt32(RD4.Text) + Convert.ToInt32(RD5.Text)


                Dim LabelTotalSS As Label = DirectCast(FormViewRegistration.FindControl("LabelTotalSS"), Label)
                Dim SS1 As TextBox = DirectCast(FormViewRegistration.FindControl("SS1"), TextBox)
                Dim SS2 As TextBox = DirectCast(FormViewRegistration.FindControl("SS2"), TextBox)
                Dim SS3 As TextBox = DirectCast(FormViewRegistration.FindControl("SS3"), TextBox)
                Dim SS4 As TextBox = DirectCast(FormViewRegistration.FindControl("SS4"), TextBox)
                Dim SS5 As TextBox = DirectCast(FormViewRegistration.FindControl("SS5"), TextBox)
                LabelTotalSS.Text = Convert.ToInt32(SS1.Text) + Convert.ToInt32(SS2.Text) + Convert.ToInt32(SS3.Text) + Convert.ToInt32(SS4.Text) + Convert.ToInt32(SS5.Text)


                Dim LabelTotalPD As Label = DirectCast(FormViewRegistration.FindControl("LabelTotalPD"), Label)
                Dim PD1 As TextBox = DirectCast(FormViewRegistration.FindControl("PD1"), TextBox)
                Dim PD2 As TextBox = DirectCast(FormViewRegistration.FindControl("PD2"), TextBox)
                Dim PD3 As TextBox = DirectCast(FormViewRegistration.FindControl("PD3"), TextBox)
                Dim PD4 As TextBox = DirectCast(FormViewRegistration.FindControl("PD4"), TextBox)
                Dim PD5 As TextBox = DirectCast(FormViewRegistration.FindControl("PD5"), TextBox)
                LabelTotalPD.Text = Convert.ToInt32(PD1.Text) + Convert.ToInt32(PD2.Text) + Convert.ToInt32(PD3.Text) + Convert.ToInt32(PD4.Text) + Convert.ToInt32(PD5.Text)


                Dim LabelTotalSD As Label = DirectCast(FormViewRegistration.FindControl("LabelTotalSD"), Label)
                LabelTotalSD.Text = Convert.ToInt32(SS1.Text) + Convert.ToInt32(PD1.Text)

                Dim LabelTotalSMP As Label = DirectCast(FormViewRegistration.FindControl("LabelTotalSMP"), Label)
                LabelTotalSMP.Text = Convert.ToInt32(SS2.Text) + Convert.ToInt32(PD2.Text) + Convert.ToInt32(SS4.Text) + Convert.ToInt32(PD4.Text)

                Dim LabelTotalSMA As Label = DirectCast(FormViewRegistration.FindControl("LabelTotalSMA"), Label)
                LabelTotalSMA.Text = Convert.ToInt32(SS3.Text) + Convert.ToInt32(PD3.Text) + Convert.ToInt32(SS5.Text) + Convert.ToInt32(PD5.Text)

            End If

        Catch ex As Exception
            LabelStatus.Text = ex.Message
        End Try
    End Sub
End Class
