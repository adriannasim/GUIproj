
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
        
        <!-- Bootstrap CSS -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="assets/css/tiny-slider.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <style>
            .changepwd-forgotpwd-a {
                text-decoration:none;
                color:black !important;
            }

            .changepwd-forgotpwd-a:hover {
                color: #fed09a !important;
            }
            .password-error-message {
                color: red;
                font-size: 12px;
            }
            .password-status-message {
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

                <form action="EditNewPassword" id="change-password-form" method="post">
                    <!-- Change Password -->
                    <div class="col-md-5" style="padding-left:180px;width:70%;">
                        <div class="p-3"style="padding-top:10px;">

                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Change Password</h4>
                            </div>

                            <div class="row mt-2">

                                <div class="col-md-12"><label class="labels">Current Password</label>
                                    <input type="text" class="form-control" placeholder="" value="" id="current-password" name="current-password">
                                    <div id="current-password-error" class="password-error-message"></div>
                                    <div id="current-password-status" class="password-status-message"></div>
                                </div>

                                <div class="col-md-12 mt-2" style="font-size:11px;color:#C0C2C9;">
                                    <p>Password must be minimum 8 and maximum 15 characters, at least one uppercase letter, one lowercase letter, one number and one special character from @, $, !, %, *, ?, &.</p>
                                </div>

                                <!--<div class="col-md-12">
                                    <p><a href="#" class="changepwd-forgotpwd-a">Forgot your password?</a></p>
                                </div>--->

                            </div>
                            <div class="row mt-3">

                                <div class="col-md-6"><label class="labels">New Password</label>
                                    <input type="text" class="form-control" placeholder="" value="" id="new-password" name="new-password">
                                    <div id="new-password-error" class="password-error-message"></div>
                                </div>

                                <div class="col-md-6"><label class="labels">Confirm Password</label>
                                    <input type="text" class="form-control" value="" placeholder="" id="confirm-password" name="confirm-password">
                                    <div id="confirm-password-error" class="password-error-message"></div>
                                </div>

                            </div>

                            <div class="mt-5 text-center">
                                <button class="btn btn-primary profile-button" name="change-password-submit" id="change-password-submit" type="submit">Save</button>
                            </div>
                        </div>
                    </div>
                    <!-- Change Password -->
                </form>

            </div>
            <!-- Page content wrapper-->

        </div>
        <!--end of content-->
        <script>
            function validateNewPwd() {
                var userPwd = document.getElementById("new-password").value;
                var currentPwd = document.getElementById("current-password").value;
                var confirmPwd = document.getElementById("confirm-password").value;
                var errorDiv = document.getElementById("new-password-error");
                var passFormat =
                        /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/;

                if (confirmPwd) {
                    validateConfirmPwd();
                }

                if (!userPwd) {
                    errorDiv.textContent = "Password is required.";
                } else if (!userPwd.match(passFormat)) {
                    errorDiv.textContent =
                            "Invalid password format.";
                } else if (userPwd === currentPwd) {
                    errorDiv.textContent = "New password must be different from the current password.";
                } else {
                    errorDiv.textContent = "";
                }
            }


            function validateConfirmPwd() {
                var userPwd = document.getElementById("new-password").value;
                var confirmPwd = document.getElementById("confirm-password").value;
                var errorDiv1 = document.getElementById("new-password-error");
                var errorDiv2 = document.getElementById("confirm-password-error");
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

            var lastCheckedPassword = "";

            function validateCurrentPwd() {
                var pass = document.getElementById("current-password").value;
                var passFormat = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/;
                var errorDiv = document.getElementById("current-password-error");
                var statusDiv = document.getElementById("current-password-status");

                if (!pass) {
                    errorDiv.textContent = "Current password is required.";
                    return;
                }

                if (pass !== lastCheckedPassword) {
                    lastCheckedPassword = pass;

                    if (!pass.match(passFormat)) {
                        errorDiv.textContent = "Invalid password format.";
                    } else {
                        errorDiv.textContent = "";
                        statusDiv.textContent = "Matching...";

                        var xhr = new XMLHttpRequest();
                        xhr.open(
                                "GET",
                                "CheckCurrentPassword?password=" + encodeURIComponent(pass),
                                true
                                );
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState === 4) {
                                statusDiv.textContent = "";
                                if (xhr.status === 200) {
                                    var response = xhr.responseText;
                                    if (response === "not matched") {
                                        errorDiv.textContent = "Incorrect password.";
                                    } else {
                                        errorDiv.textContent = "";
                                    }
                                } else {
                                    errorDiv.textContent = "Error checking password. Please try again later.";
                                }
                            }
                        };
                        xhr.send();
                    }
                }
            }

            // Add event listeners to trigger validation
            document
                    .getElementById("new-password")
                    .addEventListener("blur", validateNewPwd);
            document
                    .getElementById("confirm-password")
                    .addEventListener("blur", validateConfirmPwd);
            document
                    .getElementById("current-password")
                    .addEventListener("blur", validateCurrentPwd);


            function validateAllFields() {
                // Trigger validation for all fields
                validateNewPwd();
                validateConfirmPwd();
                validateCurrentPwd();

                // Perform form submission if there are no validation errors
                if (!hasValidationError()) {
                    document.getElementById("change-password-form").submit();
                }
            }

            function hasValidationError() {
                // Validation error flags for each field
                var currentPwdError = document.getElementById(
                        "current-password-error"
                        ).textContent;
                var newPwdError = document.getElementById(
                        "new-password-error"
                        ).textContent;
                var confirmPwdError = document.getElementById(
                        "confirm-password-error"
                        ).textContent;
                var currentPwdStatus = document.getElementById(
                        "current-password-status"
                        ).textContent;

                // Check if any validation error exists
                return (
                        currentPwdError ||
                        newPwdError ||
                        confirmPwdError ||
                        confirmPwdError ||
                        currentPwdStatus === "Matching..."
                        );
            }

            document.getElementById("change-password-submit").addEventListener("click", function (event) {
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