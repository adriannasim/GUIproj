<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--imports--%>
<%@page import="entity.Product,java.util.ArrayList"%> 

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--includes: RetrieveProducts Servlet (This servlet will run automatically when the page is loaded)--%>
<jsp:include page="/RetrieveProducts"/>

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
        <!-- Include commonFiles.tag -->
        <custom:commonFiles/>
    </head>

    <body class="text-center">
        <!--header-->
        <jsp:include page="components/header.jsp" />
        
        <h2 class="prod_title">A R T W O R K S</h2>

        <!-- Begin: Main Product Section (This part will display the main product in the store based on database settings of main=T) -->
        <div class="container">
            <div class="row align-items-center">
                <%
                    if (sessMainProduct != null) {
                        String imageSrc = request.getContextPath() + sessMainProduct.getProdImg()[0];
                %>
                <img src="<%= imageSrc%>" width="500px" height="auto" class="col-3 main-prod-img" />
                <%
                    }
                %>
            
                <div class="col-3">
                    <h2><%= sessMainProduct.getProdName()%></h2>
                    <p><%= sessMainProduct.get30WordsDesc()%></p>
                    <a href="ProductDetail.jsp?id=<%= sessMainProduct.getProdId()%>">
                        Learn more
                    </a>
                </div>
            </div>
        </div>
        <!-- End: Main Product Section -->

        <!-- Begin: All Products Section (This part will display all the products available in the store) -->
        <div class="container mt-4">
            <div class="row d-flex flex-row">
                <% for (int i = 0; i < sessProdList.size(); i++) { %>
                    <% if (i % 4 == 0) { %>
                        </div>
                        <div class="row d-flex flex-row">
                    <% } %>

                    <div class="col-3">
                        <div class="card m-4 pb-4" style="width: 250px;">
                            <% Product product = sessProdList.get(i); %>
                            <img class="card-img-top prod-img" src="${pageContext.request.contextPath}<%= product.getProdImg()[0]%>" alt="Product Image">
                            <div class="card-body">
                                <h5 class="card-title"><%= product.getProdName()%></h5>
                                <p class="card-text"><%= product.get30WordsDesc()%></p>
                            </div>
                            <a href="ProductDetail.jsp?id=<%= product.getProdId()%>"><span class="btn btn-info">Read More</span></a>
                        </div>
                    </div>
                <% } %>
            </div>
        </div>
        <!-- End: All Products Section -->
        
        <!--footer-->
        <jsp:include page="components/footer.jsp" />
    </body>
</html>
