<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.time.LocalDate, java.time.temporal.ChronoUnit" %>
<%
    // Database connection parameters
    //This is the reservation summary page
    String jdbcUrl = "jdbc:mysql://localhost:3306/moffat_bay_lodge?useSSL=false&allowPublicKeyRetrieval=true";
	String dbUser = "lodgeAdmin";
	String dbPassword = "moffat2024";
%>
<html>
<head>
    <title>Reservation Summary</title>
        <style>
            @font-face {
            font-family: 'CatchyMager';
            src: local('catchy_mager'),
                url('../fonts/catchy_mager/catchy_mager.otf') format('opentype'),
                url('../fonts/catchy_mager/catchy_mager.ttf') format('truetype');
        }

        @font-face {
            font-family: 'Coco Gothic';
            src: local('coco_gothic'),
                url('../fonts/coco_gothic/Coco-Gothic-Regular-trial.ttf') format('truetype');
        }
        
        body {
           font-family: 'Coco Gothic', Arial, sans-serif;
            background-color: #f6f6e9;
            color: #503827;
            padding: 20px;
        }

        .reservationDetails {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background: #FBFBFC; 
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            font-weight: bold;
            color: #6f5e4b;
        }

        td {
            color: #503827;
        }
         .buttons {
            text-align: center;
            margin-top: 20px;
        }

        .submitBtn, .cancelBtn {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        .submitBtn {
            background-color: #476561;
            color: #fbfbfc;
        }

        .cancelBtn {
            background-color: #6f5e4b;
            color: #fbfbfc;
        }

        .submitBtn:hover {
            background-color: #6f5e4b;
        }

        .cancelBtn:hover {
            background-color: #476561;
        }
    </style>
</head>
<body>
<%@include file="NavBar.jsp"%> 
<div class='reservationDetails'>
<h2>Reservation Summary</h2>
<%
    String action = request.getParameter("action");
    String roomType = request.getParameter("roomType");
    String checkInDate = request.getParameter("checkInDate");
    String checkOutDate = request.getParameter("checkOutDate");
    int adultCount = Integer.parseInt(request.getParameter("adultCount"));
    int childCount = Integer.parseInt(request.getParameter("childCount"));

    long numberOfNights = 0;
    double nightlyRate = 0.0;
    double totalCost = 0.0;

    try {
        LocalDate checkIn = LocalDate.parse(checkInDate);
        LocalDate checkOut = LocalDate.parse(checkOutDate);
        numberOfNights = ChronoUnit.DAYS.between(checkIn, checkOut);

        switch (roomType) {
            case "singleQueen":
                nightlyRate = 141.75;
                break;
            case "doubleFull":
                nightlyRate = 126.00;
                break;
            case "doubleQueen":
                nightlyRate = 157.50;
                break;
            case "singleKing":
                nightlyRate = 168.00;
                break;
        }

        totalCost = nightlyRate * numberOfNights;
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error calculating reservation details: " + e.getMessage() + "</p>");
    }

    if ("submit".equals(action)) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            //retrieve guest_id from session 
            int guestID = (int) session.getAttribute("guest_id");
            
            // Map roomType to roomId
            int roomId = -1;
            if ("singleQueen".equals(roomType)) {
                roomId = 1;
            } else if ("doubleFull".equals(roomType)) {
                roomId = 2;
            } else if ("doubleQueen".equals(roomType)) {
                roomId = 3;
            } else if ("singleKing".equals(roomType)) {
                roomId = 4;
            } else {
    %>
                <h3>Room Selection Error</h3>
                <p>The selected room type is invalid. Please try again.</p>
    <%
                connection.close();
                return;
            }
            //DEBUGGING 
    System.out.println("Guest ID: " + guestID);
    System.out.println("Room ID: " + roomId);
    System.out.println("Check-in Date: " + checkInDate);
    System.out.println("Check-out Date: " + checkOutDate);
    System.out.println("Total Guests: " + (adultCount + childCount));
    System.out.println("Adult Guests: " + adultCount);
    System.out.println("Child Guests: " + childCount);
                		//DEBUGGING 
                		
            String sql = "INSERT INTO Bookings (guest_id, room_id, check_in, check_out, guest_count, adult_guest, child_guest) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?)";
                		
            PreparedStatement stmt = connection.prepareStatement(sql);
            
                	    stmt.setInt(1, guestID); // Signed-in user's guest ID
                        stmt.setInt(2, roomId);  // Mapped room ID
                        stmt.setDate(3, java.sql.Date.valueOf(checkInDate)); // Check-in date
                        stmt.setDate(4, java.sql.Date.valueOf(checkOutDate)); // Check-out date
                        stmt.setInt(5, adultCount + childCount); // Total guest count
                        stmt.setInt(6, adultCount); // Adult guests
                        stmt.setInt(7, childCount); // Child guests

                        int rowsInserted = stmt.executeUpdate();

                        if (rowsInserted > 0) {
                        	String query = "SELECT booking_id FROM Bookings WHERE guest_id = ? AND room_id = ? AND check_in = ? AND check_out = ?";
                            PreparedStatement selectStmt = connection.prepareStatement(query);

                            selectStmt.setInt(1, guestID);
                            selectStmt.setInt(2, roomId);
                            selectStmt.setDate(3, java.sql.Date.valueOf(checkInDate));
                            selectStmt.setDate(4, java.sql.Date.valueOf(checkOutDate));

                            ResultSet rs = selectStmt.executeQuery();

                            if (rs.next()) {
                                String confirmationNum = rs.getString("booking_id"); 
                                System.out.println("Fetched UUID: " + confirmationNum); // Debugging output
                    %>
                                <h3>Reservation Submitted Successfully!</h3>
                                <p>Your reservation has been saved. </p>
                                <p> Your confirmation number is: <%= confirmationNum %></p>
                                <p><a href="index.jsp">Return to Home</a></p>
            <%
                            } else {
            %>
                                <h3>Reservation Submission Failed</h3>
                                <p>There was an issue saving your reservation. Please try again later.</p>
            <%
                            }
                        } else {
            %>
                            <h3>Reservation Submission Failed</h3>
                            <p>There was an issue saving your reservation. Please try again later.</p>
            <%
                        }

                        connection.close();
                    } catch (Exception e) {
            %>
                    <p style="color:red;">Database error: <%= e.getMessage() %></p>
                    <%
                    e.printStackTrace(); // Logs the error for debugging
                    }
                } else { // Preview reservation details before submission
            %>
                    <table border="1" cellpadding="10" cellspacing="0">
                        <tr>
                            <th>Room Type:</th>
                            <td><%= roomType %></td>
                        </tr>
                        <tr>
                            <th>Total Guests:</th>
                            <td><%= adultCount + childCount %></td>
                        </tr>
                        <tr>
                            <th>Check-In Date:</th>
                            <td><%= checkInDate %></td>
                        </tr>
                        <tr>
                            <th>Check-Out Date:</th>
                            <td><%= checkOutDate %></td>
                        </tr>
                        <tr>
                            <th>Total Cost:</th>
                            <td>$<%= String.format("%.2f", totalCost) %></td>
                        </tr>
                    </table>
                    <form action="CheckReservation.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="submit">
                        <input type="hidden" name="roomType" value="<%= roomType %>">
                        <input type="hidden" name="adultCount" value="<%= adultCount %>">
                        <input type="hidden" name="childCount" value="<%= childCount %>">
                        <input type="hidden" name="checkInDate" value="<%= checkInDate %>">
                        <input type="hidden" name="checkOutDate" value="<%= checkOutDate %>">
                        <button class="submitBtn" type="submit">Submit Reservation</button>
                    </form>
                    <form action="index.jsp" method="get" style="display:inline;">
                        <button class="cancelBtn" type="submit">Cancel</button>
                    </form>
            <%
                }
            %>

