<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Return.aspx.cs" Inherits="Return" %>

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

        .wrapper.style4 {
            padding-top: 2%;
        }

        textarea {
            resize: none;
        }

        table {
            padding: 5px 5px 5px 5px;
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
                        <li class="current">Return Book</li>
                    </ul>
                </nav>
            </header>

            <!-- Banner -->
            <section class="wrapper style4 special container 75%">
                <!-- Content -->
                <h2>Return Book</h2>
                <div class="content">
                    <div class="row 50%">
                        <div class="6u 12u(mobile)">
                            <asp:Label ID="Label2" runat="server" Text="MemberID : "></asp:Label>
                        </div>
                        <div class="6u 12u(mobile)">
                            <asp:DropDownList ID="ddlMemberID" runat="server" Width="200px"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="row 50%">
                        <div class="6u 12u(mobile)">
                            <asp:Label ID="Label1" runat="server" Text="ISBN : "></asp:Label>
                        </div>
                        <div class="6u 12u(mobile)">
                            <asp:DropDownList ID="ddlISBN" runat="server" Width="200px"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="row 50%">
                        <div class="6u 12u(mobile)">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text="Date Returned : "></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtDateBorrowed" runat="server" Height="40px" Enabled="false" placeholder="Please select a date"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtDaysBorrowed" runat="server" Height="40px" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtExpectedReturn" runat="server" Height="40px" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtActualReturn" runat="server" Height="40px" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <asp:TextBox ID="txtResult" runat="server" Height="40px" Enabled="false" Font-Bold="true"></asp:TextBox>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <asp:TextBox ID="txtEmail" runat="server" Height="40px" Font-Bold="true" placeholder="Enter Email Address"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnEmail" runat="server" Text="Send Email" OnClick="sendEmail" Enabled="false"/>
                                    </td>
                                </tr>
                            </table>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Please Enter Email" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="6u 12u(mobile)">
                            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="400px">
                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" ></DayHeaderStyle>

                                <DayStyle Width="14%"></DayStyle>

                                <NextPrevStyle Font-Size="8pt" ForeColor="White"></NextPrevStyle>

                                <OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>

                                <SelectedDayStyle BackColor="#CC3333" ForeColor="White"></SelectedDayStyle>

                                <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%"></SelectorStyle>

                                <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt"></TitleStyle>

                                <TodayDayStyle BackColor="#CCCC99"></TodayDayStyle>
                            </asp:Calendar>
                        </div>
                    </div>
                      <asp:Label ID="lblMail" runat="server" Text="" Font-Bold="true" ></asp:Label>
                    <div class="row">
                        <div class="6u">
                            <asp:Button ID="btnReturnBook" runat="server" Text="Return Book" CssClass="button special" OnClick="btnReturn" CausesValidation="false"/>
                        </div>
                        <div class="6u">
                            <asp:Button ID="Button2" runat="server" Text="Back to Main Menu" CssClass="button special" PostBackUrl="~/MainMenu.aspx" CausesValidation="false" />
                        </div>
                        
                    </div>

                </div>
                <div style="text-align: left">
                </div>
                </br>
                    <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ISBN,MemberID" DataSourceID="SqlDataSource1" AllowPaging="True" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" EmptyDataText="No Data is present" PageSize="5">
                    <Columns>
                        <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True" SortExpression="ISBN"></asp:BoundField>
                        <asp:BoundField DataField="MemberID" HeaderText="MemberID" ReadOnly="True" SortExpression="MemberID"></asp:BoundField>
                        <asp:BoundField DataField="DateBorrowed" HeaderText="DateBorrowed" SortExpression="DateBorrowed"></asp:BoundField>
                        <asp:BoundField DataField="NumberDays" HeaderText="NumberDays" SortExpression="NumberDays"></asp:BoundField>
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
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="Select_Assign" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
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

