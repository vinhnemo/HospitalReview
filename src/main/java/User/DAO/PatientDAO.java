/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User.DAO;

import Database.*;
import User.DTO.Patient;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.transaction.Transaction;

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
    public Patient login(String email) {
        Patient p = new Patient();
        
        String query = "SELECT * FROM patient WHERE email = ?";
        /*
        String query = "SELECT `patient`.`p_id`,"
                + "    `patient`.`p_fname`,"
                + "    `patient`.`p_lname`,"
                + "    `patient`.`p_gender`,"
                + "    `patient`.`email`,"
                + "    `patient`.`password`,"
                + "    `patient`.`p_address`,"
                + "    `patient`.`languages`"
                + "FROM patient, deactivepatien  where patient.email = ? and IFNULL(deactivepatien.p_id != patient.p_id , TRUE);";
        */
        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                p.setID(rs.getInt("p_id"));
                p.setEmail(rs.getString("email"));
                p.setLname(rs.getString("p_lname"));
                p.setFname(rs.getString("p_fname"));
                p.setPass(rs.getString("password"));
                p.setAddress(rs.getString("p_address"));
                p.setSex(rs.getString("p_gender"));
                p.setLang(rs.getString("languages"));
            }

            connection.close();
            return p;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

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
            ps.setLong(8, p.getID());
            ps.executeUpdate();

            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public List<Patient> searchPatien(String name) {
        String query;
        List<Patient> list = new ArrayList<>();

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps;

            query = "SELECT * FROM patient WHERE p_fname LIKE ? OR p_lname LIKE ?";
            ps = connection.prepareCall(query);
            ps.setString(1, "%" + name + "%");
            ps.setString(2, "%" + name + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Patient p = new Patient();
                p.setID(rs.getInt("p_id"));
                p.setFname(rs.getString("p_fname"));
                p.setLname(rs.getString("p_lname"));
                p.setSex(rs.getString("p_gender"));
                p.setEmail(rs.getString("email"));
                p.setPass(rs.getString("password"));
                p.setAddress(rs.getString("p_address"));
                p.setLang(rs.getString("languages"));
                list.add(p);
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(Patient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    // Get All News
    public List<Patient> getAllPatient() {
        List<Patient> list = new ArrayList<>();
        String query = "SELECT * FROM patient ";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Patient p = new Patient();
                p.setID(rs.getInt("p_id"));
                p.setFname(rs.getString("p_fname"));
                p.setLname(rs.getString("p_lname"));
                p.setSex(rs.getString("p_gender"));
                p.setEmail(rs.getString("email"));
                p.setPass(rs.getString("password"));
                p.setAddress(rs.getString("p_address"));
                p.setLang(rs.getString("languages"));
                list.add(p);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(Patient.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public Patient getPatient(int id) {
        String query = "SELECT * FROM patient WHERE p_id = ?";
        Patient p = new Patient();

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                p.setID(rs.getInt("p_id"));
                p.setFname(rs.getString("p_fname"));
                p.setLname(rs.getString("p_lname"));
                p.setSex(rs.getString("p_gender"));
                p.setEmail(rs.getString("email"));
                p.setPass(rs.getString("password"));
                p.setAddress(rs.getString("p_address"));
                p.setLang(rs.getString("languages"));
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public Patient getPatientfromEmail(String email) {
        String query = "SELECT * FROM patient WHERE email = ?";
        Patient p = new Patient();

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                p.setID(rs.getInt("p_id"));
                p.setFname(rs.getString("p_fname"));
                p.setLname(rs.getString("p_lname"));
                p.setSex(rs.getString("p_gender"));
                p.setEmail(rs.getString("email"));
                p.setPass(rs.getString("password"));
                p.setAddress(rs.getString("p_address"));
                p.setLang(rs.getString("languages"));
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public boolean removePatient(int id) {
        // Connect to database
        Connection connection = Database.getConnection();

        String query = " DELETE FROM deactivepatien WHERE DP_id = ? ; DELETE FROM patient WHERE p_id = ? ;";

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, id);
            ps.setInt(2, id);
            ps.executeUpdate();
            connection.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deactivePatient(int id) {

        String query = "INSERT INTO deactivepatien"
                + "(DP_id,"
                + "p_id)"
                + " VALUES "
                + "(?,"
                + "?);";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setLong(1, id);
            ps.setLong(2, id);
            ps.executeUpdate();

            connection.close();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    public boolean active(int id) {

        String query = "DELETE FROM deactivepatien WHERE DP_id = ?";
                

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setLong(1, id);

            ps.executeUpdate();

            connection.close();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }

}
