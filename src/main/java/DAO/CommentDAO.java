/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Database.*;
import DTO.Comment;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kuro
 */
public class CommentDAO {

    public void addComment(String comment, int d_id, int p_id) {

        String query = "INSERT INTO comment"
                + "("
                + "c_comment,"
                + "d_id,"
                + "p_id)"
                + " VALUES "
                + "("
                + "?,"
                + "?,"
                + "?);";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setString(1, comment);
            ps.setInt(2, d_id);
             ps.setInt(3, p_id);
            ps.executeUpdate();

            connection.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public Comment getComment(int id) {
        String query = "SELECT * FROM comment INNER JOIN doctor ON comment.d_id = doctor.d_id WHERE comment.d_id = ?";
        Comment c = new Comment();

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                c.setID(rs.getInt("c_id"));
                c.setComment(rs.getString("c_comment"));
                c.setdID(rs.getInt("d_id"));
                c.setpID(rs.getInt("p_id"));
            }

            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return c;
    }

    public List<Comment> getAllComment(int id) {
        List<Comment> list = new ArrayList<>();
        String query = "SELECT * FROM comment WHERE d_id = ?";

        // Connect to database
        Connection connection = Database.getConnection();

        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Comment c = new Comment();
                c.setID(rs.getInt("c_id"));
                c.setComment(rs.getString("c_comment"));
                c.setdID(rs.getInt("d_id"));
                c.setpID(rs.getInt("p_id"));
                list.add(c);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
}
