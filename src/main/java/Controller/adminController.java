/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import static Controller.DoctorController.convertSup;
import DAO.DoctorDAO;
import DAO.HospitalDAO;
import DTO.Doctor;
import DTO.Hospital;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static org.apache.commons.lang3.StringEscapeUtils.escapeHtml4;

/**
 *
 * @author NemoVinh
 */
public class adminController extends HttpServlet {

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

        ServletContext sc = getServletContext();

        // Call session
        HttpSession session = request.getSession();

        // Declare requestDispatcher
        RequestDispatcher rd;
        // Get action
        String action = request.getParameter("action");
        if (action.equals("doctor")) {
            DoctorDAO dao = new DoctorDAO();
            
            String fname = escapeHtml4(request.getParameter("fname"));
            fname = convertSup(fname);
            String lname = escapeHtml4(request.getParameter("lname"));
            lname = convertSup(lname);
            String gender = escapeHtml4(request.getParameter("gender"));
            gender = convertSup(gender);
            String degree = escapeHtml4(request.getParameter("degree"));
            degree = convertSup(degree);
            boolean insurance = Boolean.parseBoolean(request.getParameter("insurance"));
            String speciality = escapeHtml4(request.getParameter("speciality"));
            speciality = convertSup(speciality);
            String hour = escapeHtml4(request.getParameter("hour"));
            hour = convertSup(hour);
            String language = escapeHtml4(request.getParameter("language"));
            language = convertSup(language);
//            public Doctor(String fname, String lname, String sex, String degree, boolean insurance, String speciality, String hours, String lang, int allowReview)
            Doctor doc = new Doctor(fname, lname, gender, degree, insurance, speciality, hour, language);
            dao.insertDoctor(doc);
            List<Doctor> listOfDoctor = dao.getAllDoctor();
            session.setAttribute("doctorlist", listOfDoctor);
            rd = sc.getRequestDispatcher("/showdoctor.jsp");
            rd.forward(request, response);

        } else if (action.equals("hospital")) {
            HospitalDAO dao = new HospitalDAO();
            // Hospital object
            Hospital hospital = new Hospital();

            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String website = request.getParameter("website");
            String admin = request.getParameter("admin");
            String email = request.getParameter("email");

            String error = "";
            if (name.equals("") || address.equals("") || website.equals("")) {
                error += "Please fill out all required fields.";
            }

            if (error.length() > 0) {
                request.setAttribute("error", error);
                rd = sc.getRequestDispatcher("/hospitalreg.jsp");
                rd.forward(request, response);
            } else {

                hospital.setName(name);
                hospital.setAddress(address);
                hospital.setWebsite(website);
                hospital.setAdName(admin);
                hospital.setAdEmail(email);

                if (dao.insertHospital(hospital)) {
                    List<Hospital> listofHospital = dao.getAllHospital();
                    session.setAttribute("hospitallist", listofHospital);
//                    session.setAttribute("action", null);
                    rd = sc.getRequestDispatcher("/showhospital.jsp");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("error", "There is something wrong when adding to database.");
                    rd = sc.getRequestDispatcher("/hospitalreg.jsp");
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

public static String convertSup(String word) {
        StringBuilder sb = new StringBuilder();

        char[] charArray = word.toLowerCase().toCharArray();
        for (int i = 0; i < charArray.length; i++) {
            // Single character case
            switch (charArray[i]) {
                // New line
                case '\n':
                    sb.append("<br>");
                    break;
                // Trademark
                case '\u2122':
                    sb.append("&trade;");
                    break;
                // Register
                case '\u00AE':
                    sb.append("&reg;");
                    break;
                // Copyright
                case '\u00a9':
                    sb.append("&copy;");
                    break;
                default:
                    sb.append(word.charAt(i));
                    break;
            }
        }
        return sb.toString();
    }
}
