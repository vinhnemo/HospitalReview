/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Calculate.LatitudeAndLongitudeWithPincode;
import Calculate.Location;
import Calculate.connectpython;
import DTO.Admin;
import DTO.Patient;
import DAO.AdminDAO;
import DAO.HospitalDAO;
import DAO.PatientDAO;
import DTO.Hospital;
import Database.BCrypt;
import Util.*;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author TGMaster
 */
public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Call Servlet Context
        ServletContext sc = getServletContext();

        // Declare requestDispatcher
        RequestDispatcher rd;

        // Call session
        HttpSession session = request.getSession();

        String action = request.getParameter("action");

        Admin admin = new Admin();
        boolean adminLogin;

        if (action == null) {
            rd = sc.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        } else {
            Message msg = new Message();
            adminLogin = false;

            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            String remember = request.getParameter("remember");

            if (email == null || pass == null) {
                msg.setCode(0);
                msg.setText("Please type your email and password");
            } else {
                Patient patient = PatientDAO.getUserbyEmail(email);

                String error = "";
                if (patient.getPass() == null) {

                    admin = AdminDAO.getUserbyEmail(email);

                    // Check if user does not exist
                    if (admin.getPass() == null) {
                        error = "User account does not exist";
                    } else if (!BCrypt.checkpw(pass, admin.getPass())) {
                        error = "Your password is not correct";
                    } else {
                        adminLogin = true;
                    }

                } else if (!BCrypt.checkpw(pass, patient.getPass())) {
                    error = "Your password is not correct";

                } else if (patient.getStatus().equals("inactive")) {
                    error = "Your account is pending. Please check your email";
                    Date now = new Date();  // Get time now
                    Date date = PatientDAO.getDatefromToken(patient.getID()); // Get time store in database
                    // 30 mins expired
                    if (now.getTime() - date.getTime() > 30L * 60 * 1000) {
                        if (patient.getStatus().equals("inactive")) {
                            String hash = PatientDAO.getTokenfromId(patient.getID());
                            error = "Your account is pending. Click <a href=\"/verify?action=RenewToken&userId=" + patient.getID() + "&key=" + hash + "\"> here </a> to request a new link";
                        }
                    }
                } else if (patient.getStatus().equals("deactive")) {
                    error = "Your account is deactive. If you want to re-login, please contact us.";

                } else if (patient.getStatus().equals("forgot")) {
                    PatientDAO.updateStatus(patient.getID(), "active");
                    PatientDAO.updateToken(patient.getID(), null);
                }

                if (error.length() == 0) {
                    // If this is an admin
                    if (adminLogin) {
                        session.setAttribute("admin", admin);
                    } else {

/*                        ************************load location************************ xin 1 it speed
                        HospitalDAO hospitalDAO = new HospitalDAO();
                        List<Hospital> listofHospital = hospitalDAO.getAllHospital();
                        connectpython con = new connectpython();
                        LatitudeAndLongitudeWithPincode la = new LatitudeAndLongitudeWithPincode();
                        Location lol_patient = new Location();
                        lol_patient.setAddress(patient.getAddress());
                        try {
                            lol_patient = la.getLatLongPositions(lol_patient);
                        } catch (Exception ex) {
                            //Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        HashMap<Integer, Double> map = new HashMap<Integer, Double>();
                        if (listofHospital.size() > 0) {
                            for (Hospital h : listofHospital) {
                                Location lol_hospital = new Location();
                                lol_hospital.setAddress(h.getAddress());
                                try {
                                    lol_hospital = la.getLatLongPositions(lol_hospital);
                                } catch (Exception ex) {
                                    Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
                                }
                                double dis = con.calculatdistance(lol_patient.getLat(), lol_patient.getLng(), lol_hospital.getLat(), lol_hospital.getLng());
                                dis = Math.round(100.0 * dis) / 100.0;
                                map.put(h.getID(), dis);
                            }

                            //sort
                            session.setAttribute("distance", map);
                        }
//************************end load***********************/
                        session.setAttribute("patient", patient);
                    }

                    // Save login cookie
                    if (remember.equals("yes")) {
                        Cookie loginCookie;
                        if (adminLogin) {
                            loginCookie = new Cookie("a_email", admin.getEmail());
                        } else {
                            loginCookie = new Cookie("u_email", patient.getEmail());
                        }
                        //setting cookie to expiry in 30 mins
                        loginCookie.setMaxAge(60 * 30);
                        response.addCookie(loginCookie);
                    }
                    msg.setCode(0);
                    msg.setText("You have logged in successfully");
                } else {
                    msg.setCode(-1);
                    msg.setText(error);
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
