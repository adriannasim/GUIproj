<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="entity.Product,java.util.ArrayList, model.ProductDAO"%> 
<%--<jsp:include page="/RetrieveProducts"/>--%>

<% ArrayList<Product> sessProdList = new ArrayList<Product>(); 
    if (session.getAttribute("prodList") != null) 
    { sessProdList = (ArrayList<Product>) session.getAttribute("prodList"); } %>
      
<!DOCTYPE html>
<html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Home Page</title>
      <link
        rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
        rel="nofollow"
        integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I"
        crossorigin="anonymous"
      />
      <script
        src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"
      ></script>

      <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"
        integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/"
        crossorigin="anonymous"
      ></script>
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
    </body>
</html>
