<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Moffat Bay Lodge</title>
<link rel="stylesheet" href="../css/styles.css">
<style>
</style>
</head>
<body>
	<%@include file="NavBar.jsp"%>
	<div class="content">
        <% 
            // logout message
            String logout = request.getParameter("logout");
            if ("success".equals(logout)) {
        %>
        <div class="alert alert-success" style="margin: 20px; padding: 15px; border: 1px solid green; background-color: #e6ffe6; color: green; text-align: center;">
            You have been successfully logged out.
        </div>
        <% 
            }
        %>
   <%@include file="Welcome.jsp"%>
   </div>
</body>
</html>
