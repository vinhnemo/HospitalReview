package Database;

import DAO.PatientDAO;
import Util.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import java.util.logging.*;

public class Database {

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");


            conn = DriverManager.getConnection(Info.DB_URL, Info.DB_USERNAME, Info.DB_PASSWORD);
            
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, e);
        }
        return conn;
    }

    public static void main(String[] args) {
        //String hash = Util.generateRandomStr(8);
        //PatientDAO.updateToken(1, BCrypt.hashpw(hash, Info.HASH_SALT));
        //System.out.println(PatientDAO.getTokenfromId(1));
    }
}
