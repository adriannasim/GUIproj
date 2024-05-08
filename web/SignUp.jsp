<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%--imports--%> 
<%@page import="entity.Product,java.util.ArrayList"%> 

<%--tags--%> 
<%@ include file="css/bootstrapStyles.jsp" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Sign Up</title>

        <!-- Include commonFiles.tag -->
        <custom:commonFiles />

        <style>
            .signup-error-message {
                color: red;
            }
        </style>

        <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    </head>

    <body class="text-center">
        <!--header-->
        <jsp:include page="components/header.jsp" />

        <!-- Start of Message Div -->
        <%
            String message = (String) session.getAttribute("message");
            if (message != null) {
        %>
        <div id="messageDiv"><%= message%></div>
        <script>
            setTimeout(function () {
                var messageDiv = document.getElementById("messageDiv");
                messageDiv.style.display = "none";
            }, 5000);
        </script>
        <%
                session.removeAttribute("message");
            }
        %>
        <!-- End of Message Div -->

        <h2 class="so_title">Sign Up</h2>

        <form action="signup" method="post" id="signup-form">
            <div class="container">

                <!-- Start of PK Row -->
                <div class="row justify-content-md-center mt-4">
                    <div class="col-1">
                        <label>Username</label>
                    </div>
                    <div class="col-4">
                        <input class="form-control" name="signup-username" id="signup-username" type="text" required
                               value="<%= (request.getParameter("signup-username") != null)
                                       ? request.getParameter("signup-username") : ""%>" />
                        <div id="signup-username-error" class="signup-error-message"></div>
                        <div id="signup-username-status" class="signup-status-message"></div><br/><br/>
                    </div>
                    <div class="col-1">
                        <label>Email</label> 
                    </div>
                    <div class="col-4">
                           <input class="form-control" name="signup-email" id="signup-email" type="email" value="<%=(request.getParameter("signup-email") != null)
                                ? request.getParameter("signup-email") : ""%>"/>
                        <div id="signup-email-error" class="signup-error-message"></div>
                        <div id="signup-email-status" class="signup-status-message"></div>
                    </div>
                </div>
                <!-- End of PK Row -->

                <!-- Start of Name Row -->
                <div class="row justify-content-md-center">
                    <div class="col-1">
                        <label>First Name</label>
                    </div>
                    <div class="col-4">
                        <input class="form-control" name="signup-firstname" id="signup-firstname" type="text"
                               value="<%= (request.getParameter("signup-firstname") != null)
                                       ? request.getParameter("signup-firstname") : ""%>"/>
                        <div id="signup-firstname-error" class="signup-error-message"></div><br/><br/>
                    </div>
                    <div class="col-1">
                        <label>Last Name</label> 
                    </div>
                    <div class="col-4">
                           <input class="form-control" name="signup-lastname" id="signup-lastname" type="text" value="<%=(request.getParameter("signup-lastname") != null)
                                ? request.getParameter("signup-lastname") : ""%>"/>
                        <div id="signup-lastname-error" class="signup-error-message"></div><br/><br/>
                    </div>
                </div>
                <!-- End of Name Row --> 

                <!-- Start of Gender & Contact No Row -->
                <div class="row justify-content-md-center">
                    <div class="col-1">
                        <label>Gender</label>
                    </div>
                    <div class="col-4">
                        <input class="mr-2" type="radio" id="male" name="signup-gender" value="M" <% if ("M".equals(request.getParameter("signup-gender"))) { %> checked <% } %>
                               />
                        <label for="male" class="mr-3">Male</label>
                        <input class="mr-2" type="radio" id="female" name="signup-gender" value="F" <% if ("F".equals(request.getParameter("signup-gender"))) { %> checked <% } %>
                               />
                        <label for="female" class="mr-3">Female</label>
                        <input class="mr-2" type="radio" id="undefined" name="signup-gender" value="-" <% if ("-".equals(request.getParameter("signup-gender"))) { %> checked <% }%>
                               />
                        <label for="undefined" class="mr-3">Prefer not to say</label>
                        <div id="signup-gender-error" class="signup-error-message"></div>
                    </div>
                    <div class="col-1">
                        <label>Contact</label> 
                    </div>
                    <div class="col-4">
                        <input class="form-control" name="signup-contactNo" id="signup-contactNo" type="text"
                               value="<%= (request.getParameter("signup-contactNo") != null)
                                       ? request.getParameter("signup-contactNo") : ""%>"/>
                        <div id="signup-contactNo-error" class="signup-error-message"></div><br/><br/>
                    </div>
                </div>
                <!-- End of Gender & Contact No Row -->

                <!-- Start of Password Row -->
                <div class="row justify-content-md-center">
                    <div class="col-1">
                        <label>Password</label> 
                    </div>
                    <div class="col-4">
                        <input class="form-control" name="signup-userPwd" id="signup-userPwd" type="password" />
                        <div id="signup-userPwd-error" class="signup-error-message"></div><br/><br/>
                    </div>
                    <div class="col-1">
                        <label>Confirm Password</label> 
                    </div>
                    <div class="col-4">
                        <input class="form-control" name="signup-confirmPwd" id="signup-confirmPwd" type="password"/>
                        <div id="signup-confirmPwd-error" class="signup-error-message"></div><br/><br/>
                    </div>
                </div>
                <!-- End of Password Row --> 

                <!-- Start of DOB Row -->
                <div class="row justify-content-md-center">
                    <div class="col-1">
                        <label>Date of Birth</label>
                    </div>
                    <div class="col-4">
                        <input class="form-control" name="signup-dateOfBirth" id="signup-dateOfBirth" type="date"
                               value="<%= (request.getParameter("signup-dateOfBirth") != null)
                                       ? request.getParameter("signup-dateOfBirth") : ""%>" />
                        <div id="signup-dateOfBirth-error" class="signup-error-message"></div><br/><br/>
                    </div>
                    <div class="col-1">

                    </div>
                    <div class="col-4">

                    </div>
                </div>
                <!-- End of DOB Row -->

                <!-- Start of address from -->
                <form id="address-form" action="" method="get" autocomplete="off"> 
                    <!-- First Row Start -->
                    <div class="row justify-content-md-center">
                        <div class="col-1">
                            <label class="full-field">
                                <span class="form-label">Address</span>
                            </label>
                        </div>
                        <div class="col-4">
                            <input class="form-control" id="ship-address" name="ship-address" required autocomplete="off" 
                                   value="<%= (request.getParameter("ship-address") != null) ? request.getParameter("ship-address") : ""%>" />
                            <div id="signup-address-error" class="signup-error-message"></div><br/><br/>
                        </div>
                        <div class="col-1">
                            <label class="full-field">
                                <span class="form-label">Unit / Apartment (optional)</span>
                            </label>
                        </div>
                        <div class="col-4">
                            <input class="form-control" id="address2" name="address2" value="<%=(request.getParameter("address2") != null) ? request.getParameter("address2") : ""%>" readonly/><br/><br/>
                        </div>
                    </div>
                    <!-- First Row End -->

                    <!-- Second Row Start -->
                    <div class="row justify-content-md-center">
                        <div class="col-1">
                            <label class="full-field">
                                <span class="form-label">City</span>
                            </label>
                        </div>
                        <div class="col-4">
                            <input class="form-control" id="locality" name="locality" value="<%=(request.getParameter("locality") != null) ? request.getParameter("locality") : ""%>" required readonly />
                        </div>
                        <div class="col-1">
                            <label class="slim-field-start">
                                <span class="form-label">State</span>
                            </label>
                        </div>
                        <div class="col-4">
                            <input class="form-control" id="state" name="state" required value="<%=(request.getParameter("state") != null) ? request.getParameter("state") : ""%>" readonly /><br/><br/>
                        </div>
                    </div>
                    <!-- Second Row End -->

                    <!-- Third Row Start -->
                    <div class="row justify-content-md-center">
                        <div class="col-1">
                            <label class="slim-field-end" for="postal_code">
                                <span class="form-label">Postal code</span>
                            </label>
                        </div>
                        <div class="col-4">
                            <input class="form-control" id="postcode" name="postcode" required value="<%=(request.getParameter("postcode") != null) ? request.getParameter("postcode") : ""%>" readonly />
                        </div>
                        <div class="col-1">
                            <label class="slim-field-start">
                                <span class="form-label">Country</span>
                            </label>
                        </div>
                        <div class="col-4">
                            <input class="form-control" id="country" name="country" value="<%=(request.getParameter("country") != null) ? request.getParameter("country") : ""%>" required readonly /><br/><br/>
                        </div>
                    </div>
                    <!-- Third Row End -->
                </form>
                <!-- End of address from -->

                <!-- Start of Submit Button -->
                <div class="row justify-content-md-end">
                    <div class="col-3">
                        <div class="justify-content-md-end">
                            <button type="submit" id="signup-submit-button" class="btn btn-outline-success btn-block text-dark">Sign Up</button> 
                        </div>
                    </div>
                </div>
                <!-- End of Submit Button -->

                <!-- Start of Sign In Button -->
                <div class="row justify-content-md-start">
                    <div class="col-2 so_backlink">
                        <a href="SignIn.jsp" class="so_backlink">Back to Sign In</a>
                    </div>
                </div>
                <!-- End of Sign In Button -->

            </div>
        </form> 


        <script>
            var lastCheckedUsername = ""; // Variable to store the last checked username

            function validateUsername() {
                var username = document.getElementById("signup-username").value;
                var nameFormat = /^[a-zA-Z0-9]+$/;
                var errorDiv = document.getElementById("signup-username-error");
                var statusDiv = document.getElementById("signup-username-status");

                if (!username) {
                    errorDiv.textContent = "Username is required.";
                    return;
                }

                if (username !== lastCheckedUsername) {
                    lastCheckedUsername = username;

                    if (username.length < 2) {
                        errorDiv.textContent = "Username must be at least 2 characters long.";
                    } else if (!username.match(nameFormat)) {
                        errorDiv.textContent = "Username should only consist of alphabets and numbers.";
                    } else {
                        errorDiv.textContent = "";
                        statusDiv.textContent = "Searching...";

                        var xhr = new XMLHttpRequest();
                        xhr.open(
                                "GET",
                                "CheckDuplicateUsername?username=" + encodeURIComponent(username),
                                true
                                );
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState === 4) {
                                statusDiv.textContent = "";
                                if (xhr.status === 200) {
                                    var response = xhr.responseText;
                                    if (response === "duplicate") {
                                        errorDiv.textContent = "Username is already taken.";
                                    } else {
                                        errorDiv.textContent = "";
                                    }
                                } else {
                                    errorDiv.textContent = "Error checking username availability. Please try again later.";
                                }
                            }
                        };
                        xhr.send();
                    }
                }
            }

            function validateUserPwd() {
                var userPwd = document.getElementById("signup-userPwd").value;
                var confirmPwd = document.getElementById("signup-confirmPwd").value;
                var errorDiv = document.getElementById("signup-userPwd-error");
                var passFormat =
                        /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/;
                if (confirmPwd) {
                    validateConfirmPwd();
                }
                if (!userPwd) {
                    errorDiv.textContent = "Password is required.";
                } else if (!userPwd.match(passFormat)) {
                    errorDiv.textContent =
                            "Password must be minimum 8 and maximum 15 characters, at least one uppercase letter, one lowercase letter, one number and one special character from <@,$,!,%,*,?,&>";
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateConfirmPwd() {
                var userPwd = document.getElementById("signup-userPwd").value;
                var confirmPwd = document.getElementById("signup-confirmPwd").value;
                var errorDiv1 = document.getElementById("signup-userPwd-error");
                var errorDiv2 = document.getElementById("signup-confirmPwd-error");
                if (!userPwd) {
                    errorDiv1.textContent = "Please enter the password.";
                }
                if (!confirmPwd) {
                    errorDiv2.textContent = "Please enter the password again.";
                } else if (userPwd !== confirmPwd) {
                    errorDiv2.textContent = "Passwords do not match.";
                } else {
                    errorDiv2.textContent = "";
                }
            }

            var lastCheckedEmail = "";

            function validateEmail() {
                var email = document.getElementById("signup-email").value;
                var emailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                var errorDiv = document.getElementById("signup-email-error");
                var statusDiv = document.getElementById("signup-email-status");

                if (!email) {
                    errorDiv.textContent = "Email is required.";
                    return;
                }

                if (email !== lastCheckedEmail) {
                    lastCheckedEmail = email;

                    if (!email.match(emailFormat)) {
                        errorDiv.textContent = "Invalid email format.";
                    } else {
                        errorDiv.textContent = "";
                        statusDiv.textContent = "Searching...";

                        var xhr = new XMLHttpRequest();
                        xhr.open(
                                "GET",
                                "CheckDuplicateEmail?email=" + encodeURIComponent(email),
                                true
                                );
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState === 4) {
                                statusDiv.textContent = "";
                                if (xhr.status === 200) {
                                    var response = xhr.responseText;
                                    if (response === "duplicate") {
                                        errorDiv.textContent = "Email is already registered.";
                                    } else {
                                        errorDiv.textContent = "";
                                    }
                                } else {
                                    errorDiv.textContent = "Error checking email availability. Please try again later.";
                                }
                            }
                        };
                        xhr.send();
                    }
                }
            }

            function validateFirstName() {
                var firstname = document.getElementById("signup-firstname").value;
                var nameFormat = /^[a-zA-Z\s]+$/;
                var errorDiv = document.getElementById("signup-firstname-error");
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
                var lastname = document.getElementById("signup-lastname").value;
                var nameFormat = /^[a-zA-Z\s]+$/;
                var errorDiv = document.getElementById("signup-lastname-error");
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
                var contactNo = document.getElementById("signup-contactNo").value;
                var phoneFormat =
                        /^6?(?:01[02346-9]\d{7}|011\d{8}|015\d{8}|03\d{8}|0[4-9]\d{7})$/;
                var errorDiv = document.getElementById("signup-contactNo-error");
                if (!contactNo) {
                    errorDiv.textContent = "Contact No. is required.";
                } else if (!contactNo.match(phoneFormat)) {
                    errorDiv.textContent = "Invalid phone format.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateGender() {
                var errorDiv = document.getElementById("signup-gender-error");
                if (
                        !document.getElementById("male").checked &&
                        !document.getElementById("female").checked &&
                        !document.getElementById("undefined").checked
                        )
                {
                    errorDiv.textContent = "Gender is required.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateDateOfBirth() {
                var dateOfBirth = document.getElementById("signup-dateOfBirth").value;
                var errorDiv = document.getElementById("signup-dateOfBirth-error");
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

            function validateAddress() {
                var address = address1Field.value.trim();
                var locality = document.querySelector("#locality").value.trim();
                var state = document.querySelector("#state").value.trim();
                var postcode = postalField.value.trim();
                var country = document.querySelector("#country").value.trim();
                var errorDiv = document.getElementById("signup-address-error");
                if (!address && !locality && !state && !postcode && !country) {
                    errorDiv.textContent = "Address is required.";
                } else if (!address || !locality || !state || !postcode || !country) {
                    errorDiv.textContent = "Invalid address.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            // Add event listeners to trigger validation
            document
                    .getElementById("signup-username")
                    .addEventListener("blur", validateUsername);
            document
                    .getElementById("signup-userPwd")
                    .addEventListener("blur", validateUserPwd);
            document
                    .getElementById("signup-confirmPwd")
                    .addEventListener("blur", validateConfirmPwd);
            document
                    .getElementById("signup-email")
                    .addEventListener("blur", validateEmail);
            document
                    .getElementById("signup-firstname")
                    .addEventListener("blur", validateFirstName);
            document
                    .getElementById("signup-lastname")
                    .addEventListener("blur", validateLastName);
            document
                    .getElementById("signup-contactNo")
                    .addEventListener("blur", validateContactNo);
            document
                    .getElementById("signup-dateOfBirth")
                    .addEventListener("blur", validateDateOfBirth);
            document
                    .getElementById("ship-address")
                    .addEventListener("blur", validateAddress);
            document
                    .getElementById("male")
                    .addEventListener("click", validateGender);
            document
                    .getElementById("female")
                    .addEventListener("click", validateGender);
            document
                    .getElementById("undefined")
                    .addEventListener("click", validateGender);

            function validateAllFields() {
                // Trigger validation for all fields
                validateUsername();
                validateUserPwd();
                validateConfirmPwd();
                validateEmail();
                validateFirstName();
                validateLastName();
                validateContactNo();
                validateGender();
                validateDateOfBirth();
                validateAddress();

                // Perform form submission if there are no validation errors
                if (!hasValidationError()) {
                    document.getElementById("signup-form").submit();
                }
            }

            function hasValidationError() {
                // Validation error flags for each field
                var usernameError = document.getElementById(
                        "signup-username-error"
                        ).textContent;
                var usernameStatus = document.getElementById(
                        "signup-username-status"
                        ).textContent;
                var userPwdError = document.getElementById(
                        "signup-userPwd-error"
                        ).textContent;
                var confirmPwdError = document.getElementById(
                        "signup-confirmPwd-error"
                        ).textContent;
                var emailError =
                        document.getElementById(
                                "signup-email-error"
                                ).textContent;
                var emailStatus = document.getElementById(
                        "signup-email-status"
                        ).textContent;
                var firstNameError = document.getElementById(
                        "signup-firstname-error"
                        ).textContent;
                var lastNameError = document.getElementById(
                        "signup-lastname-error"
                        ).textContent;
                var contactNoError = document.getElementById(
                        "signup-contactNo-error"
                        ).textContent;
                var dobError = document.getElementById(
                        "signup-dateOfBirth-error"
                        ).textContent;
                var genderError = document.getElementById(
                        "signup-gender-error"
                        ).textContent;
                var addressError =
                        document.getElementById(
                                "signup-address-error"
                                ).textContent;

                // Check if any validation error exists
                return (
                        usernameError ||
                        userPwdError ||
                        confirmPwdError ||
                        emailError ||
                        firstNameError ||
                        lastNameError ||
                        contactNoError ||
                        dobError ||
                        genderError ||
                        addressError ||
                        usernameStatus === "Searching..." ||
                        emailStatus === "Searching..."
                        );
            }

            document.getElementById("signup-submit-button").addEventListener("click", function (event) {
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
        <!--footer-->

    </body>
    <jsp:include page="components/footer.jsp" />
</html>
