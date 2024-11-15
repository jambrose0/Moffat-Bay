package lodge.model;
import jakarta.servlet.ServletContext;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

import static lodge.model.Provider.*;


public class ConnectionProvider {
    private static final Logger log = Logger.getLogger(ConnectionProvider.class.getName());
    private static Connection con = null;

    public static Connection initConnection(ServletContext context) {
        if(con == null) {
            System.out.println("Database failed in ConnectionProvider");
        }
        try {
            String dbName = context.getInitParameter("dbName");
            String dbUser = context.getInitParameter("dbUser");
            String dbPass = context.getInitParameter("dbPass");
            String jdbcDriver = context.getInitParameter("jdbcDriver");
            log.info("Initializing database connection...");
            log.info("Database URL: " + dbName);

            Class.forName(jdbcDriver);
            log.info("JDBC Driver loaded successfully.");
            con = DriverManager.getConnection(dbName,dbUser, dbPass);
            log.info("DB connected successfully.");
        } catch (Exception e) {
            log.log(Level.SEVERE, "Database connection error", e);
        }
        return con;
    }


    public static Connection getConnection() {
        return con;
    }

    }