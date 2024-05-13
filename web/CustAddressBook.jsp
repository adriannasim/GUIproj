
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
        <title>Profile Setting</title>
        <!-- Core theme CSS (includes Bootstrap) for Customer Profile ONLY -->
        <link href="css/profilestyles.css" rel="stylesheet" />

        <!-- Include commonFiles.tag -->
        <custom:commonFiles />
        
        <!-- Bootstrap CSS -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="assets/css/tiny-slider.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">

        <style>
            .address-error-message {
                color: red;
                font-size:12px;
            }
        </style>

        <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    </head>

    <body>
        <header class="text-center">
            <%--header--%>
            <jsp:include page="components/Header.jsp" />
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
                       href="EditCustProfile">Edit Profile</a>
                    <a class="list-group-item list-group-item-light p-3 list-group-a" 
                       href="EditCustAddress">Address book</a>
                    <a class="list-group-item list-group-item-light p-3 list-group-a" 
                       href="CustChangePassword.jsp">Change my password</a>
                    <a class="list-group-item list-group-item-light p-3 list-group-a" 
                       href="EditPaymentCard">My credit/debit cards</a>
                </div>
            </div>


            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Page content-->
                <form action="EditCustAddress" method="post" id="address-form">

                    <!-- Edit Address -->
                    <div class="col-md-5" style="padding-left:180px;width:70%;">
                        <div class="p-3"style="padding-top:10px;">

                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">My Current Address</h4>
                            </div>
                            <form action="" method="get" autocomplete="off"> 
                                <div class="row mt-2">

                                    <div class="col-md-12"><label class="labels">Address Line 1</label>
                                        <input type="text" class="form-control" placeholder="address" value="${requestScope.address1}" id="ship-address" name="ship-address" required autocomplete="off" >
                                        <div id="address-address1-error" class="address-error-message"></div>
                                    </div>

                                    <div class="col-md-12"><label class="labels">Address Line 2</label>
                                        <input type="text" class="form-control" placeholder="address" value="${requestScope.address2}" id="address2" name="address2">
                                        <div id="address-address2-error" class="address-error-message"></div>
                                    </div>

                                    <div class="col-md-12"><label class="labels">Postcode</label>
                                        <input type="text" class="form-control" placeholder="postcode" value="${requestScope.postcode}" id="postcode" name="postcode">
                                        <div id="address-postcode-error" class="address-error-message"></div>
                                    </div>

                                    <div class="col-md-12"><label class="labels">City</label>
                                        <input type="text" class="form-control" placeholder="city" value="${requestScope.city}" id="locality" name="locality">
                                        <div id="address-city-error" class="address-error-message"></div>
                                    </div>

                                </div>
                                        
                                <div class="row mt-3">

                                    <div class="col-md-6"><label class="labels">Country</label>
                                        <input type="text" class="form-control" placeholder="country" value="${requestScope.country}" id="country" name="country">
                                        <div id="address-country-error" class="address-error-message"></div>
                                    </div>

                                    <div class="col-md-6"><label class="labels">State/Region</label>
                                        <input type="text" class="form-control" value="${requestScope.state}" placeholder="state" id="state" name="state">
                                        <div id="address-state-error" class="address-error-message"></div>
                                    </div>

                                </div>
                                        
                            </form>
                                        
                            <div class="mt-5 text-center">
                                <button class="btn btn-primary profile-button" id="address-form-submit" type="submit">Save Address</button>
                            </div>
                                        
                        </div>
                    </div>
                    <!-- Edit Address -->
                </form>
            </div>
            <!-- Page content wrapper-->

        </div>
        <!--end of content-->
        <script>
            function validateAddress() {
                var address1 = document.getElementById('ship-address').value.trim();
                var city = document.querySelector("#locality").value.trim();
                var state = document.querySelector("#state").value.trim();
                var postcode = document.getElementById('postcode').value.trim();
                var country = document.querySelector("#country").value.trim();

                // Get error div elements for each field
                var address1ErrorDiv = document.getElementById("address-address1-error");
                var cityErrorDiv = document.getElementById("address-city-error");
                var stateErrorDiv = document.getElementById("address-state-error");
                var postcodeErrorDiv = document.getElementById("address-postcode-error");
                var countryErrorDiv = document.getElementById("address-country-error");

                // Validate address1
                if (!address1) {
                    address1ErrorDiv.textContent = "Address line 1 is required.";
                } else {
                    address1ErrorDiv.textContent = "";
                }

                // Validate locality
                if (!city) {
                    cityErrorDiv.textContent = "City is required.";
                } else {
                    cityErrorDiv.textContent = "";
                }

                // Validate state
                if (!state) {
                    stateErrorDiv.textContent = "State is required.";
                } else {
                    stateErrorDiv.textContent = "";
                }

                // Validate postcode
                if (!postcode) {
                    postcodeErrorDiv.textContent = "Postcode is required.";
                } else {
                    postcodeErrorDiv.textContent = "";
                }

                // Validate country
                if (!country) {
                    countryErrorDiv.textContent = "Country is required.";
                } else {
                    countryErrorDiv.textContent = "";
                }
            }

            document.getElementById("ship-address").addEventListener("blur", validateAddress);
            document.getElementById("postcode").addEventListener("blur", validateAddress);
            document.getElementById("slocality").addEventListener("blur", validateAddress);
            document.getElementById("state").addEventListener("blur", validateAddress);
            document.getElementById("country").addEventListener("blur", validateAddress);


            function validateAllFields() {
                validateAddress();

                if (!hasValidationError()) {
                    document.getElementById("address-form").submit();
                }
            }

            function hasValidationError() {
                // Validation error flags for each field
                var address1Error = document.getElementById("address-address1-error").textContent;
                var address2Error = document.getElementById("address-address2-error").textContent;
                var cityError = document.getElementById("address-city-error").textContent;
                var stateError = document.getElementById("address-state-error").textContent;
                var postcodeError = document.getElementById("address-postcode-error").textContent;
                var countryError = document.getElementById("address-country-error").textContent;

                // Check if any validation error exists
                return (
                        address1Error ||
                        address2Error ||
                        cityError ||
                        stateError ||
                        postcodeError ||
                        countryError
                        );
            }


            document.getElementById("address-form-submit").addEventListener("click", function (event) {
                event.preventDefault();
                validateAllFields();
                if (hasValidationError()) {
                    alert("Please correct the validation errors before submitting the form.");
                }
            });
        </script>
        <script
            async
            defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjUgiiuQxHnVKzlXWADiT4T9YxjQda4Q0&callback=initAutocomplete&libraries=places&v=weekly"
        ></script>
    </body>
    <%--footer--%>
    <jsp:include page="components/Footer.jsp" />
</html>