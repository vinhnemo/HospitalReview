/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import User.DAO.DoctorDAO;
import User.DTO.Doctor;
import java.io.IOException;
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
 * @author Kuro
 */
public class DoctorController extends HttpServlet {
// Connect Database

    private final DoctorDAO doctorDAO = new DoctorDAO();

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
        if (action == null) {
            List<Doctor> listOfDoctor = doctorDAO.getAllDoctor();
            session.setAttribute("doctorlist", listOfDoctor);
            rd = sc.getRequestDispatcher("search.jsp");
            rd.forward(request, response);
        } else {
            // add Doctor
            if (action.equals("addDoctor")) {

                int id = Integer.parseInt(request.getParameter("id"));
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
                doctorDAO.addDoctor(id, fname, lname, gender, degree, insurance, speciality, hour, language);
                List<Doctor> listOfDoctor = doctorDAO.getAllDoctor();
                session.setAttribute("doctorlist", listOfDoctor);
                response.sendRedirect("");

            } // search Doctor UC1
            else if (action.equals("Search Doctor")) {
                String search = escapeHtml4(request.getParameter("search"));
                List<Doctor> searchList = doctorDAO.searchDoctor(search);
                session.setAttribute("doctorlist", searchList);
                rd = sc.getRequestDispatcher("/search.jsp");
                rd.forward(request, response);
            } // remove Doctor
            else if (action.equals("removeDoctor")) {
                int id = (Integer) Integer.parseInt(request.getParameter("remove"));
                doctorDAO.remove(id);
                List<Doctor> listOfDoctor = doctorDAO.getAllDoctor();
                session.setAttribute("doctorlist", listOfDoctor);
                response.sendRedirect("");
            } //update Doctor
            else if (action.equals("updateDoctor")) {
                int id = Integer.parseInt(request.getParameter("id"));
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
                doctorDAO.updateDoctor(id, fname, lname, gender, degree, insurance, speciality, hour, language);
                List<Doctor> listOfDoctor = doctorDAO.getAllDoctor();
                session.setAttribute("doctorlist", listOfDoctor);
                response.sendRedirect("");
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
