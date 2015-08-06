<%@ Page Title="SIS Attendance Archive" Language="VB" MasterPageFile="~/Site.Master"
    AutoEventWireup="false" CodeFile="MicroTeaching.aspx.vb" Inherits="UserList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    ATTENDANCE</h2>
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="30">
                            <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" Width="95%" DataSourceID="SqlDataSourceAcademicTerms"
                                DataTextField="AcademicTerm" DataValueField="AcademicTermID">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:DropDownList ID="DropDownListSchoolCodes" runat="server" TabIndex="7" Width="95%"
                                DataSourceID="SqlDataSourceSchoolCodes" DataTextField="SchoolName" DataValueField="SchoolCode"
                                AutoPostBack="True" Enabled="False">
                                <asp:ListItem Value="">Select School</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label42" runat="server" Font-Bold="True" Text="Select Date:" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Calendar ID="CalendarAttendanceDate" runat="server" BackColor="White" Width="95%">
                                <SelectedDayStyle BackColor="#FF9900" />
                                <TitleStyle BackColor="#33CCFF" />
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    ARCHIVE</h2>
                <br />
                <asp:GridView ID="GridViewMicroTeaching" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="MicroTeachingID" DataSourceID="SqlDataSourceMicroTeaching" 
                    Width="680px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image6" runat="server" ImageUrl="~/Development/Images/menu-alt-24.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date / Name" SortExpression="Date">
                            <ItemTemplate>
                                <asp:Label ID="LabelDate" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="Red"
                                    Text='<%# Bind("Date", "{0:D}") %>'></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="LabelName" runat="server" Font-Bold="True" Font-Size="X-Small" Text='<%# Bind("TraineeName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Teaching Topics / Notes" SortExpression="TopicID">
                            <ItemTemplate>
                                <asp:Label ID="LabelTitle" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="Red"
                                    Text='<%# Eval("UnitTitle") %>'></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="LabelNotes" runat="server" Font-Bold="True" Font-Size="X-Small" Text='<%# Bind("Notes") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="../Development/Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning1" runat="server" Font-Bold="True" Text="Sorry! No Record Found!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="75px" />
                </asp:GridView>
                <br />
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms ">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT SchoolCode, SchoolName FROM tbl_Schools WHERE (SchoolCode = @SchoolCode) ORDER BY SchoolName">
                    <SelectParameters>
                        <asp:ProfileParameter Name="SchoolCode" PropertyName="SchoolCode" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceMicroTeaching" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT tbl_DevelopmentMicroTeaching.MicroTeachingID, tbl_DevelopmentMicroTeaching.TraineeID, tbl_DevelopmentMicroTeaching.Date, tbl_DevelopmentMicroTeaching.Notes, tbl_DevelopmentMicroTeaching.AcademicTermID, tbl_DevelopmentMicroTeaching.SavedBy, tbl_Staff.StaffName AS TraineeName, tbl_DevelopmentMicroTeaching.UnitTitleID, tbl_SectionCatalog.SectionCatalog, tbl_CourseUnitTitles.UnitTitle FROM tbl_DevelopmentMicroTeaching INNER JOIN tbl_Staff ON tbl_DevelopmentMicroTeaching.TraineeID = tbl_Staff.StaffID INNER JOIN tbl_SectionCatalog ON tbl_DevelopmentMicroTeaching.SectionCatalogID = tbl_SectionCatalog.SectionCatalogID INNER JOIN tbl_CourseUnitTitles ON tbl_DevelopmentMicroTeaching.UnitTitleID = tbl_CourseUnitTitles.UnitTitleID WHERE (tbl_DevelopmentMicroTeaching.TraineeID = @TraineeID)"
                    InsertCommand="INSERT INTO tbl_DevelopmentMicroTeaching(TraineeID, Date, Notes, AcademicTermID, UnitTitleID, SavedBy, SectionCatalogID, SchoolCode) VALUES (@TraineeID, @Date, @Notes, @AcademicTermID, @UnitTitleID, @SavedBy, @SectionCatalogID, @SchoolCode)">
                    <InsertParameters>
                        <asp:Parameter Name="TraineeID" />
                        <asp:Parameter Name="Date" />
                        <asp:Parameter Name="Notes" />
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="UnitTitleID" />
                        <asp:Parameter Name="SavedBy" />
                        <asp:Parameter Name="SectionCatalogID" />
                        <asp:Parameter Name="SchoolCode" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="TraineeID" SessionField="UserID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
