package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.*;

public class Database {

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");


            //conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", ""); database của ku

            conn = DriverManager.getConnection("jdbc:mysql://35.198.229.164:3306/hospital", "root", "12345");
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, e);
        }
        return conn;
    }

    public static void main(String[] args) {
        DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        System.out.println(sdf.format(date));
    }
}
