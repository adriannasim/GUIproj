<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign In</title>
        <!-- Include commonFiles.tag -->
        <custom:commonFiles/>
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
        <h1>Sign In</h1>
        <form action="signin" method="post" id="signin-form">
            <label>Username/Email</label>
            <input type="text" name="signin-username/email" id="signin-username/email"/><br/><br/>

            <label>Password</label>
            <input type="password" name="signin-password" id="signin-password"/><br/><br/>

            <button type="submit">Sign In</button>
            <a href="SignUp.jsp"><button type="button">Don't have account? Go to Sign Up</button></a>
        </form>

        <!--footer-->
        <jsp:include page="components/footer.jsp" />
    </body>
</html>
