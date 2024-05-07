<%@page contentType="text/html" pageEncoding="UTF-8"%> <%--imports--%> <%@page
    import="entity.Product,java.util.ArrayList"%> <%--tags--%> <%@ taglib
        prefix="custom" tagdir="/WEB-INF/tags" %>

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


                <h1>Sign Up</h1>

                <form action="signup" method="post" id="signup-form">
                    <label>Username</label>
                    <input name="signup-username" id="signup-username" type="text" required
                           value="<%= (request.getParameter("signup-username") != null)
                                   ? request.getParameter("signup-username") : ""%>" /><br />
                    <div id="signup-username-error" class="signup-error-message"></div>
                    <div id="signup-username-status" class="signup-status-message"></div>
                    <br />

                    <label>First Name</label>
                    <input name="signup-firstname" id="signup-firstname" type="text"
                           value="<%= (request.getParameter("signup-firstname") != null)
                                   ? request.getParameter("signup-firstname") : ""%>"/><br />
                    <div id="signup-firstname-error" class="signup-error-message"></div>
                    <br />

                    <label>Last Name</label>
                           <input name="signup-lastname" id="signup-lastname" type="text" value="<%=(request.getParameter("signup-lastname") != null)
                                   ? request.getParameter("signup-lastname") : ""%>"/><br />
                    <div id="signup-lastname-error" class="signup-error-message"></div>
                    <br />

                    <label>Gender</label>
                    <input type="radio" id="male" name="signup-gender" value="M" <% if ("M".equals(request.getParameter("signup-gender"))) { %> checked <% } %>
                           />
                    <label for="male">Male</label>
                    <input type="radio" id="female" name="signup-gender" value="F" <% if ("F".equals(request.getParameter("signup-gender"))) { %> checked <% } %>
                           />
                    <label for="female">Female</label>
                    <input type="radio" id="undefined" name="signup-gender" value="-" <% if ("-".equals(request.getParameter("signup-gender"))) { %> checked <% }%>
                           />
                    <label for="undefined">Prefer not to say</label>
                    <br />
                    <div id="signup-gender-error" class="signup-error-message"></div>
                    <br />

                    <label>Email</label>
                           <input name="signup-email" id="signup-email" type="email" value="<%=(request.getParameter("signup-email") != null)
                                   ? request.getParameter("signup-email") : ""%>"/><br />
                    <div id="signup-email-error" class="signup-error-message"></div>
                    <div id="signup-email-status" class="signup-status-message"></div>
                    <br />

                    <label>Contact No</label>
                    <input name="signup-contactNo" id="signup-contactNo" type="text"
                           value="<%= (request.getParameter("signup-contactNo") != null)
                                   ? request.getParameter("signup-contactNo") : ""%>"/><br />
                    <div id="signup-contactNo-error" class="signup-error-message"></div>
                    <br />

                    <label>Password</label>
                    <input name="signup-userPwd" id="signup-userPwd" type="password" /><br />
                    <div id="signup-userPwd-error" class="signup-error-message"></div>
                    <br />

                    <label>Confirm Password</label>
                    <input
                        name="signup-confirmPwd"
                        id="signup-confirmPwd"
                        type="password"
                        /><br />
                    <div id="signup-confirmPwd-error" class="signup-error-message"></div>
                    <br />

                    <label>Date of Birth</label>
                    <input name="signup-dateOfBirth" id="signup-dateOfBirth" type="date"
                           value="<%= (request.getParameter("signup-dateOfBirth") != null)
                                   ? request.getParameter("signup-dateOfBirth") : ""%>" /><br />
                    <div id="signup-dateOfBirth-error" class="signup-error-message"></div>
                    <br />

                    <form id="address-form" action="" method="get" autocomplete="off">
                        <label class="full-field">
                            <span class="form-label">Address</span>
                            <input id="ship-address" name="ship-address" required
                                   autocomplete="off" value="<%= (request.getParameter("ship-address")
                                           != null) ? request.getParameter("ship-address") : ""%>" />
                        </label>
                        <label class="full-field">
                            <span class="form-label"
                                  >Apartment, unit, suite, or floor (optional)</span
                            >
                                   <input id="address2" name="address2" value="<%=(request.getParameter("address2") != null)
                                           ? request.getParameter("address2") : ""%>" readonly/>
                        </label>
                        <br /><br />
                        <label class="full-field">
                            <span class="form-label">City</span>
                                   <input id="locality" name="locality" value="<%=(request.getParameter("locality") != null)
                                           ? request.getParameter("locality") : ""%>" required readonly />
                        </label>
                        <label class="slim-field-start">
                            <span class="form-label">State</span>
                                   <input id="state" name="state" required value="<%=(request.getParameter("state") != null)
                                           ? request.getParameter("state") : ""%>" readonly />
                        </label>
                        <br /><br />
                        <label class="slim-field-end" for="postal_code">
                            <span class="form-label">Postal code</span>
                                   <input id="postcode" name="postcode" required value="<%=(request.getParameter("postcode") != null)
                                           ? request.getParameter("postcode") : ""%>" readonly />
                        </label>
                        <label class="full-field">
                            <span class="form-label">Country</span>
                                   <input id="country" name="country" value="<%=(request.getParameter("country") != null)
                                           ? request.getParameter("country") : ""%>" required readonly />
                        </label>
                        <br /><br />
                    </form>
                    <div id="ship-address-error" class="signup-error-message"></div>
                    <br />
                    <br />

                    <button type="submit" id="signup-submit-button">Sign Up</button>
                    <a href="SignIn.jsp"><button type="button">Back to sign in</button></a>
                </form>
                <script>
                    var lastCheckedUsername = ""; // Variable to store the last checked username

                    function validateUsername() {
                        var username = document.getElementById("signup-username").value;

                        // Check if the username has changed since the last validation
                        if (username !== lastCheckedUsername) {
                            lastCheckedUsername = username; // Update the last checked username

                            var nameFormat = /^[a-zA-Z0-9]+$/;
                            var errorDiv = document.getElementById("signup-username-error");
                            var statusDiv = document.getElementById("signup-username-status");

                            if (!username) {
                                errorDiv.textContent = "Username is required.";
                            } else if (username.length < 2) {
                                errorDiv.textContent =
                                        "Username must be at least 2 characters long.";
                            } else if (!username.match(nameFormat)) {
                                errorDiv.textContent =
                                        "Username should only consist of alphabets and numbers.";
                            } else {
                                // Clear previous error messages
                                errorDiv.textContent = "";
                                statusDiv.textContent = "Searching..."; // Set status message here

                                // Perform AJAX request to check if username is already taken
                                var xhr = new XMLHttpRequest();
                                xhr.open(
                                        "GET",
                                        "CheckDuplicateUsername?username=" + encodeURIComponent(username),
                                        true
                                        );
                                xhr.onreadystatechange = function () {
                                    if (xhr.readyState === 4) {
                                        statusDiv.textContent = ""; // Clear status message
                                        if (xhr.status === 200) {
                                            var response = xhr.responseText;
                                            if (response === "duplicate") {
                                                errorDiv.textContent = "Username is already taken.";
                                            } else {
                                                errorDiv.textContent = "";
                                            }
                                        } else {
                                            errorDiv.textContent =
                                                    "Error checking username availability. Please try again later.";
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

                    var lastCheckedEmail = ""; // Variable to store the last checked email

                    function validateEmail() {
                        var email = document.getElementById("signup-email").value;
                        var emailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                        // Check if the email has changed since the last validation
                        if (email !== lastCheckedEmail) {
                            lastCheckedEmail = email; // Update the last checked email
                            var errorDiv = document.getElementById("signup-email-error");
                            var statusDiv = document.getElementById("signup-email-status");

                            if (!email) {
                                errorDiv.textContent = "Email is required.";
                            } else if (!email.match(emailFormat)) {
                                errorDiv.textContent =
                                        "Invalid email format.";
                            } else {
                                // Clear previous error messages
                                errorDiv.textContent = "";
                                statusDiv.textContent = "Searching..."; // Set status message here

                                // Perform AJAX request to check if username is already taken
                                var xhr = new XMLHttpRequest();
                                xhr.open(
                                        "GET",
                                        "CheckDuplicateEmail?email=" + encodeURIComponent(email),
                                        true
                                        );
                                xhr.onreadystatechange = function () {
                                    if (xhr.readyState === 4) {
                                        statusDiv.textContent = ""; // Clear status message
                                        if (xhr.status === 200) {
                                            var response = xhr.responseText;
                                            if (response === "duplicate") {
                                                errorDiv.textContent = "Email is already registered.";
                                            } else {
                                                errorDiv.textContent = "";
                                            }
                                        } else {
                                            errorDiv.textContent =
                                                    "Error checking email availability. Please try again later.";
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
                                ) {
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
                            if (isNaN(age) || age < 1) {
                                errorDiv.textContent = "Invalid Date of Birth.";
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
                        var errorDiv = document.getElementById("ship-address-error");
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
                                document.getElementById("signup-email-error").textContent;
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
                                document.getElementById("ship-address-error").textContent;

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

                    document
                            .getElementById("signup-submit-button")
                            .addEventListener("click", function (event) {
                                // Prevent the default form submission behavior
                                event.preventDefault();

                                validateAllFields();
                                // Perform your form validation here
                                if (hasValidationError()) {
                                    // If there are validation errors, display them and prevent form submission
                                    // You can optionally display an error message or highlight the fields with errors
                                    alert(
                                            "Please correct the validation errors before submitting the form."
                                            );
                                }
                            });
                </script>
                <script
                    async
                    defer
                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjUgiiuQxHnVKzlXWADiT4T9YxjQda4Q0&callback=initAutocomplete&libraries=places&v=weekly"
                ></script>
                <!--footer-->
                <jsp:include page="components/footer.jsp" />
            </body>
        </html>
