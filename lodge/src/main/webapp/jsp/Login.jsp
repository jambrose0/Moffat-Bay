
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<%@include file="NavBar.jsp"%>




<div class="login-page">

<div class="login-header">
    <h2>Login</h2>
</div>
<div class="login-form">
    <form>
        <label for="email">Email</label><br>
        <input type="text" PLACEHOLDER="Enter Email" name="email" required> <br>
        <label for="password">Password</label><br>
        <input type="password" PLACEHOLDER="Enter Password" name ="password" required> <br>
        <button type="submit" class="submitBtn">Login</button>
    </form>
</div>
</div>
</body>
</html>
