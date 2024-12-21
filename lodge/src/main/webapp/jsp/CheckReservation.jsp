<%-- 
Jacob Ambrose
Jackie Scott
Marissa Lee
--%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
  <link rel="stylesheet" href="../css/check_page.css">  
<title>Check Reservation Page</title>
</head>
<body>
	<%@include file="NavBar.jsp"%>

	<div class="search_container">
		<h1>Search Reservation</h1>
		<div class="search-box">
			<form method="post" onsubmit="return validateInputs()">
				<label for="confirmation-number">Enter a confirmation number</label>
				<input type="text" id="confirmation-number"
					placeholder="Confirmation number" name="confirmation-number">
				<span>or</span> <input type="email" id="email"
					placeholder="Enter Email address" name="email">

				<button class="search-btn" type="submit" name="search">Search</button>
			</form>
		</div>

		<%
		String search = request.getParameter("search");
		String confNumber = request.getParameter("confirmation-number");
		String email = request.getParameter("email");

		if ((confNumber != null && !confNumber.isEmpty()) || (email != null && !email.isEmpty())) {

			String url = "jdbc:mysql://localhost:3306/moffat_bay_lodge";
			String user = "lodgeAdmin";
			String pass = "moffat2024";

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, user, pass);

				String sql = "SELECT bookings.booking_id, guests.email, rooms.room_type, "
				+ "bookings.adult_guest, bookings.child_guest, bookings.check_in, bookings.check_out "
				+ "FROM bookings " + "JOIN guests ON bookings.guest_id = guests.guest_id "
				+ "JOIN rooms ON bookings.room_id = rooms.room_id "
				+ "WHERE bookings.booking_id = ? OR guests.email = ?";

				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, confNumber);
				ps.setString(2, email);

				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
			// Retrieve values from the result set
			String bookingId = rs.getString("booking_id");
			String guestEmail = rs.getString("email");
			String roomType = rs.getString("room_type");
			int adultCount = rs.getInt("adult_guest");
			int childCount = rs.getInt("child_guest");
			Date checkIn = rs.getDate("check_in");
			Date checkOut = rs.getDate("check_out");

		%>

		<div class="resDetails">
			<h3>Reservation Details</h3>
			<div class="form-group">
				<label for="room-type">Room type:</label> <input type="text"
					id="room-type" placeholder="Room type" value="<%=roomType%>"
					readonly>
			</div>

			<div class="form-group">
				<label for="number-guests">Number of Guests:</label>
				<div class="guests">
					<div class="guest-group">
						<label for="number-adults">Adults:</label> <input type="text"
							id="number-adults" value="<%= adultCount %>" readonly>
					</div>
					<div class="guest-group">
						<label for="number-children">Children:</label> <input type="text"
							id="number-children" value="<%= childCount %>" readonly>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label for="checkin-date">Check-in dates:</label> <input type="date"
					id="checkin-date" value="<%=checkIn %>" readonly>
			</div>

			<div class="form-group">
				<label for="checkout-date">Check-out dates:</label> <input
					type="date" id="checkout-date" value="<%=checkOut %>" readonly>
			</div>
		</div>

		<%
		} else {
		%>
		<p>No reservation found for the given confirmation number or
			email.</p>
		<%
		}

		// Close the connection and statement
		rs.close();
		ps.close();
		conn.close();

		} catch (Exception e) {
		e.printStackTrace();
		out.println("<p>Error: " + e.getMessage() + "</p>");
		}
		}
		%>

	</div>
	<script type="text/javascript">
		function validateInputs() {
			const confNumber = document.getElementById("confirmation-number").value;
			const email = document.getElementById("email").value;

			if (confNumber === "" && email === "") {
				alert("Please enter either a confirmation number or an email address.")
				return false;
			}
			return true;
		}
	</script>
</body>
</html>
