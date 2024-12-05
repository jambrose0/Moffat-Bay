
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="../css/login_styles.css">
</head>
<body>
<%@include file="NavBar.jsp"%>
<div class="login-page">
<div class="login-header">
    <h2>Login</h2>
    <%
        String profile_msg = (String)request.getAttribute("profile_msg");
        if(profile_msg != null) {
            out.print(profile_msg);
        }
        String login_msg = (String)request.getAttribute("login_msg");
        if(login_msg != null) {
            out.print(login_msg);
        }
    %>
</div>
<div class="login-form">
    <form action="loginProcess.jsp" method="post">
        <label for="email">Email</label><br>
        <input type="text" placeholder="Enter Email" name="email" required> <br>
        <label for="password">Password</label><br>
        <input type="password" placeholder="Enter Password" name ="password" required> <br>
        <button type="submit" class="submitBtn">Login</button>
    </form>
</div>
</div>
</body>
</html>
