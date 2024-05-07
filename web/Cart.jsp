<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--tags-->
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %> <%--imports--%> 
<%@page import="entity.Product,entity.CartItem,java.util.ArrayList, model.CartItemDAO,java.text.DecimalFormat"%>

<%-- Begin: Retrieve Product List From Session (cartItemList) --%> 
<%
    ArrayList<CartItem> cartItemList = new ArrayList<CartItem>();
    if (session.getAttribute("cartItemList") != null) {
        cartItemList
                = (ArrayList<CartItem>) session.getAttribute("cartItemList");
    }
    int totalQty = 0;
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
        <title>Cart</title>

        <!-- Include commonFiles.tag -->
        <custom:commonFiles />
    </head>

    <body class="text-center d-flex flex-column">
        <!--header-->
        <jsp:include page="components/header.jsp" />

        <!--start of content-->
        <div id="message-box"></div>

        <% if (cartItemList.isEmpty()) { %>
        <div> Your cart is empty. </div>
        <% }
        %>

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
                    totalQty += cartItem.getItemQty();
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
                    <b>Total item(s) : <%=totalQty%> pcs</b>&nbsp; &nbsp;
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
                    <small> Shipping Fee : RM <%=formattedShippingFee%> <br/><span style="font-size: 10px;">(Free shipping if purchase over RM1,000)</span></small><br/>
                    <small> Sales Tax (10%) : RM <%=formattedSalesTax%> <br/></small>
                    <b>Total: <%=formattedTotal%></b><br/>
                    <hr/>
                    <button class="w-25" type="submit">Proceed to Checkout</button>
                </div>
                <% }%>
        </form>
        <!--end of content-->

        <!--footer-->
        <jsp:include page="components/footer.jsp" />

        <script>
            // Increment For Update
            function incrementValueAndUpdate(inputId, maxValue, prodId, price) {
                var inputElement = document.getElementById('qty' + inputId);
                var value = parseInt(inputElement.value, 10);
                if (value >= maxValue) {
                    var messageDiv = document.getElementById("message-box");
                    messageDiv.innerHTML = "Maximum quantity reached";
                    messageDiv.style.display = "block";
                    setTimeout(function () {
                        messageDiv.style.display = "none";
                    }, 5000);
                }
                if (value < maxValue) {
                    inputElement.value = value + 1;
                    updateCartItem(prodId, value + 1);
                }
            }

            // Decrement For Update
            function decrementValueAndUpdate(inputId, minValue, prodId, price) {
                var inputElement = document.getElementById('qty' + inputId);
                var value = parseInt(inputElement.value, 10);
                if (value <= minValue) {
                    var messageDiv = document.getElementById("message-box");
                    messageDiv.innerHTML = "Item quantity should not less than 1.";
                    messageDiv.style.display = "block";
                    setTimeout(function () {
                        messageDiv.style.display = "none";
                    }, 5000);
                }
                if (value > minValue) {
                    inputElement.value = value - 1;
                    updateCartItem(prodId, value - 1);
                }
            }

            // Calling UpdateCartItem servlet
            function updateCartItem(productId, newQuantity) {
                document.getElementById('message-box').innerHTML = "Processing...";

                var xhr = new XMLHttpRequest();
                xhr.open("POST", "UpdateCart", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        //var response = xhr.responseText;
                        //document.getElementById('message-box').innerHTML = response;
                        //setTimeout(function () {
                        //  document.getElementById('message-box').innerHTML = "";
                        //}, 5000);
                        updateCartContent(xhr.responseText);
                        document.getElementById('message-box').innerHTML = "Item updated.";
                        setTimeout(function () {
                            document.getElementById('message-box').innerHTML = "";
                        }, 5000);
                    }
                };
                xhr.send("prodId=" + encodeURIComponent(productId) + "&qty=" + encodeURIComponent(newQuantity));
            }

            // Calling DeleteCartItem servlet
            function deleteCartItem(productId) {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "DeleteCartItem", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            updateCartContent(xhr.responseText);
                            document.getElementById('message-box').innerHTML = "Item deleted.";
                            setTimeout(function () {
                                document.getElementById('message-box').innerHTML = "";
                            }, 5000);
                        }
                    }
                };
                xhr.send("prodId=" + encodeURIComponent(productId));
            }

            // Update the cart Content after Delete
            function updateCartContent(cartItemsHTML) {
                document.body.innerHTML = cartItemsHTML;
            }

        </script>
    </body>
</html> 