/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.Patient;
import DAO.PatientDAO;
import Database.BCrypt;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.commons.lang3.RandomStringUtils;

/**
 *
 * @author TGMaster
 */
public class ForgotPass extends HttpServlet {

    // Connect Database
    private final PatientDAO patientDAO = new PatientDAO();

    // Email Setting
    private final String subject = "[Support] Reset Password";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Declare requestDispatcher
        RequestDispatcher rd;

        String action = request.getParameter("action");

        if (action == null) {
            rd = sc.getRequestDispatcher("/forgotpass.jsp");
            rd.forward(request, response);
        } else {

            

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
                url = "/forgotpass.jsp";
            } else {

                Patient p = patientDAO.login(email);
                Patient new_patient = new Patient(p.getID(), p.getFname(), p.getLname(), p.getSex(), p.getEmail(), PasswordHashing.hashPassword(randomStr), p.getAddress(), p.getLang());

                patientDAO.updateUser(new_patient);

                

                url = "/forgotpass.jsp";
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
