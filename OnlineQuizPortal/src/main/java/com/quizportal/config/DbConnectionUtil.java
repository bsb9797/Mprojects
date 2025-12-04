package com.quizportal.config;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
/**
* Central place for creating JDBC connections.
* Used by all DAO classes.
*/
public final class DbConnectionUtil {
 
    // TODO: change DB name, username, password as per your system
    private static final String DB_URL =
            "jdbc:mysql://localhost:3306/quiz_portal_db?useSSL=false&allowPublicKeyRetrieval=true";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "root@39";
 
    // Load the MySQL driver once when the class is loaded
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            // Fail fast: if driver is missing, nothing will work
            throw new ExceptionInInitializerError("Could not load MySQL JDBC driver: " + ex.getMessage());
        }
    }
 
    // Private constructor – no one should create objects of this class
    private DbConnectionUtil() {
    }
 
    /**
     * Returns a new JDBC connection to the quiz_portal_db database.
     * Caller (DAO classes) must close the connection after use.
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
    }
}