/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Hospital.DAO;

import Database.*;
import Hospital.DTO.Hospital;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TGMaster
 */
public class HospitalDAO {

    public boolean insertHospital(Hospital hospital) {
        String query = "INSERT INTO hospital"
                + "("
                + "h_name,"
                + "h_address,"
                + "h_website,"
                + "adname,"
                + "ademail,"
                + " VALUES "
                + "("
                + "?,"
                + "?,"
                + "?,"
                + "?,"
                + "?);";

        // Connect to database
        Connection connection = Database.getConnection();

        // Prepare Statement
        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setString(1, hospital.getName());
            ps.setString(2, hospital.getAddress());
            ps.setString(3, hospital.getWebsite());
            ps.setString(4, hospital.getAdName());
            ps.setString(5, hospital.getAdEmail());
            ps.executeUpdate();

            connection.close();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    public void updateHospital(Hospital h) {
        String query = "UPDATE hospital"
                + " SET "
                + "h_name = ?,"
                + "h_address = ?,"
                + "h_website = ?,"
                + "adname = ? ,"
                + "ademail = ?"
                + " WHERE h_id = ?;";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setString(1, h.getName());
            ps.setString(2, h.getAddress());
            ps.setString(3, h.getWebsite());
            ps.setString(4, h.getAdName());
            ps.setString(5, h.getWebsite());
            ps.setLong(6, h.getID());
            ps.executeUpdate();

            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public List<Hospital> searchHospital(String name) {
        String query;
        List<Hospital> list = new ArrayList<>();

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps;

            query = "SELECT * FROM hospital WHERE p_fname LIKE ? OR p_lname LIKE ?";
            ps = connection.prepareCall(query);
            ps.setString(1, "%" + name + "%");
            ps.setString(2, "%" + name + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Hospital h = new Hospital();
                h.setID(rs.getInt("h_id"));
                h.setName(rs.getString("h_name"));
                h.setAddress(rs.getString("h_address"));
                h.setWebsite(rs.getString("h_website"));
                h.setAdName(rs.getString("adname"));
                h.setAdEmail(rs.getString("ademail"));
                list.add(h);
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(Hospital.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    // Get All News
    public List<Hospital> getAllHospital() {
        List<Hospital> list = new ArrayList<>();
        String query = "SELECT * FROM hospital";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Hospital h = new Hospital();
                h.setID(rs.getInt("h_id"));
                h.setName(rs.getString("h_name"));
                h.setAddress(rs.getString("h_address"));
                h.setWebsite(rs.getString("h_website"));
                h.setAdName(rs.getString("adname"));
                h.setAdEmail(rs.getString("ademail"));
                list.add(h);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(Hospital.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public Hospital getHospital(int id) {
        String query = "SELECT * FROM hospital WHERE h_id = ?";
        Hospital h = new Hospital();

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                h.setID(rs.getInt("h_id"));
                h.setName(rs.getString("h_name"));
                h.setAddress(rs.getString("h_address"));
                h.setWebsite(rs.getString("h_website"));
                h.setAdName(rs.getString("adname"));
                h.setAdEmail(rs.getString("ademail"));
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(Hospital.class.getName()).log(Level.SEVERE, null, ex);
        }
        return h;
    }

    public boolean removeHospital(int id) {
        // Connect to database
        Connection connection = Database.getConnection();

        String query = "DELETE FROM hospital WHERE h_id = ?";

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, id);
            ps.executeUpdate();
            connection.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Hospital.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
