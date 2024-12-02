package lodge.beans;

import jakarta.servlet.ServletException; //updated to jakarta
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name="Contacus", urlPatterns = {"/Contactus"})
public class Contactus extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data from request
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // JDBC setup to connect to the database
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/moffat_bay_lodge", "lodgeAdmin", "moffat2024");

            // SQL query to insert form data into the database
            String sql = "INSERT INTO contact_form (name, phone, email, message) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, phone);
            stmt.setString(3, email);
            stmt.setString(4, message);

            // Execute the insert query
            stmt.executeUpdate();

            // Close the connection
            stmt.close();
            connection.close();

            // Redirect or send response
            response.sendRedirect("thankyou.jsp"); // Redirect to a thank you page after successful form submission
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to an error page in case of failure
        }
    }
}
