<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%--imports--%>
<%@page import="entity.Product,java.util.ArrayList"%> 

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <!-- Include commonFiles.tag -->
        <custom:commonFiles/>
        <style>
            .signup-error-message {
                color: red;
            }
        </style>
        <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:400,500"
            rel="stylesheet"
            />
    </head>
    <body>
        <h1>Sign Up</h1>

        <form action="signup" method="post" id="signup-form">
            <label>Username</label>
            <input name="signup-username" id="signup-username" type="text" required/><br/>
            <div id="signup-username-error" class="signup-error-message"></div><br>

            <label>First Name</label>
            <input name="signup-firstname" id="signup-firstname" type="text"/><br/>
            <div id="signup-firstname-error" class="signup-error-message"></div><br>

            <label>Last Name</label>
            <input name="signup-lastname" id="signup-lastname" type="text"/><br/>
            <div id="signup-lastname-error" class="signup-error-message"></div><br>

            <label>Gender</label>
            <input type="radio" id="male" name="signup-gender" value="M">
            <label for="male">Male</label>
            <input type="radio" id="female" name="signup-gender" value="F">
            <label for="female">Female</label>
            <input type="radio" id="undefined" name="signup-gender" value="-">
            <label for="undefined">Prefer not to say</label>
            <br/>
            <div id="signup-gender-error" class="signup-error-message"></div><br>

            <label>Email</label>
            <input name="signup-email" id="signup-email" type="email"/><br/>
            <div id="signup-email-error" class="signup-error-message"></div><br>

            <label>Contact No</label>
            <input name="signup-contactNo" id="signup-contactNo" type="text"/><br/>
            <div id="signup-contactNo-error" class="signup-error-message"></div><br>

            <label>Password</label>
            <input name="signup-userPwd" id="signup-userPwd" type="text"/><br/>
            <div id="signup-userPwd-error" class="signup-error-message"></div><br>

            <label>Confirm Password</label>
            <input name="signup-confirmPwd" id="signup-confirmPwd" type="text"/><br/>
            <div id="signup-confirmPwd-error" class="signup-error-message"></div><br>

            <label>Date of Birth</label>
            <input name="signup-dateOfBirth" id="signup-dateOfBirth" type="date"/><br/>
            <div id="signup-dateOfBirth-error" class="signup-error-message"></div><br>

            <form id="address-form" action="" method="get" autocomplete="off">
                <label class="full-field">
                    <span class="form-label">Address</span>
                    <input
                        id="ship-address"
                        name="ship-address"
                        required
                        autocomplete="off"
                        />
                </label>
                <label class="full-field">
                    <span class="form-label">Apartment, unit, suite, or floor (optional)</span>
                    <input id="address2" name="address2" readonly/>
                </label>
                <br/><br/>
                <label class="full-field">
                    <span class="form-label">City</span>
                    <input id="locality" name="locality" required readonly/>
                </label>
                <label class="slim-field-start">
                    <span class="form-label">State</span>
                    <input id="state" name="state" required readonly/>
                </label>
                <br/><br/>
                <label class="slim-field-end" for="postal_code">
                    <span class="form-label">Postal code</span>
                    <input id="postcode" name="postcode" required readonly/>
                </label>
                <label class="full-field">
                    <span class="form-label">Country</span>
                    <input id="country" name="country" required readonly/>
                </label>
                <br/><br/>
            </form>
            <div id="ship-address-error" class="signup-error-message"></div><br/>
            <br/>

            <button type="submit" id="signup-submit-button">Sign Up</button>
            <a href="SignIn.jsp"><button type="button">Back to sign in</button></a>
        </form>
        <script>

            function validateUsername() {
                var username = document.getElementById("signup-username").value;
                var errorDiv = document.getElementById("signup-username-error");
                if (!username) {
                    errorDiv.textContent = "Username is required.";
                } else if (username.length < 3) {
                    errorDiv.textContent = "Username must be at least 3 characters long.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateUserPwd() {
                var userPwd = document.getElementById("signup-userPwd").value;
                var confirmPwd = document.getElementById("signup-confirmPwd").value;
                var errorDiv = document.getElementById("signup-userPwd-error");
                var passFormat = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/;
                if (confirmPwd) {
                    validateConfirmPwd();
                }
                if (!userPwd) {
                    errorDiv.textContent = "Password is required.";
                } else if (!userPwd.match(passFormat)) {
                    errorDiv.textContent = "Password must be minimum 8 and maximum 15 characters, at least one uppercase letter, one lowercase letter, one number and one special character from <@,$,!,%,*,?,&>";
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

            function validateEmail() {
                var email = document.getElementById("signup-email").value;
                var emailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                var errorDiv = document.getElementById("signup-email-error");
                if (!email) {
                    errorDiv.textContent = "Email is required.";
                } else if (!email.match(emailFormat)) {
                    errorDiv.textContent = "Invalid email format.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateFirstName() {
                var firstname = document.getElementById("signup-firstname").value;
                var nameFormat = /^[a-zA-Z]+$/;
                var errorDiv = document.getElementById("signup-firstname-error");
                if (!firstname) {
                    errorDiv.textContent = "First Name is required.";
                } else if (firstname.length < 2) {
                    errorDiv.textContent = "First Name must be at least 2 characters long.";
                } else if (!firstname.match(nameFormat)) {
                    errorDiv.textContent = "First Name should only consists of alphabets.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateLastName() {
                var lastname = document.getElementById("signup-lastname").value;
                var nameFormat = /^[a-zA-Z]+$/;
                var errorDiv = document.getElementById("signup-lastname-error");
                if (!lastname) {
                    errorDiv.textContent = "Last Name is required.";
                } else if (lastname.length < 2) {
                    errorDiv.textContent = "Last Name must be at least 2 characters long.";
                } else if (!lastname.match(nameFormat)) {
                    errorDiv.textContent = "First Name should only consists of alphabets.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateContactNo() {
                var contactNo = document.getElementById("signup-contactNo").value;
                var phoneFormat = /^6?(?:01[02346-9]\d{7}|011\d{8}|015\d{8}|03\d{8}|0[4-9]\d{7})$/;
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
                if (!document.getElementById('male').checked &&
                        !document.getElementById('female').checked &&
                        !document.getElementById('undefined')) {
                    errorDiv.textContent = "Gender is required.";
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
                console.log("postcode is :" + postcode);
                if (!address && !locality && !state && !postcode && !country) {
                    errorDiv.textContent = "Address is required.";
                } else if (!address || !locality || !state || !postcode || !country) {
                    errorDiv.textContent = "Invalid address.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            // Add event listeners to trigger validation
            document.getElementById("signup-username").addEventListener("input", validateUsername);
            document.getElementById("signup-userPwd").addEventListener("input", validateUserPwd);
            document.getElementById("signup-confirmPwd").addEventListener("input", validateConfirmPwd);
            document.getElementById("signup-email").addEventListener("input", validateEmail);
            document.getElementById("signup-firstname").addEventListener("input", validateFirstName);
            document.getElementById("signup-lastname").addEventListener("input", validateLastName);
            document.getElementById("signup-contactNo").addEventListener("input", validateContactNo);
            document.getElementById("signup-dateOfBirth").addEventListener("input", validateDateOfBirth);
            document.getElementById("ship-address").addEventListener("input", validateAddress);
            function hasValidationError() {
                return (
                        document.getElementById("signup-username-error").textContent ||
                        document.getElementById("signup-userPwd-error").textContent ||
                        document.getElementById("signup-confirmPwd-error").textContent ||
                        document.getElementById("signup-email-error").textContent ||
                        document.getElementById("signup-firstname-error").textContent ||
                        document.getElementById("signup-lastname-error").textContent ||
                        document.getElementById("signup-contactNo-error").textContent ||
                        document.getElementById("signup-dateOfBirth-error").textContent ||
                        document.getElementById("signup-gender-error").textContent ||
                        document.getElementById("ship-address-error").textContent
                        );
            }

            // Function to enable or disable the submit button based on validation errors
            function updateSubmitButton() {
                var submitButton = document.getElementById("signup-submit-button");
                if (hasValidationError()) {
                    submitButton.disabled = true;
                } else {
                    submitButton.disabled = false;
                }
            }
        </script>
        <script
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjUgiiuQxHnVKzlXWADiT4T9YxjQda4Q0&callback=initAutocomplete&libraries=places&v=weekly"
            defer
        ></script>
    </body>
</html>
