
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@page%>
<html>
<head>
<title>Book a Room</title>
<link rel="stylesheet" href="/lodge/css/styles.css">
<style type="text/css">
:root {
	--moffat-mocha: #503827;
	--moffat-green: #476561;
	--moffat-sand: #6F5E4B;
	--moffat-white: #FBFBFC;
	--moffat-tan: #9C8F85;
	-moffat-background: #F6F6E9;
}

@font-face {
	font-family: catchyMager;
	src: local("catchy_mager"),
		url("../fonts/catchy_mager/catchy_mager.otf") format("opentype"),
		url("../fonts/catchy_mager/catchy_mager.ttf") format("truetype");
	font-family: Coco Gothic;
	src: local("coco_gothic"),
		url("../fonts/coco_gothic/Coco-Gothic-Regular-trial.ttf")
		format("truetype")
}

body, p, ul, li {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	background-color: F6F6E9;
}

.bookingPage {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	/* 				height: 100vh; */
}

.bookingPage h2 {
	text-align: center;
	font-family: catchyMager;
	letter-spacing: 1px;
	font-size: 30px;
	margin-bottom: 25px;
}

.bookingTable {
	width: 40%;
}

table {
	border-collapse: collapse;
	font-family: arial, sans-serif;
}

td {
	text-align: center;
	padding: 10px 20px;
}

tr:nth-child(odd) {
	background-color: #CBEBF6;
}
.submitBtn{
    background-color: var(--moffat-green);
    color: var(--moffat-white);
    width: 25%;
    height: 35px;
    font-size: 20px;
    border: none;
    border-radius: 12px;
    margin: 15px;
}
.submitBtn:hover {
    background-color: var(--moffat-sand);
    color: black;
}
</style>


</head>
<body>
	<%@include file="NavBar.jsp"%>
	<div class="bookingPage">
		<h2>Book a Room</h2>
		<form action="CheckReservation.jsp" method="post"  onsubmit="return validateDates(event)">
		<table class=bookingTable>
			<tr>
				<td>Room type</td>
				<td><select name="roomType">
						<option value="doubleFull">Select a room</option>
						<option value="doubleFull">Double Full Beds: $126.00 per
							night</option>
						<option value="singleQueen">Single Queen Bed: $141.75 per
							night</option>
						<option value="doubleQueen">Double Queen Beds: $157.50
							per night</option>
						<option value="singleKing">Single King Bed: $168.00 per
							night</option>
				</select></td>
			</tr>
			<tr>
				<td>Number of Guests</td>
				<td><input type="number" name="adultCount" placeholder="Number of Adults"></td>
				<td><input type="number" name="childCount" placeholder="Number of Children"></td>
			</tr>
			<tr>
				<td>Check-in Date</td>
				<td><input type="date" id="checkInDate" name="checkInDate"></td>
				<td>Check-Out Date</td>
				<td><input type="date" id="checkOutDate" name="checkOutDate"></td>
			</tr>
			<tr>
			<td colspan='6'> 
					<input class='submitBtn' type="submit" value='Review Booking'>
		</td>
			</tr>
		</table>
		</form>
	</div>



<!--JS function to determine if checkout date is after check-in date. If same day or before will not allow form to process  -->
	<script type="text/javascript">
		function validateDates(event) {
		event.preventDefault();
		const checkInDate = new Date(document.getElementById('checkInDate').value);
		const checkOutDate = new Date(document.getElementById('checkOutDate').value);
		
		//validates that check IN date is BEFORE check OUT date
		if (checkOutDate <= checkInDate) {
		alert('Check-out date cannot be before or the same date as the check-in date!');
		return;
	}
		alert("Proceeding with form submission");
		event.target.submit();
		}
		</script>
</body>
</html>
