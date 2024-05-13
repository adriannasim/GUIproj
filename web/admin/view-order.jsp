<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports--%>
<%@page import="jpaEntity.*, java.util.List,java.util.ArrayList,java.text.SimpleDateFormat, java.util.Date,java.text.DecimalFormat"%> 

<%
    Custorder order = new Custorder();
    if (request.getAttribute("order") != null) {
        // Ensure session attribute is retrieved as List<Custorder>
        order = (Custorder) session.getAttribute("order");
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
            href="../assets/img/apple-icon.png"
            />
        <link rel="icon" type="image/png" href="../assets/img/art_logo.png" />
        <title>Soft UI Dashboard by Creative Tim</title>
        <!--     Fonts and icons     -->
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
            rel="stylesheet"
            />
        <!-- Nucleo Icons -->
        <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
        <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- Font Awesome Icons -->
        <script
            src="https://kit.fontawesome.com/42d5adcbca.js"
            crossorigin="anonymous"
        ></script>
        <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- CSS Files -->
        <link
            id="pagestyle"
            href="../assets/css/soft-ui-dashboard.css?v=1.0.7"
            rel="stylesheet"
            />
        <!-- Nepcha Analytics (nepcha.com) -->
        <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
        <script
            defer
            data-site="YOUR_DOMAIN_HERE"
            src="https://api.nepcha.com/js/nepcha-analytics.js"
        ></script>


        <style>
            .modal {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 9999;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .modal .card {
                width: 100%;
                max-width: 500px;
                margin-top: calc(50vh - 150px);
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .close {
                cursor: pointer;
                position: absolute;
                top: 10px;
                left: 15px;
            }
        </style>
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

            <%
                if (order != null) {

            %>
            <div class="container-fluid py-4">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header pb-0 d-flex flex-column">

                                <h6 class="mb-3 text-sm">Order Id: <%=order.getOrderid()%></h6>

                                <%
                                    Date orderDate = order.getOrderdate();
                                    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                                    String formattedDate = sdf.format(orderDate);
                                %>
                                <p class="mb-2 text-xs">Purchase on:
                                    <span class="text-dark font-weight-bold ms-sm-2"><%=formattedDate%></span>
                                </p>
                                <%
                                    if (order != null && order.getPaymentinfo() != null) {

                                %>
                                <p class="mb-2 text-xs">
                                    Payment Id:
                                    <span class="text-dark ms-sm-2 font-weight-bold">
                                        <%=order.getPaymentinfo().getPaymentid()%></span>            
                                </p>
                                <% } %>

                                <%
                                    String statusClass = "";
                                    String status = order.getStatus(); // Assuming getStatus() returns the status of the order

                                    if (status.equals("packaging")) {
                                        statusClass = "bg-gradient-secondary";
                                    } else if (status.equals("shipping")) {
                                        statusClass = "bg-gradient-dark";
                                    } else if (status.equals("delivery")) {
                                        statusClass = "bg-gradient-success";
                                    }
                                %>
                                <p class="text-xs">
                                    Status:
                                    <span class="badge badge-sm <%= statusClass%>"><%=order.getStatus()%></span>
                                </p>
                            </div>
                            <div class="card-body pt-4 p-3">
                                <h6 class="mb-3 text-sm">Order Item Details</h6>
                                <%
                                    if (order != null && order.getOrderitems() != null && !order.getOrderitems().isEmpty()) {
                                        for (Orderitem orderitem : order.getOrderitems()) {

                                %>
                                <!-- Product looping here -->
                                <div class="d-flex flex-column">
                                    <p class="mb-2 text-xs">
                                        Product Name:
                                        <span class="text-dark ms-sm-2 font-weight-bold">
                                            <%=orderitem.getProdname()%></span> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        Id:
                                        <span class="text-dark ms-sm-2 font-weight-bold">
                                            <%=orderitem.getOrderitemPK().getProdid()%></span> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        Qty:
                                        <span class="text-dark ms-sm-2 font-weight-bold">
                                            <%=orderitem.getItemqty()%></span>  &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        Unit Price:
                                        <span class="text-dark ms-sm-2 font-weight-bold">
                                            <%=orderitem.getProdprice()%></span>  
                                        Amount:
                                        <span class="text-dark ms-sm-2 font-weight-bold">
                                            <%=orderitem.getProdprice() * orderitem.getItemqty()%></span>  
                                    </p>
                                </div>
                                <!-- Product looping here -->
                                <% }
                                    }%>

                                <h6 class="mb-3 text-sm pt-4">Customer Details</h6>
                                <div class="d-flex flex-column">
                                    <p class="mb-2 text-xs">
                                        Purchased by:
                                        <span class="text-dark ms-sm-2 font-weight-bold">
                                            <%=order.getUsername()%></span>            
                                    </p>

                                    <div class="d-flex flex-column">
                                        <p class="mb-2 text-xs">
                                            Shipping To:
                                            <span class="text-dark ms-sm-2 font-weight-bold">
                                                <%=order.getName()%></span>  
                                            <span class="text-dark ms-sm-2 font-weight-bold">
                                                <%=order.getContactno()%></span>  
                                            <span class="text-dark ms-sm-2 font-weight-bold">
                                                <%=order.getAddress()%>, <%=order.getCity()%>, <%=order.getPostalcode()%>, <%=order.getState()%>, <%=order.getCountry()%>.</span>            
                                        </p>
                                    </div>

                                    <%
                                        if (order != null && order.getPaymentinfo() != null) {
                                    %>
                                    <h6 class="mb-3 text-sm pt-4"> Payment Info</h6>
                                    <div class="d-flex flex-column">
                                        <p class="mb-2 text-xs">
                                            Type:
                                            <span class="text-dark ms-sm-2 font-weight-bold">
                                                <%=order.getPaymentinfo().getPaymenttype()%></span>  
                                        </p>
                                        <p class="mb-2 text-xs">
                                            Payment Amount: 
                                            <span class="text-dark ms-sm-2 font-weight-bold">
                                                <%=order.getPaymentinfo().getPaymentamount()%></span>     
                                        </p>
                                        <p class="mb-2 text-xs">
                                            Shipping Fee:
                                            <span class="text-dark ms-sm-2 font-weight-bold">
                                                <%=order.getPaymentinfo().getShippingfee()%></span>
                                        </p>
                                        <p class="mb-2 text-xs">
                                            Sales Tax:
                                            <span class="text-dark ms-sm-2 font-weight-bold">
                                                <%=order.getPaymentinfo().getSalestax()%></span>
                                        </p>
                                        <p class="mb-2 text-xs">
                                            Charges: <span class="text-dark ms-sm-2 font-weight-bold">
                                                <%=order.getPaymentinfo().getCharges()%></span>
                                        </p>
                                        <%                                                }
                                            }

                                        %>
                                    </div>

                                    <div class="ms-auto text-end">
                                        <button id="update-status-btn"
                                                class="btn btn-link text-primary px-3 mb-0"

                                                ><i
                                                class="fas fa-pencil-alt text-primary me-2"
                                                aria-hidden="true"
                                                ></i
                                            >Update Status</button
                                        >
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%@ include file="components/footer.jsp" %>
                </div>

            </div>


            <!-- The Modal -->
            <div id="update-status-modal" class="modal">
                <div
                    class="container-fluid py-4 w-50 d-flex align-items-center justify-content-center"
                    >
                    <div class="row">
                        <div class="col-12">
                            <div class="card mb-4">
                                <div class="card-body p-4">
                                    <span id="close-update-status" class="close">&times;</span>
                                    <form role="form">
                                        <label class="form-label fs-6">Order Status</label>
                                        <%
                                            // Get the status of the order
                                            String status = order.getStatus();
                                            // Define the next status based on the current status
                                            String nextStatus = "";
                                            if (status.equals("Packaging")) {
                                                nextStatus = "Shipping";
                                            } else if (status.equals("Shipping")) {
                                                nextStatus = "Delivery";
                                            } else {
                                                nextStatus = "Delivery"; // If current status is already "delivery", set it to "delivery" again
                                            }

                                            // Define the button label based on the next status
                                            String buttonLabel = "Update To \"" + nextStatus.substring(0, 1).toUpperCase() + nextStatus.substring(1) + "\"";
                                        %>
                                        <div class="text-center">
                                            <button id="update-status-submit-btn" type="button" class="btn bg-primary w-100 mt-4 mb-0 text-white"><%=buttonLabel%></button>
                                        </div>
                                        <script>
                                            // Update Status Button Click Event
                                            document.getElementById("update-status-submit-btn").onclick = function () {
                                                // Retrieve the next status and order ID
                                                var nextStatus = "<%= nextStatus%>";
                                                var orderId = "<%= order.getOrderid()%>";

                                                // Make an AJAX request to the servlet
                                                var xhr = new XMLHttpRequest();
                                                xhr.open("POST", "UpdateOrderStatus", true);
                                                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                                                xhr.onreadystatechange = function () {
                                                    if (xhr.readyState === XMLHttpRequest.DONE) {
                                                        if (xhr.status === 200) {
                                                            // Request successful, handle response
                                                            if (xhr.responseText === "success") {
                                                                // Update successful, update UI or perform any other actions
                                                                alert("Status updated successfully!");
                                                            } else {
                                                                // Update failed, handle error
                                                                alert("Failed to update status.");
                                                            }
                                                        } else {
                                                            // Request failed, handle error
                                                            alert("Failed to update status. Please try again later.");
                                                        }
                                                    }
                                                };

                                                // Send the request with parameters nextStatus and orderId
                                                xhr.send("nextStatus=" + nextStatus + "&orderId=" + orderId);
                                            };
                                        </script>
                                    </form>                  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% }%>
        </main>


        <!--   Core JS Files   -->
        <script src="../assets/js/core/popper.min.js"></script>
        <script src="../assets/js/core/bootstrap.min.js"></script>
        <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
        <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
        <script>
                                            // Update Status Modal
                                            var updateStatusModal = document.getElementById("update-status-modal");
                                            var updateStatusBtn = document.getElementById("update-status-btn");
                                            var closeUpdateStatus = document.getElementById("close-update-status");

                                            updateStatusModal.style.display = "none";

                                            updateStatusBtn.onclick = function () {
                                                if (updateStatusModal.style.display === "none") {
                                                    updateStatusModal.style.display = "block";
                                                } else {
                                                    updateStatusModal.style.display = "none";
                                                }
                                            };

                                            closeUpdateStatus.onclick = function () {
                                                updateStatusModal.style.display = "none";
                                            };

                                            window.onclick = function (event) {
                                                if (event.target == updateStatusModal) {
                                                    updateStatusModal.style.display = "none";
                                                }
                                            };
        </script>

    </body>
</html>
