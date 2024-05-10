<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%-- tags --%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%-- imports --%>
<%@page import="entity.Product,java.util.ArrayList, model.ProductDAO"%> 

<%-- includes --%>
<jsp:include page="/RetrieveProducts"/>

<%-- Begin: Retrieve Product List From Session & Retrieve the cart if cart haven't retrieve yet --%>
<%
    ArrayList<Product> sessProdList = new ArrayList<Product>();
    if (session.getAttribute("prodList") != null) {
        sessProdList = (ArrayList<Product>) session.getAttribute("prodList");
    }

    String cartId = (String) session.getAttribute("cartId");
    if (cartId == null) {
%>
<script>
    // Use AJAX to call RetrieveCart servlet in the background
    function retrieveCartInBackground() {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'RetrieveCart', true);

        // Add event listener to handle response
        xhr.onload = function () {
            if (xhr.status >= 200 && xhr.status < 300) {
                // Request was successful, hide loading indicator
                document.getElementById('loadingMessage').style.display = 'none';
            } else {
                // Request failed, handle error if needed
                console.error('Failed to retrieve cart');
            }
        };

        xhr.send();

        // Show loading message or spinner
        document.getElementById('loadingMessage').style.display = 'block';
    }

    window.onload = function () {
        retrieveCartInBackground();
    };
</script>

<%
    }
%>
<%-- End: Retrieve Product List From Session & Retrieve the cart --%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Home Page</title>

        <%-- Include commonFiles.tag --%>
        <custom:commonFiles />
        
        <style>
        
        body {
            background-image: url('img/images/background1.png'); 
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }    
            
        .latest-artworks-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }

        .artwork-item {
            margin: 10px;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 5px;
            text-align: center;
            width: 200px;
        }

        .artwork-item img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }

        .artwork-item h3 {
            margin-top: 10px;
            font-size: 16px;
        }

        .artwork-item p {
            margin: 5px 0;
            font-size: 14px;
            color: #777;
        }

        .artwork-item a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        .artwork-item a:hover {
            text-decoration: underline;
        }

        .all-artworks-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            text-decoration: none;
        }

        .all-artworks-button:hover {
            background-color: #0056b3;
        }
        
        .card{
            width: 200px;
            height: 230px;
            display: inline-block;
            border-radius: 10px;
            padding: 15px 25px;
            box-sizing: border-box;
            cursor: pointer;
            margin: 10px 15px;
            background-position: center;
            background-size: cover;
            transition: transform 0.5s;
        }
        
        .card:hover{
            transform: translateY(-10px);
        }
    </style>
        
    </head>

    <body class="text-center">
        <%-- header --%>
        <jsp:include page="components/header.jsp" />

        <!--start of content-->
        <h1>Home</h1>

        <div id="loadingMessage" style="display: none;">Retrieving cart...</div>

        <!-- Link to All Products Page Button -->
        <a href="ProductPage.jsp?all=t"><button>All Artworks</button></a>

        <!-- Begin: Latest Artwork Section (This part will display the 4 recently added artworks) -->
        <h2>Latest Artworks</h2>
        <div class="d-flex margin-auto justify-content-center flex-row align-items-center">
            <%
                Product product = null;
                for (int i = 0; i < sessProdList.size(); i++) {
                    product = sessProdList.get(i);
            %>
            <a
                href="ProductDetail.jsp?id=<%= product.getProdId()%>" style="text-decoration: none"
                >
                <div class="card">
                    <div>
                        <img
                            src="<%= request.getContextPath() + product.getProdImg()[0]%>"
                            width="200px"
                            height="auto"
                            />
                    </div>
                    <div><%= product.getProdName()%></div>
                    <% String formattedPrice = String.format("%.2f", product.getProdPrice()); %>
                    <div>RM<%= formattedPrice%></div>
                </div>
            </a>
            <% }%>
        </div>
        <!--end of content-->

        <%-- footer --%>
        <jsp:include page="components/footer.jsp" />
    </body>
</html>
