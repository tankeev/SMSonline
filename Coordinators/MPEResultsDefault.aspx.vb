Imports System.IO

Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html
Imports iTextSharp.text.html.simpleparser

Partial Class Assignments
    Inherits System.Web.UI.Page

    Dim SqlString As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Coordinator") Then
            Response.Redirect("~/Warning.aspx")
        End If

        If Not IsPostBack Then
            If GridViewGeneralTestsScores.Rows.Count = 0 Then
                PanelTestScores.Visible = False
            Else
                PanelTestScores.Visible = True
            End If
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

    Protected Sub ButtonFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonFilter.Click
        Try

            Dim DropDownListAcademicTermsMaster As DropDownList = Master.FindControl("DropDownListAcademicTermsMaster")
            Dim DropDownListSchoolCodesMaster As DropDownList = Master.FindControl("DropDownListSchoolCodesMaster")

            SqlString = "SELECT GeneralTestID, GeneralTestName, SectionCatalog, StudentID, StudentName, Correct, Wrong, NotAnswered, Score, CourseCategory, SchoolCode, CurrentSectionID FROM vw_GeneralTestsScoresCalculated "
            Dim SqlStringFilter As String = String.Empty

            Dim SelectedItemCounter As Integer = 0

            For Each listItem As System.Web.UI.WebControls.ListItem In CheckBoxListSections.Items

                SqlStringFilter += If(listItem.Selected, String.Format("CurrentSectionID='{0}' OR ", listItem.Value), "")
                If listItem.Selected Then
                    SelectedItemCounter += 1
                End If
            Next

            If Not String.IsNullOrEmpty(SqlStringFilter) Then
                SqlStringFilter = SqlStringFilter.Substring(0, SqlStringFilter.Length - 3)
            End If

            If SelectedItemCounter = 0 Then

                PanelStatus.Visible = True
                PanelTestScores.Visible = False

                LabelStatus.Text = "Select A Grade First!"

            Else

                LabelStatus.Text = ""

                PanelStatus.Visible = False
                PanelTestScores.Visible = True

                SqlString += "Where SchoolCode=@SchoolCode And GeneralTestGroupID=@GeneralTestGroupID And CourseCategory=@CourseCategory And (" & SqlStringFilter & ") Order By StudentName"

                SqlDataSourceGeneralTestsScores.SelectCommand = SqlString

                SqlDataSourceGeneralTestsScores.SelectParameters.Clear()
                SqlDataSourceGeneralTestsScores.SelectParameters.Add(New Parameter("SchoolCode", Data.DbType.Int32, DropDownListSchoolCodesMaster.SelectedValue))
                SqlDataSourceGeneralTestsScores.SelectParameters.Add(New Parameter("CourseCategory", Data.DbType.String, DropDownListCourses.SelectedValue))
                SqlDataSourceGeneralTestsScores.SelectParameters.Add(New Parameter("GeneralTestGroupID", Data.DbType.String, DropDownListGeneralTestsGroups.SelectedValue))

                SqlDataSourceGeneralTestsScores.DataBind()

                GridViewGeneralTestsScores.DataSource = SqlDataSourceGeneralTestsScores
                GridViewGeneralTestsScores.DataBind()

                SqlDataSourceGeneralTestsScoresPrint.SelectCommand = SqlString

                SqlDataSourceGeneralTestsScoresPrint.SelectParameters.Clear()
                SqlDataSourceGeneralTestsScoresPrint.SelectParameters.Add(New Parameter("SchoolCode", Data.DbType.Int32, DropDownListSchoolCodesMaster.SelectedValue))
                SqlDataSourceGeneralTestsScoresPrint.SelectParameters.Add(New Parameter("CourseCategory", Data.DbType.String, DropDownListCourses.SelectedValue))
                SqlDataSourceGeneralTestsScoresPrint.SelectParameters.Add(New Parameter("GeneralTestGroupID", Data.DbType.String, DropDownListGeneralTestsGroups.SelectedValue))

                SqlDataSourceGeneralTestsScoresPrint.DataBind()

                GridViewGeneralTestsScoresPrint.AllowPaging = False

                GridViewGeneralTestsScoresPrint.DataSource = SqlDataSourceGeneralTestsScoresPrint
                GridViewGeneralTestsScoresPrint.DataBind()

            End If

        Catch ex As Exception
            LabelCheck.Text = ex.Message
        End Try
    End Sub

    Protected Sub GridViewGeneralTestsScores_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        Try
            If (e.CommandName = "ShowAnswers") Then

                Dim MyCommandArgument As String = e.CommandArgument.ToString()

                Dim MyArguments As String() = New String(2) {}

                Dim splitter As Char() = {";"}

                MyArguments = MyCommandArgument.Split(splitter)

                ' Retrieve the row index stored in the CommandArgument property.
                Dim index As Integer = Convert.ToInt32(MyArguments(0))

                ' Retrieve the row that contains the button from the Rows collection.
                Dim row As GridViewRow = GridViewGeneralTestsScores.Rows(index)

                Dim CourseCategoryLabel As Label = row.FindControl("CourseCategoryLabel")

                CourseCategoryLabel.Text = MyArguments(2) + " - " + MyArguments(1)

                Dim DataListGeneralTestStudentAnswers As DataList = row.FindControl("DataListGeneralTestStudentAnswers")

                Dim SqlDataSourceGeneralTestStudentAnswers As SqlDataSource = row.FindControl("SqlDataSourceGeneralTestStudentAnswers")

                SqlDataSourceGeneralTestStudentAnswers.SelectParameters("CourseCategory").DefaultValue = MyArguments(1)

                DataListGeneralTestStudentAnswers.DataBind()

            End If
        Catch ex As Exception
            LabelCheck.Text = ex.Message
        End Try
    End Sub

    Protected Sub ImageButtonExcel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonExcel.Click

        Dim filename As String = "MPE_" + DropDownListGeneralTestsGroups.SelectedIndex.ToString + ".xls"

        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", "attachment;filename=" + filename)
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-excel"
        Using sw As New StringWriter()

            Dim hw As New HtmlTextWriter(sw)

            'To Export all pages

            'GridViewGeneralTestsScoresPrint.AllowPaging = False
            'GridViewGeneralTestsScoresPrint.DataBind()

            GridViewGeneralTestsScoresPrint.HeaderRow.BackColor = System.Drawing.Color.White

            For Each cell As TableCell In GridViewGeneralTestsScoresPrint.HeaderRow.Cells
                cell.BackColor = GridViewGeneralTestsScoresPrint.HeaderStyle.BackColor
            Next
            For Each row As GridViewRow In GridViewGeneralTestsScoresPrint.Rows
                row.BackColor = System.Drawing.Color.White
                For Each cell As TableCell In row.Cells
                    If row.RowIndex Mod 2 = 0 Then
                        cell.BackColor = GridViewGeneralTestsScoresPrint.AlternatingRowStyle.BackColor
                    Else
                        cell.BackColor = GridViewGeneralTestsScoresPrint.RowStyle.BackColor
                    End If
                    cell.CssClass = "textmode"
                Next
            Next
            'GridViewGeneralTestsScoresPrint.Columns.RemoveAt(2)
            GridViewGeneralTestsScoresPrint.RenderControl(hw)
            'style to format numbers to string
            Dim style As String = "<style> .textmode { } </style>"
            Response.Write(style)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.[End]()

        End Using
    End Sub

    Protected Sub ImageButtonWord_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonWord.Click

        Dim filename As String = "MPE_" + DropDownListGeneralTestsGroups.SelectedIndex.ToString + ".doc"

        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", "attachment;filename=" + filename)
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-word "

        Dim sw As New StringWriter()

        Dim hw As New HtmlTextWriter(sw)

        'GridViewGeneralTestsScoresPrint.AllowPaging = False
        'GridViewGeneralTestsScoresPrint.DataBind()

        GridViewGeneralTestsScoresPrint.RenderControl(hw)

        Response.Output.Write(sw.ToString())
        Response.Flush()
        Response.End()
    End Sub

    Protected Sub ImageButtonPDF_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonPDF.Click

        'GridViewGeneralTestsScoresPrint.AllowPaging = False
        'GridViewGeneralTestsScoresPrint.DataBind()

        'Create a table
        Dim table As New iTextSharp.text.Table(GridViewGeneralTestsScoresPrint.Columns.Count)
        table.Cellpadding = 5

        'Set the column widths
        Dim widths As Integer() = New Integer(GridViewGeneralTestsScoresPrint.Columns.Count - 1) {}
        For x As Integer = 0 To GridViewGeneralTestsScoresPrint.Columns.Count - 1
            widths(x) = CInt(GridViewGeneralTestsScoresPrint.Columns(x).ItemStyle.Width.Value)
            Dim cellText As String = Server.HtmlDecode(GridViewGeneralTestsScoresPrint.HeaderRow.Cells(x).Text)
            Dim cell As New iTextSharp.text.Cell(cellText)
            'cell.BackgroundColor = New Color(System.Drawing.ColorTranslator.FromHtml("#008000"))
            table.AddCell(cell)

        Next
        table.SetWidths(widths)

        'Transfer rows from GridView to table
        For i As Integer = 0 To GridViewGeneralTestsScoresPrint.Rows.Count - 1
            If GridViewGeneralTestsScoresPrint.Rows(i).RowType = DataControlRowType.DataRow Then
                For j As Integer = 0 To GridViewGeneralTestsScoresPrint.Columns.Count - 1
                    Dim cellText As String = Server.HtmlDecode(GridViewGeneralTestsScoresPrint.Rows(i).Cells(j).Text)
                    Dim cell As New iTextSharp.text.Cell(cellText)
                    'Set Color of Alternating row
                    If i Mod 2 <> 0 Then
                        'cell.BackgroundColor = New Color(System.Drawing.ColorTranslator.FromHtml("#C2D69B"))
                    End If
                    table.AddCell(cell)
                Next
            End If
        Next

        'Create the PDF Document

        Dim pdfDoc As New Document(PageSize.A4, 10.0F, 10.0F, 10.0F, 0.0F)
        pdfDoc.SetPageSize(iTextSharp.text.PageSize.A4.Rotate)

        PdfWriter.GetInstance(pdfDoc, Response.OutputStream)

        pdfDoc.Open()
        pdfDoc.Add(table)
        pdfDoc.Close()

        Dim filename As String = "MPE_" + DropDownListGeneralTestsGroups.SelectedIndex.ToString + ".pdf"

        Response.ContentType = "application/pdf"
        Response.AddHeader("content-disposition", "attachment;filename=" + filename)
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.Write(pdfDoc)
        Response.End()

    End Sub

    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)
        ' Verifies that the control is rendered
    End Sub

End Class
