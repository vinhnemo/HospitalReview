/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Database.*;
import DTO.Doctor;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kuro
 */
public class DoctorDAO {

    public boolean validateUser(String username) {

        String query = "SELECT * FROM doctor WHERE d_fname = ? OR d_lname = ?";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setString(1, username);
            ps.setString(2, username);
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

    //Search doctor by name
    public List<Doctor> searchDoctor(String name) {
        String query;
        List<Doctor> list = new ArrayList<>();

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps;

            query = "SELECT * FROM doctor WHERE d_fname LIKE ? OR d_lname LIKE ?";
            //System.out.println(query);
            ps = connection.prepareCall(query);
            ps.setString(1, "%" + name + "%");
            ps.setString(2, "%" + name + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Doctor doctor = new Doctor();
                doctor.setID(rs.getInt("d_id"));
                doctor.setFname(rs.getString("d_fname"));
                doctor.setLname(rs.getString("d_lname"));
                doctor.setSex(rs.getString("d_gender"));
                doctor.setDegree(rs.getString("d_degree"));
                doctor.setInsurance(rs.getBoolean("d_insurance"));
                doctor.setSpeciality(rs.getString("d_speciality"));
                doctor.setHours(rs.getString("d_hour"));
                doctor.setLang(rs.getString("languages"));
                list.add(doctor);
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    // Get All doctors
    public List<Doctor> getAllDoctor() {
        List<Doctor> list = new ArrayList<>();
        String query = "SELECT * FROM doctor";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Doctor doctor = new Doctor();
                doctor.setID(rs.getInt("d_id"));
                doctor.setFname(rs.getString("d_fname"));
                doctor.setLname(rs.getString("d_lname"));
                doctor.setSex(rs.getString("d_gender"));
                doctor.setDegree(rs.getString("d_degree"));
                doctor.setInsurance(rs.getBoolean("d_insurance"));
                doctor.setSpeciality(rs.getString("d_speciality"));
                doctor.setHours(rs.getString("d_hour"));
                doctor.setLang(rs.getString("languages"));
                list.add(doctor);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public Doctor getDoctor(int id) {

        //String query = "SELECT doctor.d_id,d_fname,d_lname,d_gender,d_degree,d_insurance,d_speciality,d_hour,languages, allowReview FROM doctor,doctorreview WHERE doctor.d_id = ? AND doctor.d_id = doctorreview.d_id;";
        String query = "select * from doctor where d_id = ? ;";
        Doctor doctor = new Doctor();

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                doctor.setID(rs.getInt("d_id"));
                doctor.setFname(rs.getString("d_fname"));
                doctor.setLname(rs.getString("d_lname"));
                doctor.setSex(rs.getString("d_gender"));
                doctor.setDegree(rs.getString("d_degree"));
                doctor.setInsurance(rs.getBoolean("d_insurance"));
                doctor.setSpeciality(rs.getString("d_speciality"));
                doctor.setHours(rs.getString("d_hour"));
                doctor.setLang(rs.getString("languages"));
                //doctor.setAllowReview(rs.getInt("allowReview"));
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return doctor;
    }

    public boolean insertDoctor(Doctor d) {
      
        String query1 ="INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ( ? , ? , ? , ? , ? , ? , ? , ? );" ;
        
        
        String query = "INSERT INTO doctor"
                + "("
                + " d_fname , "
                + " d_lname , "
                + " d_gender , "
                + " d_degree , "
                + " d_insurance , "
                + " d_speciality , "
                + " d_hour  ,"
                + " languages) "
                + " VALUES "
                + " ( "
                + " ? ,"
                + " ? ,"
                + " ? ,"
                + " ? ,"
                + " ? ,"
                + " ? ,"
                + " ? ,"
                + " ? );";
        System.out.println(query1 + "ssssssssssssssssssssssssssssssssssssssssssssssss");
        // Connect to database
        Connection connection = Database.getConnection();

        // Prepare Statement
        try {
            PreparedStatement ps = connection.prepareCall(query1);
            ps.setString(1, d.getFname());
            ps.setString(2, d.getLname());
            ps.setString(3, d.getSex());
            ps.setString(4, d.getDegree());
            ps.setBoolean(5, d.getInsurance());
            ps.setString(6, d.getSpeciality());
            ps.setString(7, d.getHours());
            ps.setString(8, d.getLang());
            ps.executeUpdate();

            connection.close();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    public void remove(int id) {
        // Connect to database
        Connection connection = Database.getConnection();

        String query = "DELETE FROM doctorreview WHERE d_id = ?";
        String query1 = "DELETE FROM doctor WHERE d_id = ?";

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, id);
            ps.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        try {
            PreparedStatement ps = connection.prepareCall(query1);
            ps.setInt(1, id);
            ps.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateDoctor(Doctor d) {
        String query = "UPDATE doctor SET "
                + " d_fname = ?, "
                + " d_lname = ?, "
                + " d_gender = ?, "
                + " d_degree = ?, "
                + " d_insurance = ?, "
                + " d_speciality = ?, "
                + " d_hour = ?, "
                + " languages = ? "
                + " WHERE "
                + " d_id = ? ";

        // Connect to database
        Connection connection = Database.getConnection();
        System.out.println(query);
        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setString(1, d.getFname());
            ps.setString(2, d.getLname());
            ps.setString(3, d.getSex());
            ps.setString(4, d.getDegree());
            ps.setBoolean(5, d.getInsurance());
            ps.setString(6, d.getSpeciality());
            ps.setString(7, d.getHours());
            ps.setString(8, d.getLang());
            ps.setLong(9, d.getID());

            ps.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

//    public void updateDoctor(int id, String fname, String lname, String sex, String degree, boolean insurance, String speciality, String hours, String lang) {
//        String query = "UPDATE doctor SET"
//                + "d_fname = ?,"
//                + "d_lname = ?,"
//                + "d_gender = ?,"
//                + "d_degree = ?,"
//                + "d_insurance = ?,"
//                + "d_speciality = ?,"
//                + "d_hour = ?,"
//                + "languages = ?"
//                + " WHERE "
//                + "d_id = ?";
//        // Connect to database
//        Connection connection = Database.getConnection();
//
//        try {
//            PreparedStatement ps = connection.prepareCall(query);
//            ps.setString(1, fname);
//            ps.setString(2, lname);
//            ps.setString(3, sex);
//            ps.setString(4, degree);
//            ps.setBoolean(5, insurance);
//            ps.setString(6, speciality);
//            ps.setString(7, hours);
//            ps.setString(8, lang);
//            ps.setInt(9, id);
//            ps.executeUpdate();
//
//            connection.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//    }
    public static ArrayList<Doctor> getAllDoctorBookmark(int pID) {
        ArrayList<Doctor> list = new ArrayList<>();
        String query = "SELECT doctor.d_id,d_fname,d_lname,d_gender,d_degree,d_insurance,d_speciality,d_hour,languages,p_id FROM doctor,bookmarkdoctor WHERE p_id = '" + pID + "' AND doctor.d_id = bookmarkdoctor.d_id;";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Doctor doctor = new Doctor();
                doctor.setID(rs.getInt("d_id"));
                doctor.setFname(rs.getString("d_fname"));
                doctor.setLname(rs.getString("d_lname"));
                doctor.setSex(rs.getString("d_gender"));
                doctor.setDegree(rs.getString("d_degree"));
                doctor.setInsurance(rs.getBoolean("d_insurance"));
                doctor.setSpeciality(rs.getString("d_speciality"));
                doctor.setHours(rs.getString("d_hour"));
                doctor.setLang(rs.getString("languages"));
                list.add(doctor);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public Doctor getDoctorReview(int id) {

        String query = "SELECT doctor.d_id,d_fname,d_lname,d_gender,d_degree,d_insurance,d_speciality,d_hour,languages, allowReview FROM doctor,doctorreview WHERE doctor.d_id = ? AND doctor.d_id = doctorreview.d_id;";
        // String query = "select * from doctor where d_id = ? ;";
        Doctor doctor = new Doctor();

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                doctor.setID(rs.getInt("d_id"));
                doctor.setFname(rs.getString("d_fname"));
                doctor.setLname(rs.getString("d_lname"));
                doctor.setSex(rs.getString("d_gender"));
                doctor.setDegree(rs.getString("d_degree"));
                doctor.setInsurance(rs.getBoolean("d_insurance"));
                doctor.setSpeciality(rs.getString("d_speciality"));
                doctor.setHours(rs.getString("d_hour"));
                doctor.setLang(rs.getString("languages"));
                doctor.setAllowReview(rs.getInt("allowReview"));
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return doctor;
    }
}
