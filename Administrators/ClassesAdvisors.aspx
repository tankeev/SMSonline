<%@ Page Title="SIS HomeRoom Teachers" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="ClassesAdvisors.aspx.vb" Inherits="UserList" %>

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
            </div>
            <div class="content-right">
                <h2>
                    CLASSROOM TEACHERS</h2>
                <br />
                <asp:GridView ID="GridViewClassesTeachers" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="SectionMentorID" OnRowUpdated="GridViewUpdateEventHandler" DataSourceID="SqlDataSourceClassesTeachers"
                    Width="680px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Administrators/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <strong>
                                    <%# Container.DataItemIndex + 1 %>
                                </strong>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="45px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Section" SortExpression="SectionCatalog">
                            <ItemTemplate>
                                <asp:Label ID="LabelSection" runat="server" Font-Bold="True" ForeColor="Red" Text='<%# Eval("SectionCatalog") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="HomeRoom Teacher">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListStaff" runat="server" DataSourceID="SqlDataSourceStaff"
                                    DataTextField="StaffName" DataValueField="StaffID" SelectedValue='<%# DataBinder.Eval (Container.DataItem, "StaffID") %>'
                                    Width="95%">
                                </asp:DropDownList>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Update" ImageUrl="~/Administrators/Images/save.gif" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div align="center">
                            <br />
                            <img alt="" src="../Administrators/Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                            <br />
                            <br />
                            <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" Text="Sorry! No Student Found!"></asp:Label>
                            <br />
                            <br />
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle Height="30px" />
                </asp:GridView>
                <br />
                <asp:Label ID="LabelTotal" runat="server" Font-Bold="True"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceClassesTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StaffID, SectionCatalog, SectionMentorID, StaffName, IsDefault, SectionGroup FROM vw_SectionsMentors WHERE (SchoolCode = @SchoolCode) AND (AcademicYearID = @AcademicTermID) ORDER BY SectionGroup"
                    
                    
                    UpdateCommand="UPDATE tbl_SectionMentors SET StaffID = @StaffID WHERE (SectionMentorID = @SectionMentorID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="StaffID" />
                        <asp:Parameter Name="SectionMentorID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    
                    SelectCommand="SELECT StaffID, StaffName FROM vw_UsersStaff WHERE (SchoolCode = @SchoolCode) ORDER BY StaffName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
