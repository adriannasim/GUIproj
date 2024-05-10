<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="components/header.jsp" />

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE-edge">
        <meta name="viewport" content="width-device-width,initial-scale=1.0">
        <title>About Us</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/profilestyles.css" rel="stylesheet" />
    </head>

    <body id="page-top">
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

        <!-- About section-->
        <section class="py-5">
            <div class="container">
                <div class="row align-items-center gx-4">
                    <div class="col-md-5">
                        <div class="ms-md-2 ms-lg-5"><img class="img-fluid rounded-3" src="img/images/title.png" alt="aboutus"></div>
                    </div>
                    <div class="col-md-6 offset-md-1">
                        <div class="ms-md-2 ms-lg-5">
                            <span class="text-muted">Our Story</span>
                            <h2 class="display-5 fw-bold">About Us</h2>
                            <p class="lead">Welcome, where every stroke tells a story. Our journey began decades ago, fueled by a passion for art and a commitment to showcasing the diverse voices of creativity. Arts guides our narrative, as each piece in our collection reflects the evolution of our gallery.</p>
                            <p class="lead mb-0">From humble beginnings to our current status as a cornerstone of the art community, we've remained dedicated to curating experiences that resonate. Our arts unfold our gallery's story in vivid detail—each slide a chapter, each artwork a milestone. </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Services section-->
        <section class="vh-100" style="background-color: #eee;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-lg-9 col-xl-7">
                        <div class="card" style="border-radius: 15px;">
                            <div class="card-body p-5">

                                <div class="text-center mb-4 pb-2">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-quotes/bulb.webp"
                                         alt="Bulb" width="170">
                                </div>

                                <figure class="text-center mb-0">
                                    <blockquote class="blockquote">
                                        <p class="pb-3">
                                            <i class="fas fa-quote-left fa-xs text-primary"></i>
                                            <span class="lead font-italic">Art evokes the mystery without which the world would not exist.</span>
                                            <i class="fas fa-quote-right fa-xs text-primary"></i>
                                        </p>
                                    </blockquote>
                                    <figcaption class="blockquote-footer mb-0">
                                        René Magritte
                                    </figcaption>
                                </figure>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Contact section-->
        <section class="py-5">
            <div class="container">
                <div class="row gx-4 align-items-center justify-content-between">
                    <div class="col-md-5 order-2 order-md-1">
                        <div class="mt-5 mt-md-0">=
                            <h2 class="display-5 fw-bold">Contact Us</h2>
                            <p class="lead">We're here to assist you on your artistic journey. Whether you're seeking guidance on our collection, planning a visit to our gallery, or exploring opportunities for collaboration, our team at <span style="color: blue">gallery@email.com</span> is eager to hear from you. Reach out to us through the form below, and we'll ensure that your inquiry receives the attention it deserves.</p>
                            <p class="lead">Alternatively, you can visit us in person at <span style="color: blue">1, Light Street, GeorgeTown, 10200, Penang, Malaysia</span>, where our doors are always open to fellow art enthusiasts. Let's connect and explore the world of art together.</p>
                        </div>
                    </div>
                    <div class="col-md-6 offset-md-1 order-1 order-md-2">
                        <div class="row gx-2 gx-lg-3">
                            <div class="col-6">
                                <div class="mb-2"><img class="img-fluid rounded-3" src="img/images/most-famous-artists-1.jpg" alt="most-famous-artists-1"></div>
                            </div>
                            <div class="col-6">
                                <div class="mb-2"><img class="img-fluid rounded-3" src="img/images/most-famous-artists-2.jpg" alt="most-famous-artists-2"></div>
                            </div>
                            <div class="col-6">
                                <div class="mb-2"><img class="img-fluid rounded-3" src="img/images/most-famous-artists-3.jpg" alt="most-famous-artists-3"></div>
                            </div>
                            <div class="col-6">
                                <div class="mb-2"><img class="img-fluid rounded-3" src="img/images/most-famous-artists-4.jpg" alt="most-famous-artists-4"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>

    <%--footer--%>
    <jsp:include page="components/footer.jsp" />
</html>
