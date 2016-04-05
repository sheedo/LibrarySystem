<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainMenu.aspx.cs" Inherits="MainMenu" %>

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
        .rightpad {
            padding-right:15%;
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
							<li class="current">MainMenu</li>
                            <li><a href="Login.aspx" class="button special">LogOut</a></li>
						</ul>
					</nav>
				</header>

			<!-- Banner -->
				<section id="banner">
                    <div class="inner">
                    <header>
							<h2>Main Menu</h2>
					</header>
                    <p>
                        Please select an option :
                    </p>					
					<table>
                        <tr>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="Book Info" CssClass="button special" PostBackUrl="~/BookMenu.aspx"/>
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <td>
                                <asp:Button ID="Button2" runat="server" Text="Assign Book" CssClass="button special" PostBackUrl="~/Assign.aspx"/>
                            </td>
                        </tr>
                        <tr><td></br></td></tr>
                         <tr>
                            <td>
                                <asp:Button ID="Button3" runat="server" Text="Member Info" CssClass="button special" PostBackUrl="~/MemberMenu.aspx"/>
                            </td>
                             <td></br></td>
                            <td>
                                <asp:Button ID="Button4" runat="server" Text="Return Book" CssClass="button special" PostBackUrl="~/Return.aspx"/>
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
