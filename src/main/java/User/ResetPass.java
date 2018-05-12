/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import User.DTO.Patient;
import User.DAO.PatientDAO;
import Database.PasswordHashing;
import Mail.*;

import java.io.IOException;
import java.security.SecureRandom;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.commons.lang3.RandomStringUtils;

/**
 *
 * @author TGMaster
 */
public class ResetPass extends HttpServlet {

    // Connect Database
    private final PatientDAO patientDAO = new PatientDAO();

    // Email Setting
    private final String service = "service.gamelord@gmail.com";
    private final String mailserver = "smtp.gmail.com";
    private final String subject = "[Support] Reset Password | Hospital Review";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Declare requestDispatcher
        RequestDispatcher rd;

        String action = request.getParameter("action");

        if (action == null) {
            rd = sc.getRequestDispatcher("/resetpass.jsp");
            rd.forward(request, response);
        } else {

            char[] possibleCharacters = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789").toCharArray();
            String randomStr = RandomStringUtils.random(8, 0, possibleCharacters.length - 1, false, false, possibleCharacters, new SecureRandom());

            String email = request.getParameter("email");
            String error = "";

            if (email.equals("")) {
                error += "Please enter the valid email!";
            } else {
                if (!patientDAO.validateUser(email)) {
                    error += "Your email does not exist!";
                }
            }

            String url;
            if (error.length() > 0) {
                request.setAttribute("error", error);
                url = "/resetpass.jsp";
            } else {

                Patient p = patientDAO.login(email);
                Patient new_patient = new Patient(p.getID(), p.getFname(), p.getLname(), p.getSex(), p.getEmail(), PasswordHashing.hashPassword(randomStr), p.getAddress(), p.getLang());

                patientDAO.updateUser(new_patient);

                // Send Email
                String text = "<b>Reset Password</b><br>"
                        + "<p>Your email: <strong>" + email + "</strong></p>"
                        + "<p>New password: <strong>" + randomStr + "</strong></p>"
                        + "<p>Please login with your new password</p>";

                Mail mail = new Mail(email, service, text, subject, mailserver);
                MailController sendMail = new MailController();

                if (sendMail.sendMail(mail)) {
                    request.setAttribute("message", "Please check your email for your new password");
                }

                url = "/resetpass.jsp";
            }

            rd = sc.getRequestDispatcher(url);
            rd.forward(request, response);

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}