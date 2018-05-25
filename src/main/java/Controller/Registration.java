package Controller;

import DTO.Admin;
import DTO.Patient;
import DAO.AdminDAO;
import DAO.PatientDAO;
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

    private static final String subject = "[Registration] Welcome to our hospital";

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

        // Get action
        String action = request.getParameter("action");

        if (action == null) {
            rd = sc.getRequestDispatcher("/register.jsp");
            rd.forward(request, response);
        } else if (action.equals("Signup Now")) {
            // Patient object
            Patient patient = new Patient();

            // Get Parameter in small form
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            String address = request.getParameter("address");

            if (fname.equals("") || lname.equals("") || email.equals("") || address.equals("")) {
                rd = sc.getRequestDispatcher("/register.jsp");
                rd.forward(request, response);
            } else {
                patient.setFname(fname);
                patient.setLname(lname);
                patient.setEmail(email);
                patient.setAddress(address);
                request.setAttribute("patient", patient);
                
                rd = sc.getRequestDispatcher("/register.jsp");
                rd.forward(request, response);
            }

        } else {
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
                String sex = request.getParameter("gender");
                String language = request.getParameter("language");

                String error = "";
                if (fname.equals("") || lname.equals("") || email.equals("") || pass.equals("") || address.equals("") || sex.equals("")) {
                    error += "Please fill out all required fields.";
                } else if (!pass.equals(pass2)) {
                    error += "Your password and confirmation password do not match";
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
                        System.out.println("Stop here!");
                        text = "Hello <strong>" + patient.getFname() + "</strong>,<br><br>" + text;

                        Mail mail = new Mail(patient.getEmail(), service, text, subject, mailserver);
                        MailController sm = new MailController();
                        sm.sendMail(mail);

                        session.setAttribute("user", patient);
                        response.sendRedirect("/register.jsp");
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

                    admin.setEmail(email);
                    admin.setPass(PasswordHashing.hashPassword(pass));

                    // Set Default Profile Pic
                    //patient.setImage("avatar.jpg");
                    // Check if adding is successful
                    if (adminDAO.insertUser(admin)) {

                        text = "Hello <strong>" + admin.getEmail() + "</strong>,<br><br>" + text;

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
