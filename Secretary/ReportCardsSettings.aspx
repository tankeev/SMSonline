<%@ Page Title="SIS Report Cards" Language="VB" MasterPageFile="~/Site.Master" CodeFile="ReportCardsSettings.aspx.vb"
    Inherits="Attendance_Checklist" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuReportCards.ascx" TagName="MenuReportCards" TagPrefix="uc2" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="content-left">
        <h2>
            MENU</h2>
        <br />
        <uc2:MenuReportCards ID="MenuReportCards" runat="server" />
        <br />
        <table class="content-table" width="240">
            <tr>
                <td height="28">
                    <asp:Label ID="Label148" runat="server" Font-Bold="True" Text="Report Type" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButtonList ID="RadioButtonListReportTypes" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="1">Midterm Report Card</asp:ListItem>
                        <asp:ListItem Selected="True" Value="2">Final Report Card</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td height="28">
                    <asp:Label ID="Label173" runat="server" Font-Bold="True" Text="Set Print Date" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="28">
                    <asp:TextBox ID="TextBoxDate" runat="server" ValidationGroup="Date" Width="95%"></asp:TextBox>
                    <asp:CalendarExtender ID="TextBoxDate_CalendarExtender" runat="server" Enabled="True"
                        TargetControlID="TextBoxDate">
                    </asp:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td height="28">
                    <asp:Label ID="Label44" runat="server" Font-Bold="True" Text="Select Section" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButtonList ID="RadioButtonListSections" runat="server" DataSourceID="SqlDataSourceSections"
                        DataTextField="SectionCatalog" DataValueField="SectionCatalogID" RepeatColumns="4"
                        Width="95%">
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td height="28">
                    <asp:Button ID="ButtonShowList" runat="server" Text="Show Students" ValidationGroup="Date"
                        Width="95%" />
                </td>
            </tr>
            <tr>
                <td height="22">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ControlToValidate="TextBoxDate"
                        ErrorMessage="(*) Select A Proper Date Please!" Font-Bold="True" ForeColor="Red"
                        ValidationGroup="Date"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td height="22">
                    <asp:RangeValidator ID="RangeValidatorDate" runat="server" ControlToValidate="TextBoxDate"
                        ErrorMessage="(*) Select A Proper Date Please!" Font-Bold="True" ForeColor="Red"
                        MaximumValue="1.1.2020" MinimumValue="1.1.2010" Type="Date" ValidationGroup="Date"></asp:RangeValidator>
                </td>
            </tr>
        </table>
        <br />
    </div>
    <div class="content-right">
        <h2>
            REPORT CARD SETTINGS</h2>
        <br />
        <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID"
            DataSourceID="SqlDataSourceReportsStudents" Width="675px">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Secretary/Images/Item.png" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="35px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="StudentID" SortExpression="StudentID" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="LabelStudentID" runat="server" Text='<%# Bind("StudentID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />
                <asp:TemplateField HeaderText="HTM">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLinkReport" runat="server" ImageUrl="~/Secretary/Images/htm_png.png"
                            NavigateUrl="#" Target="_blank"></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PDF">
                    <ItemTemplate>
                        <asp:Image ID="ImaDge2" runat="server" ImageUrl="~/Secretary/Images/pdf_png.png" />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PRINT">
                    <ItemTemplate>
                        <asp:Image ID="ImaDDge2" runat="server" ImageUrl="~/Secretary/Images/printer.png" />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <div align="center">
                    <br />
                    <img alt="" src="Images/no-data.png" />
                    <br />
                    <br />
                    <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                        Text="Please Select a School Section to see the Students!"></asp:Label>
                    <br />
                    <br />
                </div>
            </EmptyDataTemplate>
        </asp:GridView>
        <br />
        <br />
        <asp:Label ID="LabelStatus" runat="server" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) ORDER BY SectionGroup">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceReportsStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            SelectCommand="SELECT StudentID, StudentName, SchoolCode FROM tbl_Students WHERE (CurrentSectionID = @CurrentSectionID) AND (SchoolCode = @SchoolCode) AND ([Continue] = 1) ORDER BY StudentName">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadioButtonListSections" Name="CurrentSectionID"
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
