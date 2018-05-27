/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Database.Database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Duyet Pham
 */
public class bookmarkDAO {

    public void bookmarkDoctor(int p_id, int d_id) {

        String query = "INSERT INTO hospitalreview.bookmarkdoctor"
                + "("
                + "p_id,"
                + "d_id)"
                + " VALUES "
                + "("
                + "?,"
                + "?);";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, p_id);
            ps.setInt(2, d_id);
            ps.executeUpdate();

            connection.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public void removeBookmarkDoctor(int pID, int dID) {

        try {
            String sqlStatement1 = "DELETE FROM bookmarkdoctor WHERE p_id=" + pID + " AND d_id=" + dID + " ;";
            // create a mysql database connection
            String myDriver = "com.mysql.jdbc.Driver";
            String myUrl = "jdbc:mysql://localhost:3306/hospitalreview?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false";
            Class.forName(myDriver);
            Connection conn = DriverManager.getConnection(myUrl, "root", "7777777");

            Statement st = conn.createStatement();

            st.executeUpdate(sqlStatement1);
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Got an exception!");
            System.err.println(e.getMessage());
        }

    }
    

}
