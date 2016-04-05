<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberAdd.aspx.cs" Inherits="MemberAdd" %>

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
							<li class="current">Add Member</li>
						</ul>
					</nav>
				</header>

			<!-- Banner -->
				<section class="wrapper style4 special container 75%">
                    <!-- Content -->
                    <h2>Enter Member Info</h2>
								<div class="content">
										<div class="row 50%">
											<div class="12u">
												<asp:TextBox ID="txtMemberID" runat="server" placeholder="MemberID" MaxLength="25"></asp:TextBox>
											</div>
										</div>
                                    <div class="row 50%">
											<div class="12u">
												<asp:TextBox ID="txtFName" runat="server" placeholder="First Name" MaxLength="25"></asp:TextBox>
											</div>
										</div>
                                    <div class="row 50%">
											<div class="12u">
												<asp:TextBox ID="txtLName" runat="server" placeholder="Last Name" MaxLength="25"></asp:TextBox>
											</div>
										</div>
                                     <div class="row 50%">
											<div class="12u">
												<asp:TextBox ID="txtClassName" runat="server" placeholder="Class Name" MaxLength="25"></asp:TextBox>
											</div>
										</div>
                                        <div class="row 50%" style="text-align:left">
											<div class="6u 12u(mobile)">
                                                <asp:Label ID="Label1" runat="server" Text="Age : " ForeColor="Black" Font-Size="X-Large"></asp:Label>
											</div>
											<div class="6u 12u(mobile)">
                                                <asp:DropDownList ID="ddlAge" runat="server" Width="200px"></asp:DropDownList>
											</div>
										</div>
                                       <div class="row 50%" style="text-align:left">
											<div class="6u 12u(mobile)">
                                                <asp:Label ID="Label2" runat="server" Text="Gender : " ForeColor="Black" Font-Size="X-Large"></asp:Label>
											</div>
											<div class="6u 6u(mobile)">
                                                    <asp:DropDownList ID="ddlGender" runat="server" Width="200px">
                                                    <asp:ListItem Selected="True" Text="Male" Value="M" />
                                                    <asp:ListItem Text="Female" Value="F" />
                                                    </asp:DropDownList>
											</div>
										</div>
										<div class="row">
											<div class="6u 12u(mobile)">
                                                <asp:Button ID="Button1" runat="server" Text="Add Member" CssClass="button special" OnClick="btnAddMember"/>	
											</div>
                                            <div class="6u 12u(mobile)">
                                                <asp:Button ID="Button2" runat="server" Text="Back to Member Menu" CssClass="button special" PostBackUrl="~/MemberMenu.aspx" CausesValidation="false"/>	
											</div>
										</div>
								</div>
                                <div style="text-align:left">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Please Enter MemberID" ControlToValidate="txtMemberID" Display="None"></asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Please Enter First Name" ControlToValidate="txtFName" Display="None"></asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Please Enter Last Name" ControlToValidate="txtLName" Display="None"></asp:RequiredFieldValidator>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* Please Enter Class Name" ControlToValidate="txtClassName" Display="None"></asp:RequiredFieldValidator>
                      
                                     <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Fix the following Errors : " ForeColor="Red"/>
				                </div>
                     </br>
                    <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="MemberID">
                        <AlternatingItemTemplate>
                            <tr style="background-color: #FAFAD2; color: #284775;">
                                <td>
                                    <asp:Label Text='<%# Eval("MemberID") %>' runat="server" ID="MemberIDLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("FirstName") %>' runat="server" ID="FirstNameLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("LastName") %>' runat="server" ID="LastNameLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("ClassName") %>' runat="server" ID="ClassNameLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Age") %>' runat="server" ID="AgeLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Gender") %>' runat="server" ID="GenderLabel" /></td>
                            </tr>
                        </AlternatingItemTemplate>                      
                        <EmptyDataTemplate>
                            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #FFFBD6; color: #333333;">
                                <td>
                                    <asp:Label Text='<%# Eval("MemberID") %>' runat="server" ID="MemberIDLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("FirstName") %>' runat="server" ID="FirstNameLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("LastName") %>' runat="server" ID="LastNameLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("ClassName") %>' runat="server" ID="ClassNameLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Age") %>' runat="server" ID="AgeLabel" /></td>
                                <td>
                                    <asp:Label Text='<%# Eval("Gender") %>' runat="server" ID="GenderLabel" /></td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                                            <tr runat="server" style="background-color: #FFFBD6; color: #333333;">
                                                <th runat="server">MemberID</th>
                                                <th runat="server">FirstName</th>
                                                <th runat="server">LastName</th>
                                                <th runat="server">ClassName</th>
                                                <th runat="server">Age</th>
                                                <th runat="server">Gender</th>
                                            </tr>
                                            <tr runat="server" id="itemPlaceholder"></tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;">
                                        <asp:DataPager runat="server" ID="DataPager1" PageSize="10">
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
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="Select_Member" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
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
