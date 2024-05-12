<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--imports--%>
<%@page import="java.util.ArrayList,entity.*,java.text.DecimalFormat"%>

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %> 

<%--imports--%> 
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
    DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
%> 
<%-- End: Retrieve Product List From Session (cartitemList) --%>

<!doctype html>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link rel="shortcut icon" href="favicon.png">

        <!-- Bootstrap CSS -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="assets/css/tiny-slider.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <title>Bong Bong</title>
    </head>

    <%--header--%>
    <jsp:include page="components/Header.jsp" />

    <body>
        <!-- Start Hero Section -->
        <div class="hero">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-5">
                        <div class="intro-excerpt">
                            <h1>Cart</h1>
                        </div>
                    </div>
                    <div class="col-lg-7">

                    </div>
                </div>
            </div>
        </div>
        <!-- End Hero Section -->
        
        <div class="alert" id="message-box">
        </div>

        <div class="untree_co-section before-footer-section">
            <div class="container">
                <div class="row mb-5">

                    <form class="col-md-12" method="post">
                        <div class="site-blocks-table">

                            <% if (cartItemList.isEmpty()) { %>
                            <h3>Your cart is empty. </h3>
                            <% } else { %>

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="product-thumbnail">Image</th>
                                        <th class="product-name">Product</th>
                                        <th class="product-price">Price</th>
                                        <th class="product-quantity">Quantity</th>
                                        <th class="product-total">Total</th>
                                        <th class="product-remove">Remove</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <!-- Product Looping Start Here -->
                                    <% for (CartItem cartItem : cartItemList) {%>

                                    <tr>
                                        <td class="product-thumbnail">
                                            <img src="<%= request.getContextPath() + cartItem.getProd().getProdImg()[0]%>" alt="Image" class="img-fluid">
                                        </td>
                                        <td class="product-name">
                                            <h2 class="h5 text-black"><%= cartItem.getProd().getProdName()%></h2>
                                        </td>
                                        <td><% String formattedPrice = String.format("%.2f", cartItem.getProd().getProdPrice());%>
                                            RM <%=formattedPrice%> </td>
                                        <td>
                                            <div class="input-group mb-3 d-flex align-items-center quantity-container" style="max-width: 120px;">
                                                <div class="input-group-prepend">
                                                    <button class="btn btn-outline-black decrease" type="button" onclick="decrementValueAndUpdate('<%= cartItem.getProd().getProdId()%>', 1, '<%= cartItem.getProd().getProdId()%>',<%=cartItem.getProd().getProdPrice()%>)">&minus;</button>
                                                </div>
                                                <input type="text" class="form-control text-center quantity-amount"  min="<%= cartItem.getProd().getQtyAvailable() <= 0 ? '0' : '1'%>"
                                                       max="<%= cartItem.getProd().getQtyAvailable()%>"
                                                       value="<%= cartItem.getItemQty()%>"
                                                       name="qty"
                                                       type="number"
                                                       class="quantity-input"
                                                       id="qty<%=cartItem.getProd().getProdId()%>"
                                                       data-price="<%=cartItem.getProd().getProdPrice()%>"
                                                       readonly>
                                                <div class="input-group-append">
                                                    <button class="btn btn-outline-black increase" type="button" onclick="incrementValueAndUpdate('<%= cartItem.getProd().getProdId()%>', <%= cartItem.getProd().getQtyAvailable()%>, '<%= cartItem.getProd().getProdId()%>',<%=cartItem.getProd().getProdPrice()%>)">&plus;</button>
                                                </div>
                                            </div>

                                        </td>
                                        <td>
                                            <% String formattedAmount = decimalFormat.format(cartItem.getProd().getProdPrice() * cartItem.getItemQty());%>
                                            RM <%=formattedAmount%></td>
                                        <td><a href="#" class="btn btn-black btn-sm" onclick="deleteCartItem('<%= cartItem.getProd().getProdId()%>')">X</a></td>
                                    </tr>
                                <div class="cart-item-error">
                                    <% if (cartItem.getProd().getQtyAvailable() < cartItem.getItemQty()) {%>
                                    <span>Sorry, selected quantity exceeds available stock (<%= cartItem.getProd().getQtyAvailable()%> items).</span>
                                    <% } %>

                                </div>
                                <!-- Product Looping End Here -->
                                <%
                                    totalQty += cartItem.getItemQty();
                                    subtotal += cartItem.getProd().getProdPrice() * cartItem.getItemQty();
                                %>
                                <% }%>


                                </tbody>
                            </table>
                            <% } %>
                            <%
                                String formattedSubtotal = decimalFormat.format(subtotal);
                            %>

                        </div>
                    </form>

                </div>

                <div class="row">
                    <div class="col-md-6">

                        <div class="row mb-5">
                            <div class="col-md-6">
                                <a href="Home.jsp"><button class="btn btn-outline-black btn-sm btn-block">Continue Shopping</button></a>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-12">
                                <label class="text-black h4" for="coupon">Coupon</label>
                                <p>Enter your coupon code if you have one.</p>
                            </div>
                            <div class="col-md-8 mb-3 mb-md-0">
                                <input type="text" class="form-control py-3" id="coupon" placeholder="Coupon Code">
                            </div>
                            <div class="col-md-4">
                                <button class="btn btn-black">Apply Coupon</button>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-6 pl-5">
                        <div class="row justify-content-end">
                            <div class="col-md-7">

                                <div class="row">
                                    <div class="col-md-12 text-right border-bottom mb-5">
                                        <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <span class="text-black">Total Items (pcs)</span>
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <strong class="text-black"><%=totalQty%></strong>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <span class="text-black">Subtotal</span>
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <strong class="text-black">RM <%=formattedSubtotal%></strong>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <button class="btn btn-black btn-lg py-3 btn-block <%=(!cartItemList.isEmpty()) ? "" : "disabled"%>" onclick="window.location = 'checkout.jsp'">Proceed To Checkout</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>

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

                                            function validateForm() {
                                                // Check if the error message exists
                                                var errorMessage = document.querySelector('.cart-item-error span');
                                                if (errorMessage) {
                                                    alert(errorMessage.textContent);
                                                    return false; // Prevent form submission
                                                }
                                                return true; // Allow form submission
                                            }

                                            // Calling UpdateCartItem servlet
                                            function updateCartItem(prodId, newQuantity) {
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
                                                xhr.send("prodId=" + encodeURIComponent(prodId) + "&qty=" + encodeURIComponent(newQuantity));
                                            }

                                            // Calling DeleteCartItem servlet
                                            function deleteCartItem(prodId) {
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
                                                xhr.send("prodId=" + encodeURIComponent(prodId));
                                            }

                                            // Update the cart Content after Delete
                                            function updateCartContent(cartItemsHTML) {
                                                document.body.innerHTML = cartItemsHTML;
                                            }


        </script>

        <%--footer--%>
        <jsp:include page="components/Footer.jsp" />
    </body>

</html>
