/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Calculate.Location;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author NemoVinh
 */
public class LocationDAO {
    
     public List<Location> getAllDoctor() {
        List<Location> list = new ArrayList<>();
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
}
