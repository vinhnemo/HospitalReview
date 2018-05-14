/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Other.DAO;

import Database.*;
import Other.DTO.Comment;

import java.sql.*;

/**
 *
 * @author Kuro
 */
public class CommentDAO {

    public void addComment(int c_id, String comment, int d_id) {

        String query = "INSERT INTO comment"
                + "("
                + "c_id,"
                + "c_comment,"
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
            ps.setInt(1, c_id);
            ps.setString(2, comment);
            ps.setInt(3, d_id);
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
            }

            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return c;
    }
}
