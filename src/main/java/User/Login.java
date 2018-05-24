/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import Database.PasswordHashing;
import User.DAO.*;
import User.DTO.*;

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
        String error;
        boolean adminLogin;
        Admin admin = new Admin();
        Patient patient = new Patient();

        if (action == null) {
            rd = sc.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        } else {
            error = "";
            adminLogin = false;

            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            String remember = request.getParameter("remember");

            if (email.equals("") || pass.equals("")) {
                error = "3";
            } else {
                patient = patientDAO.login(email);

                if (patient.getPass() == null) {
                    error = "1";
                    adminLogin = true;
                } else if (!PasswordHashing.checkPassword(pass, patient.getPass())) {
                    error = "2";
                }

                if (adminLogin) {
                    admin = adminDAO.login(email);

                    // Check if user does not exist
                    if (admin.getPass() == null) {
                        error = "1";
                    } else if (!PasswordHashing.checkPassword(pass, admin.getPass())) {
                        error = "2";
                    }
                }
            }

            // If something is wrong
            if (error.length() > 0) {
                response.getWriter().write(error);
            } else {
                // If this is an admin
                if (adminLogin) {
                    session.setAttribute("user", admin);
                } else {
                    session.setAttribute("user", patient);
                }

                // Save login cookie
                if (remember.equals("yes")) {
                    Cookie loginCookie;
                    if (adminLogin) {
                        loginCookie = new Cookie("u_email", admin.getEmail());
                    } else {
                        loginCookie = new Cookie("u_email", patient.getEmail());
                    }
                    //setting cookie to expiry in 30 mins
                    loginCookie.setMaxAge(60 * 60 * 24 * 365);
                    response.addCookie(loginCookie);
                }

                response.getWriter().write("success");
            }

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
