<%@ Page Title="SIS Report Cards" Language="VB" MasterPageFile="~/Site.Master" CodeFile="ReportCardsSettings.aspx.vb"
    Inherits="ReportCards_Settings" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuReportCards.ascx" TagName="MenuReportCards" TagPrefix="uc2" %>
<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc2:MenuReportCards ID="MenuReportCards" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label173" runat="server" Font-Bold="True" Text="Select Print Date"
                                ForeColor="Red"></asp:Label>
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
                            <asp:Label ID="Label175" runat="server" Font-Bold="True" ForeColor="Red" Text="Select School Level"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:RadioButtonList ID="RadioButtonListSectionSchool" runat="server" AutoPostBack="True"
                                RepeatDirection="Horizontal" Width="95%">
                                <asp:ListItem Value="SD">SD</asp:ListItem>
                                <asp:ListItem Value="SMP">SMP</asp:ListItem>
                                <asp:ListItem Selected="True" Value="SMA">SMA</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label176" runat="server" Font-Bold="True" Text="Select School Section"
                                ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListSections" runat="server" DataSourceID="SqlDataSourceSections"
                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" RepeatColumns="4"
                                Width="95%" AutoPostBack="True">
                            </asp:RadioButtonList>
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
                    <tr>
                        <td height="22">
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    REPORT CARD SETTINGS</h2>
                <br />
                <asp:TabContainer ID="TabContainer" runat="server" ActiveTabIndex="0" CssClass="tab"
                    Width="675px">
                    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                        <HeaderTemplate>
                            MID-TERM REPORT
                        </HeaderTemplate>
                        <ContentTemplate>
                            <br />
                            <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" DataSourceID="SqlDataSourceAcademicTerms"
                                DataTextField="AcademicTerm" DataValueField="AcademicTermID" Width="650px">
                            </asp:DropDownList>
                            <br />
                            <br />
                            <asp:GridView ID="GridViewMidReport" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID"
                                DataSourceID="SqlDataSourceReportsStudents" Width="650px">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Staff/Images/Item.png" />
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
                                            <asp:HyperLink ID="HyperLinkReport" runat="server" ImageUrl="~/Staff/Images/htm_png.png"
                                                NavigateUrl="#" Target="_blank"></asp:HyperLink>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PDF">
                                        <ItemTemplate>
                                            <asp:Image ID="ImaDge2" runat="server" ImageUrl="~/Staff/Images/pdf_png.png" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PRINT">
                                        <ItemTemplate>
                                            <asp:Image ID="ImaDDge2" runat="server" ImageUrl="~/Staff/Images/printer.png" />
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
                            <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicSemester + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms WHERE (ReportTypeID = 1) ORDER BY Active DESC, AcademicTerm DESC">
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                        <HeaderTemplate>
                            FINAL REPORT
                        </HeaderTemplate>
                        <ContentTemplate>
                            <br />
                            <asp:DropDownList ID="DropDownListAcademicSemesters" runat="server" DataSourceID="SqlDataSourceAcademicSemesters"
                                DataTextField="AcademicSemester" DataValueField="AcademicSemesterID" Width="650px">
                            </asp:DropDownList>
                            <br />
                            <br />
                            <asp:GridView ID="GridViewFinalReport" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="StudentID" DataSourceID="SqlDataSourceReportsStudents" Width="650px">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Staff/Images/Item.png" />
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
                                            <asp:HyperLink ID="HyperLinkReport" runat="server" ImageUrl="~/Staff/Images/htm_png.png"
                                                NavigateUrl="#" Target="_blank"></asp:HyperLink>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PDF">
                                        <ItemTemplate>
                                            <asp:Image ID="ImaDge3" runat="server" ImageUrl="~/Staff/Images/pdf_png.png" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PRINT">
                                        <ItemTemplate>
                                            <asp:Image ID="ImaDDge3" runat="server" ImageUrl="~/Staff/Images/printer.png" />
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
                                        <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" Font-Size="Medium"
                                            ForeColor="Red" Text="Please Select a School Section to see the Students!"></asp:Label>
                                        <br />
                                        <br />
                                    </div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceAcademicSemesters" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                                SelectCommand="SELECT AcademicSemesterID, AcademicYear + N' ' + AcademicSemester AS AcademicSemester FROM tbl_AcademicTerms WHERE (ReportTypeID = 2) ORDER BY Active DESC, AcademicSemester DESC">
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_Sections WHERE (SchoolCode = @SchoolCode) AND (SectionSchool = @SectionSchool) ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="RadioButtonListSectionSchool" Name="SectionSchool"
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
                <uc1:WebMessageBox ID="WebMessageBoxReports" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
