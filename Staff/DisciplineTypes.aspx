<%@ Page Title="SIS Discipline Checklist" Language="VB" MasterPageFile="~/Site.Master"
    CodeFile="DisciplineTypes.aspx.vb" Inherits="Attendance_Checklist" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="content-left">
        <h2>
            DISCIPLINE</h2>
        <br />
        <table class="content-table" width="240">
            </tr>
            <tr>
                <td width="40">
                    <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Staff/Images/button_green.png"
                        NavigateUrl="~/Staff/DisciplineChecklist.aspx">Add New</asp:HyperLink>
                </td>
                <td>
                    <asp:Label ID="Label48" runat="server" Text="Discipline Points"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table class="content-table" width="240">
            </tr>
            <tr>
                <td width="40">
                    <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Staff/Images/button_green.png"
                        NavigateUrl="~/Staff/DisciplineStudentPoints.aspx">Add New</asp:HyperLink>
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Behaviour Points"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:LoginView ID="LoginViewDiscipline" runat="server">
            <RoleGroups>
                <asp:RoleGroup Roles="DisciplineAdmin">
                    <ContentTemplate>
                        <table class="content-table" width="240">
                            </tr>
                            <tr>
                                <td width="40">
                                    <asp:HyperLink ID="HyperLinkAddNew" runat="server" ImageUrl="~/Staff/Images/button_orange.png"
                                        NavigateUrl="~/Staff/DisciplineAddBonusPoints.aspx">Add New</asp:HyperLink>
                                </td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="Update Bonus Points"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table class="content-table" width="240">
                            </tr>
                            <tr>
                                <td width="40">
                                    <asp:HyperLink ID="HyperLinkAddNew0" runat="server" ImageUrl="~/Staff/Images/button_orange.png"
                                        NavigateUrl="~/Staff/DisciplineAddOffensePoints.aspx">Add New</asp:HyperLink>
                                </td>
                                <td>
                                    <asp:Label ID="Label45" runat="server" Text="Update Offense Points"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table class="content-table" width="240">
                            </tr>
                            <tr>
                                <td width="40">
                                    <asp:HyperLink ID="HyperLink3" runat="server" Enabled="False" ImageUrl="~/Staff/Images/button_orange.png"
                                        NavigateUrl="~/Staff/DisciplineTypes.aspx">Add New</asp:HyperLink>
                                </td>
                                <td>
                                    <asp:Label ID="Label46" runat="server" ForeColor="Red" Text="Edit Discipline Points"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>
        <table class="content-table" width="240">
            <tr>
                <td height="30">
                    <asp:Label ID="Label42" runat="server" Font-Bold="True" Text="Select Date:" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td height="30">
                    <asp:Calendar ID="CalendarDisciplineDate" runat="server" BackColor="White" Width="95%">
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
            TYPES</h2>
        <br />
        <asp:GridView ID="GridViewDiscipline" runat="server" AutoGenerateColumns="False"
            DataKeyNames="DisciplineTypeID" DataSourceID="SqlDataSourceDisciplineTypes" Width="680px">
            <Columns>
                <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="AttendanceTypeID">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Setup/Images/Item.png" />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="35px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Discipline Type" SortExpression="DisciplineType">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBoxDisciplineType" runat="server" Text='<%# Bind("DisciplineType") %>'
                            Width="230px"></asp:TextBox>
                    </ItemTemplate>
                    <ItemStyle Width="250px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Local Name" SortExpression="DisciplineTypeLocalName">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBoxLocalName" runat="server" Text='<%# Bind("DisciplineTypeLocalName") %>'
                            Width="230px"></asp:TextBox>
                    </ItemTemplate>
                    <ItemStyle Width="250px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Point" SortExpression="DisciplinePoint">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBoxPoint" runat="server" Text='<%# Bind("DisciplinePoint") %>'
                            Width="35px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bonus?" SortExpression="PointType">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBoxBonus" runat="server" Checked='<%# Bind("PointType") %>' />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButtonDelete" runat="server" CausesValidation="False" CommandName="Delete"
                            ImageUrl="~/Setup/Images/delete.gif" Text="Edit" ToolTip="Delete!" />
                        <asp:ConfirmButtonExtender ID="ImageButtonDelete_ConfirmButtonExtender" runat="server"
                            ConfirmText="Are You Sure?" Enabled="True" TargetControlID="ImageButtonDelete">
                        </asp:ConfirmButtonExtender>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="35px" />
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
                    <asp:Label ID="LabelWarning0" runat="server" Font-Bold="True" ForeColor="Red" Text="Please Add Discipline Types Using the Form Below!"></asp:Label>
                    <br />
                    <br />
                </div>
            </EmptyDataTemplate>
            <RowStyle Height="30px" />
        </asp:GridView>
        <br />
        <asp:Button ID="ButtonUpdate" runat="server" Text="Update Changes" Width="680px" />
        <br />
        <br />
        <asp:Label ID="LabelStatusUpdate" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:FormView ID="FormViewDiscipline" runat="server" DataKeyNames="DisciplineTypeID"
            DataSourceID="SqlDataSourceDisciplineTypes" DefaultMode="Insert" Width="680px">
            <EditItemTemplate>
                AttendanceTypeID:
                <asp:Label ID="AttendanceTypeIDLabel1" runat="server" Text='<%# Eval("AttendanceTypeID") %>' />
                <br />
                Priority:
                <asp:TextBox ID="PriorityTextBox" runat="server" Text='<%# Bind("Priority") %>' />
                <br />
                AttendanceType:
                <asp:TextBox ID="AttendanceTypeTextBox" runat="server" Text='<%# Bind("AttendanceType") %>' />
                <br />
                Definition:
                <asp:TextBox ID="DefinitionTextBox" runat="server" Text='<%# Bind("Definition") %>' />
                <br />
                Color:
                <asp:TextBox ID="ColorTextBox" runat="server" Text='<%# Bind("Color") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                    CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <table width="100%">
                    <tr>
                        <td height="30" width="120">
                            <asp:Label ID="Label2" runat="server" Text="Discipline Type:" Font-Bold="True"></asp:Label>
                        </td>
                        <td width="250">
                            <asp:TextBox ID="DisciplineTypeTextBox" runat="server" Text='<%# Bind("DisciplineType") %>'
                                Width="220px" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DisciplineTypeTextBox"
                                ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" ValidationGroup="Discipline">(*)</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label3" runat="server" Text="Bahasa Indonesia" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="BahasaIndonesiaTypeTextBox" runat="server" Text='<%# Bind("DisciplineTypeLocalName") %>'
                                Width="220px" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="BahasaIndonesiaTypeTextBox"
                                ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" ValidationGroup="Discipline">(*)</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label4" runat="server" Text="Point:" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListPoints" runat="server" SelectedValue='<%# Bind("DisciplinePoint") %>'
                                Width="230px">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <asp:Label ID="Label5" runat="server" Text="Type:" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListType" runat="server" RepeatDirection="Horizontal"
                                SelectedValue='<%# Bind("PointType") %>'>
                                <asp:ListItem Value="False">Offense</asp:ListItem>
                                <asp:ListItem Value="True">Bonus</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonListType"
                                ErrorMessage="(*)" Font-Bold="True" ForeColor="Red" ValidationGroup="Discipline">(*)</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Add Discipline Type" Width="220px"
                                CommandName="Insert" ValidationGroup="Discipline" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </InsertItemTemplate>
        </asp:FormView>
        <asp:Label ID="LabelStatusInsert" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSourceDisciplineTypes" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
            SelectCommand="SELECT DisciplineTypeID, DisciplineType, DisciplineTypeLocalName, DisciplinePoint, PointType, SchoolCode FROM tbl_DisciplineTypes WHERE (SchoolCode = @SchoolCode)"
            DeleteCommand="DELETE FROM tbl_DisciplineTypes WHERE (DisciplineTypeID = @DisciplineTypeID)"
            InsertCommand="INSERT INTO tbl_DisciplineTypes(DisciplineType, DisciplineTypeLocalName, DisciplinePoint, PointType, SchoolCode) VALUES (@DisciplineType, @DisciplineTypeLocalName, @DisciplinePoint, @PointType, @SchoolCode)"
            UpdateCommand="UPDATE tbl_DisciplineTypes SET DisciplineType = @DisciplineType, DisciplineTypeLocalName = @DisciplineTypeLocalName, DisciplinePoint = @DisciplinePoint, PointType = @PointType WHERE (DisciplineTypeID = @DisciplineTypeID)">
            <DeleteParameters>
                <asp:Parameter Name="DisciplineTypeID" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DisciplineType" />
                <asp:Parameter Name="DisciplineTypeLocalName" />
                <asp:Parameter Name="DisciplinePoint" />
                <asp:Parameter Name="PointType" />
                <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                    PropertyName="SelectedValue" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListSchoolCodesMaster" Name="SchoolCode"
                    PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="DisciplineType" />
                <asp:Parameter Name="DisciplineTypeLocalName" />
                <asp:Parameter Name="DisciplinePoint" />
                <asp:Parameter Name="PointType" />
                <asp:Parameter Name="DisciplineTypeID" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
