<%@ Page Title="SIS Registration" Language="VB" MasterPageFile="~/Site.Master" CodeFile="ClassesRegistered.aspx.vb"
    Inherits="UserList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuClasses.ascx" TagName="MenuClasses" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuClasses ID="MenuClasses" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label25" runat="server" Font-Bold="True" Text="School Sections"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListSectionsLeft" runat="server" DataSourceID="SqlDataSourceSections"
                                DataTextField="SectionCatalog" DataValueField="SectionCatalogID" RepeatColumns="4"
                                AutoPostBack="True">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                           </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="content-right">
                <h2>
                    CLASSROOM REGISTRATION</h2>
                <br />
                <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataKeyNames="AcademicTermStudentID"
                    DataSourceID="SqlDataSourceAcademicTermsStudents" Width="680px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <strong>
                                    <%# Container.DataItemIndex + 1 %>
                                </strong>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="SectionCatalog" HeaderText="Section" SortExpression="SectionCatalog">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" />
                        <asp:TemplateField HeaderText="Olympiad" SortExpression="IsOlympiad">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsOlympiad") %>' />
                                <asp:HoverMenuExtender ID="CheckBox1_HoverMenuExtender" runat="server" HoverCssClass="popupHover"
                                    PopupPosition="Left" OffsetX="0" OffsetY="0" PopDelay="50" TargetControlID="CheckBox1"
                                    PopupControlID="PanelInfo">
                                </asp:HoverMenuExtender>
                                <asp:Panel ID="PanelInfo" runat="server" BackColor="#FFFFCC" BorderColor="#FF6600"
                                    BorderStyle="Solid" BorderWidth="1px">
                                    <asp:Label ID="LabelOlympiadName" runat="server" Text='<%# Eval("OlympiadName") %>'></asp:Label>
                                </asp:Panel>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="75px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Scholarship" SortExpression="IsScholarship">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("IsScholarship") %>' />
                                <asp:HoverMenuExtender ID="CheckBox2_HoverMenuExtender" runat="server" HoverCssClass="popupHover"
                                    PopupPosition="Left" OffsetX="0" OffsetY="0" PopDelay="50" TargetControlID="CheckBox2"
                                    PopupControlID="PanelInfo2">
                                </asp:HoverMenuExtender>
                                <asp:Panel ID="PanelInfo2" runat="server" BackColor="#FFFFCC" BorderColor="#FF6600"
                                    BorderStyle="Solid" BorderWidth="1px">
                                    <asp:Label ID="LabelScholarshipPercentage" runat="server" Text='<%# Eval("ScholarshipPercentage") %>'></asp:Label>
                                </asp:Panel>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="75px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" Text="Sorry! No Student Found!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    
                    SelectCommand="SELECT SectionCatalogID, SectionCatalog FROM vw_SectionsMentors WHERE (SchoolCode = @SchoolCode) AND (AcademicTermID = @AcademicTermID) ORDER BY SectionGroup">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAcademicTermsStudents" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AcademicTermStudentID, AcademicYear, AcademicTerm, StudentID, StudentName, IsOlympiad, OlympiadName, IsScholarship, SectionCatalogID, SectionCatalog, SchoolCode, SchoolName, ScholarshipPercentage FROM vw_AcademicTermsStudents WHERE (AcademicTermID = @AcademicTermID) AND (SectionCatalogID = @SectionCatalogID) AND (SchoolCode = @SchoolCode)"
                    InsertCommand="IF NOT EXISTS (SELECT * FROM tbl_AcademicTermsStudents
                   WHERE AcademicTermID = @AcademicTermID
                   AND StudentID= @StudentID
                   AND SectionCatalogID = @SectionCatalogID)

INSERT INTO tbl_AcademicTermsStudents(AcademicTermID, SchoolCode, StudentID, SectionCatalogID) VALUES (@AcademicTermID, @SchoolCode, @StudentID, @SectionCatalogID)"
                    DeleteCommand="DELETE FROM tbl_AcademicTermsStudents WHERE (AcademicTermID = @AcademicTermID) AND (StudentID = @StudentID) AND (SectionCatalogID = @SectionCatalogID)">
                    <DeleteParameters>
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="SectionCatalogID" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="AcademicTermID" />
                        <asp:Parameter Name="StudentID" />
                        <asp:Parameter Name="SectionCatalogID" />
                        <asp:Parameter Name="SchoolCode" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="RadioButtonListSectionsLeft" Name="SectionCatalogID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
