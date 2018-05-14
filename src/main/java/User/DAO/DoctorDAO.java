/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User.DAO;

import Database.*;
import User.DTO.Doctor;

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

    public Doctor getDoctor(int id) {
        String query = "SELECT * FROM doctor WHERE d_id = ?";
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
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return doctor;
    }
}
