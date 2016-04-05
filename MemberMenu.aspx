<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberMenu.aspx.cs" Inherits="MemberMenu" %>

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
							<li class="current">Member Menu</li>
						</ul>
					</nav>
				</header>

			<!-- Banner -->
					<section id="banner">
                   <div class="inner">
                     <header>
							<h2>Member Menu</h2>
					</header>
                    <p>
                        Please select an option :
                    </p>		
					<table>
                        <tr>
                            <td>
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/add_user.png" PostBackUrl="~/MemberAdd.aspx"/>
                            </td>
                            <td>
                                 <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/user_edit.png" PostBackUrl="~/MemberEdit.aspx"/>
                            </td>
                        </tr>
                          <tr>
                            <td>
                                <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/images/user_search.png" PostBackUrl="~/MemberSearch.aspx"/>
                            </td>
                            <td>
                                 <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/images/delete_user.png" PostBackUrl="~/MemberDelete.aspx"/>
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

