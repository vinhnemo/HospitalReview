/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Admin;
import Database.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author TGMaster
 */
public class AdminDAO {

    // Check existing username
    public boolean validateUser(String email) {

        String query = "SELECT * FROM admin WHERE email = ?";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                connection.close();
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    // Insert account
    public boolean insertUser(Admin admin) {

        String query = "INSERT INTO admin"
                + "("
                + "email,"
                + "password)"
                + " VALUES "
                + "("
                + "?,"
                + "?);";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setString(1, admin.getEmail());
            ps.setString(2, admin.getPass());
            ps.executeUpdate();

            connection.close();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }
    
    // Check login
    public Admin login(String email) {
        Admin admin = new Admin();

        String query = "SELECT * FROM admin WHERE email = ?";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                admin.setID(rs.getInt("id"));
                admin.setEmail(rs.getString("email"));
                admin.setPass(rs.getString("password"));
            }

            connection.close();
            return admin;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    // Update info
    public void updateUser(Admin admin) {
        String query = "UPDATE admin"
                + " SET "
                + "email = ? ,"
                + "password = ?,"
                + " WHERE id = ?;";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setString(1, admin.getEmail());
            ps.setString(2, admin.getPass());
            ps.setInt(3, admin.getID());
            ps.executeUpdate();

            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }
}
