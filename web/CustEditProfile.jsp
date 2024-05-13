
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
        
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="assets/css/tiny-slider.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        
        <style>
            .edit-profile-error-message {
                color: red;
                font-size: 12px;
            }
        </style>

        <!-- Include commonFiles.tag -->
        <custom:commonFiles />

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

                <form action="EditCustProfile" method="post" id="edit-profile-form">
                    <!-- Edit Profile -->
                    <div class="col-md-5" style="padding-left:180px;width:70%;">
                        <div class="p-3"style="padding-top:10px;">

                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Edit Profile</h4>
                            </div>

                            <div class="row mt-2">

                                <div class="col-md-6">
                                    <label class="labels text-right">First Name</label>
                                    <input type="text" class="form-control" placeholder="first name" 
                                           value="${requestScope.firstname}" name="edit-profile-firstname" id="edit-profile-firstname">
                                    <div id="edit-profile-firstname-error" class="edit-profile-error-message"></div>
                                </div>

                                <div class="col-md-6">
                                    <label class="labels">Last Name</label>
                                    <input type="text" class="form-control" placeholder="last name"
                                           value="${requestScope.lastname}" name="edit-profile-lastname" id="edit-profile-lastname">
                                    <div id="edit-profile-lastname-error" class="edit-profile-error-message"></div>
                                </div>

                            </div>

                            <div class="row mt-2">

                                <!-- <div class="col-md-6"><label class="labels">Email</label>
                                    <input type="text" class="form-control" placeholder="email"
                                           value="${requestScope.email}" name="edit-profile-email" id="edit-profile-email">
                                    <div id="edit-profile-email-error" class="edit-profile-error-message"></div>
                                    <div id="edit-profile-email-status" class="edit-profile-status-message"></div>
                                </div> -->

                                <div class="col-md-6"><label class="labels">Contact Number</label>
                                    <input type="text" class="form-control" placeholder="contact number" 
                                           value="${requestScope.contactNo}" name="edit-profile-contactno" id="edit-profile-contactno">
                                    <div id="edit-profile-contactno-error" class="edit-profile-error-message"></div>
                                </div>

                                <div class="col-md-6"><label class="labels">Date Of Birth</label>
                                    <input type="date" class="form-control" name="edit-profile-dob" id="edit-profile-dob" value="${requestScope.dateOfBirth}">
                                    <div id="edit-profile-dob-error" class="edit-profile-error-message"></div>
                                </div>

                            </div>

                            <div class="mt-5 text-center">
                                <button class="btn btn-primary profile-button" id="edit-profile-submit-button" type="submit">Save Profile</button>
                            </div>
                        </div>
                    </div>
                    <!-- Edit Profile -->
                </form>

            </div>
            <!-- Page content wrapper-->

        </div>
        <!--end of content-->

        <script>
            // var lastCheckedEmail = "";
            // var initialEmailValue;

            // window.onload = function () {
            //     initialEmailValue = document.getElementById("edit-profile-email").value;
            // }

            // function validateEmail() {
            //     var email = document.getElementById("edit-profile-email").value;
            //     var emailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            //     var errorDiv = document.getElementById("edit-profile-email-error");
            //     var statusDiv = document.getElementById("edit-profile-email-status");

            //     if (!email) {
            //         errorDiv.textContent = "Email is required.";
            //         return;
            //     }

            //     if (email === initialEmailValue) {
            //         // If the email is the same as the initial value, no need to check for duplicates
            //         errorDiv.textContent = "";
            //         return;
            //     }

            //     if (email !== lastCheckedEmail) {
            //         lastCheckedEmail = email;

            //         if (!email.match(emailFormat)) {
            //             errorDiv.textContent = "Invalid email format.";
            //         } else {
            //             errorDiv.textContent = "";
            //             statusDiv.textContent = "Searching...";

            //             var xhr = new XMLHttpRequest();
            //             xhr.open(
            //                     "GET",
            //                     "CheckDuplicateEmail?email=" + encodeURIComponent(email),
            //                     true
            //                     );
            //             xhr.onreadystatechange = function () {
            //                 if (xhr.readyState === 4) {
            //                     statusDiv.textContent = "";
            //                     if (xhr.status === 200) {
            //                         var response = xhr.responseText;
            //                         if (response === "duplicate") {
            //                             errorDiv.textContent = "Email is already registered.";
            //                         } else {
            //                             errorDiv.textContent = "";
            //                         }
            //                     } else {
            //                         errorDiv.textContent = "Error checking email availability. Please try again later.";
            //                     }
            //                 }
            //             };
            //             xhr.send();
            //         }
            //     }
            // }

            function validateFirstName() {
                var firstname = document.getElementById("edit-profile-firstname").value;
                var nameFormat = /^[a-zA-Z\s]+$/;
                var errorDiv = document.getElementById("edit-profile-firstname-error");
                if (!firstname) {
                    errorDiv.textContent = "First Name is required.";
                } else if (firstname.length < 2) {
                    errorDiv.textContent =
                            "First Name must be at least 2 characters long.";
                } else if (!firstname.match(nameFormat)) {
                    errorDiv.textContent =
                            "First Name should only consists of alphabets and spaces.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateLastName() {
                var lastname = document.getElementById("edit-profile-lastname").value;
                var nameFormat = /^[a-zA-Z\s]+$/;
                var errorDiv = document.getElementById("edit-profile-lastname-error");
                if (!lastname) {
                    errorDiv.textContent = "Last Name is required.";
                } else if (lastname.length < 2) {
                    errorDiv.textContent =
                            "Last Name must be at least 2 characters long.";
                } else if (!lastname.match(nameFormat)) {
                    errorDiv.textContent =
                            "First Name should only consists of alphabets and spaces.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateContactNo() {
                var contactNo = document.getElementById("edit-profile-contactno").value;
                var phoneFormat =
                        /^6?(?:01[02346-9]\d{7}|011\d{8}|015\d{8}|03\d{8}|0[4-9]\d{7})$/;
                var errorDiv = document.getElementById("edit-profile-contactno-error");
                if (!contactNo) {
                    errorDiv.textContent = "Contact No. is required.";
                } else if (!contactNo.match(phoneFormat)) {
                    errorDiv.textContent = "Invalid phone format.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateDateOfBirth() {
                var dateOfBirth = document.getElementById("edit-profile-dob").value;
                var errorDiv = document.getElementById("edit-profile-dob-error");
                if (!dateOfBirth) {
                    errorDiv.textContent = "Date of Birth is required.";
                } else {
                    var today = new Date();
                    var dob = new Date(dateOfBirth);
                    var difference = today - dob;
                    var age = Math.floor(difference / (1000 * 60 * 60 * 24 * 365));
                    if (isNaN(age) || age < 12) {
                        errorDiv.textContent = "You must be at least 12 years old to sign up.";
                    } else {
                        errorDiv.textContent = "";
                    }
                }
            }

            // Add event listeners to trigger validations
            // document
            //         .getElementById("edit-profile-email")
            //         .addEventListener("blur", validateEmail);
            document
                    .getElementById("edit-profile-firstname")
                    .addEventListener("blur", validateFirstName);
            document
                    .getElementById("edit-profile-lastname")
                    .addEventListener("blur", validateLastName);
            document
                    .getElementById("edit-profile-contactno")
                    .addEventListener("blur", validateContactNo);
            document
                    .getElementById("edit-profile-dob")
                    .addEventListener("blur", validateDateOfBirth);


            function validateAllFields() {
                // Trigger validation for all fields
                // validateEmail();
                validateFirstName();
                validateLastName();
                validateContactNo();
                validateDateOfBirth();

                // Perform form submission if there are no validation errors
                if (!hasValidationError()) {
                    document.getElementById("edit-profile-form").submit();
                }
            }

            function hasValidationError() {
                // Validation error flags for each field
                // var emailError =
                //         document.getElementById(
                //                 "edit-profile-email-error"
                //                 ).textContent;
                // var emailStatus = document.getElementById(
                //         "edit-profile-email-status"
                //         ).textContent;
                var firstNameError = document.getElementById(
                        "edit-profile-firstname-error"
                        ).textContent;
                var lastNameError = document.getElementById(
                        "edit-profile-lastname-error"
                        ).textContent;
                var contactNoError = document.getElementById(
                        "edit-profile-contactno-error"
                        ).textContent;
                var dobError = document.getElementById(
                        "edit-profile-dob-error"
                        ).textContent;


                // Check if any validation error exists
                return (
                        // emailError ||
                        firstNameError ||
                        lastNameError ||
                        contactNoError ||
                        dobError 
                        // emailStatus === "Searching..."
                        );
            }

            document.getElementById("edit-profile-submit-button").addEventListener("click", function (event) {
                event.preventDefault();
                validateAllFields();
                if (hasValidationError()) {
                    alert("Please correct the validation errors before submitting the form.");
                }
            });
        </script>
    </body>
    <%--footer--%>
    <jsp:include page="admin-components/footer.jsp" />
</html>