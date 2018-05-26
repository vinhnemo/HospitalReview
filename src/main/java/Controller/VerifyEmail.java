/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.PatientDAO;
import Database.BCrypt;
import Util.Info;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author S410U
 */
@WebServlet("/verify")
public class VerifyEmail extends HttpServlet{
    public VerifyEmail() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    if (action.equals("activation")) {
            Integer pId = Integer.parseInt(request.getParameter("userId"));
            String hash = BCrypt.hashpw(request.getParameter("key"), Info.HASH_SALT);
            String message = null;

            try {
                // verify with database
                if (PatientDAO.verifyEmail(pId, hash)) {
                    //update status as active
                    PatientDAO.updateStatus(pId, "active");
                    PatientDAO.updateToken(pId, null);
                    message = "Email verified successfully.";
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        } 
}
