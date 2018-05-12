/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Database.*;
import Other.Rate;

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

    public boolean insertRate(Rate rate) {

        String query = "INSERT INTO rate"
                + "("
                + "r_id,"
                + "r_rate,"
                + "d_id)"
                + " VALUES "
                + "("
                + "?,"
                + "?,"
                + "?);";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, rate.getID());
            ps.setFloat(2, rate.getRate());
            ps.setInt(3, rate.getdID());
            ps.executeUpdate();

            connection.close();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }
}
