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

    <body class="text-center">
        <%--header--%>
        <jsp:include page="components/header.jsp" />

        <!--start of content-->
        <div id="message-box"></div>

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
                        RM <%=formattedPrice%> &nbsp; </div>

                    <!-- Buttons for increment, decrement, and delete -->
                    <div class="btns">
                        Qty:
                        <button class="btn" type="button" onclick="decrementValueAndUpdate('<%= cartItem.getProd().getProdId()%>', 1, '<%= cartItem.getProd().getProdId()%>',<%=cartItem.getProd().getProdPrice()%>)">
                            -
                        </button>
                        <input
                            min="1"
                            max="<%= cartItem.getProd().getQtyAvailable()%>"
                            value="<%= cartItem.getItemQty()%>"
                            name="qty"
                            type="number"
                            class="quantity-input"
                            id="qty<%=cartItem.getProd().getProdId()%>"
                            data-price="<%=cartItem.getProd().getProdPrice()%>"
                            readonly
                            />
                        <button class="btn" type="button" onclick="incrementValueAndUpdate('<%= cartItem.getProd().getProdId()%>', <%= cartItem.getProd().getQtyAvailable()%>, '<%= cartItem.getProd().getProdId()%>',<%=cartItem.getProd().getProdPrice()%>)">
                            +
                        </button>
                    </div>

                    <button type="button" onclick="deleteCartItem('<%= cartItem.getProd().getProdId()%>')">Delete</button
                    <div id="amount<%=cartItem.getProd().getProdId()%>" class="subtotal">
                        <% String formattedAmount = decimalFormat.format(cartItem.getProd().getProdPrice() * cartItem.getItemQty());%>
                        Amount: RM <%=formattedAmount%>
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
                    <b>Total: <%=formattedTotal%></b><br/>
                    <hr/>
                    <button class="w-25" type="submit">Proceed to Checkout</button>
                </div>
                <% }%>
        </form>


        <!--end of content-->
    </body>
    <%--footer--%>
    <jsp:include page="components/footer.jsp" />
</html>
