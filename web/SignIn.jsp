<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<%@ include file="css/bootstrapStyles.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign In</title>
        <!-- Include commonFiles.tag -->
        <custom:commonFiles/>
        
        <style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('img/images/background1.png'); 
        background-size: cover;
        background-position: center;
        color: white; 
        margin: 0;
        padding: 0;
    }
    
        .cont {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 90vh;
        }

        /* Styling the form container */
        .cont form {
            border: 2px solid white;
            padding: 20px;
            border-radius: 10px;
            background-color: #fff;
        }

        /* Centering the form fields */
        .cont form .row {
            justify-content: center;
        }

        /* Padding for form items */
        .si_item-padding {
            padding: 10px 0;
        }

        /* Styling the submit button */
        .si_btn-pd button {
            width: 100%;
        }

        /* Styling the links */
        .si_link {
            text-align: center;
        }

</style>

        
    </head>
    <body class="text-center">
        <!--header-->
        <jsp:include page="components/header.jsp" />
        <%
            // Retrieve the message from session
            String signupMsg = (String) session.getAttribute("signup-message");
            // Check if a message exists and is not empty
            if (signupMsg != null && !signupMsg.isEmpty()) {
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
            if (signinMsg != null && !signinMsg.isEmpty()) {
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
       if (signupSuccess != null && signupSuccess) {
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
       
    <div class="cont">
        
        <form action="signin" method="post" id="signin-form">
            <h2 class="si_title">Sign In</h2>
            <div class="container"> 
                <div class="row justify-content-md-end">
                    <div class="col-2">
                        <label>Username/Email</label>
                    </div>
                    <div class="col-4">
                        <input class="form-control form-control-lg" type="text" name="signin-username/email" id="signin-username/email"/><br/><br/>
                    </div>
                    <div class="row justify-content-md-end">
                    <div class="col-2">
                        <label>Password</label> 
                    </div>
                    <div class="col-4">
                        <input class="form-control form-control-lg" type="password" name="signin-password" id="signin-password"/><br/><br/>
                    </div>
                    </div>
                    <div class="col-2 si_item-padding">
                        <label></label> 
                    </div>
                    <div class="col-2 si_item-padding">
                        <input type="checkbox"/>&nbsp;&nbsp;
                        <label>Remember Me</label> 
                    </div>
                    <div class="col-2 si_btn-pd">
                       <button type="submit" class="btn btn-outline-success btn-block">Sign In</button> 
                    </div>
                </div>
                <div class="row justify-content-md-end">
                    <div class="col-2 si_link">
                        <a href="FgtPw.jsp" class="si_backlink">Forgot Password</a>
                    </div>
                    <div class="col-2">
                    </div>
                    <div class="col-2 si_link">
                        <a href="SignUp.jsp" class="si_backlink">Don't have an account? Sign up here</a>
                    </div>
                </div>
                </div>
        </form>
        </div>

        <!--footer-->
        <jsp:include page="components/footer.jsp" />
    </body>
</html>
