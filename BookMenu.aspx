<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BookMenu.aspx.cs" Inherits="BookMenu" %>

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
							<li class="current">Book Menu</li>
						</ul>
					</nav>
				</header>

			<!-- Banner -->
				<section id="banner">
                    <div class="inner">
                     <header>
							<h2>Book Menu</h2>
					</header>
                    <p>
                        Please select an option :
                    </p>		
					<table>
                        <tr>
                            <td>
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/book_blue_add.png" PostBackUrl="~/BookAdd.aspx"/>
                            </td>
                            <td>
                                 <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/book_blue_edit.png" PostBackUrl="~/BookEdit.aspx"/>
                            </td>
                        </tr>
                          <tr>
                            <td>
                                <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/images/book_blue_search.png" PostBackUrl="~/BookSearch.aspx"/>
                            </td>
                            <td>
                                 <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/images/book_blue_delete.png" PostBackUrl="~/BookDelete.aspx"/>
                            </td>
                        </tr>
                          <tr>
                            <td style="text-align:center" colspan="2">
                                <asp:Button ID="Button1" runat="server" Text="Back to Main Menu" PostBackUrl="~/MainMenu.aspx" CssClass="button special"/>
                            </td>
                        </tr>
					</table>
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
