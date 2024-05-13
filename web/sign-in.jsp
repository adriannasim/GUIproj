<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

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
            body {
                z-index: 0;
            }

            .form-control {
                font-size: 16px;
            }

            .message {
                position: fixed;
                top: 20%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #fff;
                padding: 10px 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                z-index: 9999;
                text-align: center;
            }

            .signup-error-message{
                font-size: 12px;
                color: red;
            }
            .signup-status-message{
                font-size: 12px;
                color: red;
            }
            #signupLink{
                color: black;
                text-decoration: none;
            }
            #signupLink:hover{
                color: #3b5d50;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <%--header--%>
        <jsp:include page="admin-components/aside.jsp" />
        <!-- Start of Message Div -->
        <%
            // Retrieve the message from session
            String signupMsg = (String) session.getAttribute("signup-message");
            // Check if a message exists and is not empty
            if (signupMsg != null && !signupMsg.isEmpty())
            {
        %>
        <div id="signupMsg" class="message">
            <%= signupMsg%>
        </div>
        <%
            // Clear the session attribute after displaying the message
            session.removeAttribute("signup-message");
        %>
        <script>
            setTimeout(function () {
                var messageDiv = document.getElementById("signupMsg");
                if (messageDiv) {
                    messageDiv.style.display = "none";
                }
            }, 5000); // 5000 milliseconds = 5 seconds
        </script>
        <%
            }
        %>
        <%
            // Retrieve the message from session
            String signinMsg = (String) session.getAttribute("signin-failure-message");
            // Check if a message exists and is not empty
            if (signinMsg != null && !signinMsg.isEmpty())
            {
        %>
        <div id="signinMsg" class="message">
            <%= signinMsg%>
        </div>
        <%
            // Clear the session attribute after displaying the message
            session.removeAttribute("signin-failure-message");
        %>
        <script>
            setTimeout(function () {
                var messageDiv = document.getElementById("signinMsg");
                if (messageDiv) {
                    messageDiv.style.display = "none";
                }
            }, 5000); // 5000 milliseconds = 5 seconds
        </script>
        <%
            }
        %>
        <%
            // Check if sign-up was successful
            Boolean signupSuccess = (Boolean) request.getSession().getAttribute("signup-success");
            if (signupSuccess != null && signupSuccess)
            {
        %>
        <script>
            // Use AJAX to call RetrieveCart servlet in the background
            function retrieveCartInBackground() {
                var xhr = new XMLHttpRequest();
                xhr.open('GET', 'RetrieveCart', true);
                xhr.send();
            }

            // Call the function to retrieve cart data in the background
            retrieveCartInBackground();
        </script>
        <%
                // Reset the attribute to avoid invoking RetrieveCart multiple times
                request.getSession().removeAttribute("signup-success");
            }
        %>
        <!-- End of Message Div -->

        <!-- Background image -->
        <div class="p-5 bg-image" style="background-color:#3b5d50;
             height: 300px;
            ">
        </div>
        
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
                            <h2 class="fw-bold mb-5">Admin Sign in</h2>
                            <form action="AdminLogin" method="post" id="signin-form">
                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <div data-mdb-input-init class="form-outline">
                                            <label class="form-label" for="signin-username">Username/email<span class="text-danger">*</span></label>
                                            <input class="form-control form-control-lg" type="text" 
                                                   name="signin-username" id="signin-username/email"/>
                                        </div>
                                    </div>
                                    <!-- Password input -->
                                    <div data-mdb-input-init class="col-md-6 mb-4">
                                        <label class="form-label" for="signin-password">Password<span class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <input class="form-control" name="signin-password" id="signin-password" type="password" />
                                            <span class="input-group-text" id="togglePassword">
                                                <i class="fas fa-eye" id="toggleIcon"></i>
                                            </span>
                                        </div>

                                    </div>
                                </div>

                                <!-- Submit button -->
                                <button type="submit" data-mdb-button-init data-mdb-ripple-init 
                                        class="btn btn-primary btn-block btn-rounded mb-4"
                                        id="signup-submit-button"
                                        style="background-color:black;color:white;border-radius:30px;">
                                    Sign in
                                </button>

                                <!-- Register buttons -->
                                <div class="text-center">
                                    <p>
                                        <a href="SignUp.jsp" class="si_backlink"
                                           id="signupLink">Don't have an account? Sign up here</a>
                                    </p>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>

        </section>
        <!-- Section: Design Block -->
        <script>

            // Toggle password visibility for signup-userPwd
            document.getElementById('togglePassword').addEventListener('click', function () {
                var pwdInput = document.getElementById('signin-password');
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

        </script>

        <%--footer--%>
        <jsp:include page="admin-components/footer.jsp" />
    </body>
</html>
