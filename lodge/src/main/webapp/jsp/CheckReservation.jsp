<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page %>
<html>
<head>
    <title>Review Reservation</title>
</head>
<body>
<%@include file="NavBar.jsp"%>
<div class='reservationDetails'>
<h2>Reservation Summary</h2>
<table border='1' cellpadding='10' cellspacing='0'>
<tr> 
<th>Room Type
<td> <%=request.getParameter("roomType") %></td>
</tr>
<tr>
<th>Number of Adults</th>
<td><%=request.getParameter("adultCount") %></td>
</tr>
<tr>
<th>Number of Children</th>
<td><%=request.getParameter("childCount")%></td>
</tr>
<tr>
<th>Check-In Date </th>
<td><%= request.getParameter("checkInDate") %></td>
</tr>
<tr>
<th>Check-Out Date</th>
<td><%=request.getParameter("checkOutDate") %></td>
</tr>
</table>

</div>

</body>
</html>
