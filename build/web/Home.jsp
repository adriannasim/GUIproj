<%-- This file is a guideline for all individual jsp files --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports--%>
<%@page import="entity.Product,java.util.ArrayList, model.ProductDAO"%> 

<%--includes--%>
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
        <link rel="shortcut icon" href="favicon.png">

        <!-- Bootstrap CSS -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="assets/css/tiny-slider.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <title>Bong Bong</title>
        <!-- Include commonFiles.tag -->
        <custom:commonFiles />
    </head>

    <body class="text-center mt-0" id="page-top">

        <%--header--%>
        <jsp:include page="components/Header.jsp" />

        <!-- Start Hero Section -->
        <div class="hero">
            <div class="container">
                <div class="row justify-content-between">

                    <div class="col-lg-1"></div>
                    <div class="col-lg-4">
                        <div class="intro-excerpt">
                            <h1>Modern Art <span clsas="d-block">Gallery</span></h1>
                            <p class="mb-4">Welcome, where every stroke tells a story. Our journey began decades ago, fueled by a passion for art and a commitment to showcasing the diverse voices of creativity.</p>
                            <p>
                                <a href="ProductPage.jsp?all=t" class="btn btn-secondary me-2">Shop Now</a>
                                <a href="ProductPage.jsp?all=t" class="btn btn-white-outline">Explore</a></p>
                        </div>
                    </div>
                    <div class="col-lg-2"></div>
                    <div class="col-lg-5">
                        <div class="hero-img-wrap">
                            <img src="assets/img/Home/home-art.png" class="img-fluid">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Hero Section -->

        <!-- Start Main Product Section -->
        <div class="product-section">
            <div class="container">
                <div class="row">

                    <!-- Start Column 1 -->
                    <div class="col-md-12 col-lg-3 mb-5 mb-lg-0">
                        <h2 class="mb-4 section-title">Artistry in Motion.</h2>
                        <p class="mb-4">Highlighting the dynamic nature of art, introduces a carousel featuring various artworks that come to life with each slide.</p>
                        <p><a href="shop.jsp" class="btn">Explore</a></p>
                    </div> 
                    <!-- End Column 1 -->

                    <!-- Three Products Looping -->
                    <!-- Start Product Column -->
                    <%
                        Product product = null;
                        for (int i = 0; i < sessProdList.size() && i < 3; i++) {
                        product = sessProdList.get(i);
                    %>
                    <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
                        
                        <a class="product-item" href="ProductDetail.jsp?id=<%= product.getProdId()%>">
                            <img src="<%= request.getContextPath() + product.getProdImg()[0]%>" width="100%" height="350px" class="product-thumbnail">
                            <h3 class="product-title"><%= product.getProdName()%></h3>
                    <% String formattedPrice = String.format("%.2f", product.getProdPrice());%>
                            <strong class="product-price">RM<%= formattedPrice%></strong>

                            <span class="icon-cross">
                                <button type="button" class="btn btn-round" style="font-size:10pt;">
                                    AddToCart
                                </button>
                            </span>
                        </a>
                    </div> 
                    <% }%>
                    <!-- End Product Column -->
                </div>
            </div>
        </div>
        <!-- End Main Product Section -->

        <!-- Start About Us Section -->
        <div class="about-us-section mt-5 mb-5">
            <div class="container">
                <div class="row justify-content-between">

                    <div class="col-lg-5 mb-5 mb-lg-0">
                        <div class="imgs-grid">
                            <div class="grid grid-1"><img src="assets/img/Home/background1.png" width="550px" alt="Famous Artist"></div>
                        </div>
                    </div>

                    <div class="col-lg-6 ps-lg-5">
                        <h2 class="section-title mb-4">About Us</h2>
                        <p>From contemporary masterpieces to timeless classics, our gallery showcases the finest creations from talented artists around the world. 
                            We offer an exquisite selection of artwork for sale, curated to inspire and enrich your living spaces. 
                            Whether you're seeking a statement piece for your home or a unique gift for a loved one, discover the perfect artwork to complement your style and elevate your surroundings.</p>
                        <p><a herf="contact.jsp" class="btn mt-4">Explore</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- End About Us Section -->

        <!-- Start Reviews Slider -->
        <div class="testimonial-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 mx-auto text-center">
                        <h2 class="section-title">Reviews</h2>
                    </div>
                </div>

                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="testimonial-slider-wrap text-center">

                            <div id="testimonial-nav">
                                <span class="prev" data-controls="prev"><span class="fa fa-chevron-left"></span></span>
                                <span class="next" data-controls="next"><span class="fa fa-chevron-right"></span></span>
                            </div>

                            <div class="testimonial-slider">

                                <div class="item">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-8 mx-auto">

                                            <div class="testimonial-block text-center">
                                                <blockquote class="mb-5">
                                                    <p>&ldquo;Art should be something that liberates your soul, provokes the imagination and encourages people to go further.&rdquo;</p>
                                                </blockquote>

                                                <div class="author-info">
                                                    <h3 class="font-weight-bold">Keith Haring</h3>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div> 
                                <!-- END item -->

                                <div class="item">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-8 mx-auto">

                                            <div class="testimonial-block text-center">
                                                <blockquote class="mb-5">
                                                    <p>&ldquo;Art evokes the mystery without which the world would not exist.&rdquo;</p>
                                                </blockquote>

                                                <div class="author-info">
                                                    <h3 class="font-weight-bold">Ren  Magritte</h3>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div> 
                                <!-- END item -->

                                <div class="item">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-8 mx-auto">

                                            <div class="testimonial-block text-center">
                                                <blockquote class="mb-5">
                                                    <p>&ldquo;Before I start carving the idea must be almost complete. I say ?almost' because the really important thing seems to be the sculptor's ability to let his intuition guide him over the gap between conception and realization without compromising the integrity of the original idea.&rdquo;</p>
                                                </blockquote>

                                                <div class="author-info">
                                                    <h3 class="font-weight-bold">Barbara Hepworth</h3>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div> 
                                <!-- END item -->

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Reviews Slider -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/tiny-slider.js"></script>
        <script src="assets/js/custom.js"></script>


        
    <!--end of content-->
</body>
<%--footer--%>
<jsp:include page="components/footer.jsp" />
</html>
