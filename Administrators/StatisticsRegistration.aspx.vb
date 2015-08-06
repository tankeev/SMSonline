
Partial Class Registration
    Inherits System.Web.UI.Page

    Dim RD1TotalValue As Integer = 0
    Dim SS1TotalValue As Integer = 0
    Dim PD1TotalValue As Integer = 0

    Dim RD2TotalValue As Integer = 0
    Dim SS2TotalValue As Integer = 0
    Dim PD2TotalValue As Integer = 0

    Dim RD3TotalValue As Integer = 0
    Dim SS3TotalValue As Integer = 0
    Dim PD3TotalValue As Integer = 0

    Dim TS1TotalValue As Integer = 0
    Dim TS2TotalValue As Integer = 0

    Dim RD4TotalValue As Integer = 0
    Dim SS4TotalValue As Integer = 0
    Dim PD4TotalValue As Integer = 0

    Dim RD5TotalValue As Integer = 0
    Dim SS5TotalValue As Integer = 0
    Dim PD5TotalValue As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub DataListRegistration_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListRegistration.ItemDataBound

        Try

            If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then

                Dim RD1 As TextBox = DirectCast(e.Item.FindControl("RD1"), TextBox)
                RD1TotalValue += Convert.ToInt32(RD1.Text)

                Dim RD2 As TextBox = DirectCast(e.Item.FindControl("RD2"), TextBox)
                RD2TotalValue += Convert.ToInt32(RD2.Text)

                Dim RD3 As TextBox = DirectCast(e.Item.FindControl("RD3"), TextBox)
                RD3TotalValue += Convert.ToInt32(RD3.Text)

                Dim RD4 As TextBox = DirectCast(e.Item.FindControl("RD4"), TextBox)
                RD4TotalValue += Convert.ToInt32(RD4.Text)

                Dim RD5 As TextBox = DirectCast(e.Item.FindControl("RD5"), TextBox)
                RD5TotalValue += Convert.ToInt32(RD5.Text)

                Dim LabelTotalRD As Label = DirectCast(e.Item.FindControl("LabelTotalRD"), Label)
                LabelTotalRD.Text = Convert.ToInt32(RD1.Text) + Convert.ToInt32(RD2.Text) + Convert.ToInt32(RD3.Text) + Convert.ToInt32(RD4.Text) + Convert.ToInt32(RD5.Text)



                Dim SS1 As TextBox = DirectCast(e.Item.FindControl("SS1"), TextBox)
                SS1TotalValue += Convert.ToInt32(SS1.Text)

                Dim SS2 As TextBox = DirectCast(e.Item.FindControl("SS2"), TextBox)
                SS2TotalValue += Convert.ToInt32(SS2.Text)

                Dim SS3 As TextBox = DirectCast(e.Item.FindControl("SS3"), TextBox)
                SS3TotalValue += Convert.ToInt32(SS3.Text)

                Dim SS4 As TextBox = DirectCast(e.Item.FindControl("SS4"), TextBox)
                SS4TotalValue += Convert.ToInt32(SS4.Text)

                Dim SS5 As TextBox = DirectCast(e.Item.FindControl("SS5"), TextBox)
                SS5TotalValue += Convert.ToInt32(SS5.Text)

                Dim LabelTotalSS As Label = DirectCast(e.Item.FindControl("LabelTotalSS"), Label)
                LabelTotalSS.Text = Convert.ToInt32(SS1.Text) + Convert.ToInt32(SS2.Text) + Convert.ToInt32(SS3.Text) + Convert.ToInt32(SS4.Text) + Convert.ToInt32(SS5.Text)



                Dim PD1 As TextBox = DirectCast(e.Item.FindControl("PD1"), TextBox)
                PD1TotalValue += Convert.ToInt32(PD1.Text)

                Dim PD2 As TextBox = DirectCast(e.Item.FindControl("PD2"), TextBox)
                PD2TotalValue += Convert.ToInt32(PD2.Text)

                Dim PD3 As TextBox = DirectCast(e.Item.FindControl("PD3"), TextBox)
                PD3TotalValue += Convert.ToInt32(PD3.Text)

                Dim PD4 As TextBox = DirectCast(e.Item.FindControl("PD4"), TextBox)
                PD4TotalValue += Convert.ToInt32(PD4.Text)

                Dim PD5 As TextBox = DirectCast(e.Item.FindControl("PD5"), TextBox)
                PD5TotalValue += Convert.ToInt32(PD5.Text)

                Dim LabelTotalPD As Label = DirectCast(e.Item.FindControl("LabelTotalPD"), Label)
                LabelTotalPD.Text = Convert.ToInt32(PD1.Text) + Convert.ToInt32(PD2.Text) + Convert.ToInt32(PD3.Text) + Convert.ToInt32(PD4.Text) + Convert.ToInt32(PD5.Text)



                Dim LabelTotalSD As Label = DirectCast(e.Item.FindControl("LabelTotalSD"), Label)
                LabelTotalSD.Text = Convert.ToInt32(SS1.Text) + Convert.ToInt32(PD1.Text)

                Dim LabelTotalSMP As Label = DirectCast(e.Item.FindControl("LabelTotalSMP"), Label)
                LabelTotalSMP.Text = Convert.ToInt32(SS2.Text) + Convert.ToInt32(PD2.Text) + Convert.ToInt32(SS4.Text) + Convert.ToInt32(PD4.Text)

                Dim LabelTotalSMA As Label = DirectCast(e.Item.FindControl("LabelTotalSMA"), Label)
                LabelTotalSMA.Text = Convert.ToInt32(SS3.Text) + Convert.ToInt32(PD3.Text) + Convert.ToInt32(SS5.Text) + Convert.ToInt32(PD5.Text)



                Dim TS1 As TextBox = DirectCast(e.Item.FindControl("TS1"), TextBox)
                TS1TotalValue += Convert.ToInt32(TS1.Text)

                Dim TS2 As TextBox = DirectCast(e.Item.FindControl("TS2"), TextBox)
                TS2TotalValue += Convert.ToInt32(TS2.Text)

            End If

            If e.Item.ItemType = ListItemType.Footer Then

                Dim RD1Total As Label = DirectCast(e.Item.FindControl("RD1Total"), Label)
                RD1Total.Text = RD1TotalValue

                Dim SS1Total As Label = DirectCast(e.Item.FindControl("SS1Total"), Label)
                SS1Total.Text = SS1TotalValue

                Dim PD1Total As Label = DirectCast(e.Item.FindControl("PD1Total"), Label)
                PD1Total.Text = PD1TotalValue


                Dim RD2Total As Label = DirectCast(e.Item.FindControl("RD2Total"), Label)
                RD2Total.Text = RD2TotalValue

                Dim SS2Total As Label = DirectCast(e.Item.FindControl("SS2Total"), Label)
                SS2Total.Text = SS2TotalValue

                Dim PD2Total As Label = DirectCast(e.Item.FindControl("PD2Total"), Label)
                PD2Total.Text = PD2TotalValue


                Dim RD3Total As Label = DirectCast(e.Item.FindControl("RD3Total"), Label)
                RD3Total.Text = RD3TotalValue

                Dim SS3Total As Label = DirectCast(e.Item.FindControl("SS3Total"), Label)
                SS3Total.Text = SS3TotalValue

                Dim PD3Total As Label = DirectCast(e.Item.FindControl("PD3Total"), Label)
                PD3Total.Text = PD3TotalValue


                Dim RD4Total As Label = DirectCast(e.Item.FindControl("RD4Total"), Label)
                RD4Total.Text = RD4TotalValue

                Dim SS4Total As Label = DirectCast(e.Item.FindControl("SS4Total"), Label)
                SS4Total.Text = SS4TotalValue

                Dim PD4Total As Label = DirectCast(e.Item.FindControl("PD4Total"), Label)
                PD4Total.Text = PD4TotalValue


                Dim RD5Total As Label = DirectCast(e.Item.FindControl("RD5Total"), Label)
                RD5Total.Text = RD5TotalValue

                Dim SS5Total As Label = DirectCast(e.Item.FindControl("SS5Total"), Label)
                SS5Total.Text = SS5TotalValue

                Dim PD5Total As Label = DirectCast(e.Item.FindControl("PD5Total"), Label)
                PD5Total.Text = PD5TotalValue


                Dim TS1Total As Label = DirectCast(e.Item.FindControl("TS1Total"), Label)
                TS1Total.Text = TS1TotalValue

                Dim TS2Total As Label = DirectCast(e.Item.FindControl("TS2Total"), Label)
                TS2Total.Text = TS2TotalValue

            End If

        Catch ex As Exception
            LabelStatusRegistration.Text = ex.Message
        End Try

    End Sub
End Class
