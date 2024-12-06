<%-- 
Jacob Ambrose
Jackie Scott
Marissa Lee
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Moffat Bay Lodge</title>
<link rel="stylesheet" href="../css/attractions-styles.css">

</head>
<body>
	<%@include file="NavBar.jsp"%>
	<div class="attractionsContainer">
		<h2>Attractions</h2>
		<div class="attractions-hero">
    <img src="../images/hiking-attractions.png"
        alt="Hiker in red backpack walking along mountain trail">
    <div class="hero-content">
        <h3 class="hero-title">Hiking</h3>
        <p class="hero-description">Immerse yourself in nature as you traverse scenic trails, from lush forests to breathtaking mountain vistas, perfect for adventurers of all levels.</p>
    </div>
</div>

		<div class="attractions-row">
    <!-- Card 1 -->
    <div class="card">
        <div class="card-img">
            <img alt="Onlookers whale watching tail fin only" src="../images/whales-attractions.png">
        </div>
        <div class="card-content">
            <span class="tag">Whale Watching</span>
            <p>Witness the majesty of the ocean as you embark on a thrilling adventure to see whales in their natural habitat.</p>
        </div>
    </div>
    <!-- Card 2 -->
    <div class="card">
        <div class="card-img">
            <img alt="Scuba Diver viewing coral reef" src="../images/snorkel-attractions.png">
        </div>
        <div class="card-content">
            <span class="tag">Scuba Diving</span>
            <p>Dive into crystal-clear waters to explore vibrant marine life and stunning coral reefs.</p>
        </div>
    </div>
    <!-- Card 3 -->
    <div class="card">
        <div class="card-img">
            <img alt="Woman and man kayaking down calm river, trees on both sides of the river" src="../images/kayaking-attractions.png">
        </div>
        <div class="card-content">
            <span class="tag">Kayaking</span>
            <p>Paddle along serene coastlines and hidden coves, immersing yourself in breathtaking views and tranquil waters.</p>
        </div>
    </div>
</div>
	</div>
</body>
</html>
