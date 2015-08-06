<%@ Page Title="SIS Asessments By Courses" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="AssessmentsStudentMarks.aspx.vb" Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuAssessments.ascx" TagName="MenuAssessments" TagPrefix="uc1" %>
<%@ Register Src="WebMessageBox.ascx" TagName="WebMessageBox" TagPrefix="uc2" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuAssessments ID="MenuAssessments" runat="server" />
                <br />
                <table class="content-table" width="240">
                    <tr>
                        <td height="28">
                            <asp:Label ID="Label34" runat="server" Font-Bold="True" Text="Teacher List"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="ListBoxTeachers" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceTeachers"
                                DataTextField="StaffName" DataValueField="StaffID" Height="250px" Width="95%">
                            </asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="28">
                            <asp:Label ID="LabelTotal" runat="server"></asp:Label>
                            <asp:Button ID="btnShow" runat="server" Style="display: none;" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content-right">
                <h2>
                    ASSESSMENTS BY TEACHERS</h2>
                <br />
                <asp:DropDownList ID="DropDownListAssessments" runat="server" AutoPostBack="True"
                    DataSourceID="SqlDataSourceAssessments" DataTextField="Assessment" DataValueField="AssessmentID"
                    Width="675px">
                </asp:DropDownList>
                <br />
                <br />
                <asp:GridView ID="GridViewAssessmentsMarks" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceAssessmentsMarks" Width="675px" DataKeyNames="AssessmentMarkID">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="ImageItem" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="NO">
                            <ItemTemplate>
                                <strong>
                                    <%# Container.DataItemIndex + 1 %>
                                </strong>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName">
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Excused?">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxExcused" runat="server" Checked='<%# Bind("Excused") %>' />
                                <asp:HoverMenuExtender ID="CheckBoxExcused_HoverMenuExtender" runat="server" OffsetX="0"
                                    OffsetY="0" PopDelay="50" PopupControlID="PanelInfoCheckBoxExcused" PopupPosition="Right"
                                    TargetControlID="CheckBoxExcused">
                                </asp:HoverMenuExtender>
                                <asp:Panel ID="PanelInfoCheckBoxExcused" runat="server" CssClass="MenuToolTip" Width="230"
                                    Style="display: none;" HorizontalAlign="Left">
                                    <asp:Label ID="Label1" runat="server" Text="Is Student Excused?" ForeColor="Red"
                                        Font-Bold="True"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label131" runat="server" Text="Check this, if the student is excused from Assessment for a valid reason."></asp:Label>
                                    <img class="callout" src="images/callout.gif" />
                                </asp:Panel>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="75px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Score">
                            <ItemTemplate>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBoxInput"
                                    ErrorMessage="*" Font-Bold="True" ForeColor="Red" MaximumValue="100" MinimumValue="0"
                                    Type="Integer" ValidationGroup="AssessmentMarks">*</asp:RangeValidator>
                                <asp:TextBox ID="TextBoxInput" runat="server" Text='<%# Bind("Score") %>' Width="30px"
                                    ValidationGroup="AssessmentMarks"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxInput"
                                    ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="AssessmentMarks">*</asp:RequiredFieldValidator>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Bold="True" HorizontalAlign="Center" Width="75px" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Panel ID="PanelEmpty" runat="server" HorizontalAlign="Center">
                            <br />
                            <asp:Image ID="ImageEmpty" runat="server" ImageUrl="~/Coordinators/Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Sorry No Data Found!"></asp:Label>
                            <br />
                        </asp:Panel>
                    </EmptyDataTemplate>
                    <HeaderStyle Height="30px" />
                </asp:GridView>
                <br />
                <asp:Button ID="ButtonUpdateAllMarks" runat="server" Text="Update Assessment Marks"
                    ValidationGroup="AssessmentMarks" Width="675px" />
                <asp:ConfirmButtonExtender ID="ButtonUpdateAllMarks_ConfirmButtonExtender" runat="server"
                    ConfirmText="Do you really want to update?" Enabled="True" TargetControlID="ButtonUpdateAllMarks">
                </asp:ConfirmButtonExtender>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StaffID, StaffName FROM tbl_Staff WHERE (SchoolCode = @SchoolCode) ORDER BY StaffName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AssessmentID, CourseCategory + N' ' + SectionCatalog + N' ' + AssessmentType + N' ' + Assessment AS Assessment FROM vw_AssessmentsByTeachers WHERE (AcademicTermID = @AcademicTermID) AND (StaffID = @StaffID) ORDER BY CourseCategory + N' ' + SectionCatalog + N' ' + AssessmentType + N' ' + Assessment">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListBoxTeachers" Name="StaffID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessmentsMarks" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AssessmentMarkID, AssessmentID, StudentName, AssessmentMark AS Score, Excused, IsLocked FROM vw_AssessmentMarks WHERE (AssessmentID = @AssessmentID) ORDER BY StudentName"
                    UpdateCommand="UPDATE tbl_AssessmentMarks SET AssessmentMark = @AssessmentMark, Excused = @Excused WHERE (AssessmentMarkID = @AssessmentMarkID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAssessments" Name="AssessmentID" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="AssessmentMark" />
                        <asp:Parameter Name="Excused" />
                        <asp:Parameter Name="AssessmentMarkID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <uc2:WebMessageBox ID="WebMessageBoxAssessments" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
