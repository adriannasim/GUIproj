<%-- Begin: Page Declaration --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Product,java.util.ArrayList"%> 
<%-- End: Page Declaration --%>

<%-- Begin: Access RetrieveProducts Servlet (This servlet will run automatically when the page is loaded) --%>
<jsp:include page="/RetrieveProducts"/>
<%-- End: Access RetrieveProducts Servlet --%>

<%-- Begin: Retrieve Product List and Main Product From Session (prodList & mainProduct) --%>
<%
    ArrayList<Product> sessProdList = new ArrayList<Product>();
    if (session.getAttribute("prodList") != null) {
        sessProdList = (ArrayList<Product>) session.getAttribute("prodList");
    }

    Product sessMainProduct = new Product();
    if (session.getAttribute("mainProduct") != null) {
        sessMainProduct = (Product) session.getAttribute("mainProduct");
    }
%>
<%-- End: Retrieve Product List and Main Product From Session (prodList & mainProduct) --%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Products</title>
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
        <h1>Artworks</h1>
        
        <!-- Begin: Main Product Section (This part will display the main product in the store based on database settings of main=T) -->
        <div class="d-flex flex-row align-items-center">
            <div>
                <%  
                    if (sessMainProduct != null) {
                        String imageSrc = request.getContextPath() + sessMainProduct.getProdImg()[0];
                %>
                <img src="<%= imageSrc%>" width="500px" height="auto" />
                <%
                    }
                %>
            </div>
            <div class="p-4">
                <h2><%= sessMainProduct.getProdName()%></h2>
                <p><%= sessMainProduct.get30WordsDesc()%></p>
                <a href="ProductDetail.jsp?id=<%= sessMainProduct.getProdId()%>">
                    Learn more
                </a>
            </div>
        </div>
        <!-- End: Main Product Section (This part will display the main product in the store based on database settings of main=T) -->

        <!-- Begin: All Products Section (This part will display all the products available in the store) -->
        <div class="d-flex margin-auto justify-content-center flex-row align-items-center">
            <% 
                Product product = null;
                for (int i = 0; i < sessProdList.size(); i++) {
                    product = sessProdList.get(i);
            %>
            <a href="ProductDetail.jsp?id=<%= product.getProdId()%>" style="text-decoration:none;">
                <div class="p-2">
                    <div>
                        <img
                            src="${pageContext.request.contextPath}<%= product.getProdImg()[0]%>"
                            width="200px"
                            height="auto"
                        />
                    </div>
                    <div><%= product.getProdName()%></div>
                    <div><%= product.get30WordsDesc()%></div>
                    Read more
                </div>
            </a>
            <% }%>
        </div>
        <!-- End: All Products Section (This part will display all the products available in the store) -->
    </body>
</html>
