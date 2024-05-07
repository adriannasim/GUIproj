package controller;

import java.io.IOException;
import java.io.PrintWriter;
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

        session.setAttribute("firstname",firstname);
        session.setAttribute("lastname",lastname);
        session.setAttribute("address1",address1);
        session.setAttribute("address2",address2);
        session.setAttribute("city",city);
        session.setAttribute("state",state);
        session.setAttribute("postalcode",postalCode);
        session.setAttribute("country",country);
        session.setAttribute("contactNo",contactNo);
        session.setAttribute("remark",remark);
        
        // Forward the request to the sign-up confirmation page
        RequestDispatcher dispatcher = request.getRequestDispatcher("PaymentMethod.jsp");
        dispatcher.forward(request, response);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initializations
         HttpSession session = request.getSession();
         
        // Save the payment method entered by user
        String paymentMethod = request.getParameter("paymentMethod");
        session.setAttribute("paymentMethod",paymentMethod);
        
        if (paymentMethod != null) {
            session.setAttribute("paymentMethod", paymentMethod);
            System.out.println("Payment method is: " + paymentMethod);
            
            if (paymentMethod.equals("card")) {
                response.sendRedirect("CardPayment.jsp");
            } else if (paymentMethod.equals("fpx")) {
                response.sendRedirect("FPXPayment.jsp");
            } else if (paymentMethod.equals("ewallet")) {
                response.sendRedirect("EWalletPayment.jsp");
            } else {
                // Error Handling here
            }
        } else {
            // Handle case where paymentMethod parameter is missing
            // Redirect user to an error page or display an error message
        }
    
    }
}
