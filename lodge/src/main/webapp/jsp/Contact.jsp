<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" href="/lodge/css/contact.css">
</head>
<body>

    <div class="contactContainer">
        <!-- Form Section -->
        <div class="form-section">
            <h2>Have a question? Send us a message, and we'll respond as soon as possible.</h2>
     <form action="Contactus" method="POST">
    <input type="text" id="name" name="name" required placeholder="Name">
    <input type="tel" id="phone" name="phone" required placeholder="Phone Number">
    <input type="email" id="email" name="email" required placeholder="Email">
    <textarea id="message" name="message" rows="5" required placeholder="How can we help you?"></textarea>
    <button type="submit">Send Message</button>
</form>
     
       
        </div>

        <!-- Info Section -->
        <div class="info-section">
            <h2>Reservations Office</h2>
            <ul>
                <li>123 Anywhere St. Any City, ST 12345</li>
                <li>1123-456-7890</li>
                <li>reservations@moffatbay.com</li>
            </ul>
            <p>Monday to Sunday<br>7:00am to 9:00pm EST</p>
        </div>
    </div>
</body>
</html>
