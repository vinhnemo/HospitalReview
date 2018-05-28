/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.RateDAO;
import DTO.Comment;
import DTO.Doctor;
import DTO.Rate;
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

/**
 *
 * @author Kuro
 */
public class RateController extends HttpServlet {

    private final RateDAO rateDAO = new RateDAO();
    private Doctor doc;

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
            doc = (Doctor) session.getAttribute("prodoc");
            int did = doc.getID();
            List<Rate> listOfRate = rateDAO.getAllRate(did);
            session.setAttribute("ratelist", listOfRate);
            rd = sc.getRequestDispatcher("/viewdoctor.jsp");
            rd.forward(request, response);
        } else {
            if (action.equals("addRate")) {
                int did = Integer.parseInt(request.getParameter("did"));
                float rate = Float.parseFloat(request.getParameter("rate"));
                rateDAO.addRate(rate, did);
                List<Rate> listOfRate = rateDAO.getAllRate(did);
                session.setAttribute("ratelist", listOfRate);
                response.sendRedirect("/doctor?action=viewpro&id_doctor=" + did);
                //rd.forward(request, response);
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
