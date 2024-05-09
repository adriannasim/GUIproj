<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%--imports--%>
<%@page import="entity.Product,java.util.ArrayList,java.text.DecimalFormat"%> 

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--includes RetrieveProducts Servlet (This servlet will run automatically when the page is loaded)--%>
<jsp:include page="/RetrieveProducts"/>

<%-- Begin: Retrieve Product List & Suggested Product List From Session (prodList & suggestionList) --%>
<%
    ArrayList<Product> sessProdList = new ArrayList<Product>();
    if (session.getAttribute("prodList") != null) {
        sessProdList = (ArrayList<Product>) session.getAttribute("prodList");
    }

    ArrayList<Product> sessSuggestionList = new ArrayList<Product>();
    if (session.getAttribute("suggestionList") != null) {
        sessSuggestionList = (ArrayList<Product>) session.getAttribute("suggestionList");
    }
%>
<%-- End: Retrieve Product List & Suggested Product List From Session (prodList & suggestionList) --%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>
        <!-- Include commonFiles.tag -->
        <custom:commonFiles/>     
    </head>

    <body class="text-center">
        <!--header-->
        <jsp:include page="components/header.jsp" />

        <div id="message-box"></div>
        
        <!-- Begin: Product Details Section (This part will display product image, price, description, keywords, and cart button) -->
        <% Product product = sessProdList.get(0);%>
        <div class="prod-backlink">
            <a href="ProductPage.jsp?all=t"><i class="fa fa-bars mr-3"></i>All Products</a><i class="fa fa-angle-right ml-3 mr-3"></i><%= product.getProdName()%>
        </div>
        <div class="container single-prod">
            <div class="row">
                <div class="col-6">
                    <img
                        src="${pageContext.request.contextPath}<%= product.getProdImg()[0]%>"
                        width="500px"
                        height="auto" 

                    />
                </div>
                <div class="col-5 prod-details">
                    <h2 class="detail-element"><%= product.getProdName()%></h2>
                    <%
                        DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
                        String formattedPrice = decimalFormat.format(product.getProdPrice());
                    %>
                    <h2 class="detail-element" id="totalPrice">RM <%=formattedPrice%></h2>
                    <div class="detail-element"><%= product.getProdDesc()%></div>
                    <div class="detail-element">
                        <% String keywords = String.join(" , ", product.getProdKeywords());%>
                        <%= keywords%>
                    </div>
                    <div>
                        <div class="btns detail-element">
                            <button class="btn prod-btn" type="button" onclick="decrementValue('itemQty', 1,<%= product.getProdPrice()%>)">
                                -
                            </button>
                            <input type="hidden" name="prodId" value="<%=product.getProdId()%>">
                            <input
                                min="<%= product.getQtyAvailable() == 0 ? '0' : '1'%>"
                                value="1"
                                max="<%= product.getQtyAvailable()%>"
                                name="itemQty"
                                type="number"
                                class=""
                                id="itemQty"
                                readonly
                                />
                            <button class="btn prod-btn" type="button" onclick="incrementValue('itemQty', <%=product.getQtyAvailable()%>,<%= product.getProdPrice()%>)">
                                +
                            </button>
                        </div>
                                <div id="msg" class="message mb-3"></div>
                                <button type="button" class="btn btn-dark atc-btn" id="addToCartButton" 
                                <% if (product.getQtyAvailable() <= 0) { %>
                                disabled="disabled" 
                                <% } else {%>
                                onclick="addToCart('<%= product.getProdId()%>', document.getElementById('itemQty').value)"
                                <% } %>>
                            <% if (product.getQtyAvailable() <= 0) { %>
                            Out of Stock
                            <% } else { %>
                            Add to Cart
                            <% } %>
                        </button>
                    </div>
                </div>
            </div>
        </div> 
        <!-- End: Product Details Section -->

        <!-- Begin: Recommended Artworks Section (This section will display 3 recommended artworks based on keywords) -->
        <h3>You may also like</h3>
        
        <div class="container sprod-rec">
    <div class="row d-flex flex-row">
        <% for (int i = 0; i < sessSuggestionList.size(); i++) { %>
            <% if (i % 3 == 0) { %>
                </div>
                <div class="row d-flex flex-row">
            <% } %>
            <% Product suggestedProd = sessSuggestionList.get(i); %>
            
                <div class="col-4">
                    <div class="card m-4 pb-4" style="width: 300px;">
                        <img class="card-img-top sprod-img" src="${pageContext.request.contextPath}<%= suggestedProd.getProdImg()[0]%>" alt="Product Image">
                        <div class="card-body">
                            <h5 class="card-title"><%= suggestedProd.getProdName()%></h5>
                            <p class="card-text"><%= suggestedProd.get30WordsDesc()%></p>
                        </div>
                        <a href="ProductDetail.jsp?id=<%= suggestedProd.getProdId()%>"><span class="btn btn-info">Learn More</span></a>
                    </div>
                </div>
        <% } %>
    </div> <!-- Closing the last row outside the loop -->
</div>
        <!-- End: Recommended Artworks Section -->

        <!--footer-->
        <jsp:include page="components/footer.jsp" />

        <script>
            function incrementValue(inputId, maxValue, price) {
                var inputElement = document.getElementById(inputId);
                var value = parseInt(inputElement.value, 10);
                // Check if the current value is already at the maximum
                if (value >= maxValue) {
                    var messageDiv = document.getElementById("msg");
                    messageDiv.innerHTML = "Maximum quantity reached";
                    messageDiv.style.display = "block";
                    setTimeout(function () {
                        messageDiv.style.display = "none";
                    }, 3000); // Hide the message after 3 seconds
                    return; // Exit the function early
                }
                if (value < maxValue) {
                    inputElement.value = value + 1;
                    updateTotalPrice(price);
                }
            }

            function decrementValue(inputId, minValue, price) {
                var inputElement = document.getElementById(inputId);
                var value = parseInt(inputElement.value, 10);
                if (value > minValue) {
                    inputElement.value = value - 1;
                    updateTotalPrice(price);
                }
            }

            function updateTotalPrice(price) {
                var quantity = document.getElementById('itemQty').value;
                var totalPrice = quantity * price;
                var formattedTotalPrice = totalPrice.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
                document.getElementById('totalPrice').innerHTML = 'RM ' + formattedTotalPrice;
            }
        </script>
        <script>
            function addToCart(prodId, itemQty) {
                // Display "Loading..." message
                document.getElementById('message-box').innerHTML = "Processing...";

                var xhr = new XMLHttpRequest();
                xhr.open("POST", "AddToCart", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        var response = xhr.responseText;
                        document.getElementById('message-box').innerHTML = response;
                        setTimeout(function () {
                            document.getElementById('message-box').innerHTML = "";
                        }, 5000);
                    }
                };
                xhr.send("prodId=" + encodeURIComponent(prodId) + "&itemQty=" + encodeURIComponent(itemQty));
            }
        </script>

    </body>
</html>
