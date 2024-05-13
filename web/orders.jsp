<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports--%>
<%@page import="jpaEntity.*, java.util.List,java.util.ArrayList,java.text.SimpleDateFormat, java.util.Date,java.text.DecimalFormat"%> 

<%--includes--%>
<jsp:include page="/RetrieveOrders"/>

<%
    List<Custorder> orderList = new ArrayList<Custorder>();
    if (session.getAttribute("orderList") != null) {
        // Ensure session attribute is retrieved as List<Custorder>
        orderList = (List<Custorder>) session.getAttribute("orderList");
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <link
            rel="apple-touch-icon"
            sizes="76x76"
            href="/assets/img/apple-icon.png"
            />
        <link rel="icon" type="image/png" href="/assets/img/art_logo.png" />
        <title>Soft UI Dashboard by Creative Tim</title>
        <!--     Fonts and icons     -->
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
            rel="stylesheet"
            />
        <!-- Nucleo Icons -->
        <link href="/assets/css/nucleo-icons.css" rel="stylesheet" />
        <link href="/assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- Font Awesome Icons -->
        <script
            src="https://kit.fontawesome.com/42d5adcbca.js"
            crossorigin="anonymous"
        ></script>
        <link href="/assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- CSS Files -->
        <link
            id="pagestyle"
            href="/assets/css/soft-ui-dashboard.css?v=1.0.7"
            rel="stylesheet"
            />
        <!-- Nepcha Analytics (nepcha.com) -->
        <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
        <script
            defer
            data-site="YOUR_DOMAIN_HERE"
            src="https://api.nepcha.com/js/nepcha-analytics.js"
        ></script>
    </head>

    <body class="g-sidenav-show bg-gray-100">
        <!-- Aside -->
        <%@ include file="components/aside.jsp" %>
        <!-- End Aside -->

        <main
            class="main-content position-relative max-height-vh-100 h-100 border-radius-lg"
            >
            <!-- Navbar -->
            <nav
                class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
                id="navbarBlur"
                navbar-scroll="true"
                >
                <div class="container-fluid py-1 px-4">
                    <nav aria-label="breadcrumb">
                        <h6 class="font-weight-bolder mb-0">Orders</h6>
                    </nav>
                    <div class="container-fluid py-1 px-3">
                        <nav aria-label="breadcrumb">
                            <ul class="navbar-nav justify-content-end">
                                <li class="nav-item d-flex align-items-center">
                                    <a
                                        href="sign-in.jsp"
                                        class="nav-link text-body font-weight-bold px-0"
                                        >
                                        <i class="fa fa-user me-sm-1"></i>
                                        <span class="d-sm-inline d-none">Logout</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->

            <div class="container-fluid py-4">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header pb-0 d-flex flex-row align-items-center">
                                <h6 class="mb-0">Orders</h6>
                                <div class="input-group w-25 mx-4">
                                    <span class="input-group-text text-body"><i class="fas fa-search" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" placeholder="Type here...">
                                </div>
                            </div>
                            <div class="card-body pt-4 p-3">
                                <ul class="list-group">
                                    <%
                                        if (orderList != null && !orderList.isEmpty()) {
                                            for (Custorder custorder : orderList) {
                                    %>
                                    <li
                                        class="list-group-item border-0 d-flex p-4 mb-2 bg-gray-100 border-radius-lg"
                                        >
                                        <div class="d-flex flex-column">
                                            <h6 class="mb-3 text-sm">Order Id: <%=custorder.getOrderid()%></h6>
                                            <%
                                                Date orderDate = custorder.getOrderdate();
                                                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                                                String formattedDate = sdf.format(orderDate);
                                            %>
                                            <span class="mb-2 text-xs"
                                                  >Purchase on:
                                                <span class="text-dark font-weight-bold ms-sm-2"
                                                      ><%=formattedDate%></span
                                                ></span
                                            >
                                            <%
                                                if (custorder != null && custorder.getPaymentinfo() != null) {

                                            %>
                                            <span class="mb-2 text-xs"
                                                  >Payment Id:
                                                <span class="text-dark ms-sm-2 font-weight-bold"
                                                      ><%=custorder.getPaymentinfo().getPaymentid()%></span
                                                ></span
                                            >
                                            <% } %>

                                            <%
                                                String statusClass = "";
                                                String status = custorder.getStatus(); // Assuming getStatus() returns the status of the order

                                                if (status.equals("packaging")) {
                                                    statusClass = "bg-gradient-secondary";
                                                } else if (status.equals("shipping")) {
                                                    statusClass = "bg-gradient-dark";
                                                } else if (status.equals("delivery")) {
                                                    statusClass = "bg-gradient-success";
                                                }
                                            %>
                                            <span class="text-xs"
                                                  >Status:
                                                <span class="badge badge-sm  <%= statusClass%>"
                                                      ><%=custorder.getStatus()%></span
                                                >
                                        </div>
                                        <div class="ms-auto text-end">
                                            <a class="btn btn-link text-primary px-3 mb-0"
                                               href="view-order.jsp?orderId=<%= custorder.getOrderid()%>">
                                                <i class="fas fa-pencil-alt text-primary me-2" aria-hidden="true"></i>
                                                View
                                            </a>
                                        </div>
                                    </li>
                                    <%
                                            }
                                        }
                                    %>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <%@ include file="admin-components/footer.jsp" %>
            </div>
        </main>
        <!--   Core JS Files   -->
        <script src="/assets/js/core/popper.min.js"></script>
        <script src="/assets/js/core/bootstrap.min.js"></script>
        <script src="/assets/js/plugins/perfect-scrollbar.min.js"></script>
        <script src="/assets/js/plugins/smooth-scrollbar.min.js"></script>

    </body>
</html>
