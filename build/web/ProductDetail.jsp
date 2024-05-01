<%-- Begin: Page Declaration --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="entity.Product,java.util.ArrayList"%> 
<%-- End: Page Declaration --%>

<%-- Begin: Access RetrieveProducts Servlet (This servlet will run automatically when the page is loaded) --%>
<jsp:include page="/RetrieveProducts"/>
<%-- End: Access RetrieveProducts Servlet --%>

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
        <!-- Begin: Import Bootstrap Libraries -->
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
        <!-- End: Import Bootstrap Libraries -->
    </head>
    
    <body class="text-center">
        
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
                <button> Add to Cart </button>
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
    </body>
</html>
