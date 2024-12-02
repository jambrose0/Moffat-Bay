<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Moffat Bay Lodge</title>
 <link rel="stylesheet" href="../css/styles.css">
 <style>
  .fishContainer {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 20px;
}

 .fishContainer h3 {
	margin: 0;
	font-size: 65px;
	color: var(--moffat-mocha);
	text-align: center;
} 

.fishContainer img {
	width: 45px;
	height: auto;
} 
</style>
</head>
<body>
	<div class="lander">
		<div class="welcome">
			<div class="fishContainer">
				<img class="fishImg" id="fishLeft" src="../images/landing-fish.png" alt="fish jumping out of water">
				<h3>Welcome To</h3>
				<img class="fishImg" id="fishRight" src="../images/landing-fish.png" alt="fish jumping out of water">
			</div>
			<h1>Moffat Bay Lodge</h1>
			<div class="landingLogo">
				<img src="../images/lodge-icon.png">
			</div>
		</div>
	</div>
</body>
</html>
