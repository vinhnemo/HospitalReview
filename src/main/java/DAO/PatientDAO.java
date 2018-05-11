/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Database.*;
import User.Patient;

import java.sql.*;

/**
 *
 * @author TGMaster
 */
public class PatientDAO {

    // Check existing email
    public boolean validateUser(String email) {

        String query = "SELECT * FROM patient WHERE email = ?";

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
    public boolean insertUser(Patient patient) {

        String query = "INSERT INTO patient"
                + "("
                + "p_fname,"
                + "p_lname,"
                + "p_gender,"
                + "email,"
                + "password,"
                + "p_address,"
                + "languages)"
                + " VALUES "
                + "("
                + "?,"
                + "?,"
                + "?,"
                + "?,"
                + "?,"
                + "?,"
                + "?);";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setString(1, patient.getFname());
            ps.setString(2, patient.getLname());
            ps.setString(3, patient.getSex());
            ps.setString(4, patient.getEmail());
            ps.setString(5, patient.getPass());
            ps.setString(6, patient.getAddress());
            ps.setString(7, patient.getLang());
            ps.executeUpdate();

            connection.close();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    // Check login
//    public Patient login(String name) {
//        Patient p = new Patient();
//
//        String query = "SELECT * FROM users WHERE user_name = ?";
//
//        // Connect to database
//        Connection connection = Database.getConnection();
//
//        try {
//            PreparedStatement ps = connection.prepareCall(query);
//            ps.setString(1, name);
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//                p.setID(rs.getInt("user_id"));
//                p.setEmail(rs.getString("user_email"));
//                p.setName(rs.getString("user_name"));
//                p.setPass(rs.getString("user_pass"));
//                p.setAddress(rs.getString("user_address"));
//                p.setImage(rs.getString("user_image"));
//
//                // Format Date
//                if (rs.getDate("user_DOB") != null) {
//                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//                    java.util.Date bday = rs.getDate("user_DOB");
//                    p.setDOB(sdf.format(bday));
//                }
//                psetAdmin(rs.getBoolean("user_admin"));
//            }
//
//            connection.close();
//            return p;
//
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        }
//        return null;
//    }
    
    public void updateUser(Patient p) {
        String query = "UPDATE patient"
                + " SET "
                + "p_fname = ?,"
                + "p_lname = ?,"
                + "p_gender = ?,"
                + "email = ? ,"
                + "password = ?,"
                + "p_address = ?,"
                + "languages = ?"
                + " WHERE p_id = ?;";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setString(1, p.getFname());
            ps.setString(2, p.getLname());
            ps.setString(3, p.getSex());
            ps.setString(4, p.getEmail());
            ps.setString(5, p.getPass());
            ps.setString(6, p.getAddress());
            ps.setString(7, p.getLang());
            ps.setInt(8, p.getID());
            ps.executeUpdate();

            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }
}
