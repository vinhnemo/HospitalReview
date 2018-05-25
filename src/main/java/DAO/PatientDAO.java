package DAO;

import Database.*;
import DTO.Patient;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nemo
 */
public class PatientDAO {

    // Check existing email
    public static boolean isExistUser(String email) {

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
    public static String insertUser(Patient patient) {
        String id = null;
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
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, patient.getFname());
            ps.setString(2, patient.getLname());
            ps.setString(3, patient.getSex());
            ps.setString(4, patient.getEmail());
            ps.setString(5, patient.getPass());
            ps.setString(6, patient.getAddress());
            ps.setString(7, patient.getLang());
            ps.executeUpdate();

            PreparedStatement ps2 = connection.prepareStatement("SELECT p_id FROM patient WHERE email = ?");
            ps2.setString(1, patient.getEmail());
            ResultSet rs = ps2.executeQuery();
            
            if (rs != null) {
                while (rs.next()) {
                    id = rs.getString(1);
                }
            }
            connection.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return id;
    }

    public static void updateUser(Patient p) {
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

    public static List<Patient> searchPatien(String name) {
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
            ex.printStackTrace();
        }
        return list;
    }

    // Get All News
    public static List<Patient> getAllPatient() {
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
            ex.printStackTrace();
        }

        return list;
    }

    public static Patient getPatient(int id) {
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
            ex.printStackTrace();
        }
        return p;
    }

    public static Patient getUserbyEmail(String email) {
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
            ex.printStackTrace();
        }
        return p;
    }

    public static boolean removePatient(int id) {
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
            ex.printStackTrace();
        }
        return false;
    }

    public static boolean deactivePatient(int id) {

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

    public static boolean active(int id) {

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
