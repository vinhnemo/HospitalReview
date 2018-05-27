/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DTO.Admin;
import DTO.Patient;
import DAO.AdminDAO;
import DAO.PatientDAO;
import Database.BCrypt;
import Util.*;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author TGMaster
 */
public class Login extends HttpServlet {

    // Connect Database
    private final PatientDAO patientDAO = new PatientDAO();
    private final AdminDAO adminDAO = new AdminDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Declare requestDispatcher
        RequestDispatcher rd;

        // Call session
        HttpSession session = request.getSession();

        String action = request.getParameter("action");

        boolean adminLogin;
        Admin admin = new Admin();
        Patient patient = new Patient();

        if (action == null) {
            rd = sc.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        } else {
            Message msg = new Message();
            adminLogin = false;

            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            String remember = request.getParameter("remember");

            if (email == null || pass == null) {
                msg.setCode(0);
                msg.setText("Please type your email and password");
            } else {
                patient = patientDAO.getUserbyEmail(email);
                
                String error = "";
                if (patient.getPass() == null) {

                    admin = adminDAO.getUserbyEmail(email);

                    // Check if user does not exist
                    if (admin.getPass() == null) {
                        error = "User account does not exist";
                    } else if (!BCrypt.checkpw(pass, admin.getPass())) {
                        error = "Your password is not correct";
                    } else {
                        adminLogin = true;
                    }

                } else if (!BCrypt.checkpw(pass, patient.getPass())) {
                    error = "Your password is not correct";

                } else if (patient.getStatus().equals("inactive") || patient.getStatus().equals("forgot")) {
                    error = "Your account is pending. Please check your email";

                }

                if (error.length() == 0) {
                    // If this is an admin
                    if (adminLogin) {
                        session.setAttribute("admin", admin);
                    } else {
                        session.setAttribute("patient", patient);
                    }

                    // Save login cookie
                    if (remember.equals("yes")) {
                        Cookie loginCookie;
                        if (adminLogin) {
                            loginCookie = new Cookie("a_email", admin.getEmail());
                        } else {
                            loginCookie = new Cookie("u_email", patient.getEmail());
                        }
                        //setting cookie to expiry in 30 mins
                        loginCookie.setMaxAge(60 * 30);
                        response.addCookie(loginCookie);
                    }
                    msg.setCode(0);
                    msg.setText("You have logged in successfully");
                } else {
                    msg.setCode(-1);
                    msg.setText(error);
                }
            }
            response.getWriter().write(Util.toJson(msg));
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
