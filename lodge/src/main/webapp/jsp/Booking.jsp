<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<% 
    if (session == null || session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
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
	--moffat-background: #F6F6E9;
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
	height: 40vh;
	background-color: var(--moffat-background);
	font-family: 'catchyMager', Arial, sans-serif; 
	color: var(--moffat-sand);
}

.bookingPage h2 {
	font-size: 36px;
	margin-bottom: 20px;
}

.formGroup {
	width: 100%;
	max-width: 400px;
	margin-bottom: 20px;
	text-align: center;
}

.formGroup label {
	display: block;
	font-size: 16px;
	margin-bottom: 10px;
	font-weight: bold;
}

.formGroup select, .formGroup input {
	width: 100%;
	padding: 10px;
	font-size: 16px;
	border: 2px solid var(--moffat-tan);
	border-radius: 8px;
	background-color: var(--moffat-white);
}

.formGroup input[type="number"] {
	text-align: center;
}

.numberControls {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 10px;
}

.numberControls button {
	background: none;
	border: none;
	font-size: 24px;
	font-weight: bold;
	color: var(--moffat-sand);
	cursor: pointer;
}

.dateGroup {
	display: flex;
	justify-content: space-between;
	gap: 10px;
}

.dateGroup input {
	flex: 1;
}

.dateIcon {
	position: relative;
	display: inline-block;
}

.dateIcon input {
	padding-left: 30px;
}

.dateIcon::before {
	position: absolute;
	left: 10px;
	top: 50%;
	transform: translateY(-50%);
	font-size: 16px;
}

.submitBtn {
	background-color: var(--moffat-green);
	color: var(--moffat-white);
	width: 100%;
	max-width: 250px;
	height: 50px;
	font-size: 18px;
	border: none;
	border-radius: 12px;
	margin-top: 15px;
	cursor: pointer;
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
		<form action="ReservationSummary.jsp" method="post"
			onsubmit="return submitForm(event)">
			<!-- Room Type -->
			<div class="formGroup">
				<label for="roomType">Room Type</label> <select id="roomType"
					name="roomType">
					<option value="select">Select a room</option>
					<option value="doubleFull">Double Full Beds: $126.00 per
						night</option>
					<option value="singleQueen">Single Queen Bed: $141.75 per
						night</option>
					<option value="doubleQueen">Double Queen Beds: $157.50 per
						night</option>
					<option value="singleKing">Single King Bed: $168.00 per
						night</option>
				</select>
			</div>

			<!-- Number of Guests -->
			<div class="formGroup">
				<label>Number of Guests</label>
				<div class="numberControls">
					<label>Adults</label> <input type="number" name="adultCount"
						value="0" min="0"> <label>Children</label> <input
						type="number" name="childCount" value="0" min="0">
				</div>
			</div>

			<!-- Check-in and Check-out Dates -->
			<div class="formGroup">
				<label>Check in / Check out Dates</label>
				<div class="dateGroup">
					<div class="dateIcon">
						<input type="date" id="checkInDate" name="checkInDate"
							placeholder="Check-in">
					</div>
					<div class="dateIcon">
						<input type="date" id="checkOutDate" name="checkOutDate"
							placeholder="Check-out">
					</div>
				</div>
			</div>

			<!-- Submit Button -->
			<input class="submitBtn" type="submit" value="Review Reservation">
		</form>
	</div>


	<!--JS function to determine if checkout date is after check-in date. If same day or before will not allow form to process  -->
	<script type="text/javascript">
		function validateInputs() {
		/* Retrieve Form Values */
		const roomType = document.getElementById('roomType').value;
		const adultCount = Number(document.querySelector('input[name="adultCount"]').value);
		const checkInValue = document.getElementById('checkInDate').value
		const checkOutValue = document.getElementById('checkOutDate').value
		
		/* Validates that all aspects of the form are filled in before processing*/
		if(roomType === 'select') {
		alert('Please select a room type');
		return false;
		}
		if(adultCount <=0) {
		alert('Please ensure there is an adult guest present');
		return false;
		}
		if(!checkInValue || !checkOutValue) {
		alert('Please select both check-in and check-out dates');
		return false;
		}
		return true;
		}
		
		function validateDates() {
		const checkInDate = new Date(document.getElementById('checkInDate').value);
		const checkOutDate = new Date(document.getElementById('checkOutDate').value);
		//validates that check IN date is BEFORE check OUT date
		if (checkOutDate <= checkInDate ) {
		alert('Check-out date cannot be before or the same date as the check-in date!');
		return false;
	}
 		return true;
		}
		function submitForm(event) {
		event.preventDefault();
		
		const isFormValid = validateInputs();
		const datesValid = validateDates();
		
		if (isFormValid && datesValid) {
			alert("Proceeding with form submission")
			event.target.submit();
		}
		}
		</script>
</body>
</html>
