<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign In</title>
    </head>
    <body>
         <%
            // Retrieve the message from session
            String message = (String) session.getAttribute("signup-message");
            // Check if a message exists and is not empty
            if (message != null && !message.isEmpty()) {
        %>
        <div id="message" class="message">
            <%= message%>
        </div>
        <%
            // Clear the session attribute after 5 seconds
        %>
        <script>
            setTimeout(function () {
                var messageDiv = document.getElementById("message");
                if (messageDiv) {
                    messageDiv.style.display = "none";
                }
            }, 5000); // 5000 milliseconds = 5 seconds
        </script>
        <%
                // Clear the session attribute after displaying the message
                session.removeAttribute("message");
            }
        %>
        <h1>Sign In</h1>
        <form action="signup" method="post">
            <label>Username/Email</label>
            <input type="text"/><br/>

            <label>Password</label>
            <input type="text"/><br/>

            <button type="submit">Sign In</button>
        </form>
    </body>
</html>
