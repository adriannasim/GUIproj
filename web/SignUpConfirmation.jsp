<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign Up Confirmation</title>
</head>
<body>
    <h1>Sign Up Confirmation</h1>
    <p>Please review the information you provided:</p>
    <ul>
        <li><strong>Username:</strong> <%= request.getAttribute("signup-username") %></li>
        <li><strong>Email:</strong> <%= request.getAttribute("signup-email") %></li>
        <li><strong>First Name:</strong> <%= request.getAttribute("signup-firstname") %></li>
        <li><strong>Last Name:</strong> <%= request.getAttribute("signup-lastname") %></li>
        <li><strong>Contact No:</strong> <%= request.getAttribute("signup-contactNo") %></li>
        <li><strong>Date of Birth:</strong> <%= request.getAttribute("signup-dateOfBirth") %></li>
        <li><strong>Gender:</strong> <%= request.getAttribute("signup-gender") %></li>
        <li><strong>Address:</strong> <%= request.getAttribute("ship-address") %></li>
        <li><strong>Apartment, unit, suite, or floor:</strong> <%= request.getAttribute("address2") %></li>
        <li><strong>City:</strong> <%= request.getAttribute("locality") %></li>
        <li><strong>State:</strong> <%= request.getAttribute("state") %></li>
        <li><strong>Postal Code:</strong> <%= request.getAttribute("postcode") %></li>
        <li><strong>Country:</strong> <%= request.getAttribute("country") %></li>
        <!-- Include other form fields here -->
    </ul>
    <form action="signup" method="get">
        <!-- Hidden input fields to pass the values -->
        <input type="hidden" name="signup-username" value="<%= request.getAttribute("signup-username") %>">
        <input type="hidden" name="signup-email" value="<%= request.getAttribute("signup-email") %>">
        <input type="hidden" name="signup-userPwd" value="<%= request.getAttribute("signup-userPwd") %>">
        <input type="hidden" name="signup-firstname" value="<%= request.getAttribute("signup-firstname") %>">
        <input type="hidden" name="signup-lastname" value="<%= request.getAttribute("signup-lastname") %>">
        <input type="hidden" name="signup-contactNo" value="<%= request.getAttribute("signup-contactNo") %>">
        <input type="hidden" name="signup-dateOfBirth" value="<%= request.getAttribute("signup-dateOfBirth") %>">
        <input type="hidden" name="signup-gender" value="<%= request.getAttribute("signup-gender") %>">
        <input type="hidden" name="ship-address" value="<%= request.getAttribute("ship-address") %>">
        <input type="hidden" name="address2" value="<%= request.getAttribute("address2") %>">
        <input type="hidden" name="locality" value="<%= request.getAttribute("locality") %>">
        <input type="hidden" name="state" value="<%= request.getAttribute("state") %>">
        <input type="hidden" name="postcode" value="<%= request.getAttribute("postcode") %>">
        <input type="hidden" name="country" value="<%= request.getAttribute("country") %>">
        <!-- Include other hidden input fields for each sign-up field -->

        <input type="hidden" name="confirmed" value="true">
        <button type="submit">Confirm Sign Up</button>
    </form>
    <form action="SignUp.jsp" method="get">
        <input type="hidden" name="signup-username" value="<%= request.getAttribute("signup-username") %>">
        <input type="hidden" name="signup-email" value="<%= request.getAttribute("signup-email") %>">
        <input type="hidden" name="signup-firstname" value="<%= request.getAttribute("signup-firstname") %>">
        <input type="hidden" name="signup-lastname" value="<%= request.getAttribute("signup-lastname") %>">
        <input type="hidden" name="signup-contactNo" value="<%= request.getAttribute("signup-contactNo") %>">
        <input type="hidden" name="signup-dateOfBirth" value="<%= request.getAttribute("signup-dateOfBirth") %>">
        <input type="hidden" name="signup-gender" value="<%= request.getAttribute("signup-gender") %>">
        <input type="hidden" name="ship-address" value="<%= request.getAttribute("ship-address") %>">
        <input type="hidden" name="address2" value="<%= request.getAttribute("address2") %>">
        <input type="hidden" name="locality" value="<%= request.getAttribute("locality") %>">
        <input type="hidden" name="state" value="<%= request.getAttribute("state") %>">
        <input type="hidden" name="postcode" value="<%= request.getAttribute("postcode") %>">
        <input type="hidden" name="country" value="<%= request.getAttribute("country") %>">
        <button type="submit">Edit Information</button>
    </form>
</body>
</html>
