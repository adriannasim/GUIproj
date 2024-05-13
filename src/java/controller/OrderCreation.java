package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import entity.CartItem;
import java.util.ArrayList;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.UserTransaction;
import jpaEntity.*;
import java.util.Date;
import java.time.LocalDate;
import java.util.UUID;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.NoResultException;

@WebServlet(name = "OrderCreation", urlPatterns = {"/OrderCreation"})
public class OrderCreation extends HttpServlet {

    @PersistenceContext(unitName = "GUI_AssignmentPU")
    private EntityManager em;

    @Resource
    private UserTransaction utx;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        try {
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
            custorder.setStatus("Packaging");
            custorder.setPackaging(new Date());
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
                utx.begin();
                em.persist(custorder);
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
            }

            // Save order into orderitem DB
            double subtotal = 0.0;

            for (CartItem cartItem : cartItemList) {
                String id = cartItem.getProd().getProdId();
                int qty = cartItem.getItemQty();
                Double price = cartItem.getProd().getProdPrice();
                subtotal += price * qty;
                String prodname = cartItem.getProd().getProdName();
                String[] prodimg = cartItem.getProd().getProdImg();
                String concatenatedImg = String.join(",", prodimg);

                OrderitemPK orderitemPK = new OrderitemPK();
                orderitemPK.setOrderid(orderId);
                orderitemPK.setProdid(id);

                Orderitem orderitem = new Orderitem();
                orderitem.setOrderitemPK(orderitemPK);
                orderitem.setItemqty(qty);
                orderitem.setProdprice(price);
                orderitem.setProdname(prodname);
                orderitem.setProdimg(concatenatedImg);

                try {
                    utx.begin();
                    em.persist(orderitem);
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
                }
            }

            // Amount calculation
            double shippingFee;

            if (subtotal >= 1000) {
                shippingFee = 0.0;
            } else {
                shippingFee = 15.0;
            }

            double salesTax = subtotal * 0.1;
            double total = subtotal + shippingFee + salesTax;
            String paymentId = "P" + generateRandomID();

            // Save order into paymentinfo DB
            Paymentinfo pyminfo = new Paymentinfo();
            pyminfo.setPaymentid(paymentId);
            pyminfo.setOrderid(orderId);
            pyminfo.setUsername(username);
            pyminfo.setPaymenttype(paymentMethod);
            pyminfo.setPaymentdate(new Date());

            pyminfo.setShippingfee(shippingFee);
            pyminfo.setSalestax(salesTax);

            if (paymentMethod.equals("card")) {
                pyminfo.setCharges(total * 0.01);
                pyminfo.setPaymentamount(total * 1.01);
            } else {
                pyminfo.setPaymentamount(total);
            }

            try {
                utx.begin();
                em.persist(pyminfo);
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
            }

            // If use card, then save card into paymentcard DB if needed
            if (paymentMethod.equals("card")) {
                String needAdd = request.getParameter("newly-added-card");

                if (needAdd != null) {
                    if (needAdd.equals("true")) {
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
                            utx.begin();
                            em.persist(pymcard);
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

                        }

                    }
                }
            }

            // Update the qty remaining for each product
            try {
                utx.begin();
                for (CartItem cartItem : cartItemList) {
                    String id = cartItem.getProd().getProdId();

                    // Retrieve cart items based on cartid using named query
                    Query query = em.createNamedQuery("Product.findByProdid");
                    query.setParameter("prodid", id);
                    Product prod = (Product) query.getSingleResult();

                    // Update product quantity
                    prod.setQtyavailable(prod.getQtyavailable() - cartItem.getItemQty());

                    // Persist the updated product
                    em.merge(prod);
                }

                // Commit transaction after the loop
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
            }

            // Clear the session data
            clearTheSessionData(session);

            // Clear the cart
            String cartId = (String) session.getAttribute("cartId");
            clearTheCart(cartId, em, utx);

            // Redirect to success payment page
            request.setAttribute("paymentId", paymentId);
            request.setAttribute("orderId", orderId);
            request.getRequestDispatcher("SuccessPayment.jsp").forward(request, response);

            //response.sendRedirect("SuccessPayment.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();

            // Redirect to an error page
            response.sendRedirect("404Error.jsp");
        }
        //em.close();
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

    public static void clearTheSessionData(HttpSession session) {
        session.removeAttribute("firstname");
        session.removeAttribute("lastname");
        session.removeAttribute("address1");
        session.removeAttribute("address2");
        session.removeAttribute("city");
        session.removeAttribute("state");
        session.removeAttribute("postalcode");
        session.removeAttribute("country");
        session.removeAttribute("contactNo");
        session.removeAttribute("remark");
        session.removeAttribute("cartItemList");
        session.removeAttribute("paymentMethod");
    }

    public static void clearTheCart(String cartid, EntityManager em, UserTransaction utx) {
        try {
            // Begin transaction
            utx.begin();

            // Retrieve cart items based on cartid using named query
            Query query = em.createNamedQuery("Cartitem.findByCartid");
            query.setParameter("cartid", cartid);
            ArrayList<Cartitem> cartItemList = new ArrayList<>(query.getResultList());

            // Remove each cart item
            for (Cartitem cartItem : cartItemList) {
                em.remove(cartItem);
            }

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
        }
    }
}
