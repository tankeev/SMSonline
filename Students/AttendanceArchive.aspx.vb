Imports System.Web.Configuration
Imports System.Data.SqlClient
Imports System.Data

Partial Class UserList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Student") Then
            Response.Redirect("~/Warning.aspx")
        End If

    End Sub

    Protected Sub GridViewStudents_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewStudents.RowDataBound
        Dim ATID As Label
        Dim LB As Label
        Dim CR As Label

        Dim index As Integer = -1

        'ASAGIYA DOGRU TARAMA
        For Each Row As GridViewRow In GridViewStudents.Rows

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

    Protected Sub CalendarAttendanceDate_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles CalendarAttendanceDate.PreRender
        If Not IsPostBack Then
            CalendarAttendanceDate.SelectedDate = DateAndTime.Today
        End If
    End Sub

    Protected Sub GridViewAttendanceTypes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewAttendanceTypes.SelectedIndexChanged

    End Sub
End Class
