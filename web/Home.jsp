<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports--%>
<%@page import="entity.Product,java.util.ArrayList, model.ProductDAO"%> 

<%--includes--%>
<jsp:include page="/RetrieveProducts"/>

<%-- Begin: Retrieve Product List From Session (prodList) --%>
<%
    ArrayList<Product> sessProdList = new ArrayList<Product>();
    if (session.getAttribute("prodList") != null) {
        sessProdList = (ArrayList<Product>) session.getAttribute("prodList");
    }
%>
<%-- End: Retrieve Product List From Session (prodList) --%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Home Page</title>

        <%-- Include commonFiles.tag --%>
        <custom:commonFiles />
        
        <script>
        // Wait for the DOM to be ready
        $(document).ready(function () {
            // Make an AJAX GET request to RetrieveProducts servlet
            $.ajax({
              url: "RetrieveProducts",
              type: "GET",
              success: function (data) {
                // Handle success response if needed
                console.log("Products loaded successfully.");
              },
              error: function (xhr, status, error) {
                // Handle error response if needed
                console.error("Error loading products:", error);
              }
            });
        });
        </script>
    </head>

    <body class="text-center">
        <%--header--%>
        <jsp:include page="components/header.jsp" />
    
        <!--start of content-->
        <h1>Home</h1>

        <!-- Sign In/Up Button -->
        <a href="SignUp.jsp"><button>Sign in/Sign up</button></a>

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
                <div class="p-2">
                    <div>
                        <img
                            src="${pageContext.request.contextPath}<%= product.getProdImg()[0]%>"
                            width="200px"
                            height="auto"
                            />
                    </div>
                    <div><%= product.getProdName()%></div>
                    <div><%= product.getProdPrice()%></div>
                </div>
            </a>
            <% }%>
        </div>
        <% } %>
        <!--end of content-->
        
        <%--footer--%>
        <jsp:include page="components/footer.jsp" />
    </body>
</html>
