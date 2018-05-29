/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AdminDAO;
import DAO.PatientDAO;
import DTO.Admin;
import DTO.Patient;
import Database.BCrypt;

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
 * @author NemoVinh
 */
public class PatientController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Call session
        HttpSession session = request.getSession();

        // Declare requestDispatcher
        RequestDispatcher rd;
        // Get action
        String action = request.getParameter("action");

        Cookie cookies[] = request.getCookies();
        
        Patient patient = null;
        Admin admin = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("u_email")) {
                    patient = PatientDAO.getUserbyEmail(cookie.getValue());
                } else if (cookie.getName().equals("a_email")) {
                    admin = AdminDAO.getUserbyEmail(cookie.getValue());
                }
            }
        }
        if (session.getAttribute("patient") != null) {
            patient = (Patient) session.getAttribute("patient");
        } else if (session.getAttribute("admin") != null) {
            admin = (Admin) session.getAttribute("admin");
        }
        
        if (patient == null && admin == null) {
            response.sendError(404);
        } else if (patient != null) {

            if (action == null) {
                rd = sc.getRequestDispatcher("/profileUser.jsp");
                rd.forward(request, response);
            } else if (action.equals("Save change")) {
                //get input
                int id = Integer.parseInt(request.getParameter("id"));
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                String sex = request.getParameter("gender");
                String language = request.getParameter("language");

                String error = "";
                if (fname == null || lname == null || email == null || address == null || sex == null || fname.equals("") || lname.equals("") || email.equals("") || address.equals("") || sex.equals("")) {
                    error = "Please fill out all required fields.";
                }

                if (error.length() > 0) {

                    request.setAttribute("error", error);

                    rd = sc.getRequestDispatcher("/profileUser.jsp");
                    rd.forward(request, response);

                } else {
                    patient.setID(id);
                    patient.setFname(fname);
                    patient.setLname(lname);
                    patient.setEmail(email);
                    patient.setAddress(address);
                    patient.setSex(sex);
                    patient.setLang(language);

                    PatientDAO.updateinfor(patient);
                    patient = PatientDAO.getPatient(id);
                    session.setAttribute("patient", patient);
                    rd = sc.getRequestDispatcher("/profileUser.jsp");
                    rd.forward(request, response);
                }
            } // remove patient
            else if (action.equals("deletePatient")) {

                if (PatientDAO.removePatient((int) patient.getID())) {
                    // remove session
                    if (session.getAttribute("patient") != null) {
                        session.removeAttribute("patient");
                    }
                    //remove cokie
                    if (cookies != null) {
                        for (int i = 0; i < cookies.length; i++) {
                            cookies[i].setMaxAge(0);
                        }
                    }
                    response.sendRedirect("/home.jsp");
                }

            } // Change Password
            else if (action.equals("Change Password")) {
                String error = "";
                String oldpass = request.getParameter("oldpass");
                String pass = request.getParameter("password");
                String pass2 = request.getParameter("password2");
                if (oldpass == null || pass == null || pass2 == null || oldpass.equals("") || pass.equals("") || pass2.equals("")) {
                    error = "Please fill out all required fields";
                } else if (!pass.equals(pass2)) {
                    error = "Your password and confirmation password do not match";
                } else if (!BCrypt.checkpw(oldpass, patient.getPass())) {
                    error = "Your current password is not correct";
                }

                if (error.length() > 0) {
                    request.setAttribute("error", error);

                    rd = sc.getRequestDispatcher("/profileUser.jsp");
                    rd.forward(request, response);
                } else {
                    PatientDAO.updatePassword(patient.getID(), BCrypt.hashpw(pass, BCrypt.gensalt()));
                    patient = PatientDAO.getPatient(patient.getID());
                    session.setAttribute("patient", patient);
                    
                    rd = sc.getRequestDispatcher("/profileUser.jsp");
                    rd.forward(request, response);
                }
            }
        } else if (admin != null) {
            // Change Password
            if (action.equals("Change Password")) {
                String error = "";
                String oldpass = request.getParameter("oldpass");
                String pass = request.getParameter("password");
                String pass2 = request.getParameter("password2");
                if (oldpass == null || pass == null || pass2 == null || oldpass.equals("") || pass.equals("") || pass2.equals("")) {
                    error = "Please fill out all required fields";
                } else if (!pass.equals(pass2)) {
                    error = "Your password and confirmation password do not match";
                } else if (!BCrypt.checkpw(oldpass, admin.getPass())) {
                    error = "Your current password is not correct";
                }

                if (error.length() > 0) {
                    request.setAttribute("error", error);

                    rd = sc.getRequestDispatcher("/profileUser.jsp");
                    rd.forward(request, response);
                } else {
                    AdminDAO.updatePassword(admin.getID(), BCrypt.hashpw(pass, BCrypt.gensalt()));
                    admin = AdminDAO.getAdmin(admin.getID());
                    session.setAttribute("admin", admin);
                    
                    rd = sc.getRequestDispatcher("/profileUser.jsp");
                    rd.forward(request, response);
                }
            }
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
