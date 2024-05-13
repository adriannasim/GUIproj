<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%--imports--%> 
<%@page import="entity.Product,java.util.ArrayList"%> 

<%--tags--%> 
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--header--%>
<jsp:include page="components/Header.jsp" />

<!DOCTYPE html>
<html>
    <head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link rel="shortcut icon" href="favicon.png">
        <title>Bong Bong</title>

        <!-- Theme -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="assets/css/tiny-slider.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">

        <style>
            .signup-error-message{
                color: red;
                font-size: 12px;
            }
            .signup-status-message{
                font-size: 12px;
                color: gray;
            }
            .radio-btn-group input,
            .radio-btn-group label{
                cursor: pointer;
            }
        </style>

        <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
        <script src="assets/js/GoogleAutocomplete.js"></script>
    </head>
    <body>
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

        <!-- Background image -->
        <div class="p-5 bg-image" style="background-color:#3b5d50;
             height: 300px;
             "></div>
        <!-- Background image -->

        <!-- Section: Design Block -->
        <section class="text-center  d-flex justify-content-center">

            <div class="card mx-4 mx-md-5 shadow-5-strong bg-body-tertiary" style="
                 margin-top: -100px;
                 backdrop-filter: blur(30px);
                 width: 60%;
                 margin-bottom: 60px;
                 border-radius: 20px;
                 ">
                <div class="card-body py-5 px-md-5">

                    <div class="row d-flex justify-content-center">
                        <div class="col-lg-8">
                            <h2 class="fw-bold mb-5">Sign up now</h2>
                            <form action="signup" method="post" id="signup-form">
                                <!-- 2 column grid layout with text inputs for the first and last names -->
                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <div data-mdb-input-init class="form-outline">
                                            <label class="form-label" for="signup-username">Username<span class="text-danger">*</span></label>
                                            <input class="form-control" name="signup-username" id="signup-username" 
                                                   type="text" required
                                                   value="<%= (request.getParameter("signup-username") != null)
                                                           ? request.getParameter("signup-username") : ""%>" />
                                            <div id="signup-username-error" class="signup-error-message"></div>
                                            <div id="signup-username-status" class="signup-status-message"></div>
                                        </div>
                                    </div>

                                    <!-- Email input -->
                                    <div data-mdb-input-init class="col-md-6 mb-4">
                                        <label class="form-label" for="signup-email">Email<span class="text-danger">*</span></label>
                                        <input class="form-control" name="signup-email" id="signup-email" 
                                               type="email" value="<%=(request.getParameter("signup-email") != null)
                                                       ? request.getParameter("signup-email") : ""%>"/>
                                        <div id="signup-email-error" class="signup-error-message"></div>
                                        <div id="signup-email-status" class="signup-status-message"></div>
                                    </div>

                                    <!-- First Name input -->
                                    <div class="col-md-6 mb-4">
                                        <div data-mdb-input-init class="form-outline">
                                            <label class="form-label" for="signup-firstname">First name<span class="text-danger">*</span></label>
                                            <input class="form-control" name="signup-firstname" id="signup-firstname" 
                                                   type="text"
                                                   value="<%= (request.getParameter("signup-firstname") != null)
                                                           ? request.getParameter("signup-firstname") : ""%>"/>
                                            <div id="signup-firstname-error" class="signup-error-message"></div>
                                        </div>
                                    </div>

                                    <!-- Last Name input -->
                                    <div class="col-md-6 mb-4">
                                        <div data-mdb-input-init class="form-outline">
                                            <label class="form-label" for="signup-lastname">Last name<span class="text-danger">*</span></label>
                                            <input class="form-control" name="signup-lastname" 
                                                   id="signup-lastname" type="text" 
                                                   value="<%=(request.getParameter("signup-lastname") != null)
                                                           ? request.getParameter("signup-lastname") : ""%>"/>
                                            <div id="signup-lastname-error" class="signup-error-message"></div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Gender input -->
                                <div form-outline mb-4>
                                    <label for="signup-gender">Gender<span class="text-danger">*</span></label>
                                    <div class="radio-btn-group">
                                        <input class="mr-2" type="radio" id="male" name="signup-gender" value="M" 
                                               <% if ("M".equals(request.getParameter("signup-gender"))) { %> checked <% } %>
                                               />
                                        <label for="male" class="mr-3">Male</label> &nbsp; &nbsp; &nbsp;
                                        <input class="mr-2" type="radio" id="female" name="signup-gender" value="F" 
                                               <% if ("F".equals(request.getParameter("signup-gender"))) { %> checked <% } %>
                                               />
                                        <label for="female" class="mr-3">Female</label> &nbsp; &nbsp; &nbsp;
                                        <input class="mr-2" type="radio" id="undefined" name="signup-gender" value="-" 
                                               <% if ("-".equals(request.getParameter("signup-gender"))) { %> checked <% }%>
                                               />
                                        <label for="undefined" class="mr-3">Prefer not to say</label>
                                        <hr>
                                    </div>
                                    <div id="signup-gender-error" class="signup-error-message"></div>
                                </div>

                                <!-- Contact input -->
                                <div data-mdb-input-init class="form-outline mb-4">
                                    <label class="form-label" for="signup-contactNo">Contact<span class="text-danger">*</span></label>
                                    <input class="form-control" name="signup-contactNo" id="signup-contactNo" type="text"
                                           value="<%= (request.getParameter("signup-contactNo") != null)
                                                   ? request.getParameter("signup-contactNo") : ""%>"/>
                                    <div id="signup-contactNo-error" class="signup-error-message"></div>
                                </div>

                                <!-- Date Of Birth input -->
                                <div data-mdb-input-init class="form-outline mb-4">
                                    <label class="form-label" for="signup-dateOfBirth">Date Of Birth<span class="text-danger">*</span></label>
                                    <input class="form-control" name="signup-dateOfBirth" id="signup-dateOfBirth" type="date"
                                           value="<%= (request.getParameter("signup-dateOfBirth") != null)
                                                   ? request.getParameter("signup-dateOfBirth") : ""%>" />
                                    <div id="signup-dateOfBirth-error" class="signup-error-message"></div>
                                </div>

                                <!-- Password input -->
                                <div data-mdb-input-init class="form-outline mb-4">
                                    <label class="form-label" for="signup-userPwd">Password<span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <input class="form-control" name="signup-userPwd" id="signup-userPwd" type="password" />
                                        <span class="input-group-text" id="togglePassword">
                                            <i class="fas fa-eye" id="toggleIcon"></i>
                                        </span>
                                    </div>
                                    <div id="signup-userPwd-error" class="signup-error-message"></div>
                                </div>

                                <div data-mdb-input-init class="form-outline mb-4">
                                    <label class="form-label" for="signup-confirmPwd">Confirm Password<span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <input class="form-control" name="signup-confirmPwd" id="signup-confirmPwd" type="password"/>
                                        <span class="input-group-text" id="toggleConfirmPassword">
                                            <i class="fas fa-eye" id="toggleConfirmIcon"></i>
                                        </span>
                                    </div>
                                    <div id="signup-confirmPwd-error" class="signup-error-message"></div>
                                </div>

                                <form id="address-form" action="" method="get" autocomplete="off">
                                    <!-- Address input -->
                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <div data-mdb-input-init class="form-outline">
                                            <label class="form-label" for="ship-address">Address<span class="text-danger">*</span></label>
                                            <input class="form-control" id="ship-address" name="ship-address" 
                                                   required autocomplete="off" 
                                                   value="<%= (request.getParameter("ship-address") != null)
                                                           ? request.getParameter("ship-address") : ""%>" />
                                            <div id="signup-address-error" class="signup-error-message"></div>
                                        </div>
                                    </div>

                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <label class="form-label" for="address2">Unit / Apartment (optional)</label>
                                        <input class="form-control" id="address2" name="address2" 
                                               value="<%=(request.getParameter("address2") != null)
                                                       ? request.getParameter("address2") : ""%>"/>
                                    </div>

                                    <div class="row">
                                        <!-- City input -->
                                        <div class="col-md-6 mb-4">
                                            <div data-mdb-input-init class="form-outline">
                                                <label class="form-label" for="locality">City<span class="text-danger">*</span></label>
                                                <input class="form-control" id="locality" name="locality" 
                                                       value="<%=(request.getParameter("locality") != null)
                                                               ? request.getParameter("locality") : ""%>" required readonly />
                                            </div>
                                        </div>

                                        <!-- State input -->
                                        <div class="col-md-6 mb-4">
                                            <div data-mdb-input-init class="form-outline">
                                                <label class="form-label" for="state">State<span class="text-danger">*</span></label>
                                                <input class="form-control" id="state" name="state" 
                                                       required value="<%=(request.getParameter("state") != null)
                                                               ? request.getParameter("state") : ""%>" readonly />
                                            </div>
                                        </div>

                                        <!-- Postal Code input -->
                                        <div class="col-md-6 mb-4">
                                            <div data-mdb-input-init class="form-outline">
                                                <label class="form-label" for="postcode">Postal Code<span class="text-danger">*</span></label>
                                                <input class="form-control" id="postcode" name="postcode" 
                                                       required value="<%=(request.getParameter("postcode") != null)
                                                               ? request.getParameter("postcode") : ""%>" readonly />
                                            </div>
                                        </div>

                                        <!-- Country input -->
                                        <div class="col-md-6 mb-4">
                                            <div data-mdb-input-init class="form-outline">
                                                <label class="form-label" for="country">Country<span class="text-danger">*</span></label>
                                                <input class="form-control" id="country" name="country" 
                                                       value="<%=(request.getParameter("country") != null)
                                                               ? request.getParameter("country") : ""%>" required readonly />
                                            </div>
                                        </div>
                                    </div>
                                </form>


                                <!-- Submit button -->
                                <button type="submit" data-mdb-button-init data-mdb-ripple-init 
                                        class="btn btn-primary btn-block btn-rounded mb-4"
                                        id="signup-submit-button"
                                        style="background-color:black;color:white;border-radius:30px;">
                                    Sign up
                                </button>
                            </form> 

                            <!-- Login buttons -->
                            <div class="text-center">
                                <p>
                                    <a style="text-decoration:none;" href="SignIn.jsp" class="si_backlink"
                                       id="signupLink">Back to Sign In</a>
                                </p>
                            </div>

                            <!-- Register buttons -->
                            <div class="text-center">
                                <p>or sign up with:</p>
                                <img src="img/facebook.png" width="34px" height="34px" alt="facebook"/>

                                <img src="img/twitter.png" width="31px" height="31px" alt="twitter"
                                     style="margin-left:10px;"/>

                                <img src="img/google.png" width="31px" height="31px" alt="google"
                                     style="margin-left:10px;"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Section: Design Block -->

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

            // Toggle password visibility for signup-userPwd
            document.getElementById('togglePassword').addEventListener('click', function () {
                var pwdInput = document.getElementById('signup-userPwd');
                var icon = document.getElementById('toggleIcon');
                if (pwdInput.type === 'password') {
                    pwdInput.type = 'text';
                    icon.classList.remove('fa-eye');
                    icon.classList.add('fa-eye-slash');
                } else {
                    pwdInput.type = 'password';
                    icon.classList.remove('fa-eye-slash');
                    icon.classList.add('fa-eye');
                }
            });

            // Toggle password visibility for signup-confirmPwd
            document.getElementById('toggleConfirmPassword').addEventListener('click', function () {
                var confirmPwdInput = document.getElementById('signup-confirmPwd');
                var icon = document.getElementById('toggleConfirmIcon');
                if (confirmPwdInput.type === 'password') {
                    confirmPwdInput.type = 'text';
                    icon.classList.remove('fa-eye');
                    icon.classList.add('fa-eye-slash');
                } else {
                    confirmPwdInput.type = 'password';
                    icon.classList.remove('fa-eye-slash');
                    icon.classList.add('fa-eye');
                }
            });

        </script>

        <script
            async
            defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjUgiiuQxHnVKzlXWADiT4T9YxjQda4Q0&callback=initAutocomplete&libraries=places&v=weekly"
        ></script>

        <%--footer--%>
        <jsp:include page="components/Footer.jsp" />
    </body>
</html>
