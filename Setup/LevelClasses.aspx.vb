
Partial Class Assignments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not User.IsInRole("Administrator") Then
            Response.Redirect("~/Warning.aspx")
        End If

        Dim DropDownListAcademicTermsEng As DropDownList = FormViewLevelENG.FindControl("DropDownListAcademicTerms")
        DropDownListAcademicTermsEng.SelectedValue = Session("AcademicTermID")

        Dim DropDownListAcademicTermsTur As DropDownList = FormViewLevelTUR.FindControl("DropDownListAcademicTerms")
        DropDownListAcademicTermsTur.SelectedValue = Session("AcademicTermID")

    End Sub

End Class
