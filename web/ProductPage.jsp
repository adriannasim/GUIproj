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
        <!-- End: Main Product Section -->

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
        <!-- End: All Products Section -->
        
        <!--footer-->
        <jsp:include page="components/footer.jsp" />
    </body>
</html>
