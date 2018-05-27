package Controller;

import DTO.Admin;
import DTO.Patient;
import DAO.AdminDAO;
import DAO.PatientDAO;
import Database.BCrypt;
import Util.*;

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

        // Message object
        Message msg = new Message();

        if (action == null) {
            rd = sc.getRequestDispatcher("/register.jsp");
            rd.forward(request, response);

        } else if (action.equals("Validate")) {
            String email = request.getParameter("email");
            if (PatientDAO.isExistUser(email)) {
                msg.setCode(-1);
                msg.setText("Email has already registered");
            } else {
                msg.setCode(0);
                msg.setText("Email is available");
            }
            
            response.getWriter().write(Util.toJson(msg));

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

        } else if (action.equals("Register")) {
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

                if (fname == null || lname == null || email == null || pass == null || address == null || sex == null) {
                    msg.setCode(-1);
                    msg.setText("Please input all required fields");
                } else if (!pass.equals(pass2)) {
                    msg.setCode(-1);
                    msg.setText("Your password and confirmation password do not match");
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
                    p.setStatus("inactive");

                    // generate hash code for email verification
                    String hash = Util.generateRandomStr(8);
                    p.setHashcode(BCrypt.hashpw(hash, Info.HASH_SALT));

                    try {
                        if (!PatientDAO.isExistUser(email)) {
                            // create account if email not exists
                            int id = PatientDAO.insertUser(p);

                            // send verification email
                            Mail.sendEmailRegistrationLink(id, email, hash);

                            // send output to user
                            msg.setCode(0);
                            msg.setText("Register successfully! We have sent the verification link to your email.");
                        } else {
                            msg.setCode(-1);
                            msg.setText("Your email has already registered.");
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

                if (username.equals("") || email.equals("") || pass.equals("")) {
                    msg.setCode(-1);
                    msg.setText("Please input all required fields");
                } else if (!pass.equals(pass2)) {
                    msg.setCode(-1);
                    msg.setText("Your password and confirmation password do not match");
                } else {

                    admin.setEmail(email);
                    admin.setPass(BCrypt.hashpw(pass, BCrypt.gensalt()));

                    // Check if adding is successful
                    if (!AdminDAO.isExistUser(email)) {
                        if (AdminDAO.insertUser(admin)) {
                            msg.setCode(0);
                            msg.setText("Register admin successfully!");
                        }
                    } else {
                        msg.setCode(-1);
                        msg.setText("This email has already registered.");
                    }
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
