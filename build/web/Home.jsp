<%-- This file is a guideline for all individual jsp files --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports--%>
<%@page import="entity.Product,java.util.ArrayList, model.ProductDAO"%> 
<%@ include file="css/bootstrapStyles.jsp" %>
<%--includes--%>
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
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Home</title>
        <!-- Include commonFiles.tag -->
        <custom:commonFiles />
    </head>
    
    <body class="text-center mt-0" id="page-top">
        <%--header--%>
        <jsp:include page="components/Header.jsp" />
        <div id="loadingMessage"></div>
    
        <!--start of content-->
        <!-- Masthead-->
        <header class="masthead" style="background: linear-gradient(to bottom, rgba(0, 0, 0, 0.3) 0%, rgba(0, 0, 0, 0.7) 75%, #000 100%), url('img/home/pic-4.png')">
            <div class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
                <div class="d-flex justify-content-center">
                    <div class="text-center">
                        <h1 class="mx-auto my-0 text-white text-uppercase">Bong Bong</h1>
                        <h2 class="text-white-50 mx-auto mt-2 mb-5">Explore artistic wonders at Bong Bong Art Gallery</h2>
                        <a href="ProductPage.jsp?all=t"><button class="btn btn-info" id="home-view">View our artworks</button></a>
                    </div>
                </div>
            </div>
        </header>
        <!-- About-->
        <section class="about-section text-center" id="about">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8">
                        <h2 class="text-white mb-4">A World of Artistry </h2>
                        <p class="text-white-50">
                            From contemporary masterpieces to timeless classics, our gallery showcases the finest creations from talented artists around the world. 
                            Experience the beauty of art and find your next cherished masterpiece at Bong Bong Art Gallery.
                        </p>
                    </div> 
                </div>
                <img class="img-fluid" src="img/home/pic-4.png" alt="..." />
            </div>
        </section>
        <!-- Projects-->
        <section class="projects-section bg-light" id="projects">
            <div class="container px-4 px-lg-5">
                <!-- Featured Project Row-->
                <h2 class="text-dark mb-4">About Us</h2>
                <div class="row gx-0 mb-4 mb-lg-5 align-items-center">
                    <div class="col-xl-8 col-lg-7"><img class="img-fluid mb-3 mb-lg-0" src="img/home/background1.png" alt="..." /></div>
                    <div class="col-xl-4 col-lg-5">
                        <div class="featured-text text-center text-lg-left">
                            <h4 class="text-dark">Shoreline</h4>
                            <p class="text-dark-50 mb-0"> We offer an exquisite selection of artwork for sale, curated to inspire and enrich your living spaces. 
                                Whether you're seeking a statement piece for your home or a unique gift for a loved one, discover the perfect artwork to complement your style and elevate your surroundings. 
                            </p>
                        </div>
                    </div>
                </div>
                <h2 class="text-dark mb-4">Our Masterpiece</h2>
                <!-- Project One Row-->
                <div class="row gx-0 justify-content-center ">
                    <div class="col-lg-6"><img class="img-fluid" src="img/prodImg/Portrait-Paint-1.jpg" alt="..."></div>
                    <div class="col-lg-6 order-lg-first">
                        <div class="bg-black text-center h-100 project">
                            <div class="d-flex h-100">
                                <div class="project-text w-100 my-auto text-center text-lg-right">
                                    <h4 class="text-white">Picturesque Sceneries</h4>
                                    <p class="mb-0 text-white-50">Exploration into enigmatic depths of mother nature.</p>
                                    <a href="ProductDetail.jsp?id=P0001"><button class="btn btn-info mt-4">Browse</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Project Two Row-->
                <div class="row gx-0 mb-5 mb-lg-0 justify-content-center projects-item">
                    <div class="col-lg-6"><img class="img-fluid" src="img/prodImg/Landscape-Paint-1.jpeg" alt="..."></div>
                    <div class="col-lg-6">
                        <div class="bg-black text-center h-100 project">
                            <div class="d-flex h-100">
                                <div class="project-text w-100 my-auto text-center text-lg-left">
                                    <h4 class="text-white">Portraits</h4>
                                    <p class="mb-0 text-white-50">A beacon of clarity.</p>
                                    <a href="ProductDetail.jsp?id=P0001"><button class="btn btn-info mt-4">Browse</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <h2 class="text-dark mb-4">Latest Artwork</h2>
        <div class="d-flex margin-auto justify-content-center flex-row align-items-center">
            <%
                Product product = null;
                for (int i = 0; i < sessProdList.size(); i++) {
                    product = sessProdList.get(i);
            %>
            <a
                href="ProductDetail.jsp?id=<%= product.getProdId()%>" style="text-decoration: none"
                >
                <div class="home-prod">
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
        <a href="ProductPage.jsp?all=t"><button class="btn btn-info mt-4 browse-btn">All Artworks</button></a>
        </section>
        <!--end of content-->
    </body>
    <%--footer--%>
    <jsp:include page="components/Footer.jsp" />
</html>
