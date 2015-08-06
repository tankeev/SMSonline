Partial Class Attendance_Checklist
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("StaffSD") Then
            Response.Redirect("~/Warning.aspx")
        End If

        If Not IsPostBack Then
            TextBoxDate.Text = Date.UtcNow.Date
        End If

    End Sub

    Protected Sub GridViewMidReport_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewMidReport.RowDataBound
        Try
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            For Each MarkRow As GridViewRow In GridViewMidReport.Rows

                Dim StudentID As Label = CType(MarkRow.FindControl("LabelStudentID"), Label)
                Dim Hyperlink As HyperLink = CType(MarkRow.FindControl("HyperlinkReport"), HyperLink)

                If DropDownListSchoolCodesMaster.SelectedValue = 2 Then
                    Hyperlink.NavigateUrl = String.Format("~/Reporting/KharismaSDMidReport.aspx?AT={0}&RTID={1}&SID={2}&D={3}", DropDownListAcademicTerms.SelectedValue, 1, StudentID.Text, TextBoxDate.Text)
                End If

            Next
        Catch ex As Exception
            WebMessageBoxReports.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub

    Protected Sub GridViewFinalReport_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewFinalReport.RowDataBound
        Try
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            For Each MarkRow As GridViewRow In GridViewFinalReport.Rows

                Dim StudentID As Label = CType(MarkRow.FindControl("LabelStudentID"), Label)
                Dim Hyperlink As HyperLink = CType(MarkRow.FindControl("HyperlinkReport"), HyperLink)

                If DropDownListSchoolCodesMaster.SelectedValue = 2 Then
                    Hyperlink.NavigateUrl = String.Format("~/Reporting/KharismaSDFinReport.aspx?AS={0}&RTID={1}&SID={2}&D={3}", DropDownListAcademicSemesters.SelectedValue, 2, StudentID.Text, TextBoxDate.Text)
                End If

            Next
        Catch ex As Exception
            WebMessageBoxReports.Show("An Error Occured: " & ex.Message.ToString, "Error")
        End Try
    End Sub
End Class
