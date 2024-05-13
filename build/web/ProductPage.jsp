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


<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="author" content="Untree.co">
        <link rel="shortcut icon" href="favicon.png">

        <meta name="description" content="" />
        <meta name="keywords" content="bootstrap, bootstrap4" />

        <!-- Bootstrap CSS -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="assets/css/tiny-slider.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <title>Bong Bong</title>
    </head>

    <%--header--%>
    <jsp:include page="components/Header.jsp" />

    <body>

        <!-- Start Hero Section -->
        <div class="hero">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-5">
                        <div class="intro-excerpt">
                            <h1>Our Artworks</h1>
                        </div>
                    </div>
                    <div class="col-lg-7">

                    </div>
                </div>
            </div>
        </div>
        <!-- End Hero Section -->

        <div class="untree_co-section product-section before-footer-section">
            <div class="container">
                <div class="row">
                    <div class="col-6 col-md-4 col-lg-3 mb-5">
                        <a class="product-item" href="ProductDetail.jsp?id=<%= sessMainProduct.getProdId()%>">
                            <img src="${pageContext.request.contextPath}<%= sessMainProduct.getProdImg()[0]%>" class="img-fluid product-thumbnail">
                            <h3 class="product-title"><%= sessMainProduct.getProdName()%></h3>
                            <strong class="product-price"><%= sessMainProduct.get30WordsDesc()%></strong>

                            <!--<span class="icon-cross">
                                <button type="button" class="btn btn-round" style="font-size:10pt;">
                                    View
                                </button>
                            </span>-->
                        </a>
                    </div>
                </div>
                <div class="row">

                    <% for (int i = 0; i < sessProdList.size(); i++) { %>
                    <!-- Products Looping Here -->
                    <div class="col-12 col-md-4 col-lg-3 mb-5">
                        <% Product product = sessProdList.get(i);%>
                        <a class="product-item" href="ProductDetail.jsp?id=<%= product.getProdId()%>">
                            <img src="${pageContext.request.contextPath}<%= product.getProdImg()[0]%>" class="img-fluid product-thumbnail">
                            <h3 class="product-title"><%= product.getProdName()%></h3>
                            <strong class="product-price"><%= product.get30WordsDesc()%></strong>

                            <!--<span class="icon-cross">
                                <button type="button" class="btn btn-round" style="font-size:10pt;">
                                    View
                                </button>
                            </span>-->
                        </a>
                    </div> 
                    <!-- Products Looping End Here -->
                    <% }%>
                </div>
            </div>
        </div>

        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>

        <%--footer--%>
        <jsp:include page="components/Footer.jsp" />
    </body>

</html>
