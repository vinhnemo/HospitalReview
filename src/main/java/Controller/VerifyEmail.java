/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.PatientDAO;
import DTO.Patient;
import Database.BCrypt;
import Util.Info;
import Util.Mail;
import Util.Util;

import java.io.IOException;
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

        Integer pId = Integer.parseInt(request.getParameter("userId"));
        String hash = request.getParameter("key");
        String message = null;
        String action = request.getParameter("action");

        if (pId == null || hash == null) {
            response.sendRedirect("home.jsp");
        } else {
            hash = BCrypt.hashpw(hash, Info.HASH_SALT);
        }

        try {
            // Verify with database
            if (action.equals(Info.ACTIVATION) && PatientDAO.verifyEmail(pId, hash)) {
                // Update status as active
                PatientDAO.updateStatus(pId, "active");
                PatientDAO.updateToken(pId, null);
                message = "Email verified successfully. Please log in with your account to continue.";
                response.getWriter().write(message);
                
            } else if (action.equals(Info.RESET_PASSWORD) && PatientDAO.verifyEmail(pId, hash)) {
                // Update status as active
                PatientDAO.updateStatus(pId, "active");
                PatientDAO.updateToken(pId, null);

                // Send something
                request.setAttribute("userId", pId);
                request.getRequestDispatcher("resetpass.jsp").forward(request, response);
            } else {
                // Increase attempts
                int attempts = PatientDAO.increaseAttempt(pId);
                if (attempts == 20) {

                    // Reset verification code if attempts = 20
                    String hashcode = Util.generateRandomStr(8);
                    PatientDAO.updateToken(pId, BCrypt.hashpw(hashcode, Info.HASH_SALT));
                    Patient p = PatientDAO.getPatient(pId);
                    Mail.sendEmailRegistrationLink(pId, p.getEmail(), hashcode);
                    message = "20 times Wrong Email Validation Input Given. So we are sent a new activation link to your Email";
                } else {
                    message = "Wrong Email Validation Input";
                }
                response.getWriter().write(message);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
