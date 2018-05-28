package Controller;

import DAO.bookmarkDAO;
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
public class controlBookmark extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet controlBookmark</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controlBookmark at " + request.getContextPath() + "</h1>");
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

        bookmarkDAO bookmark = new bookmarkDAO();

        String action = request.getParameter("action");

        switch (action) {
            case "bookmarkdoctor": {
                String paID = request.getParameter("pID");
                String doID = request.getParameter("dID");
                int p_id = Integer.parseInt(paID);
                int d_id = Integer.parseInt(doID);
                bookmark.bookmarkDoctor(p_id, d_id);

                response.sendRedirect("viewdoctor.jsp");
                break;
            }
            case "removebookmarkdoctor": {
                String paID = request.getParameter("pID");
                String doID = request.getParameter("dID");
                int p_id = Integer.parseInt(paID);
                int d_id = Integer.parseInt(doID);
                bookmark.removeBookmarkDoctor(p_id, d_id);
                response.sendRedirect("profileUser.jsp");
                break;
            }
            case "bookmarkhospital": {
                String paID = request.getParameter("pID");
                String hoID = request.getParameter("hID");
                int p_id = Integer.parseInt(paID);
                int h_id = Integer.parseInt(hoID);
                bookmark.bookmarkHospital(p_id, h_id);
                response.sendRedirect("viewhospital.jsp");
                break;
            }
            case "removebookmarkhospital": {
                String paID = request.getParameter("pID");
                String hoID = request.getParameter("hID");
                int p_id = Integer.parseInt(paID);
                int h_id = Integer.parseInt(hoID);
                bookmark.removeBookmarkHospital(p_id, h_id);
                response.sendRedirect("profileUser.jsp");
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
