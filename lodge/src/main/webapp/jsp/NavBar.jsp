<%-- 
Jacob Ambrose
Jackie Scott
Marissa Lee
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Moffat Bay Lodge</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
<div class="header">
    <div class="logo">
        <h1>Moffat Bay Lodge</h1>
    </div>

    <ul class="navbar">
        <li class="line"><a href="index.jsp">Home</a></li>
        <li><a href="About.jsp">About</a></li>
        <li><a href="Attractions.jsp">Attractions</a></li>
         <li><a href="Contact.jsp">Contact Us</a></li>

        <%-- Check if user is logged in --%>
        <%
 
        if (session.getAttribute("loggedIn") != null && (Boolean) session.getAttribute("loggedIn")) {
        	
        %>
        <!-- User is logged in, show "Sign Out" -->
        <li><a href="Logout.jsp">Sign Out</a></li>
        <%
        } else {
        %>
        <!-- Future feature: User is not logged in, show "Login" and "Register" -->
        <li><a href="Login.jsp">Login</a></li>
        <li><a href="Register.jsp">Register</a></li>
        <%
            }
        %>

        <li><a href="Booking.jsp">Book a Room</a></li>
        <li><a href="CheckReservation.jsp">Check Reservation</a></li>
    </ul>
</div>
</body>
</html>
