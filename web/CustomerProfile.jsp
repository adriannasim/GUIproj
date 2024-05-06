
<%-- This file is a guideline for all individual jsp files --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports-->%

<%--includes--%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Customer Profile</title>=
        <!-- Core theme CSS (includes Bootstrap) for Customer Profile ONLY -->
        <link href="css/profilestyles.css" rel="stylesheet" />

        <!-- Include commonFiles.tag -->
        <custom:commonFiles />

    </head>

    <body>
        <header class="text-center">
        <%--header--%>
        <jsp:include page="components/header.jsp" />
        </header>

        <!--start of content-->
        <section style="background-color: #f7f7f7;padding:10px;">
            <div class="container py-5">
                <div class="row">
                    <div class="col-lg-4">


                        <!-- User Profile : Upper Avatar Card -->
                        <div class="card mb-4">
                            <div class="card-body text-center">
                                <img src="img/Animal-Paint-1.jpg" alt="avatar"
                                     class="rounded-circle img-fluid" style="width: 150px;height: 140px;">
                                <h5 class="my-3">Customer Name</h5>
                                <p class="text-muted mb-1">Contact No</p>
                            </div>
                        </div>
                        <!-- User Profile : Upper Avatar Card -->


                        <!-- User Profile : Profile Setting -->                        
                        <div class="card mb-4 mb-lg-0">
                            <div class="card-body p-0">
                                <h5 class="my-3" style="padding-left:15px;">Profile Settings</h5>
                                <ul class="list-group list-group-flush rounded-3">
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <p class="mb-0">
                                            <a href="CustEditProfile.jsp" class="aSetting"
                                               style="text-decoration:none;color:black;">Edit profile</a>
                                        </p>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <p class="mb-0">
                                            <a href="CustAddressBook.jsp" class="aSetting"
                                               style="text-decoration:none;color:black;">Address book</a>
                                        </p>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <p class="mb-0">
                                            <a href="CustChangePassword.jsp" class="aSetting"
                                               style="text-decoration:none;color:black;">Change my password</a>
                                        </p>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <p class="mb-0"><a href="CustPaymentCard.jsp" class="aSetting"
                                                           style="text-decoration:none;color:black;">
                                                My credit/debit cards</a>
                                        </p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- User Profile : Profile Setting -->
                        
                        
                    </div>


                    <!-- Right Panel -->
                    <div class="col-lg-8">
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Full Name</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">Customer Name</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Email</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">example@example.com</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Country</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">Example Country</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Address</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">Example Address, PostalCode, City</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">State</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">Example State</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Right Panel -->


                        <div class="row">
                            <div class="col-md-6" style="width:100%;">


                                <!-- Order Status -->
                                <div class="card-orderstatus mb-4 mb-md-0" style="width:100%;">
                                    <div class="counter" style="width:100%;">
                                        <div class="row">
                                            <div class="col-6 col-lg-3">
                                                <div class="count-data text-center">
                                                    <p class="m-0px font-w-600" style="padding-top:5px;">
                                                        <a href="#" class="aSetting"
                                                           style="text-decoration:none;color:black;">All Orders</a>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="col-6 col-lg-3">
                                                <div class="count-data text-center">
                                                    <p class="m-0px font-w-600" style="padding-top:5px;">
                                                        <a href="#" class="aSetting"
                                                           style="text-decoration:none;color:black;">Packaging</a>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="col-6 col-lg-3">
                                                <div class="count-data text-center">
                                                    <p class="m-0px font-w-600" style="padding-top:5px;">
                                                        <a href="#" class="aSetting"
                                                           style="text-decoration:none;color:black;">Shipping</a>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="col-6 col-lg-3">
                                                <div class="count-data text-center">
                                                    <p class="m-0px font-w-600" style="padding-top:5px;">
                                                        <a href="#" class="aSetting"
                                                           style="text-decoration:none;color:black;">Delivery</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Order Status -->


                                <!-- Order Tracking -->
                                <div class="col-md-6" style="width:100%;">
                                    <h5 class="text-uppercase" style="padding-top:20px;">My recent orders</h5>
                                    <div class="order my-3">


                                        <!-- FILTERED ORDER INFO LOOPING HERE -->
                                        <div class="container-fluid d-sm-flex justify-content-center" 
                                             style="width:100%;margin:5px;">
                                            <div class="card px-2" style="width:100%;">
                                                <div class="card-header bg-white">
                                                    <div class="row justify-content-between">
                                                        <div class="col">
                                                            <p class="text-muted"> Order ID  
                                                                <span class="font-weight-bold text-dark">[ORDER ID]</span>
                                                            </p> 
                                                            <p class="text-muted"> Place On 
                                                                <span class="font-weight-bold text-dark">[ORDER DATE]</span> 
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>


                                                <!-- ORDER PRODUCTS LOOPING HERE -->
                                                <div class="card-body">
                                                    <div class="media flex-column flex-sm-row">
                                                        <div class="media-body ">
                                                            <h5 class="bold">[PRODUCT NAME]</h5>
                                                            <p class="text-muted"> Qt: [ORDER ITEM QTY]</p>
                                                            <h4 class="mt-3 mb-4 bold">
                                                                <span class="mt-5">RM</span> [PRODUCT PRICE]
                                                            </h4>
                                                            <p class="text-muted">Order Status on: 
                                                                <span class="Today">
                                                                    [PACKAGING/SHIPPING/DELIVERY DATE]
                                                                </span>
                                                            </p>
                                                            <button type="button" class="btn  btn-outline-primary d-flex">
                                                                [ORDER STATUS]
                                                            </button>    
                                                        </div>
                                                        <!-- Product Img HERE -->
                                                        <img class="align-self-center img-fluid" 
                                                             src="https://i.imgur.com/bOcHdBa.jpg" width="180 " height="180">
                                                    </div>
                                                </div>
                                                <!-- ORDER PRODUCT LOOPING END -->


                                            </div>
                                        </div>
                                        <!-- FILTERED ORDER INFO LOOPING END -->


                                    </div>
                                </div>
                                <!-- Order Tracking -->


                            </div> 
                        </div> <!-- div row end -->


                    </div>
                </div>
        </section>
        <!--end of content-->
    </body>

    <%--footer--%>
    <jsp:include page="components/footer.jsp" />
</html>