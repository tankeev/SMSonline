<%@ Page Title="SIS Asessments By Courses" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="AssessmentsByTeachers.aspx.vb" Inherits="Assignments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="MenuAssessments.ascx" TagName="MenuAssessments" TagPrefix="uc1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="content-left">
                <h2>
                    MENU</h2>
                <br />
                <uc1:MenuAssessments ID="MenuAssessments2" runat="server" />
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
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content-right">
                <h2>
                    ASSESSMENTS BY TEACHERS</h2>
                <br />
                <table width="675" class="content-table">
                    <tr>
                        <td width="350" height="50">
                            <asp:Label ID="Label27" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="Assessments" Font-Size="Medium"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label30" runat="server" Font-Bold="True" ForeColor="#333333" Text="Please Use this button to see the results:"></asp:Label>
                        </td>
                        <td align="center" width="35">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Staff/Images/info.png" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="GridViewAssessments" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceAssessments" Width="675px" DataKeyNames="AssessmentID"
                    AllowPaging="True">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="ImageItem0" runat="server" ImageUrl="~/Coordinators/Images/Item.png" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="CourseCategory" HeaderText="Course " SortExpression="CourseCategory">
                            <ItemStyle Width="125px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SectionCatalog" HeaderText="Section" SortExpression="SectionCatalog">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Type" SortExpression="CourseSectionAssessmentTypeID">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownListAssessmentType" runat="server" DataSourceID="SqlDataSourceAssessmentsTypes"
                                    DataTextField="Assessment Type" DataValueField="CourseSectionAssessmentTypeID"
                                    SelectedValue='<%# DataBinder.Eval (Container.DataItem, "CourseSectionAssessmentTypeID") %>'
                                    Width="90%">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Assessment" SortExpression="Assessment">
                            <ItemTemplate>
                                <div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 150px">
                                    <asp:Label ID="LabelAssessments" runat="server" Text='<%# Bind("Assessment") %>'
                                        ToolTip='<%# Bind("Assessment") %>' Font-Size="XX-Small"></asp:Label>
                                </div>
                            </ItemTemplate>
                            <ItemStyle Width="160px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" SortExpression="Date">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="75px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="L" SortExpression="IsLocked">
                            <HeaderTemplate>
                                <asp:CheckBox ID="CheckBoxAll" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBoxAll" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxIsLocked" runat="server" Checked='<%# Bind("IsLocked") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="25px" />
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Image" SelectImageUrl="Images/info.png" ShowSelectButton="True">
                            <ItemStyle HorizontalAlign="Center" Width="35px" />
                        </asp:CommandField>
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Panel ID="PanelEmpty" runat="server" HorizontalAlign="Center">
                            <br />
                            <asp:Image ID="ImageEmpty" runat="server" ImageUrl="Images/warning.png" />
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Sorry No Data Found!"></asp:Label>
                            <br />
                        </asp:Panel>
                    </EmptyDataTemplate>
                    <HeaderStyle Height="30px" />
                    <SelectedRowStyle BackColor="#FFFF99" />
                </asp:GridView>
                <br />
                <asp:Button ID="ButtonUpdateAll" runat="server" Text="Save Changes" Width="675px" />
                <br />
                <asp:ConfirmButtonExtender ID="ButtonUpdateAll_ConfirmButtonExtender" runat="server"
                    ConfirmText="Do you really want to save changes?" Enabled="True" TargetControlID="ButtonUpdateAll">
                </asp:ConfirmButtonExtender>
                <br />
                <asp:GridView ID="GridViewAssessmentsMarks" runat="server" AutoGenerateColumns="False"
                    DataSourceID="SqlDataSourceAssessmentsMarks" Width="675px">
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
                        <asp:TemplateField HeaderText="Score" SortExpression="Score">
                            <ItemTemplate>
                                <asp:Label ID="LabelScore" runat="server" ForeColor="Red" Text='<%# Bind("Score") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Bold="True" HorizontalAlign="Center" Width="50px" />
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
                <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceAssessmentsMarks" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StudentName, AssessmentMark AS Score FROM vw_AssessmentMarks WHERE (AssessmentID = @AssessmentID) ORDER BY StudentName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewAssessments" Name="AssessmentID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessmentsTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT CourseSectionAssessmentTypeID, CourseCategory + N' ' + SectionCatalog + N' ' + Description AS [Assessment Type] FROM vw_CourseSectionAssessmentTypes WHERE (StaffID = @StaffID) AND (AcademicTermID = @AcademicTermID) ORDER BY CourseCategory + N' ' + SectionCatalog + N' ' + Description">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBoxTeachers" Name="StaffID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceAssessments" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT AssessmentID, CourseCategory, SectionCatalog, AssessmentType, Assessment, Date, CourseSectionAssessmentTypeID, IsLocked FROM vw_AssessmentsByTeachers WHERE (AcademicTermID = @AcademicTermID) AND (StaffID = @StaffID) ORDER BY CourseCategory, SectionCatalog, AssessmentType, Assessment"
                    UpdateCommand="UPDATE tbl_Assessments SET CourseSectionAssessmentTypeID = @CourseSectionAssessmentTypeID, IsLocked = @IsLocked WHERE (AssessmentID = @AssessmentID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListAcademicTermsMaster" Name="AcademicTermID"
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListBoxTeachers" Name="StaffID" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CourseSectionAssessmentTypeID" />
                        <asp:Parameter Name="IsLocked" />
                        <asp:Parameter Name="AssessmentID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                    SelectCommand="SELECT StaffID, StaffName FROM tbl_Staff WHERE (SchoolCode = @SchoolCode) ORDER BY StaffName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
