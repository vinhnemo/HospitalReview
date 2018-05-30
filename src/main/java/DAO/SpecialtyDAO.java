/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Specialty;
import Database.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MSI
 */
public class SpecialtyDAO {
    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

    public List<Specialty> getSpecialty() {
        List<Specialty> list = new ArrayList<>();
        String query = "SELECT DISTINCT specialty FROM speciality";
        Connection connection = Database.getConnection();
        try {
            PreparedStatement ps = connection.prepareCall(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Specialty s = new Specialty();
                s.setSpecialty(rs.getString("specialty"));    
                list.add(s);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
        public List<Specialty> getSpec_specialty() {
        List<Specialty> list = new ArrayList<>();
        String query = "SELECT DISTINCT specific_specialty FROM speciality";
        Connection connection = Database.getConnection();
        try {
            PreparedStatement ps = connection.prepareCall(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Specialty spe = new Specialty();
                spe.setSpec_specialty(rs.getString("specific_specialty"));
                list.add(spe);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}



