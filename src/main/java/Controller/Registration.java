package Controller;

import DTO.Admin;
import DTO.Patient;
import DAO.AdminDAO;
import DAO.PatientDAO;
import Database.BCrypt;
import Util.Info;
import Util.Mail;
import Util.Util;

import java.io.IOException;
import javax.mail.MessagingException;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author TGMaster
 */
public class Registration extends HttpServlet {

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
        } else if (action.equals("verify")) {
            Integer pId = Integer.parseInt(request.getParameter("userId"));
            String hash = BCrypt.hashpw(request.getParameter("key"), Info.HASH_SALT);
            String message = null;

            try {
                // verify with database
                if (PatientDAO.verifyEmail(pId, hash)) {
                    //update status as active
                    PatientDAO.updateStatus(pId, "active");
                    PatientDAO.updateToken(pId, null);
                    message = "Email verified successfully.";
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        } else if (action.equals("Signup Now")) {
            // Get Parameter in small form
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            String address = request.getParameter("address");

            if (fname == null || lname == null || email == null || address == null) {
                response.sendRedirect("register");
            } else {
                // Patient object
                Patient p = new Patient();
                p.setFname(fname);
                p.setLname(lname);
                p.setEmail(email);
                p.setAddress(address);
                request.setAttribute("patient", p);

                rd = sc.getRequestDispatcher("/register.jsp");
                rd.forward(request, response);
            }

        } else {
            String type = request.getParameter("type");

            if (type.equals("patient")) {

                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String email = request.getParameter("email");
                String pass = request.getParameter("password");
                String pass2 = request.getParameter("password2");
                String address = request.getParameter("address");
                String sex = request.getParameter("gender");
                String language = request.getParameter("language");

                String error = "";
                if (fname == null || lname == null || email == null || pass == null || address == null || sex == null) {
                    error = "Please input all required fields.";
                } else if (!pass.equals(pass2)) {
                    error = "Your password and confirmation password do not match";
                }

                if (error.length() > 0) {
                    response.getWriter().write(error);
                } else {
                    // Patient object
                    Patient p = new Patient();
                    p.setFname(fname);
                    p.setLname(lname);
                    p.setPass(BCrypt.hashpw(pass, BCrypt.gensalt()));
                    p.setEmail(email);
                    p.setAddress(address);
                    p.setSex(sex);
                    p.setLang(language);
                    p.setStatus("unactive");

                    // generate hash code for email verification
                    String hash = Util.encrypt("verification");
                    p.setHashcode(BCrypt.hashpw(hash, Info.HASH_SALT));

                    try {
                        if (!PatientDAO.isExistUser(email)) {
                            // create account if email not exists
                            String id = PatientDAO.insertUser(p);

                            // send verification email
                            Mail.sendEmailRegistrationLink(id, email, hash);

                            // send output to user
                            response.getWriter().write("Register successfully! Please verify your email");
                        } else {
                            response.getWriter().write("Your email has already registered.");
                        }
                    } catch (MessagingException ex) {
                        ex.printStackTrace();
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
                    error = "Please input all required fields.";
                } else {
                    if (!pass.equals(pass2)) {
                        error = "Your password and confirmation password do not match";
                    }
                }

                if (error.length() > 0) {
                    response.getWriter().write(error);
                } else {

                    admin.setEmail(email);
                    admin.setPass(BCrypt.hashpw(pass, BCrypt.gensalt()));

                    // Check if adding is successful
                    if (!AdminDAO.isExistUser(email)) {
                        if (AdminDAO.insertUser(admin)) {
                            response.getWriter().write("Register admin successfully!");
                        }
                    } else {
                        response.getWriter().write("This email has already registered.");
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
