package DAO;

import Database.*;
import DTO.Patient;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nemo
 */
public class PatientDAO {

    // Check existing email
    public static boolean isExistUser(String email) {

        String query = "SELECT * FROM patient WHERE email = ?;";

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
    public static Integer insertUser(Patient patient) {
        Integer id = null;
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
            ps.setString(8, patient.getStatus());
            ps.executeUpdate();

            PreparedStatement ps2 = connection.prepareStatement("SELECT p_id FROM patient WHERE email = ?");
            ps2.setString(1, patient.getEmail());
            ResultSet rs = ps2.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    id = rs.getInt(1);
                }
            }
            connection.close();
            insertToken(id, patient.getHashcode());

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
                + "languages = ?,"
                + "status = ?"
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
            ps.setString(8, p.getStatus());
            ps.setLong(9, p.getID());
            ps.executeUpdate();

            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public static List<Patient> searchPatient(String name) {
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
                p.setStatus(rs.getString("status"));
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
        String query = "SELECT * FROM patient;";

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
                p.setStatus(rs.getString("status"));
                list.add(p);
            }
            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }

    public static Patient getPatient(int id) {
        String query = "SELECT * FROM patient WHERE p_id = ?;";
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
                p.setStatus(rs.getString("status"));
            }

            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return p;
    }

    public static Patient getUserbyEmail(String email) {
        String query = "SELECT * FROM patient WHERE email = ?;";
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
                p.setStatus(rs.getString("status"));
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

        String query = "DELETE FROM patient WHERE p_id = ?;";

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

    /* VERIFY EMAIL */
    public static boolean verifyEmail(Integer id, String hash) {

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * "
                    + "FROM patient p,token t "
                    + "WHERE p.p_id = ? "
                    + "AND p.p_id = t.p_id "
                    + "AND t.key = ?;");
            ps.setInt(1, id);
            ps.setString(2, hash);
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    connection.close();
                    return true;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void updateStatus(Integer id, String status) {

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE patient SET status = ? WHERE p_id = ?");
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void updateToken(Integer id, String hash) {
        String query;

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps;
            if (hash == null) {
                query = "UPDATE token SET key = ? WHERE p_id = ?;";
                ps = connection.prepareStatement(query);
                ps.setString(1, hash);
                ps.setInt(2, id);
            } else {
                query = "UPDATE token SET key = ?, date = NOW() WHERE p_id = ?;";
                ps = connection.prepareStatement(query);
                ps.setString(1, hash);
                ps.setInt(2, id);
            }

            ps.executeUpdate();

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void insertToken(Integer id, String hash) {
        String query = "INSERT INTO token (p_id, key, attempt, date) VALUES (?,?,?,NOW());";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, hash);
            ps.setInt(2, 0);
            ps.setInt(3, id);

            ps.executeUpdate();

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static int increaseAttempt(Integer id) {
        int attempts = 0;

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE token SET attempt = attempt + 1 where p_id = ?");
            ps.setInt(1, id);
            ps.executeUpdate();

            PreparedStatement ps2 = connection.prepareStatement("SELECT attempt FROM token");
            ResultSet rs = ps2.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    attempts = rs.getInt(1);
                }
            }

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return attempts;
    }

    public static void updatePassword(int id, String pass) {

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE patient SET password = ? WHERE p_id = ?");
            ps.setString(1, pass);
            ps.setInt(2, id);
            ps.executeUpdate();

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
