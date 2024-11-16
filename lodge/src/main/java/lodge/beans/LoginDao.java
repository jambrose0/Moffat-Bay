package lodge.beans;
import jakarta.servlet.ServletContext;
import lodge.model.ConnectionProvider;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


public class LoginDao {
    private static final Logger log = Logger.getLogger(LoginDao.class.getName());
//    private String dbName;
//    private String dbUser;
//    private String dbPassword;
    private String dbName = "jdbc:mysql://localhost:3306/moffat_bay_lodge";
    private String dbUser = "lodgeAdmin";
    private String dbPassword = "moffat2024";



//    public LoginDao(ServletContext context) {
//        this.dbName = context.getInitParameter("dbName");
//        this.dbUser = context.getInitParameter("dbUser");
//        this.dbPassword = context.getInitParameter("dbPass");
//    }

    public void setdbName(String dbName) {
        this.dbName = dbName;
    }

    public String getdbName() {
        return dbName;
    }
    public void setDbUser(String dbUser) {
        this.dbUser = dbUser;
    }
    public String getDbUser() {
        return dbUser;
    }
    public void setDbPassword(String dbPassword) {
        this.dbPassword = dbPassword;
    }
    public String getDbPassword() {
        return dbPassword;
    }
    public Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(getdbName(), getDbUser(), getDbPassword());
        } catch (SQLException ex) {
            System.out.println("Could not connect to DB " + ex.getMessage());
        } catch (ClassNotFoundException e) {
            System.out.println("Error from class.forName jdbc Driver:  " + e.getMessage());
        }
        return con;
    }
    public void putConnection(Connection con) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println("Unable to connect to DB" + ex.getMessage());
            }
        }
    }

public boolean login(String email, String password) {
        boolean checkUser = false;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = getConnection();
            String sql = "select * from guests where email = ? and password = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            rs = ps.executeQuery();
            if(rs.next()) {
                checkUser = true;
            }
        } catch (SQLException e) {
            System.out.println("Error during login: " + e.getMessage());
        } finally {
            putConnection(con);
            if(ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println("Error closing statement: " + ex.getMessage());
                }
            }
            if(rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    System.out.println("Error closing statement: " + ex.getMessage());
                }
            }
        }
        return checkUser;
}
} // end of class bracket
