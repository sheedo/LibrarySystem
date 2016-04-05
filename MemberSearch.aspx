<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberSearch.aspx.cs" Inherits="MemberSearch" %>

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
    </style>
</head>
<body">
    <form id="form1" runat="server">
        <div id="page-wrapper">

            <!-- Nav Bar -->
            <header id="header" class="alt">
                <h1 id="logo">Library Management System</h1>
                <nav id="nav">
                    <ul>
                        <li class="current">Search Member</li>
                    </ul>
                </nav>
            </header>

            <!-- Banner -->
            <section id="banner">
                <div class="contentcenter">
                    <h2>Search Member
                    </h2>
                </div>
                <div>
                    <table>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtMemberIDSearch" runat="server" placeholder="Enter MemberID " MaxLength="30"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="Search" OnClick="searchMember"/>
                            </td>
                        </tr>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Please Enter MemberID" ControlToValidate="txtMemberIDSearch" Font-Bold="true"  ForeColor="Red"></asp:RequiredFieldValidator>
                    </table>
                </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MemberID" AllowPaging="True" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" PageSize="5" EmptyDataText="No Data Found" EmptyDataRowStyle-ForeColor="Black">
                    <Columns>
                        <asp:BoundField DataField="MemberID" HeaderText="MemberID" ReadOnly="True" SortExpression="MemberID"></asp:BoundField>
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"></asp:BoundField>
                        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName"></asp:BoundField>
                        <asp:BoundField DataField="ClassName" HeaderText="ClassName" SortExpression="ClassName"></asp:BoundField>
                        <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age"></asp:BoundField>
                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender"></asp:BoundField>
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

                <table class="bgMessage">
                       <tr>
                           <td class="leftalign">
                            <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red" Font-Bold="true" Font-Size="XX-Large"></asp:Label>

                           </td>
                       </tr>
                   </table>
                <div class="row 50%">
                    <div class="6u 12u(mobile)">
                         <asp:Button ID="Button2" runat="server" Text="Back to Member Menu" CssClass="button special" PostBackUrl="~/MemberMenu.aspx" CausesValidation="false"/>	
                    </div>
       
                </div>
            </section>


        </div>

        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.dropotron.min.js"></script>
        <script src="assets/js/jquery.scrolly.min.js"></script>
        <script src="assets/js/jquery.scrollgress.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>

    </form>
</body>
</html>

