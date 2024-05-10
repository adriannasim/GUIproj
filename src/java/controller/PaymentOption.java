package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet(name = "PaymentOption", urlPatterns = { "/PaymentOption" })
public class PaymentOption extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initializations
        HttpSession session = request.getSession();

        // Set cache control headers to prevent caching
        response.setDateHeader("Expires", 0);
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

        // Save the payment method entered by user
        String paymentMethod = request.getParameter("paymentMethod");
        session.setAttribute("paymentMethod", paymentMethod);

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
