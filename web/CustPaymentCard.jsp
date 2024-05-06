
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
        <title>Profile Setting</title>=
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
        <div class="d-flex" id="wrapper">


            <!-- Sidebar-->
            <div class="border-end border-right bg-white text-center" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light"> 
                    <a class="sidebar-heading-a" href="CustomerProfile.jsp">&Lt; Back to Profile</a> 
                </div>
                <div class="list-group list-group-flush" id="sidebar-list-group">
                    <a class="list-group-item list-group-item-light p-3 list-group-a" 
                       href="CustEditProfile.jsp">Edit Profile</a>
                    <a class="list-group-item list-group-item-light p-3 list-group-a" 
                       href="CustAddressBook.jsp">Address book</a>
                    <a class="list-group-item list-group-item-light p-3 list-group-a" 
                       href="CustChangePassword.jsp">Change my password</a>
                    <a class="list-group-item list-group-item-light p-3 list-group-a" 
                       href="CustPaymentCard.jsp">My credit/debit cards</a>
                </div>
            </div>


            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Page content-->

                <!-- ADD Payment Card -->
                <div class="col-md-5" style="padding-left:180px;width:70%;">
                    <div class="p-3"style="padding-top:10px;">

                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">My CREDIT/DEBIT CARDS</h4>
                        </div>

                        <!-- WHEN THERE IS NO PAYMENT CARD REGISTERED -->
                        <div class="row mt-2" id="no-paymentcard">

                            <div class="col-md-12">
                                <p>There is no registered credit/debit cards.</p>
                            </div>

                            <div class="mt-5 text-center">
                                <button class="btn btn-primary profile-button" id="btn-addcard" 
                                        type="button" onclick="CardFunction()">Add Payment Card</button>
                            </div>

                        </div>
                        <!-- WHEN THERE IS NO PAYMENT CARD REGISTERED -->


                        <!-- WHEN THERE IS PAYMENT CARD REGISTERED -->
                        <div class="row mt-2" id="yes-paymentcard">

                            <!-- PAYMENT CARD LOOPING HERE -->
                            <div class="card" style="margin-bottom:20px;">
                                <div class="card-body p-0" style="margin-bottom:15px;">
                                    <h5 class="my-3" style="padding-left:15px;">Payment Card 
                                        <i class="bi bi-credit-card"></i></h5>
                                    <ul class="list-group list-group-flush rounded-3">
                                        <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                            <p class="mb-0">
                                                Example Card Name
                                            </p>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                            <p class="mb-0">
                                                Example Date Month/Year
                                            </p>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                            <p class="mb-0">
                                                Example Card Number
                                            </p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- PAYMENT CARD LOOPING END HERE -->
                            
                            <div class="mt-1 text-center">
                                <button class="btn btn-primary profile-button" id="btn-addcard" 
                                        type="button" onclick="CardFunction()" style="margin-bottom:10px;">Add Payment Card</button>
                            </div>

                        </div>
                        <!-- WHEN THERE IS PAYMENT CARD REGISTERED -->


                        <!-- REGISTER PAYMENT CARD -->
                        <div id="AddCardDiv" style="display:none;">
                            <div class="row mt-2">

                                <div class="col-md-6"><label class="labels">Card Name</label>
                                    <input type="text" class="form-control" placeholder="" value="">
                                </div>

                                <div class="col-md-6"><label class="labels">Card Number</label>
                                    <input type="text" class="form-control" placeholder="12345678435678" value="">
                                </div>

                            </div>

                            <div class="row mt-2">

                                <div class="col-md-6"><label class="labels">Date Month / Year</label>
                                    <input type="text" class="form-control px-0" placeholder="MM/YYYY">
                                </div>

                                <div class="col-md-6"><label class="labels">CVV</label>
                                    <input type="text" class="form-control" placeholder="***" value="">
                                </div>

                            </div>

                            <div class="mt-5 text-center">
                                <button class="btn btn-primary profile-button" 
                                        type="button" onclick="CardFunction()">Save</button>
                            </div>
                        </div>
                        <!-- REGISTER PAYMENT CARD -->

                    </div>
                </div>
                <!-- Edit Address -->

            </div>
            <!-- Page content wrapper-->

        </div>

        <script>
            function CardFunction() {
                var x = document.getElementById("AddCardDiv");
                if (x.style.display === "none") {
                    x.style.display = "block";
                } else {
                    x.style.display = "none";
                }

                var y = document.getElementById("yes-paymentcard");
                if (y.style.display === "none") {
                    y.style.display = "block";
                } else {
                    y.style.display = "none";
                }

                var z = document.getElementById("no-paymentcard");
                if (z.style.display === "none") {
                    z.style.display = "block";
                } else {
                    z.style.display = "none";
                }
            }
        </script>
        <!--end of content-->
    </body>
    <%--footer--%>
    <jsp:include page="components/footer.jsp" />
</html>