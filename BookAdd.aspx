<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BookAdd.aspx.cs" Inherits="BookAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Library Management System</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />

    <style type="text/css">
        .middlealign {
            vertical-align:middle;
        }
        .bottompad {
            padding-bottom:5px;
        }
       .wrapper.style4 {
			padding-top: 2%;
		}

        textarea {
            resize: none;
        }
        table{
            padding:5px 5px 5px 5px;
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
							<li class="current">Add Book</li>
						</ul>
					</nav>
				</header>

			<!-- Banner -->
				<section class="wrapper style4 special container 75%">
                    <!-- Content -->
                    <h2>Enter Book Info</h2>
								<div class="content">
										<div class="row 50%">
											<div class="6u 12u(mobile)">
                                                <asp:TextBox ID="txtISBN" runat="server" placeholder="ISBN" MaxLength="25"></asp:TextBox>
											</div>
											<div class="6u 12u(mobile)">
												<asp:TextBox ID="txtTitleBook" runat="server" placeholder="Title of Book" MaxLength="40"></asp:TextBox>
											</div>
										</div>
										<div class="row 50%">
											<div class="12u">
												<asp:TextBox ID="txtPublisher" runat="server" placeholder="Publisher" MaxLength="40"></asp:TextBox>
											</div>
										</div>
										<div class="row 50%">
											<div class="12u">
                                                <asp:TextBox ID="txtBookDescription" runat="server" placeholder="Book Description"></asp:TextBox>								
											</div>
										</div>
										<div class="row">
											<div class="6u">
                                                <asp:Button ID="Button1" runat="server" Text="Add Book" CssClass="button special" OnClick="btnAddBook"/>	
											</div>
                                            <div class="6u">
                                                <asp:Button ID="Button2" runat="server" Text="Back to Book Menu" CssClass="button special" PostBackUrl="~/BookMenu.aspx" CausesValidation="false"/>	
											</div>
                                        </div>
                                      
								</div>
                                <div style="text-align:left">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Please Enter ISBN" ControlToValidate="txtISBN" Display="None"></asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Please Enter Title of Book" ControlToValidate="txtTitleBook" Display="None"></asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Please Enter Publisher" ControlToValidate="txtPublisher" Display="None"></asp:RequiredFieldValidator>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* Please Enter Description" ControlToValidate="txtBookDescription" Display="None"></asp:RequiredFieldValidator>
                                 
                                     <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Fix the following Errors : " ForeColor="Red"/>
				                </div>
                    </br>
                    <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="ISBN">
                       
                        <EmptyDataTemplate>
                            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                                <tr>
                                    <td>No Book is stored in the database</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #FFFBD6; color: #333333;">
                                <td>
                                    <asp:Label Text='<%# Eval("ISBN") %>' runat="server" ID="ISBNLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Title") %>' runat="server" ID="TitleLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Publisher") %>' runat="server" ID="PublisherLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" /></td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                                            <tr runat="server" style="background-color: #FFFBD6; color: #333333;">
                                                <th runat="server">ISBN</th>
                                                <th runat="server">Title</th>
                                                <th runat="server">Publisher</th>
                                                <th runat="server">Description</th>
                                            </tr>
                                            <tr runat="server" id="itemPlaceholder"></tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;">
                                        <asp:DataPager runat="server" ID="DataPager1" PageSize="10" >
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                                <asp:NumericPagerField></asp:NumericPagerField>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="Select_Book" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
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
