/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.PatientDAO;
import DTO.Patient;
import Database.BCrypt;
import Util.*;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TGMaster
 */
@WebServlet("/verify")
public class VerifyEmail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get Session
        HttpSession session = request.getSession();

        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("/404.html");
            
        } else {
            Integer pId = Integer.parseInt(request.getParameter("userId"));
            String hash = BCrypt.hashpw(request.getParameter("key"), Info.HASH_SALT);
            Message message = new Message();

            try {

                // Verify with database
                if (action.equals(Info.ACTIVATION) && PatientDAO.verifyEmail(pId, hash)) {

                    Date now = new Date();  // Get time now
                    Date date = PatientDAO.getDatefromToken(pId, hash); // Get time store in database

                    // 30 mins expired
                    if (now.after(date) && (now.getTime() - date.getTime() <= 30L * 60 * 1000)) {

                        // Update status as active
                        PatientDAO.updateStatus(pId, "active");
                        PatientDAO.updateToken(pId, null);
                        message.setCode(-1);
                        message.setText("Email verified successfully. Please <a href=\"login.jsp\">log in</a> with your account to continue");

                    } else {
                        message.setCode(-1);
                        message.setText("The link has expired. Click <a href=\"home.jsp\">here</a> to continue");
                    }

                } else if (action.equals(Info.RESET_PASSWORD) && PatientDAO.verifyEmail(pId, hash)) {
                    Date now = new Date();  // Get time now
                    Date date = PatientDAO.getDatefromToken(pId, hash); // Get time store in database

                    // 30 mins expired
                    if (now.after(date) && (now.getTime() - date.getTime() <= 30L * 60 * 1000)) {

                        // Update status as active
                        PatientDAO.updateStatus(pId, "active");
                        PatientDAO.updateToken(pId, null);

                        // Send something
                        request.setAttribute("userId", pId);
                        request.getRequestDispatcher("/resetpass.jsp").forward(request, response);
                    } else {
                        message.setCode(-1);
                        message.setText("The link has expired. Click <a href=\"home.jsp\">here</a> to continue");
                    }

                } else {
                    // Increase attempts
                    int attempts = PatientDAO.increaseAttempt(pId);
                    if (attempts == 20) {

                        // Reset verification code if attempts = 20
                        String hashcode = Util.generateRandomStr(8);
                        PatientDAO.updateToken(pId, BCrypt.hashpw(hashcode, Info.HASH_SALT));
                        Patient p = PatientDAO.getPatient(pId);
                        if (action.equals(Info.ACTIVATION)) {
                            Mail.sendEmailRegistrationLink(pId, p.getEmail(), hashcode);
                        }
                        if (action.equals(Info.RESET_PASSWORD)) {
                            Mail.sendResetPasswordLink(pId, p.getEmail(), hashcode);
                        }
                        message.setCode(-1);
                        message.setText("20 times Wrong Email Validation Input Given. So we are sending a new activation link to your Email");
                    } else {
                        message.setCode(-1);
                        message.setText("There was something wrong with the link. Please try again later");
                    }
                }
                
                response.getWriter().write(message.getText());

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
