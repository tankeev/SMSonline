﻿Imports System.Collections.Generic

Partial Class Attendance_Checklist
    Inherits System.Web.UI.Page

    Public Shared DaysList As New List(Of DateTime)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("CoordinatorSD") Then
            Response.Redirect("~/Warning.aspx")
        End If

        If Not IsPostBack Then

            Dim dt As DateTime = Date.Today
            TextBoxFinishDate_CalendarExtender.SelectedDate = dt
            dt = dt.AddMonths(-1)
            TextBoxStartDate_CalendarExtender.SelectedDate = dt
        End If

    End Sub

    Protected Sub GridViewAttendanceReports_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim GridViewAttendanceReports As GridView = DirectCast(sender, GridView)

        Dim ATID As Label
        Dim LB As Label
        Dim CR As Label

        Dim index As Integer = -1

        'ASAGIYA DOGRU TARAMA
        For Each Row As GridViewRow In GridViewAttendanceReports.Rows

            'SAGA DOGRU TARAMA
            For Cell As Integer = 0 To Row.Cells.Count - 1

                'HER HUCREDEKI CONTROLLER ARANIYOR
                For Each ctrl As Control In Row.Cells(Cell).Controls

                    For m As Integer = 1 To 8

                        LB = DirectCast(Row.FindControl("LabelP" & m), Label)

                        'ARADIGIMIZI BULDUYSAK ADRESI ALIYORUZ
                        If ctrl.ID = LB.ID Then
                            index = Cell

                            For Each GRow As GridViewRow In GridViewAttendanceTypes.Rows

                                ATID = DirectCast(GRow.FindControl("LabelATID"), Label)
                                CR = DirectCast(GRow.FindControl("LabelCR"), Label)

                                If LB.Text = ATID.Text Then

                                    Row.Cells(index).BackColor = System.Drawing.ColorTranslator.FromHtml(CR.Text)

                                    Exit For

                                End If

                            Next

                            Exit For

                        End If
                    Next
                Next
            Next
        Next
    End Sub


End Class
