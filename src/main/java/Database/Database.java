package Database;

import java.sql.*;
import java.util.logging.*;

public class Database {
    
    public static Connection getConnection(){
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
<<<<<<< HEAD
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/", "root", "");
=======
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "");
>>>>>>> 542ae77ef131f3a0a0d1fc8f1c6f10d144cc2388
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, e);
        }
        return conn;
    }
    
    public static void main(String[] args) {
        System.out.println(Database.getConnection());
    }
}