/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Calculate.LatitudeAndLongitudeWithPincode;
import Calculate.Location;
import Calculate.connectpython;
import DAO.HospitalDAO;
import DAO.PatientDAO;
import DTO.Hospital;
import DTO.Patient;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
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
            throws ServletException, IOException, Exception {

        // Call Servlet Context
        ServletContext sc = getServletContext();

        HttpSession session = request.getSession();
        // Declare requestDispatcher
        RequestDispatcher rd;

        String action = request.getParameter("action");

        Patient patient = null;

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("u_email")) {
                    patient = PatientDAO.getUserbyEmail(cookie.getValue());
                }
            }
        }
        if (session.getAttribute("patient") != null) {
            patient = (Patient) session.getAttribute("patient");
        }

        if (action == null) {
            LatitudeAndLongitudeWithPincode la  = new LatitudeAndLongitudeWithPincode();
            Location lol_patient = new Location();
            lol_patient.setAddress(patient.getAddress());
            la.getLatLongPositions(lol_patient);
            HashMap<Integer, Double> map = new HashMap<Integer, Double>();
            List<Hospital> listofHospital = hospitalDAO.getAllHospital();
            if (listofHospital.size() > 0) {
                for (Hospital h : listofHospital) {
                      Location lol_hospital = new Location();
                      lol_hospital.setAddress(h.getAddress());
                      connectpython con = new connectpython();
                      double distance = con.calculatdistance(String.valueOf(lol_patient.getLat()), String.valueOf(lol_patient.getLng()), String.valueOf(lol_hospital.getLat()), String.valueOf(lol_hospital.getLng()));
                      map.put(h.getID(), distance);
                }
            }
            session.setAttribute("hospitallist", listofHospital);
            session.setAttribute("distancec", map);
            rd = sc.getRequestDispatcher("/showhospital.jsp");
            rd.forward(request, response);
        } else if (action.equals("find")) {
            String search = escapeHtml4(request.getParameter("search"));
            HospitalDAO dao = new HospitalDAO();
            List<Hospital> listOfHospital = dao.searchHospital(search);
            session.setAttribute("hospitallist", listOfHospital);
            rd = sc.getRequestDispatcher("/showhospital.jsp");
            rd.forward(request, response);
        } else if (action.equals("viewprohos")) {
            int id = Integer.parseInt(request.getParameter("id_hospital"));
            HospitalDAO dao = new HospitalDAO();
            Hospital hos;
            hos = (Hospital) dao.getHospital(id);
            session.setAttribute("prohos", hos);
            rd = sc.getRequestDispatcher("/viewhospital.jsp");
            rd.forward(request, response);
        } else if (action.equals("nearest")) {

        } else if (action.equals("update")) {
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String website = request.getParameter("website");
            String admin = request.getParameter("admin");
            String email = request.getParameter("email");
            int id = Integer.parseInt(request.getParameter("id"));
            HospitalDAO d = new HospitalDAO();
            Hospital hosp = new Hospital(id, name, address, website, admin, email);
            d.updateHospital(hosp);
            response.sendRedirect("/hospital?action=viewprohos&id_hospital=" + id);
        } else if (action.equals("remove")) {
            int id = Integer.parseInt(request.getParameter("id"));
            HospitalDAO d = new HospitalDAO();
            d.removeHospital(id);
            List<Hospital> listofHospital = hospitalDAO.getAllHospital();
            session.setAttribute("hospitallist", listofHospital);
            rd = sc.getRequestDispatcher("/showhospital.jsp");
            rd.forward(request, response);
        } else if (action.equals("add")) {

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

                if (hospitalDAO.insertHospital(hospital)) {

//                    hospital = hospitalDAO.getHospital(hospitalDAO.getIDhospital());
//                    int id = hospital.getID();
//                    Location loc = new Location();
//                    loc.setAddress(address);
//                    LatitudeAndLongitudeWithPincode la = new LatitudeAndLongitudeWithPincode();
//                    loc = la.getLatLongPositions(loc);
//                    System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
//                    System.out.println(loc.getLat() + "xxxxxxxxxxx " + loc.getLng());
                    List<Hospital> listofHospital = hospitalDAO.getAllHospital();
                    session.setAttribute("hospitallist", listofHospital);
                    rd = sc.getRequestDispatcher("/showhospital.jsp");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("error", "There is something wrong when adding to database.");
                    rd = sc.getRequestDispatcher("/showhospital.jsp");
                    rd.forward(request, response);
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(HospitalController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(HospitalController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
