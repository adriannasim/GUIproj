<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--imports--%>
<%@page import="jpaEntity.Employee,java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--includes--%>
<jsp:include page="/ManageAccounts"/>
<jsp:include page="/AddAccount"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Staff</title>

        <!-- Theme -->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <style>

            .editStaff {
                max-width: 800px;
                margin: 50px auto;
                position: relative;

            }
            .editStaff .title {
                text-align: center;
                text-transform: uppercase;
                letter-spacing: 3px;
                font-size: 3.2em;
                line-height: 48px;
                padding-bottom: 48px;
                color: #3b5d50;
                background: #3b5d50;
                -webkit-background-clip: text !important;
                -webkit-text-fill-color: transparent !important;
            }
            .contact-form .form-field {
                position: relative;
                margin: 32px 0;
            }
            .contact-form .input-text {
                display: block;
                width: 100%;
                height: 36px;
                border-width: 0 0 2px 0;
                border-color: #3b5d50;
                font-size: 18px;
                line-height: 26px;
                font-weight: 400;
            }
            .contact-form .inputGender {
                display: block;
                position: relative;
                top:20px;
            }
            .contact-form .input-text:focus {
                outline: none;
            }
            .contact-form .input-text:focus + .label,
            .contact-form .input-text.not-empty + .label {
                -webkit-transform: translateY(-24px);
                transform: translateY(-24px);
            }
            .contact-form .label {
                position: absolute;
                left: 17px;
                bottom: 20px;
                font-size: 18px;
                line-height: 26px;
                font-weight: 400;
                color: #3b5d50;
                cursor: text;
                transition: -webkit-transform .2s ease-in-out;
                transition: transform .2s ease-in-out;
                transition: transform .2s ease-in-out,
                    -webkit-transform .2s ease-in-out;
            }
            .contact-form .genderField {
                font-size: 18px;
                line-height: 26px;
                font-weight: 400;
                color: #3b5d50;
                margin-right: 15px;
            }
            .contact-form .submit-btn {
                display: inline-block;
                background-color: #3b5d50;
                color: #fff;
                text-transform: uppercase;
                letter-spacing: 2px;
                font-size: 16px;
                padding: 8px 16px;
                border: none;
                width:200px;
                cursor: pointer;
            }
        </style>
    </head>
    <body class="g-sidenav-show bg-gray-100">
        <section class="editStaff">
            <h1 class="title">Add Staff</h1>
            <div class="errorMsg row" style="position:relative;top:-20px;">
                <div class="col-sm">
                    <div id="errorUsernameDiv" style="color:red;font-size:13pt;"></div>
                    <div id="errorEmailDiv" style="color:red;font-size:13pt;"></div>
                    <div id="errorFirstNameDiv" style="color:red;font-size:13pt;"></div>
                    <div id="errorLastNameDiv" style="color:red;font-size:13pt;"></div>
                </div>
                <div class="col-sm">
                    <div id="errorContactDiv" style="color:red;font-size:13pt;"></div>
                    <div id="errorDateOfBirthDiv" style="color:red;font-size:13pt;"></div>
                    <div id="errorGenderDiv" style="color:red;font-size:13pt;"></div>
                </div>
            </div>

            <form class="contact-form row" action="AddAccount" method="post" id="editStaffForm">
                <div class="form-field col-lg-6">
                    <input id="username" name="username" class="input-text js-input" type="text"
                           value="<%= (request.getParameter("username") != null)
                                                           ? request.getParameter("username") : ""%>">
                    <label class="label" for="username">Staff Username:</label>
                </div>

                <div class="form-field col-lg-6 ">
                    <input id="empid" name="empid" class="input-text js-input" type="text"
                           value="<%= (request.getParameter("empid") != null)
                                                           ? request.getParameter("empid") : ""%>">
                    <label class="label" for="empid">Staff ID</label>
                </div>

                <div class="form-field col-lg-6 ">
                    <input id="firstname" name="firstname" class="input-text js-input" type="text"
                           value="<%= (request.getParameter("firstname") != null)
                                                           ? request.getParameter("firstname") : ""%>">
                    <label class="label" for="firstname">First Name</label>
                </div>

                <div class="form-field col-lg-6 ">
                    <input id="lastname" name="lastname" class="input-text js-input" type="text"
                           value="<%= (request.getParameter("lastname") != null)
                                                           ? request.getParameter("lastname") : ""%>">
                    <label class="label" for="lastname">Last Name</label>
                </div>

                <div class="form-field col-lg-6 ">
                    <input id="email" name="email" class="input-text js-input" type="email"
                           value="<%= (request.getParameter("email") != null)
                                                           ? request.getParameter("email") : ""%>">
                    <label class="label" for="email">Staff E-mail</label>
                </div>

                <div class="form-field col-lg-6 ">
                    <input id="contact" name="contact" class="input-text js-input" type="text"
                           value="<%= (request.getParameter("lastname") != null)
                                                           ? request.getParameter("lastname") : ""%>">
                    <label class="label" for="contact">Contact Number</label>
                </div>

                <div class="form-field col-lg-12">
                    <label class="label">Gender</label>
                    <div class="inputGender">
                        <input class="input-gender" type="radio" id="male" name="gender" value="M"
                               <% if (request.getParameter("gender").equals("M")) { %> checked
                               <% } %>
                               />
                        <label class="genderField" for="male">Male</label>
                        <input class="input-gender" type="radio" id="female" name="gender" value="F"
                               <% if (request.getParameter("gender").equals("F")) { %> checked
                               <% } %>
                               />
                        <label class="genderField" for="female">Female</label>
                    </div>
                </div>

                <div class="form-field col-lg-12">
                    <button class="submit-btn" id="editStaffSubmit" type="submit" value="Submit">Submit</button>
                </div>
            </form>
        </section>

        <script>
            function validateUsername() {
                var firstname = document.getElementById("username").value;
                var errorDiv = document.getElementById("errorUsernameDiv");

                if (!firstname) {
                    errorDiv.textContent = "Username is required.";
                } else if (firstname.length < 2) {
                    errorDiv.textContent =
                            "Username must be at least 2 characters long.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            var lastCheckedEmail = "";
            function validateEmail() {
                var email = document.getElementById("empemail").value;
                var emailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                var errorDiv = document.getElementById("emailError");
                var statusDiv = document.getElementById("emailSearching");

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
                                "CheckEmployeeEmail?email=" + encodeURIComponent(email),
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
                var firstname = document.getElementById("firstname").value;
                var nameFormat = /^[a-zA-Z\s]+$/;
                var errorDiv = document.getElementById("errorFirstNameDiv");
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
                var lastname = document.getElementById("lastname").value;
                var nameFormat = /^[a-zA-Z\s]+$/;
                var errorDiv = document.getElementById("errorLastNameDiv");
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
                var contactNo = document.getElementById("contact").value;
                var phoneFormat =
                        /^6?(?:01[02346-9]\d{7}|011\d{8}|015\d{8}|03\d{8}|0[4-9]\d{7})$/;
                var errorDiv = document.getElementById("errorContactDiv");
                if (!contactNo) {
                    errorDiv.textContent = "Contact No. is required.";
                } else if (!contactNo.match(phoneFormat)) {
                    errorDiv.textContent = "Invalid phone format.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateGender() {
                var errorDiv = document.getElementById("errorGenderDiv");
                if (
                        !document.getElementById("male").checked &&
                        !document.getElementById("female").checked
                        //!document.getElementById("nottosay").checked
                        )
                {
                    errorDiv.textContent = "Gender is required.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            // Add event listeners to trigger validation
            document
                    .getElementById("username")
                    .addEventListener("blur", validateUserame);
            document
                    .getElementById("email")
                    .addEventListener("blur", validateEmail);
            document
                    .getElementById("firstname")
                    .addEventListener("blur", validateFirstName);
            document
                    .getElementById("lastname")
                    .addEventListener("blur", validateLastName);
            document
                    .getElementById("contact")
                    .addEventListener("blur", validateContactNo);
            document
                    .getElementById("male")
                    .addEventListener("click", validateGender);
            document
                    .getElementById("female")
                    .addEventListener("click", validateGender);

            function validateAllFields() {
                // Trigger validation for all fields
                validateUsername();
                validateEmail();
                validateFirstName();
                validateLastName();
                validateContactNo();
                validateGender();
                // validateDateOfBirth();
                //validateAddress();

                // Perform form submission if there are no validation errors
                if (!hasValidationError()) {
                    document.getElementById("editStaffForm").submit();
                }
            }

            function hasValidationError() {
                // Validation error flags for each field
                var usernameError =
                        document.getElementById(
                                "errorUsernameDiv"
                                ).textContent;
                var emailError =
                        document.getElementById(
                                "errorEmailDiv"
                                ).textContent;
                var firstNameError = document.getElementById(
                        "errorFirstNameDiv"
                        ).textContent;
                var lastNameError = document.getElementById(
                        "errorLastNameDiv"
                        ).textContent;
                var contactNoError = document.getElementById(
                        "errorContactDiv"
                        ).textContent;
                //var dobError = document.getElementById(
                //   "errorDateOfBirthDiv"
                //   ).textContent;
                var genderError = document.getElementById(
                        "errorGenderDiv"
                        ).textContent;

                // Check if any validation error exists
                return (
                        usernameError ||
                        emailError ||
                        firstNameError ||
                        lastNameError ||
                        contactNoError ||
                        genderError
                        );
            }

            document.getElementById("editStaffSubmit").addEventListener("click", function (event) {
                event.preventDefault();
                validateAllFields();
                if (hasValidationError()) {
                    alert("Please correct the validation errors before submitting the form.");
                }
            });
        </script>

    </body>
</html>
