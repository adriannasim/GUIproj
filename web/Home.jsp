<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!--tags-->
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<!--imports-->
<%@page import="entity.Product,java.util.ArrayList, model.ProductDAO"%> 

<!--includes-->
<jsp:include page="/RetrieveProducts"/>

<% ArrayList<Product> sessProdList = new ArrayList<Product>(); 
    if (session.getAttribute("prodList") != null)
    { 
        sessProdList = (ArrayList<Product>) session.getAttribute("prodList"); 
    } 
%>
      
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Home Page</title>

        <!-- Include commonFiles.tag -->
        <custom:commonFiles />
        
        <!-- script to load RetrieveProducts servlet -->
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
        <!--header-->
        <jsp:include page="header.jsp" />
    
        <!--start of content-->
        <h1>Home</h1>

        <a href="SignUp.jsp"><button>Sign in/Sign up</button></a>
        <button>All Artworks</button>

        <h2>Latest Artworks</h2>
        <% Product product = null; 
        for (int i = 0; i < sessProdList.size(); i++) { 
            product = sessProdList.get(i); %>
        <div>
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
        <% } %>
        <!--end of content-->
        
        <!--footer-->
        <jsp:include page="footer.jsp" />
    </body>
</html>