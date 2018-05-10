/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import DAO.PatientDAO;
import Database.PasswordHashing;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TGMaster
 */
public class Registration extends HttpServlet {
    
    // Connect Database
    private final PatientDAO patientDAO = new PatientDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Declare requestDispatcher
        RequestDispatcher rd;

        rd = sc.getRequestDispatcher("/registration.jsp");
        rd.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Declare requestDispatcher
        RequestDispatcher rd;

        // Call session
        HttpSession session = request.getSession();

        // User object
        Patient patient = new Patient();

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String pass2 = request.getParameter("password2");
        String address = request.getParameter("address");
        String sex = request.getParameter("sex");
        String language = request.getParameter("language");

        String error = "";

        if (fname.equals("") || lname.equals("") || email.equals("") || pass.equals("") || address.equals("") || sex.equals("")) {
            error += "Please fill out all required fields";
        } else {
            if (!pass.equals(pass2)) {
                error += "Your password and confirmation password do not match";
            }
        }
        
        if (error.length() > 0) {

            request.setAttribute("error", error);

            rd = sc.getRequestDispatcher("/register.jsp");
            rd.forward(request, response);

        } else {
            
            patient.setFname(fname);
            patient.setLname(lname);
            patient.setPass(PasswordHashing.hashPassword(pass));
            patient.setEmail(email);
            patient.setAddress(address);
            patient.setSex(sex);
            patient.setLang(language);
            
            // Set Default Profile Pic
            //patient.setImage("avatar.jpg");
           
            // Check if adding is successful
<<<<<<< HEAD
            if (patientDAO.insertUser(patient)) {

                text = "Hello <strong>" + user.getName() + "</strong>,<br><br>" + text;

                Cookie loginCookie = new Cookie("username", username);
                //setting cookie to expiry in 30 mins
                loginCookie.setMaxAge(60 * 60 * 24 * 365);
                response.addCookie(loginCookie);

                Mail mail = new Mail(user.getEmail(), service, text, subject, mailserver);
                MailController sm = new MailController();
                sm.sendMail(mail);
=======
            
             PatientDAO pDAO = new PatientDAO();
            if (pDAO.insertUser(patient)) {

//                text = "Hi <strong>" + patient.getFname()+ "</strong>,<br><br>" + text;
//
//                Cookie loginCookie = new Cookie("username", username);
//                //setting cookie to expiry in 30 mins
//                loginCookie.setMaxAge(60 * 60 * 24 * 365);
//                response.addCookie(loginCookie);
//
//                Mail mail = new Mail(user.getEmail(), service, text, subject, mailserver);
//                MailController sm = new MailController();
//                sm.sendMail(mail);
>>>>>>> 2c269d0da6f589e6e012d0d6a66b86e7704806a7

                session.setAttribute("user", patient);
                response.sendRedirect("/store");
            } else {
                request.setAttribute("error", "Error in Registration");
                rd = sc.getRequestDispatcher("/register.jsp");
                rd.forward(request, response);
            }
        }
    }

}
