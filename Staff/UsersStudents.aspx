<%@ Page Title="SIS Students" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    ValidateRequest="false" EnableEventValidation="false" CodeFile="UsersStudents.aspx.vb"
    Inherits="Users_Students" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uswnb" %>
<%@ Register Src="InfoStudents.ascx" TagName="InfoStudents" TagPrefix="uc2" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU
                </h2>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                            <asp:Button ID="btnStudentInfo" runat="server" Style="display: none;" />
                            <asp:Label ID="Label121" runat="server" Text="Search Student:"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="28" align="center">
                            <asp:TextBox ID="TextBoxSearch" runat="server" Width="92%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="28" align="center">
                            <asp:Button ID="ButtonSearch" runat="server" Text="Search!" Width="95%" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content-right">
                <h2>
                    STUDENTS</h2>
                <br />
                <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID"
                    DataSourceID="SqlDataSourceStudents" Width="675px" AllowPaging="True" PageSize="20">
                    <Columns>
                        <asp:TemplateField HeaderText="S">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButtonInfo" runat="server" ImageUrl="~/Staff/Images/info.png"
                                    OnClick="ImageButtonInfo_Click" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="SectionCatalog" HeaderText="Section " SortExpression="SectionCatalog">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SchoolNo" HeaderText="SchoolNo" SortExpression="SchoolNo">
                            <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="StudentID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="LabelStudentID" runat="server" Text='<%# Bind("StudentID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="Images/no_results.jpg" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                Text="Sorry, No Students Found!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT DISTINCT StudentID, StudentName, SectionCatalog, SectionGroup, SchoolNo FROM vw_StaffCourseSectionStudents WHERE (StaffID = @StaffID) AND (AcademicTermID = @AcademicTermID) ORDER BY SectionGroup, SectionCatalog, StudentName">
                    <SelectParameters>
                        <asp:SessionParameter Name="StaffID" SessionField="UserID" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <uc2:InfoStudents ID="InfoStudents" runat="server" />
                <uswnb:WebMessageBox ID="WebMessageBoxStudents" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
