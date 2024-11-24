<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="stylesheet" href="../css/styles.css">
    <style>
        /* CSS to create the left-right layout */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex; 
            justify-content: space-between;
            align-items: center;
            padding: 20px; /* Add spacing around the content */
        }

         .text-section  {
            flex: 1; /* Take up remaining space on the left */
            max-width: 40%; /* Adjust width for centering */
            text-align: left; /* Align text to the left */
            margin-left: 10%; /* Move closer to the center */
       
        }

        .text-section h1 {
            margin-bottom: 30px; /* Space between h1 and paragraph */
            
        }

      
    </style>
</head>
<body>
    <%@ include file="NavBar.jsp" %>

    <div class="container">
        <!-- Left Section: Text -->
        <div class="text-section">
            <h1>About Moffat Bay</h1>
            <p>
                Located on Joviedsa Island, Moffat Bay Lodge and Marina offer you the perfect opportunity to get away. 
                With enchanting outdoor attractions, comfortable lodging, and affordable prices, Moffat Bay Lodge is 
                the perfect place to relax and unwind. Book your reservation today!
            </p>
        </div>

            <img src="../images/about%20page%20pic.png" alt="Moffat Bay Lodge">
        </div>
    </div>
</body>
</html>
