<%@ Page Title="Setup Global Settings" Language="VB" MasterPageFile="Setup.Master"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ChildContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <table>
                <tr>
                    <td width="320">
                        <asp:FormView ID="FormViewTabPanelSchoolInfo" runat="server" DataKeyNames="SettingsID"
                            DataSourceID="SqlDataSourceFormViewGlobalSettings" DefaultMode="Edit" Height="300px"
                            Width="320px">
                            <EditItemTemplate>
                                <div class="divClear">
                                    <table width="400">
                                        <tr>
                                            <td height="25" width="25">
                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Setup/Images/edit.png" />
                                            </td>
                                            <td width="125">
                                                <asp:Label ID="Label6" runat="server" Text="Web Address:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxWeb" runat="server" Text='<%# Bind("DefaultWebAddress") %>'
                                                    Width="220px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="25">
                                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Setup/Images/edit.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label5" runat="server" Text="E-Mail Address:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxEmail" runat="server" Text='<%# Bind("DefaultEMailAddress") %>'
                                                    Width="220px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="25">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="25">
                                                <asp:Image ID="Image4" runat="server" ImageUrl="~/Setup/Images/edit.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelImagePath" runat="server" Text="Image Path:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxImagePath" runat="server" Text='<%# Bind("ImagePath") %>'
                                                    Width="220px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="25">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="25">
                                                <asp:Image ID="Image5" runat="server" ImageUrl="~/Setup/Images/edit.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelTerm" runat="server" Text="Academic Term:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" AppendDataBoundItems="True"
                                                    DataSourceID="SqlDataSourceAcademicTerms" DataTextField="AcademicTerm" DataValueField="AcademicTermID"
                                                    SelectedValue='<%# Bind("AcademicTermID") %>' Width="226px">
                                                    <asp:ListItem Value="0">Not Selected!</asp:ListItem>
                                                    <asp:ListItem>1</asp:ListItem>
                                                    <asp:ListItem>2</asp:ListItem>
                                                    <asp:ListItem>3</asp:ListItem>
                                                    <asp:ListItem>4</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="25">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="25">
                                                <asp:Image ID="Image6" runat="server" ImageUrl="~/Setup/Images/edit.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelTerm0" runat="server" Text="Adding Assessments:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBoxAssessments" runat="server" Checked='<%# Bind("AddingAssessments") %>'
                                                    Text="Enabled?" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="25">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="25">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update" Text="Update Settings"
                                                    Width="220px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <table width="350">
                                    <tr>
                                        <td height="25" width="25">
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Setup/Images/edit.png" />
                                        </td>
                                        <td width="125">
                                            <asp:Label ID="Label6" runat="server" Text="Web Address:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxWeb" runat="server" Text='<%# Bind("DefaultWebAddress") %>'
                                                Width="150px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Setup/Images/edit.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text="E-Mail Address:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxEmail" runat="server" Text='<%# Bind("DefaultEMailAddress") %>'
                                                Width="150px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Setup/Images/edit.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelImagePath" runat="server" Text="Image Path:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxImagePath" runat="server" Text='<%# Bind("ImagePath") %>'
                                                Width="150px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <asp:Image ID="Image5" runat="server" ImageUrl="~/Setup/Images/edit.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelTerm" runat="server" Text="Academic Term:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListAcademicTerms" runat="server" AppendDataBoundItems="True"
                                                DataSourceID="SqlDataSourceAcademicTerms" DataTextField="AcademicTerm" DataValueField="AcademicTermID"
                                                SelectedValue='<%# Bind("AcademicTermID") %>' Width="156px">
                                                <asp:ListItem Value="0">Not Selected!</asp:ListItem>
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                            <asp:Image ID="Image6" runat="server" ImageUrl="~/Setup/Images/edit.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="LabelTerm0" runat="server" Text="Adding Assessments:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckBoxAssessments" runat="server" Checked='<%# Bind("AddingAssessments") %>'
                                                Text="Enabled?" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="25">
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Button ID="ButtonUpdate" runat="server" CommandName="Insert" Text="Insert Settings" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </InsertItemTemplate>
                        </asp:FormView>
                    </td>
                    <td valign="top">
                        <br />
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Setup/Images/global_network.png"
                            Width="95%" />
                    </td>
                </tr>
                <tr>
                    <td width="320">
                        <asp:Button ID="ButtonEncyrpt" runat="server" Text="Encyrpt!" />
                        <br />
                        <br />
                        <asp:Label ID="LabelStatus" runat="server"></asp:Label>
                    </td>
                    <td valign="top">
                    </td>
                </tr>
            </table>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceFormViewGlobalSettings" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT SettingsID, AcademicTermID, DefaultWebAddress, DefaultEMailAddress, AddingAssessments, ImagePath FROM tbl_GlobalSettings"
                UpdateCommand="UPDATE tbl_GlobalSettings SET AcademicTermID = @AcademicTermID, DefaultWebAddress = @DefaultWebAddress, DefaultEMailAddress = @DefaultEMailAddress, AddingAssessments = @AddingAssessments, ImagePath = @ImagePath WHERE (SettingsID = @SettingsID)"
                InsertCommand="INSERT INTO tbl_GlobalSettings(AcademicTermID, DefaultWebAddress, DefaultEMailAddress, AddingAssessments, ImagePath) VALUES (@AcademicTermID, @DefaultWebAddress, @DefaultEMailAddress, @AddingAssessments, @ImagePath)">
                <InsertParameters>
                    <asp:Parameter Name="AcademicTermID" />
                    <asp:Parameter Name="DefaultWebAddress" />
                    <asp:Parameter Name="DefaultEMailAddress" />
                    <asp:Parameter Name="AddingAssessments" />
                    <asp:Parameter Name="ImagePath" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AcademicTermID" />
                    <asp:Parameter Name="DefaultWebAddress" />
                    <asp:Parameter Name="DefaultEMailAddress" />
                    <asp:Parameter Name="AddingAssessments" />
                    <asp:Parameter Name="ImagePath" />
                    <asp:Parameter Name="SettingsID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceAcademicTerms" runat="server" ConnectionString="<%$ ConnectionStrings:SMSOnlineConnectionString %>"
                SelectCommand="SELECT AcademicTermID, AcademicYear + N' ' + AcademicTerm AS AcademicTerm FROM tbl_AcademicTerms"
                UpdateCommand="UPDATE tbl_AcademicTerms SET AcademicYear = @AcademicYear, AcademicTerm = @AcademicTerm, StartDate = @StartDate, EndDate = @EndDate, Active = @Active WHERE (AcademicTermID = @AcademicTermID)"
                DeleteCommand="DELETE FROM tbl_AcademicTerms WHERE (AcademicTermID = @AcademicTermID)"
                InsertCommand="INSERT INTO tbl_AcademicTerms(AcademicYear, AcademicTerm, StartDate, EndDate, Active) VALUES (@AcademicYear, @AcademicTerm, @StartDate, @EndDate, @Active)">
                <DeleteParameters>
                    <asp:Parameter Name="AcademicTermID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="AcademicYear" />
                    <asp:Parameter Name="AcademicTerm" />
                    <asp:Parameter Name="StartDate" />
                    <asp:Parameter Name="EndDate" />
                    <asp:Parameter Name="Active" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AcademicYear" />
                    <asp:Parameter Name="AcademicTerm" />
                    <asp:Parameter Name="StartDate" />
                    <asp:Parameter Name="EndDate" />
                    <asp:Parameter Name="Active" />
                    <asp:Parameter Name="AcademicTermID" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
