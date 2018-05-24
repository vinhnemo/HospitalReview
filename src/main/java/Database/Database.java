package Database;

import java.sql.*;
import java.util.logging.*;

public class Database {

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
<<<<<<< HEAD

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "");
=======
            conn = DriverManager.getConnection("jdbc:mysql://35.198.229.164:3306/hospital", "root", "12345");

>>>>>>> 8a14142a530d636b5880f8185aadbee533fc49ef
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, e);
        }
        return conn;
    }

    public static void main(String[] args) {
        System.out.println(Database.getConnection());
    }
}
