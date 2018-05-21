/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import Database.PasswordHashing;
import User.DAO.PatientDAO;
import User.DTO.Patient;
import java.io.IOException;
import java.io.PrintWriter;
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

        Patient patient = (Patient) session.getAttribute("user");   // get user
        PatientDAO pDAO = new PatientDAO();

        Cookie isLogin[] = request.getCookies();
        if (patient == null) {

            if (isLogin != null) {
                for (Cookie ck : isLogin) {
                    if (ck.getName().equals("u_email")) {
                        patient = pDAO.getPatientfromEmail(ck.getValue());   //get email
                    }

                }
            }
        }

        if (action == null) {
//            rd = sc.getRequestDispatcher(url);
//            rd.forward(request, response);
        } else if (action.equals("update")) {
            //get input
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

                pDAO.updateUser(patient);
                session.setAttribute("user", patient);
                rd = sc.getRequestDispatcher("/profilePatient.jsp");
                rd.forward(request, response);
            }
        } // remove patient
        else if (action.equals("deletePatient")) {

            if (pDAO.removePatient((int) patient.getID())) {
                // remove session
                if (session.getAttribute("user") != null) {
                    session.removeAttribute("user");
                }
                //remove cokie
                if (isLogin != null) {
                    for (int i = 0; i < isLogin.length; i++) {
                        isLogin[i].setMaxAge(0);
                    }
                }
                rd = sc.getRequestDispatcher("/profilePatient.jsp");
                rd.forward(request, response);
            }

        } else if (action.equals("deactive")) {
            if (pDAO.deactivePatient((int) patient.getID())) {
                
                
                rd = sc.getRequestDispatcher("/profilePatient.jsp");
                rd.forward(request, response);
            }

        } else if (action.equals("active")) {
            if (pDAO.active((int) patient.getID())) {
                
                
                rd = sc.getRequestDispatcher("/profilePatient.jsp");
                rd.forward(request, response);

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
