<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports--%>
<%@page import="jpaEntity.*, java.util.List,java.util.ArrayList,java.text.SimpleDateFormat, java.util.Date,java.text.DecimalFormat"%> 

<%--includes--%>
<jsp:include page="/RetrieveCustomerProfile" />

<%
    Customer customer = new Customer();
    if (session.getAttribute("customer") != null) {
        customer = (Customer) session.getAttribute("customer");
    }
    List<Custorder> orderList = new ArrayList<Custorder>();
    if (session.getAttribute("orderList") != null) {
        // Ensure session attribute is retrieved as List<Custorder>
        orderList = (List<Custorder>) session.getAttribute("orderList");
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Customer Profile</title>
        <!-- Core theme CSS (includes Bootstrap) for Customer Profile ONLY -->
        <link href="css/profilestyles.css" rel="stylesheet" />
        <!-- Include commonFiles.tag -->
        <custom:commonFiles />

        <!-- Bootstrap CSS -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="assets/css/tiny-slider.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">


    </head>

    <body>
        <header class="text-center">
            <%--header--%>
            <jsp:include page="components/Header.jsp" />
        </header>

        <!--start of content-->
        <section style="background-color: #f7f7f7;padding:10px;">
            <div class="container py-5">
                <div class="row">

                    <div class="col-lg-4">
                        <!-- User Profile : Upper Avatar Card -->
                        <div class="card mb-4">
                            <div class="card-body text-center">
                                <!--<img src="img/navbar/user-icon-black.png" alt="avatar"
                                     class="rounded-circle img-fluid" style="width: 150px;height: 140px;">-->
                                <h5 class="my-3"><%=customer.getCustomerPK().getUsername()%></h5>
                                <p class="text-muted mb-1"><%=customer.getContactno()%></p>
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
                                            <a href="EditCustProfile" class="aSetting"
                                               style="text-decoration:none;color:black;">Edit profile</a>
                                        </p>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <p class="mb-0">
                                            <a href="EditCustAddress" class="aSetting"
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
                                        <p class="mb-0"><a href="EditPaymentCard" class="aSetting"
                                                           style="text-decoration:none;color:black;">
                                                My credit/debit cards</a>
                                        </p>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <p class="mb-0"><a href="Logout" class="aSetting"
                                                           style="text-decoration:none;color:black;">
                                                Log Out</a>
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
                                        <p class="text-muted mb-0"><%=customer.getFirstname()%> <%=customer.getLastname()%></p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Email</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0"><%=customer.getCustomerPK().getEmail()%></p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Country</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0"><%=customer.getCountry()%></p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Address</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0"><%=customer.getAddress()%>, <%=customer.getPostalcode()%>, <%=customer.getCity()%></p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">State</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0"><%=customer.getState()%></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Right Panel -->


                        <div class="row">
                            <div class="col-md-6" style="width:100%;">

                                <!-- Order Status -->
                                <div class="card-orderstatus mb-md-0" style="width:100%;">
                                    <div class="counter" style="width:100%;">
                                        <div class="row pt-3">
                                            <div class="col-6 col-lg-3">
                                                <div class="count-data text-center">
                                                    <p class="m-0px font-w-600" style="padding-top:5px;">
                                                        <a href="CustomerProfile.jsp" class="aSetting"
                                                           style="text-decoration:none;color:black;">All Orders</a>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="col-6 col-lg-3">
                                                <div class="count-data text-center">
                                                    <p class="m-0px font-w-600" style="padding-top:5px;">
                                                        <a href="?status=packaging" class="aSetting"
                                                           style="text-decoration:none;color:black;">Packaging</a>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="col-6 col-lg-3">
                                                <div class="count-data text-center">
                                                    <p class="m-0px font-w-600" style="padding-top:5px;">
                                                        <a href="?status=shipping" class="aSetting"
                                                           style="text-decoration:none;color:black;">Shipping</a>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="col-6 col-lg-3">
                                                <div class="count-data text-center">
                                                    <p class="m-0px font-w-600" style="padding-top:5px;">
                                                        <a href="?status=delivery" class="aSetting"
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
                                        <%
                                            if (orderList != null && !orderList.isEmpty()) {
                                                for (Custorder custorder : orderList) {
                                        %>
                                        <!-- FILTERED ORDER INFO LOOPING HERE -->
                                        <div class="container-fluid d-sm-flex justify-content-center" style="width:100%;margin:5px;">
                                            <div class="card px-2" style="width:100%;">
                                                <div class="card-header bg-white">
                                                    <div class="row justify-content-between">
                                                        <div class="col">
                                                            <p class="text-muted pt-4"> Order ID
                                                                <span class="font-weight-bold text-dark"><%=custorder.getOrderid()%></span>
                                                            </p>
                                                            <%
                                                                Date orderDate = custorder.getOrderdate();
                                                                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                                                                String formattedDate = sdf.format(orderDate);
                                                            %>
                                                            <p class="text-muted"> Place On
                                                                <span class="font-weight-bold text-dark"><%=formattedDate%></span>
                                                            </p>
                                                            <!-- Order Tracking Bar HERE -->
                                                            <div class="d-flex flex-row align-items-center w-100">
                                                                <div class="w-25"> 
                                                                    <button type="button" class="btn btn-outline-primary d-flex">
                                                                        <%=custorder.getStatus()%>
                                                                    </button>
                                                                </div>
                                                                <div class="progress-track mt-3 w-75" style="margin-left:10px;">
                                                                    <ul id="progressbar">
                                                                        <li class="step0 <%= (custorder.getPackaging() != null) ? "active" : ""%> " id="step1">Packaging</li>
                                                                        <li class="step0 <%= (custorder.getShipping() != null) ? "active" : ""%> text-center" id="step2">Shipped</li>
                                                                        <li class="step0 <%= (custorder.getDelivery() != null) ? "active" : ""%> text-right" id="step3">
                                                                            <span style="position:relative;left:25px;">Delivered</span>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                            <!-- Remove active for progress tracking -->


                                                            <!-- Order Tracking Bar HERE -->
                                                            <p class="text-muted">Order Status Updated on:
                                                                <span class="Today">
                                                                    <%
                                                                        String status = custorder.getStatus();

                                                                        System.out.println("status is : " + status);
                                                                        Date dateValue = null;
                                                                        String formattedStatusDate = "";

                                                                        if (status.equals("Packaging")) {
                                                                            dateValue = custorder.getPackaging();
                                                                        } else if (status.equals("Shipping")) {
                                                                            dateValue = custorder.getShipping();
                                                                        } else if (status.equals("Delivery")) {
                                                                            dateValue = custorder.getDelivery();
                                                                        }

                                                                        if (dateValue != null) {
                                                                            formattedStatusDate = sdf.format(dateValue);
                                                                        }
                                                                    %>
                                                                    <%=formattedStatusDate%>
                                                                </span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <%
                                                    if (custorder != null && custorder.getOrderitems() != null && !custorder.getOrderitems().isEmpty()) {
                                                        for (Orderitem orderitem : custorder.getOrderitems()) {
                                                %>
                                                <!-- ORDER PRODUCTS LOOPING HERE -->
                                                <div class="card-body">
                                                    <div class="media flex-column flex-sm-row row w-50">
                                                        <div class="media-body col-sm">
                                                            <h6 class="bold"><%=orderitem.getProdname()%></h5>
                                                                <p class="text-muted"> Qty: <%=orderitem.getItemqty()%></p>
                                                                <h6 class="mt-3 mb-4 bold">
                                                                    <%
                                                                        DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
                                                                        String formattedPrice = decimalFormat.format(orderitem.getProdprice());
                                                                    %>
                                                                    <span class="mt-5">RM</span> <%=formattedPrice%> <small>/unit</small>
                                                                </h6>
                                                        </div>
                                                        <!-- Product Img HERE -->
                                                        <div class="col-sm">
                                                            <%
                                                                String prodimgStr = orderitem.getProdimg();
                                                                String[] prodimgArray = prodimgStr != null ? prodimgStr.split(",") : new String[0];
                                                            %>
                                                            <img class="align-self-center img-fluid mt-2" src="<%=request.getContextPath() + prodimgArray[0]%>" width="100 " height="100">
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- ORDER PRODUCT LOOPING END -->
                                                <%
                                                        }
                                                    }
                                                %>
                                            </div>
                                        </div>
                                        <!-- FILTERED ORDER INFO LOOPING END -->
                                        <%
                                            }
                                        } else {
                                        %>
                                        <div>No order record.</div>
                                        <%
                                            }
                                        %>
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
    <jsp:include page="components/Footer.jsp" />
</html>
