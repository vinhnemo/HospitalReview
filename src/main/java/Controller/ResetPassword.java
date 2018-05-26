/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.PatientDAO;
import DTO.Patient;
import Util.*;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import Database.BCrypt;
import javax.mail.MessagingException;

/**
 *
 * @author TGMaster
 */
@WebServlet("/forgotPassword")
public class ResetPassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get session
        HttpSession session = request.getSession();

        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Declare requestDispatcher
        RequestDispatcher rd;

        // Message object
        Message msg = new Message();
        
        String action = request.getParameter("action");
        if (action == null) {
            rd = sc.getRequestDispatcher("forgotpass.jsp");
            rd.forward(request, response);

        } else if (action.equals("forgot")) {
            String email = request.getParameter("email");
            if (email == null) {
                msg.setCode(0);
                msg.setText("Please enter your email to get your password");
            } else {
                try {
                    Patient p = PatientDAO.getUserbyEmail(email);
                    if (p != null) {
                        String hash = Util.generateRandomStr(8);
                        PatientDAO.updateStatus(p.getID(), "forgot");
                        PatientDAO.updateToken(p.getID(), BCrypt.hashpw(hash, Info.HASH_SALT));

                        Mail.sendResetPasswordLink(p.getID()+"", email, hash);
                        msg.setCode(1);
                        msg.setText("We have sent reset password link to your email");
                    } else {
                        msg.setCode(0);
                        msg.setText("This email does not exist");
                    }
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
            }
            
            response.getWriter().write(Util.toJson(msg));
        } else if (action.equals("resetPass")) {
            Integer pId = Integer.parseInt(request.getParameter("userId"));
            String pass = request.getParameter("password");
            String pass2 = request.getParameter("password2");

            if (pass == null || pass2 == null) {
                msg.setCode(0);
                msg.setText("Please input new password");
            } else if (!pass.equals(pass2)) {
                msg.setCode(0);
                msg.setText("Your password and confirmation password do not match");
            } else {
                PatientDAO.updateStatus(pId, "active");
                PatientDAO.updatePassword(pId, BCrypt.hashpw(pass, BCrypt.gensalt()));
                
                msg.setCode(1);
                msg.setText("Password changed successfully!");
            }
            response.getWriter().write(Util.toJson(msg));
        }
    }
}
