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

        String query = "INSERT INTO bookmarkdoctor"
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

        Connection connection = Database.getConnection();
        String query = "DELETE FROM bookmarkdoctor WHERE p_id= ? AND d_id= ? ;";
       try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, pID);
            ps.setInt(2, dID);
            ps.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            System.err.println("Got an exception!");
            System.err.println(e.getMessage());
        }

    }


    public void bookmarkHospital(int p_id, int h_id) {

        String query = "INSERT INTO bookmarkhospital (p_id, h_id) VALUES (?, ?);";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, p_id);
            ps.setInt(2, h_id);
            ps.executeUpdate();

            connection.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public void removeBookmarkHospital(int pID, int hID) {
       
        Connection connection = Database.getConnection();
        String query = "DELETE FROM bookmarkhospital WHERE p_id= ? AND h_id = ? ;";
       try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, pID);
            ps.setInt(2, hID);
            ps.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            System.err.println("Got an exception!");
            System.err.println(e.getMessage());
        }

    }

}
