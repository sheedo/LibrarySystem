<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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
        .erroralign {
            margin-top:10%;
            text-align:right;
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
							<li class="current">Welcome</li>
						</ul>
					</nav>
				</header>

			<!-- Banner -->
				<section id="banner">

					<div class="inner">

						<header>
							<h2>LogIn</h2>
						</header>
						<table>
                            <tr class="bottompad">
                                <td class="middlealign">
                                    <asp:Label ID="Label2" runat="server" Text="UserName : " Font-Size="X-Large" ></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr><td></br></td></tr>
                            <tr>
                                <td class="middlealign">
                                    <asp:Label ID="Label1" runat="server" Text="Password : " Font-Size="X-Large"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
						</table>
						<footer>
                            <table>
                                <tr>
                                    <td>
                                       <asp:Button ID="Button1" runat="server" Text="Enter" CssClass="button special" OnClick="btnLogin"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="erroralign">
                                        <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Orange" Font-Bold="true"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                         
						</footer>

					</div>

				</section>

		</div>

		<!-- Scripts -->
			<!--<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollgress.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>-->

    </form>
</body>
</html>
