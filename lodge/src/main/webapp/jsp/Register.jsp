<%-- 
Jacob Ambrose
Jackie Scott
Marissa Lee
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    // Database connection parameters
    String jdbcUrl = "jdbc:mysql://localhost:3306/moffat_bay_lodge?useSSL=false&allowPublicKeyRetrieval=true";
    String dbUser = "lodgeAdmin";
    String dbPassword = "moffat2024";
%>
<html>
<head>
    <title>Registration</title>
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
            background-image: url('/lodge/images/registration_bg.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            position: relative;
            z-index: 0;
        }

        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: none;
            border: 1px solid #9C8F85;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 10;
        }

        h1 {
            font-family: 'CatchyMager', Arial, sans-serif;
            text-align: center;
            font-size: 24px;
            color: #503827;
        }

        form {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: bold;
            color: #6F5E4B;
        }

        input {
            padding: 10px;
            border: 1px solid #9C8F85;
            border-radius: 5px;
            font-size: 14px;
        }

        button {
            background-color: #476561;
            color: #FBFBFC;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #503827;
        }

        .message {
            text-align: center;
            padding: 10px;
            margin-top: 10px;
            border-radius: 5px;
        }

        .success {
            background-color: #DFF2BF;
            color: #4F8A10;
        }

        .error {
            background-color: #FFBABA;
            color: #D8000C;
        }
    </style>
</head>
<body>
<%@ include file="NavBar.jsp" %>
<div class="container">
    <h1>Guest Registration</h1>

    <%-- Handle form submission --%>
    <%
        String message = "";
        String messageClass = "";
        Connection conn = null;
        PreparedStatement stmt = null;

        if (request.getMethod().equalsIgnoreCase("POST")) {
            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");

            try {
                // Load the MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the database connection
                conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

                if (conn != null) {
                    // Insert guest into the database
                    String sql = "INSERT INTO Guests (first_name, last_name, email, phone, password) VALUES (?, ?, ?, ?, ?)";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, firstName);
                    stmt.setString(2, lastName);
                    stmt.setString(3, email);
                    stmt.setString(4, phone);
                    stmt.setString(5, password);
                    stmt.executeUpdate();

                    message = "Registration successful!";
                    messageClass = "success";
                } else {
                    message = "Database connection failed!";
                    messageClass = "error";
                }
            } catch (ClassNotFoundException e) {
                message = "JDBC Driver not found: " + e.getMessage();
                messageClass = "error";
                e.printStackTrace();
            } catch (SQLException e) {
                if (e.getMessage().contains("Duplicate entry")) {
                    message = "Email already exists!";
                    messageClass = "error";
                } else {
                    message = "SQL Error: " + e.getMessage();
                    messageClass = "error";
                }
                e.printStackTrace();
            } finally {
                if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
            }
        }
    %>

    <%-- Show success or error message --%>
    <%
        if (!message.isEmpty()) {
    %>
    <div class="message <%= messageClass %>"><%= message %></div>
    <%
        }
    %>

    <%-- Registration form --%>
    <%-- Added password validation--%>
    <form method="post">
        <label for="first_name">First Name</label>
        <input type="text" name="first_name" id="first_name" required>

        <label for="last_name">Last Name</label>
       <input type="text" name="last_name" id="last_name" required>

        <label for="email">Email</label>
        <input type="email" name="email" id="email" required
        placeholder="Enter a valid email address">

        <label for="phone">Phone</label>
        <input type="tel" name="phone" id="phone" required placeholder="Enter a phone number">

        <label for="password">Password</label>
        <input type="password" name="password" id="password" required
        placeholder="Enter a Password" 
        pattern="(?=.*[A-Z])(?=.*\d).{6,}" 
        title="Password must be at least 6 characters long, include 1 uppercase letter, and 1 number." 
        required>
        
    <p class="password-requirements">
        Password must:
        <ul>
            <li>Be at least 6 characters long</li>
            <li>Include at least 1 uppercase letter</li>
            <li>Include at least 1 number</li>
        </ul>
    </p>

        <button type="submit">Register</button>
    </form>
</div>
</body>
</html>
