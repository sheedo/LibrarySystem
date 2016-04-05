<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberEdit.aspx.cs" Inherits="MemberEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Library Management System</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="assets/css/main.css" />

    <style type="text/css">
        .middlealign {
            vertical-align: middle;
        }

        .bottompad {
            padding-bottom: 5px;
        }

        table {
            padding: 5px 5px 5px 5px;
        }

        .contentcenter {
            margin-left: 30%;
            margin-right: 30%;
        }
        .leftalign{
            text-align:left;
        }
        .bgMessage{
            background-color:white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="page-wrapper">

            <!-- Nav Bar -->
            <header id="header" class="alt">
                <h1 id="logo">Library Management System</h1>
                <nav id="nav">
                    <ul>
                        <li class="current">Edit Member</li>
                    </ul>
                </nav>
            </header>

            <!-- Banner -->
            <section id="banner">
                <div class="contentcenter">
                    <h2>Edit Member
                    </h2>
                </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MemberID" DataSourceID="SqlDataSource1" AllowPaging="True" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" PageSize="10" EmptyDataText="No Data Found" EmptyDataRowStyle-ForeColor="Black">
                    <Columns>
                        <asp:CommandField ShowEditButton="True"></asp:CommandField>
                        <asp:TemplateField HeaderText="MemberID" SortExpression="MemberID">
                            <EditItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("MemberID") %>' ID="Label1"></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("MemberID") %>' ID="Label1"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("FirstName") %>' ID="txtFirstName"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" Display="None" ErrorMessage="* First Name Cannot be empty" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("FirstName") %>' ID="Label2"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("LastName") %>' ID="txtLastName"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" Display="None" ErrorMessage="* Last Name Cannot be empty" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("LastName") %>' ID="Label3"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ClassName" SortExpression="ClassName">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("ClassName") %>' ID="txtClassName"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtClassName" Display="None" ErrorMessage="* Class Name Cannot be empty" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("ClassName") %>' ID="Label4"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Age" SortExpression="Age">
                            <EditItemTemplate>
                              <asp:TextBox runat="server" Text='<%# Bind("Age") %>' ID="txtAge"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAge" Display="None" ErrorMessage="* Age Cannot be empty" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="* Age must be a numeric value" ControlToValidate="txtAge" Display="None" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("Age") %>' ID="Label5"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server"
		                        	DataSourceID="SqlDataSource1" DataTextField="Gender" DataValueField="Gender"
		                        	SelectedValue='<%# Bind("Gender") %>'>
		                        </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("Gender") %>' ID="Label6"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>



                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333"></FooterStyle>

                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" BackColor="#336666" ForeColor="White"></PagerStyle>

                    <RowStyle BackColor="White" ForeColor="#333333"></RowStyle>

                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#487575"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#275353"></SortedDescendingHeaderStyle>
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="Select_Member" SelectCommandType="StoredProcedure" UpdateCommand="Update_Member_By_ID" UpdateCommandType="StoredProcedure">
                    <UpdateParameters>
                        <asp:Parameter Name="MemberID" Type="String"></asp:Parameter>
                        <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ClassName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Age" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Gender" Type="String"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
                   <table class="bgMessage">
                       <tr>
                           <td class="leftalign">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Fix the following errors: " DisplayMode="BulletList" ForeColor="Red"/>
                            <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red" Font-Bold="true" Font-Size="XX-Large"></asp:Label>

                           </td>
                       </tr>
                   </table>
                <div class="row">
                    <div class="12u">
                         <asp:Button ID="Button2" runat="server" Text="Back to Member Menu" CssClass="button special" PostBackUrl="~/MemberMenu.aspx" CausesValidation="false"/>	
                    </div>
                </div>             
            </section>
             </div>
           

    </form>
</body>
</html>
