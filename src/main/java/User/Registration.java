/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import User.DAO.*;
import User.DTO.*;
import Database.PasswordHashing;
import Mail.*;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author TGMaster
 */
public class Registration extends HttpServlet {

    private static final String service = "service.gamelord@gmail.com";
    private static final String mailserver = "smtp.gmail.com";
    private static final String subject = "[Registration] Welcome to our hospital";

    // Connect Database
    private final PatientDAO patientDAO = new PatientDAO();
    private final AdminDAO adminDAO = new AdminDAO();
    
    public static void getLanguage(HttpServletRequest request, HttpServletResponse response) {
        // Call session
        HttpSession session = request.getSession();
        
        String lang = "";
        if (request.getParameter("language") != null) {
            lang = (String)request.getParameter("language");
        }
        else lang = "en_US";
        session.setAttribute("language", lang);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Declare requestDispatcher
        RequestDispatcher rd;
        
        // Language
        getLanguage(request, response);
        
        rd = sc.getRequestDispatcher("/register.jsp");
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

        // Language
        getLanguage(request, response);
        
        String type = request.getParameter("type");
        if (type.equals("patient")) {

            // Patient object
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
                error += "Please fill out all required fields.";
            } else {
                if (!pass.equals(pass2)) {
                    error += "Your password and confirmation password do not match";
                }
            }

            String text
                    = "Thanks for signing up to keep in touch with <strong>GAMELORD</strong>. From now on there might be a few things about GAMELORD you would like to know:<br>"
                    + "First , you will find more than 1000 games online and offline at GAMELORD<br>"
                    + "Second, you can place your order online and then collect at the same time<br>"
                    + "Third, we have a fantastic website that updates daily<br>"
                    + "Final, we have an active online community<br><br>"
                    + "Keep your eyes peeled for a special offer email from us. In the meantime, see the latest and greatest game from the website.";

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
                if (patientDAO.insertUser(patient)) {

                    text = "Hello <strong>" + patient.getFname() + "</strong>,<br><br>" + text;

                    Cookie loginCookie = new Cookie("email", email);
                    //setting cookie to expiry in 30 mins
                    loginCookie.setMaxAge(60 * 60 * 24 * 365);
                    response.addCookie(loginCookie);

                    Mail mail = new Mail(patient.getEmail(), service, text, subject, mailserver);
                    MailController sm = new MailController();
                    sm.sendMail(mail);

                    session.setAttribute("user", patient);
                    response.sendRedirect("/index.jsp");
                } else {
                    request.setAttribute("error", "Error in Registration");
                    rd = sc.getRequestDispatcher("/register.jsp");
                    rd.forward(request, response);
                }
            }
            
        } else {

            // Admin object
            Admin admin = new Admin();
            
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            String pass2 = request.getParameter("password2");
            
            String error = "";

            if (username.equals("") || email.equals("") || pass.equals("")) {
                error += "Please fill out all required fields";
            } else {
                if (!pass.equals(pass2)) {
                    error += "Your password and confirmation password do not match";
                }
            }
            
            String text
                    = "Thanks for signing up to keep in touch with <strong>GAMELORD</strong>. From now on there might be a few things about GAMELORD you would like to know:<br>"
                    + "First , you will find more than 1000 games online and offline at GAMELORD<br>"
                    + "Second, you can place your order online and then collect at the same time<br>"
                    + "Third, we have a fantastic website that updates daily<br>"
                    + "Final, we have an active online community<br><br>"
                    + "Keep your eyes peeled for a special offer email from us. In the meantime, see the latest and greatest game from the website.";

            if (error.length() > 0) {

                request.setAttribute("error", error);

                rd = sc.getRequestDispatcher("/register.jsp");
                rd.forward(request, response);

            } else {
                
                admin.setUsername(username);
                admin.setPass(PasswordHashing.hashPassword(pass));
                admin.setEmail(email);

                // Set Default Profile Pic
                //patient.setImage("avatar.jpg");
                // Check if adding is successful
                if (adminDAO.insertUser(admin)) {

                    text = "Hello <strong>" + admin.getUsername() + "</strong>,<br><br>" + text;

                    Cookie loginCookie = new Cookie("username", username);
                    //setting cookie to expiry in 1 year
                    loginCookie.setMaxAge(60 * 60 * 24 * 365);
                    response.addCookie(loginCookie);

                    Mail mail = new Mail(admin.getEmail(), service, text, subject, mailserver);
                    MailController sm = new MailController();
                    sm.sendMail(mail);

                    session.setAttribute("user", admin);
                    response.sendRedirect("/index.jsp");
                } else {
                    request.setAttribute("error", "Error in Registration");
                    rd = sc.getRequestDispatcher("/register.jsp");
                    rd.forward(request, response);
                }
            }
        }
    }

}
