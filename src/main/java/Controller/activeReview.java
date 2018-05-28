/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AdminDAO;
import DAO.AdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Duyet Pham
 */
public class activeReview extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet activeReview</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet activeReview at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        response.setContentType("text/html;charset=UTF-8");

        AdminDAO admin = new AdminDAO();
        String action = request.getParameter("action");

        switch (action) {
            case "ActivateReview": {
                String idd = request.getParameter("activateDoctorID");
                int id = Integer.parseInt(idd);
                admin.activateReview(id);
                response.sendRedirect("viewdoctor.jsp");
                break;
            }
            case "DeactivateReview": {
                String idd = request.getParameter("deActivateDoctorID");
                int id = Integer.parseInt(idd);
                admin.deactivateReview(id);
                response.sendRedirect("viewdoctor.jsp");
                break;
            }
            case "removeDoctor": {
                String idd = request.getParameter("removeDoctorID");
                int id = Integer.parseInt(idd);
                admin.removeDoctor(id);
                response.sendRedirect("adminuser.jsp");
                break;
            }

            default:
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
