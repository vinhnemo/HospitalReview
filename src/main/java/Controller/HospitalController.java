/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.HospitalDAO;
import DTO.Hospital;

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
 * @author TGMaster
 */
public class HospitalController extends HttpServlet {

    // Connect DAO
    HospitalDAO hospitalDAO = new HospitalDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Call Servlet Context
        ServletContext sc = getServletContext();

        HttpSession session = request.getSession();
        // Declare requestDispatcher
        RequestDispatcher rd;

        String action = request.getParameter("action");

        if (action == null) {
            List<Hospital> listofHospital = hospitalDAO.getAllHospital();
            session.setAttribute("hospitallist", listofHospital);
            rd = sc.getRequestDispatcher("/showhospital.jsp");
            rd.forward(request, response);
        } else if (action.equals("hospital")) {
            String search = escapeHtml4(request.getParameter("search"));
            HospitalDAO dao = new HospitalDAO();
            List<Hospital> listOfHospital = dao.searchHospital(search);
            session.setAttribute("hospitallist", listOfHospital);
            rd = sc.getRequestDispatcher("/showhospital.jsp");
            rd.forward(request, response);
        } else if (action.equals("viewprohos")) {
            int id = Integer.parseInt(request.getParameter("id_hospital"));
            HospitalDAO dao = new HospitalDAO();
            Hospital hos ;
            hos = (Hospital) dao.getHospital(id);
            session.setAttribute("prohos", hos);
            rd = sc.getRequestDispatcher("/viewhospital.jsp");
            rd.forward(request, response);
        }
        
        else if(action.equals("nearest"))
        {
            
        }
//else {
//
//            // Hospital object
//            Hospital hospital = new Hospital();
//
//            String name = request.getParameter("name");
//            String address = request.getParameter("address");
//            String website = request.getParameter("website");
//            String admin = request.getParameter("admin");
//            String email = request.getParameter("email");
//
//            String error = "";
//            if (name.equals("") || address.equals("") || website.equals("")) {
//                error += "Please fill out all required fields.";
//            }
//
//            if (error.length() > 0) {
//                request.setAttribute("error", error);
//                rd = sc.getRequestDispatcher("/hospitalreg.jsp");
//                rd.forward(request, response);
//            } else {
//
//                hospital.setName(name);
//                hospital.setAddress(address);
//                hospital.setWebsite(website);
//                hospital.setAdName(admin);
//                hospital.setAdEmail(email);
//
//                if (hospitalDAO.insertHospital(hospital)) {
//                    request.setAttribute("hospital", hospital);
//                    rd = sc.getRequestDispatcher("/hospitalprofile.jsp");
//                    rd.forward(request, response);
//                } else {
//                    request.setAttribute("error", "There is something wrong when adding to database.");
//                    rd = sc.getRequestDispatcher("/hospitalreg.jsp");
//                    rd.forward(request, response);
//                }
//            }
//        }
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
