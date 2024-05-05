package controller;

import entity.*;
import model.*;
import javax.servlet.annotation.MultipartConfig;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.ParseException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

@WebServlet(name = "signin", urlPatterns = {"/signin"})
public class SignIn extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Create a session
        HttpSession session = request.getSession();

        // Record the parameter values passed from the signin form
        String userAcc = request.getParameter("signin-username/email");
        String userPwd = request.getParameter("signin-password");

        try {
            // Checking Customer Record from DB
            CustomerDAO custDAO = new CustomerDAO();

            // Search the user record by using the user entered username//email
            Customer custByUsername = custDAO.getRecordByUsername(userAcc);
            Customer custByEmail = custDAO.getRecordByEmail(userAcc);
            boolean matched = false;

            if (custByUsername != null) {
                matched = Password.checkPassword(userPwd, custByUsername.getUserPwd());
                if (matched) {
                    session.setAttribute("username", custByUsername.getUsername());
                    Cookie cartIdToRemove = new Cookie("cart_id", "");
                    cartIdToRemove.setMaxAge(0);
                    response.addCookie(cartIdToRemove);
                    response.sendRedirect("Home.jsp");
                }
            } else if (custByEmail != null) {
                matched = Password.checkPassword(userPwd, custByEmail.getUserPwd());
                if (matched) {
                    session.setAttribute("username", custByEmail.getUsername());
                    Cookie cartIdToRemove = new Cookie("cart_id", "");
                    cartIdToRemove.setMaxAge(0);
                    response.addCookie(cartIdToRemove);
                    response.sendRedirect("Home.jsp");
                }
            } else {
                session.setAttribute("signin-failure-message", "Invalid credentials.");
                response.sendRedirect("SignIn.jsp");
            }

            if (!matched) {
                session.setAttribute("signin-failure-message", "Invalid credentials.");
                response.sendRedirect("SignIn.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
