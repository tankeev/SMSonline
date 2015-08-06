<%@ Page Title="SIS Study Skills" Language="VB" MasterPageFile="Setup.Master" AutoEventWireup="false"
    CodeFile="StudySkills.aspx.vb" Inherits="AssessmentTypesGlobal" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridViewMainAssessmentTypes" runat="server" AutoGenerateColumns="False"
                DataKeyNames="StudySkillID" DataSourceID="SqlDataSourceStudySkills" ShowFooter="True"
                Width="100%">
                <Columns>
                    <asp:TemplateField InsertVisible="False" SortExpression="AcademicYearID">
                        <ItemTemplate>
                            <img alt="" src="Images/Row.gif" style="width: 16px; height: 16px" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Study Skill">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxStudySkill" runat="server" Text='<%# Bind("StudySkill") %>'
                                Width="90%" ValidationGroup="Update"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="School Name" SortExpression="Color">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownListSchoolCodes" runat="server" DataSourceID="SqlDataSourceSchoolCodes"
                                DataTextField="SchoolName" DataValueField="SchoolCode" SelectedValue='<%# Bind("SchoolCode") %>'
                                TabIndex="7" Width="95%">
                                <asp:ListItem Value="">Select School</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                        <ItemStyle Width="220px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Section">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBoxSection" runat="server" Text='<%# Bind("SchoolSection") %>'
                                Width="40px"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="75px" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonSave" runat="server" CommandName="Update" ImageUrl="~/Administrators/Images/save.gif"
                                ToolTip="Update!" ValidationGroup="Update" />
                            <br />
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                        <FooterStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonDelete" runat="server" CommandName="Delete" ImageUrl="~/Administrators/Images/delete.gif"
                                ToolTip="Delete!" />
                            <asp:ConfirmButtonExtender ID="ConfirmButtonExtenderDelete" runat="server" TargetControlID="ImageButtonDelete"
                                ConfirmText="Do You Really Want to Delete?" ConfirmOnFormSubmit="false">
                            </asp:ConfirmButtonExtender>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div align="center">
                        <br />
                        <img alt="" src="Images/No_Data_Icon.png" style="width: 64px; height: 63px" />
                        <br />
                        <br />
                        <asp:Label ID="LabelWarning" runat="server" Font-Bold="True" Text="Sorry! No Data Found!"></asp:Label>
                        <br />
                        <br />
                    </div>
                </EmptyDataTemplate>
                <RowStyle Height="30px" />
            </asp:GridView>
            <br />
            <asp:FormView ID="FormViewMainAssessmentTypes" runat="server" DataKeyNames="AssessmentTypeID"
                DataSourceID="SqlDataSourceStudySkills" DefaultMode="Insert" Width="100%">
                <EditItemTemplate>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="divRow">
                        <div class="divCellTitle">
                            <div class="divImage">
                                <table width="100%">
                                    <tr>
                                        <td height="35" width="20">
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td width="120">
                                            <asp:Label ID="LabelWeekNo" runat="server" Text="Study Skill"></asp:Label>
                                        </td>
                                        <td width="250">
                                            <asp:TextBox ID="TextBoxAssessmentType" runat="server" Text='<%# Bind("StudySkill") %>'
                                                Width="220px"></asp:TextBox>
                                        </td>
                                        <td align="center" rowspan="4" valign="top">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="35">
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelWeekNo0" runat="server" Text="School Section"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxColor" runat="server" Text='<%# Bind("SchoolSection") %>'
                                                Width="220px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="35">
                                            <img alt="" src="Images/arrow.gif" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelWeekNo1" runat="server" Text="School Code"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListSchoolCodes" runat="server" DataSourceID="SqlDataSourceSchoolCodes"
                                                DataTextField="SchoolName" DataValueField="SchoolCode" SelectedValue='<%# Bind("SchoolCode") %>'
                                                TabIndex="7" Width="230px">
                                                <asp:ListItem Value="">Select School</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="35">
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Button ID="ButtonAdd" runat="server" CommandName="Insert" Text="Add Study Skill"
                                                ValidationGroup="AddWeek" Width="99%" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                </ItemTemplate>
            </asp:FormView>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceSchoolCodes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT SchoolCode, SchoolName, Show FROM tbl_Schools WHERE (Show = 1) ORDER BY SchoolName">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceStudySkills" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT StudySkillID, StudySkill, SchoolCode, SchoolSection FROM tbl_StudySkills"
                UpdateCommand="UPDATE tbl_StudySkills SET StudySkill = @StudySkill, SchoolCode = @SchoolCode, SchoolSection = @SchoolSection WHERE (StudySkillID = @StudySkillID)"
                DeleteCommand="DELETE FROM tbl_StudySkills WHERE (StudySkillID = @StudySkillID)"
                InsertCommand="INSERT INTO tbl_StudySkills(StudySkill, SchoolCode, SchoolSection) VALUES (@StudySkill, @SchoolCode, @SchoolSection)">
                <DeleteParameters>
                    <asp:Parameter Name="StudySkillID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="StudySkill" />
                    <asp:Parameter Name="SchoolCode" />
                    <asp:Parameter Name="SchoolSection" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="StudySkill" />
                    <asp:Parameter Name="SchoolCode" />
                    <asp:Parameter Name="SchoolSection" />
                    <asp:Parameter Name="StudySkillID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
