<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout Page</title>
</head>
<body>
<%
    // Invalidate the current session to log the user out
    session.invalidate();
	//Redirect to the index page with a success message
	response.sendRedirect("index.jsp?logout=success");
%>

</body>
</html>