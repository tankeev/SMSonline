Partial Class NewUserAccount
    Inherits System.Web.UI.Page
    Private LastAddedID As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Student") Then
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




End Class
