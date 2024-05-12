package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "PaymentMethod", urlPatterns = {"/PaymentMethod"})
public class PaymentMethod extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initializations
        HttpSession session = request.getSession();

        // Save the shipping details entered by user
        String firstname = request.getParameter("cust-firstname");
        String lastname = request.getParameter("cust-lastname");
        String address1 = request.getParameter("ship-address");
        String address2 = request.getParameter("address2");
        String city = request.getParameter("locality");
        String state = request.getParameter("state");
        String postalCode = request.getParameter("postcode");
        String country = request.getParameter("country");
        String contactNo = request.getParameter("cust-contactNo");
        String remark = request.getParameter("cust-remark");
        String paymentMethod = request.getParameter("paymentMethod");


        session.setAttribute("firstname", firstname);
        session.setAttribute("lastname", lastname);
        session.setAttribute("address1", address1);
        session.setAttribute("address2", address2);
        session.setAttribute("city", city);
        session.setAttribute("state", state);
        session.setAttribute("postalcode", postalCode);
        session.setAttribute("country", country);
        session.setAttribute("contactNo", contactNo);
        session.setAttribute("remark", remark);
        session.setAttribute("paymentMethod", paymentMethod);

        // Forward the request to the Payment Method page
        // RequestDispatcher dispatcher = request.getRequestDispatcher("PaymentMethod.jsp");
        // dispatcher.forward(request, response);

         // Set cache control headers to prevent caching
         response.setDateHeader("Expires", 0);
         response.setHeader("Pragma", "no-cache");
         response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

        if (paymentMethod != null) {
            session.setAttribute("paymentMethod", paymentMethod);

            // If user selected card payment, then redirect to CardPayment.jsp
            if (paymentMethod.equals("card")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/RetrieveCards");
                dispatcher.forward(request, response);

            } // If user select FPX, then redirect to bank selection
            else if (paymentMethod.equals("fpx")) {
                response.sendRedirect("FPXPayment.jsp");

            } // If user select ewallet, then redirect to ewallet page & set redirected
            else if (paymentMethod.equals("ewallet")) {
                session.setAttribute("redirected", true);
                response.sendRedirect("https://payment.tngdigital.com.my/sc/bDLnRffv9T");

            } else {
                // Error Handling here
            }
        } else {
            // Handle case where paymentMethod parameter is missing
            // Redirect user to an error page or display an error message
        }
    }
}
