/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Other.DAO;

import Database.*;
import Other.DTO.Rate;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kuro
 */
public class RateDAO {

    public void addRate(float rate, int d_id) {

        String query = "INSERT INTO rate"
                + "("
                + "r_rate,"
                + "d_id)"
                + " VALUES "
                + "("
                + "?,"
                + "?);";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setFloat(1, rate);
            ps.setInt(2, d_id);
            ps.executeUpdate();

            connection.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public Rate getRate(int id) {
        String query = "SELECT * FROM rate INNER JOIN doctor ON rate.d_id = doctor.d_id WHERE rate.d_id = ?";
        Rate rate = new Rate();

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                rate.setID(rs.getInt("r_id"));
                rate.setRate(rs.getFloat("r_rate"));
                rate.setdID(rs.getInt("d_id"));
            }

            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return rate;
    }

    public List<Rate> getAllRate() {
        List<Rate> list = new ArrayList<>();
        String query = "SELECT * FROM rate ";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Rate rate = new Rate();
                rate.setID(rs.getInt("r_id"));
                rate.setRate(rs.getFloat("r_rate"));
                rate.setdID(rs.getInt("d_id"));
                list.add(rate);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(RateDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public float getRatingPoint() {
        float rating = 0;
        int count = 0;
        String query = "SELECT * FROM rate ";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                count++;
                rating += rs.getFloat("r_rate");
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(RateDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rating / count;
    }
}
