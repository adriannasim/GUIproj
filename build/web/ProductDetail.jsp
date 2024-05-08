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
        <h1><%= product.getProdName()%></h1>
        <div class="d-flex flex-row align-items-center justify-content-center">
            <div class="p-4">
                <img
                    src="${pageContext.request.contextPath}<%= product.getProdImg()[0]%>"
                    width="500px"
                    height="auto"
                    />
            </div>

            <div>
                <%
                    DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
                    String formattedPrice = decimalFormat.format(product.getProdPrice());
                %>
                <h2 id="totalPrice">RM <%=formattedPrice%></h2>
                <div><%= product.getProdDesc()%></div>
                <div>
                    <% String keywords = String.join(" , ", product.getProdKeywords());%>
                    <%= keywords%>
                </div>
                <div>
                    <div class="btns">
                        <button class="btn" type="button" onclick="decrementValue('itemQty', 1,<%= product.getProdPrice()%>)">
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
                        <button class="btn" type="button" onclick="incrementValue('itemQty', <%=product.getQtyAvailable()%>,<%= product.getProdPrice()%>)">
                            +
                        </button>
                    </div>
                    <button type="button" id="addToCartButton" 
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




                    <div id="msg" class="message"></div>
                </div>
            </div>
        </div> 
        <!-- End: Product Details Section -->

        <!-- Begin: Recommended Artworks Section (This section will display 3 recommended artworks based on keywords) -->
        <h3>You may also like</h3>
        <div class="d-flex margin-auto justify-content-center flex-row align-items-center">
            <% Product suggestedProd = null;
                for (int i = 0; i < sessSuggestionList.size(); i++) {
                    suggestedProd = sessSuggestionList.get(i);%>
            <a href="ProductDetail.jsp?id=<%= suggestedProd.getProdId()%>" style="text-decoration:none;">
                <div class="p-2">
                    <div>
                        <img
                            src="${pageContext.request.contextPath}<%= suggestedProd.getProdImg()[0]%>"
                            width="200px"
                            height="auto"
                            />
                    </div>
                    <div><%= suggestedProd.getProdName()%></div>
                    <div><%= suggestedProd.get30WordsDesc()%></div>
                    Learn more
                </div>
            </a>
            <% }%>
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
