<%-- 
    Document   : Head
    Created on : May 13, 2024, 6:24:02 PM
    Author     : wynnt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
    </head>
    <body>
        <!-- Start Header/Navigation -->
        <nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

            <div class="container">
                <a class="navbar-brand" href="#">Bong Bong<span>.</span></a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsFurni">
                    <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
                        <li class="nav-item">
                            <a class="nav-link" href="Home.jsp">Home</a>
                        </li>
                        <li><a class="nav-link" href="ProductPage.jsp?all=t">Arts</a></li>
                        <li><a class="nav-link" href="about.jsp">About us</a></li>
                        <li><a class="nav-link" href="contact.jsp">Contact us</a></li>
                    </ul>

                    <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                        <li><a class="nav-link" href="<%= session.getAttribute("username") == null ? "SignIn.jsp" : "RetrieveCustomerProfile"%>"><i class="fas fa-user-circle"></i></a></li>
                        <li><a class="nav-link" href="Cart.jsp"><i class="fa fa-shopping-cart"></i></a></li>
                    </ul>
                </div>
            </div>

        </nav>
        <!-- End Header/Navigation -->
    </body>
</html>
