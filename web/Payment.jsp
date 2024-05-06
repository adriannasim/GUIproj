<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports--%> 
<%@page import="entity.Product,entity.CartItem,java.util.ArrayList, model.CartItemDAO,java.text.DecimalFormat"%>

<%--includes--%>

<%-- Begin: Retrieve Product List From Session (cartItemList) --%> 
<%
    ArrayList<CartItem> cartItemList = new ArrayList<CartItem>();
    if (session.getAttribute("cartItemList") != null) {
        cartItemList
                = (ArrayList<CartItem>) session.getAttribute("cartItemList");
    }
    Double subtotal = 0.0;
    Double shippingFee = 0.0;
    Double salesTax = 0.0;
    Double total = 0.0;
    DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
%> 
<%-- End: Retrieve Product List From Session (cartitemList) --%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Checkout</title>

        <!-- Include commonFiles.tag -->
        <custom:commonFiles />

    </head>

    <body>
        <%--header--%>
        <jsp:include page="components/header.jsp" />

        <!--start of content-->
        <div id="message-box"></div>

        <div class="p-5">
            1. Enter details.
            <h3>Shipping Address</h3>
            <div class="d-flex flex-row">

                <form>
                    <div class="d-flex flex-column">
                        <label>First Name</label>
                        <input name="signup-firstname" id="signup-firstname" type="text"
                               value="<%= (request.getParameter("signup-firstname") != null)
                                       ? request.getParameter("signup-firstname") : ""%>"/><br />
                        <div id="signup-firstname-error" class="signup-error-message"></div>

                        <label>Last Name</label>
                               <input name="signup-lastname" id="signup-lastname" type="text" value="<%=(request.getParameter("signup-lastname") != null)
                                ? request.getParameter("signup-lastname") : ""%>"/><br />
                        <div id="signup-lastname-error" class="signup-error-message"></div>

                        <form id="address-form" action="" method="get" autocomplete="off">
                            <label class="full-field">
                                <span class="form-label">Address</span>
                                <input id="ship-address" name="ship-address" required
                                       autocomplete="off" value="<%= (request.getParameter("ship-address")
                                               != null) ? request.getParameter("ship-address") : ""%>" />
                            </label><br/>

                            <label class="full-field">
                                <span class="form-label"
                                      >Apartment, unit, suite, or floor (optional)</span
                                >
                                <input id="address2" name="address2" value="<%=(request.getParameter("address2") != null)
                                               ? request.getParameter("address2") : ""%>" readonly/>
                            </label><br/>

                            <label class="full-field">
                                <span class="form-label">City</span>
                                <input id="locality" name="locality" value="<%=(request.getParameter("locality") != null)
                                               ? request.getParameter("locality") : ""%>" required readonly />
                            </label><br/>

                            <label class="slim-field-start">
                                <span class="form-label">State</span>
                                <input id="state" name="state" required value="<%=(request.getParameter("state") != null)
                                               ? request.getParameter("state") : ""%>" readonly />
                            </label><br/>

                            <label class="slim-field-end" for="postal_code">
                                <span class="form-label">Postal code</span>
                                <input id="postcode" name="postcode" required value="<%=(request.getParameter("postcode") != null)
                                               ? request.getParameter("postcode") : ""%>" readonly />
                            </label><br/>

                            <label class="full-field">
                                <span class="form-label">Country</span>
                                <input id="country" name="country" value="<%=(request.getParameter("country") != null)
                                               ? request.getParameter("country") : ""%>" required readonly />
                            </label>
                        </form>

                        <div id="ship-address-error" class="signup-error-message"></div>
                        <br />

                        <label>Contact No</label>
                        <input name="signup-contactNo" id="signup-contactNo" type="text"
                               value="<%= (request.getParameter("signup-contactNo") != null)
                                       ? request.getParameter("signup-contactNo") : ""%>"/><br />
                        <div id="signup-contactNo-error" class="signup-error-message"></div>
                        <br />
                </form>
            </div>
            <div>
                <form action="Payment" method="post">
                    <div id="cartContent">
                        <!-- Display cart items -->
                        <% for (CartItem cartItem : cartItemList) {%>
                        <div class="d-flex flex-row align-items-center w-100 justify-content-between p-5" id="cartItem<%= cartItem.getProd().getProdId()%>">
                            <!-- Display cart item details -->
                            <img src="<%= request.getContextPath() + cartItem.getProd().getProdImg()[0]%>" height="200px" width="auto" />
                            <div><%= cartItem.getProd().getProdId()%>&nbsp; </div>
                            <div><%= cartItem.getProd().getProdName()%>&nbsp;</div>
                            <div><% String formattedPrice = String.format("%.2f", cartItem.getProd().getProdPrice());%>
                                RM <%=formattedPrice%> &nbsp; </div> x
                                
                            Qty
                            <%= cartItem.getItemQty()%>

                            <div class="subtotal">
                                <% String formattedAmount = decimalFormat.format(cartItem.getProd().getProdPrice() * cartItem.getItemQty());%>
                                RM <%=formattedAmount%>
                            </div>
                        </div>
                        <%
                            subtotal += cartItem.getProd().getProdPrice() * cartItem.getItemQty();
                        %>
                        <% }%>

                        <%
                            if (!cartItemList.isEmpty()) {
                        %>
                        <div class="text-right p-5"> 
                            <%
                                String formattedSubtotal = decimalFormat.format(subtotal);
                            %>
                            <b>Subtotal : RM <%=formattedSubtotal%></b><br/>
                            <hr/>
                            <%
                                if (subtotal >= 1000) {
                                    shippingFee = 0.0;
                                } else {
                                    shippingFee = 15.00;
                                }

                                salesTax = subtotal * 0.10;
                                total = subtotal + shippingFee + salesTax;

                                String formattedShippingFee = decimalFormat.format(shippingFee);
                                String formattedSalesTax = decimalFormat.format(salesTax);
                                String formattedTotal = decimalFormat.format(total);
                            %>
                            <small> Shipping Fee : RM <%=formattedShippingFee%> <br/><span style="font-size: 10px;"><%=(subtotal < 1000) ? "(Free shipping if purchase over RM1,000)" : ""%></span></small><br/>
                            <small> Sales Tax (10%) : RM <%=formattedSalesTax%> <br/></small>
                            <b>Total: RM <%=formattedTotal%></b><br/>
                            <hr/>
                            <button class="w-25" type="submit">Proceed</button>
                        </div>
                        <% }%>
                    </div>
                </form>
            </div>
        </div>
        <!--end of content-->

        <%--footer--%>
        <jsp:include page="components/footer.jsp" />
    </body>
</html>
