<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%--imports--%>
<%@page import="entity.Product,java.util.ArrayList"%> 

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

        <%
            // Retrieve the message from session
            String msg = (String) session.getAttribute("cart-message");
            session.removeAttribute("cart-message");
            // Check if a message exists and is not empty
            if (msg != null && !msg.isEmpty()) {
        %>
        <div id="msg" class="message">
            <%= msg%>
        </div>
        <script>
            setTimeout(function () {
                var messageDiv = document.getElementById("msg");
                if (messageDiv) {
                    messageDiv.style.display = "none";
                }
            }, 5000); // 5000 milliseconds = 5 seconds
        </script>
        <%
            }
        %>


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
                <h2>RM <%= product.getProdPrice()%></h2>
                <div><%= product.getProdDesc()%></div>
                <div>
                    <% String keywords = String.join(" , ", product.getProdKeywords());%>
                    <%= keywords%>
                </div>
                <form action="AddToCart" method="post">
                    <div class="btns">
                        <button class="btn" type="button" onclick="decrementValue('itemQty', 1)">
                            -
                        </button>
                        <input type="hidden" name="prodId" value="<%=product.getProdId()%>">
                        <input
                            min="1"
                            value="1"
                            max="<%=product.getQtyAvailable()%>"
                            name="itemQty"
                            type="number"
                            class=""
                            id="itemQty"
                            />

                        <button class="btn" type="button" onclick="incrementValue('itemQty', <%=product.getQtyAvailable()%>)">
                            +
                        </button>
                    </div>
                    <button type="submit"> Add to Cart </button>
                </form>
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
    </body>
</html>
