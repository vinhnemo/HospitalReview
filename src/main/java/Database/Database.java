package Database;

import java.sql.*;
import java.util.logging.*;

public class Database {
    
    public static Connection getConnection(){
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/", "root", "");
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, e);
        }
        return conn;
    }
    
}