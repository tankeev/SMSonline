﻿Imports System.Collections.Generic

Partial Class Attendance_Checklist
    Inherits System.Web.UI.Page

    Public Shared DaysList As New List(Of DateTime)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Secretary") Then
            Response.Redirect("~/Warning.aspx")
        End If

        If Not IsPostBack Then
            TextBoxDate.Text = Date.UtcNow.Date
        End If

    End Sub

    Protected Sub GridViewStudents_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewStudents.RowDataBound

        Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
        Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

        For Each MarkRow As GridViewRow In GridViewStudents.Rows

            Dim StudentID As Label = CType(MarkRow.FindControl("LabelStudentID"), Label)
            Dim Hyperlink As HyperLink = CType(MarkRow.FindControl("HyperlinkReport"), HyperLink)

            Hyperlink.Text = "Click Here"

            If RadioButtonListReportTypes.SelectedValue = 1 And DropDownListSchoolCodesMaster.SelectedValue = 1 Then
                Hyperlink.NavigateUrl = String.Format("~/Reporting/SemestaSMPMidReport.aspx?AT={0}&RTID={1}&SID={2}&D={3}", DropDownListAcademicTermsMaster.SelectedValue, RadioButtonListReportTypes.SelectedValue, StudentID.Text, TextBoxDate.Text)

            ElseIf RadioButtonListReportTypes.SelectedValue = 2 And DropDownListSchoolCodesMaster.SelectedValue = 1 Then
                Hyperlink.NavigateUrl = String.Format("~/Reporting/SemestaSMPFinReport.aspx?AT={0}&RTID={1}&SID={2}&D={3}", DropDownListAcademicTermsMaster.SelectedValue, RadioButtonListReportTypes.SelectedValue, StudentID.Text, TextBoxDate.Text)
            End If

        Next

    End Sub

    Protected Sub ButtonShowList_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonShowList.Click
        GridViewStudents.DataBind()
    End Sub
End Class
