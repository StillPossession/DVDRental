<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmLogout.aspx.cs" Inherits="RopeyDVDs.ConfirmLogout" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
<link href="Styles/loginpage.css" rel="stylesheet" />
<script src="js/loginpage.js"></script>
</head>
<body>
<div class="login-page">
<p class="title">ROPEY DVDs</p>
<div class="form"> 
<p class="message">Are you sure to Logout?</p>

<form class="login-form" runat="server">
<asp:Button ID="Button1" runat="server" Text="OK" OnClick="Button1_Click"  />
<asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click"  />
<asp:Label class="errormsg" ID="error_msg" runat="server" Text=""></asp:Label>
</form>
</div>
</div>
</body>
</html>