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

/**
 *
 * @author TGMaster
 */
@WebServlet("/verify")
public class VerifyEmail extends HttpServlet {

    public VerifyEmail() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer pId = Integer.parseInt(request.getParameter("userId"));
        String hash = BCrypt.hashpw(request.getParameter("key"), Info.HASH_SALT);
        String message = null;
        String action = request.getParameter("action");

        try {
            // Verify with database
            if (action.equals(Info.ACTIVATION) && PatientDAO.verifyEmail(pId, hash)) {
                // Update status as active
                PatientDAO.updateStatus(pId, "active");
                PatientDAO.updateToken(pId, null);
                message = "Email verified successfully.";
            } else if (action.equals(Info.RESET_PASSWORD) && PatientDAO.verifyEmail(pId, hash)) {
                // Update status as active
                PatientDAO.updateStatus(pId, "active");
                PatientDAO.updateToken(pId, null);

                // Send something
                request.setAttribute("userId", pId);
                request.setAttribute("isResetPassword", "yes");
                request.getRequestDispatcher("resetPassword").forward(request, response);
            } else {
                // Increase attempts
                int attempts = PatientDAO.increaseAttempt(pId);
                if (attempts == 20) {
                    
                    // Reset verification code if attempts = 20
                    String hashcode = Util.encrypt(Util.generateRandomStr());
                    PatientDAO.updateToken(pId, BCrypt.hashpw(hashcode, Info.HASH_SALT));
                    Patient p = PatientDAO.getPatient(pId);
                    Mail.sendEmailRegistrationLink(pId, p.getEmail(), hashcode);
                    message = "20 times Wrong Email Validation Input Given. So we are sent new activation link to your Email";
                } else {
                    message = "Wrong Email Validation Input";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
