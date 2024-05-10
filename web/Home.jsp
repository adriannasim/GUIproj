<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%-- tags --%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%-- imports --%>
<%@page import="entity.Product,java.util.ArrayList, model.ProductDAO"%> 

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
        <title>Home Page</title>

        <%-- Include commonFiles.tag --%>
        <custom:commonFiles />

        <style>

            body {
                background-image: url('img/images/background1.png');
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }


            h1 {
                font-family: "Times New Roman", Times, serif;
                font-size: 36px;
                font-weight: bold;
                color: #000;
                text-align: center;
                text-transform: uppercase;
                letter-spacing: 2px;
                margin-top: 20px;
            }


            a {
                text-decoration: none;
            }


            button {
                padding: 10px 20px;
                font-size: 16px;
                font-weight: bold;
                color: #fff;
                background-color: #800080;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }


            button:hover {
                background-color: #4b004e;
            }


            .p-2{
                width: 200px;
                height: 230px;
                display: inline-block;
                border-radius: 10px;
                padding: 15px 25px;
                box-sizing: border-box;
                cursor: pointer;
                margin: 10px 15px;
                background-position: center;
                background-size: cover;
                transition: transform 0.5s;
            }

            .p-2:hover{
                transform: translateY(-10px);
            }

        </style>

    </head>

    <body class="text-center">
        <%-- header --%>
        <jsp:include page="components/header.jsp" />

        <!--start of content-->
        <h1>BONG BONG ART GALLERY</h1>
        <section>
            <!-- Carousel wrapper -->
            <div id="carouselAboutUs" class="carousel slide carousel-fade" data-mdb-ride="carousel" data-mdb-carousel-init
                 style="position:relative;top:-25px;height:550px;">
                <!-- Indicators -->
                <div class="carousel-indicators">
                    <button
                        type="button"
                        data-mdb-target="#carouselAboutUs"
                        data-mdb-slide-to="0"
                        class="active"
                        aria-current="true"
                        aria-label="Slide 1"
                        ></button>
                    <button
                        type="button"
                        data-mdb-target="#carouselAboutUs"
                        data-mdb-slide-to="1"
                        aria-label="Slide 2"
                        ></button>
                    <button
                        type="button"
                        data-mdb-target="#carouselAboutUs"
                        data-mdb-slide-to="2"
                        aria-label="Slide 3"
                        ></button>
                </div>

                <!-- Inner -->
                <div class="carousel-inner" style="height:550px;">
                    <!-- Single item -->
                    <div class="carousel-item active" style="height:550px;">
                        <img src="img/images/artgallery2.png" class="d-block w-100" alt="Sunset Over the City"
                             style="height:550px;" />
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Discover Masterpieces</h5>
                            <p> Let's explore the gallery's collection.</p>
                        </div>
                    </div>

                    <!-- Single item -->
                    <div class="carousel-item" style="height:450px;">
                        <img src="img/images/artgallery2.png" class="d-block w-100" alt="Canyon at Nigh"
                             style="height:550px;"/>
                        <div class="carousel-caption d-none d-md-block">
                            <h5>A Brushstroke of History</h5>
                            <p>Rich history and legacy of the gallery, depicting significant moments or artworks.</p>
                        </div>
                    </div>

                    <!-- Single item -->
                    <div class="carousel-item" style="height:550px;">
                        <img src="img/images/artgallery2.png" class="d-block w-100" alt="Cliff Above a Stormy Sea"
                             style="height:550px;"/>
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Artistry in Motion</h5>
                            <p>Highlighting the dynamic nature of art, introduces a carousel featuring various artworks that come to life with each slide.</p>
                        </div>
                    </div>
                </div>
                <!-- Inner -->

                <!-- Controls -->
                <button class="carousel-control-prev" type="button" data-mdb-target="#carouselAboutUs" 
                        data-mdb-slide="prev" style="opacity:0;">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-mdb-target="#carouselAboutUs" 
                        data-mdb-slide="next" style="opacity:0;">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <!-- Carousel wrapper -->
        </section>

        <div id="loadingMessage" style="display: none;">Retrieving cart...</div>

        <!-- Link to All Products Page Button -->
        <a href="ProductPage.jsp?all=t"><button>All Artworks</button></a>
        <br>

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
                            src="<%= request.getContextPath() + product.getProdImg()[0]%>"
                            width="200px"
                            height="auto"
                            />
                    </div>
                    <div><%= product.getProdName()%></div>
                    <% String formattedPrice = String.format("%.2f", product.getProdPrice());%>
                    <div>RM<%= formattedPrice%></div>
                </div>
            </a>
            <% }%>
        </div>
        <!--end of content-->

        <%-- footer --%>
        <jsp:include page="components/footer.jsp" />
    </body>
</html>
