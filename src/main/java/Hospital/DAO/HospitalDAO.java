/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Hospital.DAO;

import Database.*;
import Hospital.DTO.Hospital;

import java.sql.*;

/**
 *
 * @author TGMaster
 */
public class HospitalDAO {
    
    public boolean insert(Hospital hospital) {
        String query = "INSERT INTO hospital"
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
}
