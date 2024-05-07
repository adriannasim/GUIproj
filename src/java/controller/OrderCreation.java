package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import entity.*;
import java.util.ArrayList;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.UserTransaction;
import jpaEntity.*;
import java.util.Date;
import java.time.LocalDate;
import java.util.UUID;

@WebServlet(name = "OrderCreation", urlPatterns = {"/OrderCreation"})
public class OrderCreation extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve customer shipping details
        String firstname = (String) session.getAttribute("firstname");
        String lastname = (String) session.getAttribute("lastname");
        String address1 = (String) session.getAttribute("address1");
        String address2 = (String) session.getAttribute("address2");
        String city = (String) session.getAttribute("city");
        String state = (String) session.getAttribute("state");
        String postalcode = (String) session.getAttribute("postalcode");
        String country = (String) session.getAttribute("country");
        String contactNo = (String) session.getAttribute("contactNo");
        String remark = (String) session.getAttribute("remark");

        // Retrieve username
        String username = (String) session.getAttribute("username");

        // Retrieve the cart item list
        ArrayList<CartItem> cartItemList = (ArrayList<CartItem>) session.getAttribute("cartItemList");
        
        // Retrieve the payment method 
        String paymentMethod = (String) session.getAttribute("paymentMethod");

        // Generate an order id
        String orderId = generateRandomID();

        // Save order into custorder DB
        Custorder custorder = new Custorder();
        custorder.setOrderid(orderId);
        custorder.setOrderdate(new Date());
        custorder.setStatus("In Processing");
        custorder.setUsername(username);

        String addressLine;
        if (address2 != null && !address2.isEmpty()) {
            addressLine = address1 + ", " + address2;
        } else {
            addressLine = address1;
        }

        custorder.setAddress(addressLine);
        custorder.setCity(city);
        custorder.setState(state);
        custorder.setPostalcode(postalcode);
        custorder.setCountry(country);

        String name = firstname + " " + lastname;
        custorder.setName(name);
        custorder.setContactno(contactNo);
        custorder.setRemark(remark);

        try {
            // Begin transaction
            utx.begin();
            // Add the record
            em.persist(custorder);
            // Commit transaction
            utx.commit();

        } catch (Exception ex) {
            // Rollback transaction if an exception occurs
            try {
                if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                    utx.rollback();
                }
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing payment.");
        } 

        // Save order into orderitem DB
        double subtotal = 0.0;

        for (CartItem cartItem : cartItemList) {
            String id = cartItem.getProd().getProdId();
            int qty = cartItem.getItemQty();
            Double price = cartItem.getProd().getProdPrice();
            subtotal += price * qty;

            OrderitemPK orderitemPK = new OrderitemPK();
            orderitemPK.setOrderid(orderId);
            orderitemPK.setProductid(id);

            Orderitem orderitem = new Orderitem();
            orderitem.setOrderitemPK(orderitemPK);
            orderitem.setItemqty(qty);
            orderitem.setProdprice(price);

            try {
                // Begin transaction
                utx.begin();
                // Add the record
                em.persist(orderitem);
                // Commit transaction
                utx.commit();

            } catch (Exception ex) {
                // Rollback transaction if an exception occurs
                try {
                    if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                        utx.rollback();
                    }
                } catch (Exception rollbackEx) {
                    rollbackEx.printStackTrace();
                }
                ex.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing payment.");
            } 
        }

        // Amount calculation
        double shippingFee;
        
        if (subtotal > 1000) {
            shippingFee = 0.0;
        } else {
            shippingFee = 15.0;
        }

        double salesTax = subtotal * 0.1;
        double total = subtotal + shippingFee + salesTax;

        // Save order into paymentinfo DB
        Paymentinfo pyminfo = new Paymentinfo();
        pyminfo.setPaymentid("P" + generateRandomID());
        pyminfo.setOrderid(orderId);
        pyminfo.setUsername(username);
        pyminfo.setPaymenttype(paymentMethod);
        pyminfo.setPaymentdate(new Date());
        pyminfo.setPaymentamount(total);
        pyminfo.setShippingfee(shippingFee);
        pyminfo.setSalestax(salesTax);

        try {
            // Begin transaction
             utx.begin();
            // Add the record
             em.persist(pyminfo);
            // Commit transaction
             utx.commit();

        } catch (Exception ex) {
            // Rollback transaction if an exception occurs
            try {
                if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                    utx.rollback();
                }
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing payment.");
        } 

        // If use card, then save card into paymentcard DB
        if (paymentMethod.equals("card")) {
            String holderName = request.getParameter("name");
            String cardNumber = request.getParameter("cardnumber");
            String expirationDate = request.getParameter("expirationdate");
            String cvv = request.getParameter("securitycode");

            String[] expirationDateParts = null;
            int month = 0;
            int year = 0;
            if (expirationDate != null && expirationDate.contains("/")) {
                expirationDateParts = splitExp(expirationDate);
            }

            if (expirationDateParts != null && expirationDateParts.length >= 2) {
                month = Integer.parseInt(expirationDateParts[0]);
                year = Integer.parseInt(expirationDateParts[1]);
            } else {
                // Handle the case where CVV is missing or not in the expected format
            }

            PaymentcardPK pymcardPK = new PaymentcardPK();
            pymcardPK.setCardname(holderName);
            pymcardPK.setCardnumber(cardNumber);

            Paymentcard pymcard = new Paymentcard();
            pymcard.setPaymentcardPK(pymcardPK);
            pymcard.setDatemonth(month);
            pymcard.setDateyear(year);
            pymcard.setCvv(cvv);
            pymcard.setUsername(username);

            try {
                // Begin transaction
                utx.begin();
                // Add the record
                em.persist(pymcard);
                // Commit transaction
                utx.commit();

            } catch (Exception ex) {
                // Rollback transaction if an exception occurs
                try {
                    if (utx != null && utx.getStatus() == javax.transaction.Status.STATUS_ACTIVE) {
                        utx.rollback();
                    }
                } catch (Exception rollbackEx) {
                    rollbackEx.printStackTrace();
                }
                ex.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing payment.");
            } 
        }
        response.sendRedirect("SuccessPayment.jsp");
    }

    public static String generateRandomID() {
        LocalDate localDate = LocalDate.now();
        String creationDate = String.format("%ty%tm%td", localDate, localDate, localDate);
        String randomUUID = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 20);
        return creationDate + "-" + randomUUID;
    }

    public static String[] splitExp(String expirationDate) {
        return expirationDate.split("/");
    }

}
