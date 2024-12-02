<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us</title>
<link rel="stylesheet" href="../css/styles.css">
<style>
/* CSS to create the left-right layout */
:root {
	--moffat-mocha: #503827;
	--moffat-green: #476561;
	--moffat-sand: #6F5E4B;
	--moffat-white: #FBFBFC;
	--moffat-tan: #9C8F85;
	--moffat-background: #F6F6E9;
}

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: var(--moffat-background);
}

.aboutContainer {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px; /* Add spacing around the content */
	border-bottom: 1px solid hidden;
}

.text-section {
	flex: 1; /* Take up remaining space on the left */
	max-width: 50%; /* Adjust width for centering */
	text-align: left; /* Align text to the left */
	margin-left: 10%; /* Move closer to the center */
}

.text-section h1 {
	margin-bottom: 30px; /* Space between h1 and paragraph */
}

img {
	flex: 1;
	max-width: 60%;
	height: auto;
}
</style>
</head>
<body>
	<%@ include file="NavBar.jsp"%>
	<div class="aboutContainer">
		<!-- Left Section: Text -->
		<div class="text-section">
			<h1>About Moffat Bay</h1>
			<p>Located on Joviedsa Island, Moffat Bay Lodge and Marina offer
				you the perfect opportunity to get away. With enchanting outdoor
				attractions, comfortable lodging, and affordable prices, Moffat Bay
				Lodge is the perfect place to relax and unwind. Book your
				reservation today!</p>
		</div>
		<img src="../images/about%20page%20pic.png" alt="Moffat Bay Lodge">
	</div>
<%@include file="Contact.jsp"%>
</body>
</html>
