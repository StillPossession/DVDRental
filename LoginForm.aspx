<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="RopeyDVDs.LoginForm" %>

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
<p class="message">Please Login</p>
<%--<form class="register-form">
<input type="text" placeholder="name"/>
<input type="password" placeholder="password"/>
<input type="text" placeholder="email address"/>
<button>create</button>
<p class="message">Already registered? <a href="#">Sign In</a></p>
</form>--%>
<form class="login-form" runat="server">
<%--<input type="text" placeholder="username" id="input_username"/>
<input type="password" placeholder="password" id="input_password"/>--%>
<asp:TextBox ID="tB_username" runat="server" placeholder="Username"></asp:TextBox>
<asp:TextBox TextMode="Password" ID="tB_password" runat="server" placeholder="Password"></asp:TextBox>
<%--<button onclick="Button1_Click" id="btn_login">login</button>--%>
<asp:Button ID="btn_login" runat="server" Text="Login" OnClick="Btn_login_click"  />
<%-- <p class="message">Not registered? <a href="#">Create an account</a></p>--%>
<asp:Label class="errormsg" ID="error_msg" runat="server" Text=""></asp:Label>
</form>
</div>
</div>
</body>
</html>
