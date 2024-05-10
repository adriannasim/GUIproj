<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign Up Confirmation</title>
    <%@ include file="css/bootstrapStyles.jsp" %>
    
    <style>
    body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa; /* Light gray background color */
    color: #343a40; /* Dark text color */
    margin: 0;
    padding: 0;
}

.container {
    margin-top: 50px; /* Adjust top margin as needed */
    padding: 20px;
    border: 2px solid #dee2e6; /* Light border color */
    border-radius: 10px;
    background-color: #fff; /* White background color */
}

.confirmation-box {
    max-width: 600px; /* Adjust the maximum width as needed */
    margin: 0 auto; /* Center the box horizontally */
}

.confirmation-box h4 {
    margin-bottom: 20px;
    font-weight: bold;
    color: #007bff; /* Blue title color */
}

.confirmation-box .dropdown-divider {
    border-top: 1px solid #dee2e6; /* Light border color */
    margin-top: 20px;
    margin-bottom: 20px;
}

.confirmation-box p {
    margin-bottom: 10px;
}

.confirmation-box p strong {
    font-weight: bold;
}

.confirmation-box form {
    margin-top: 20px;
}

#so_confirm-btn {
    margin-right: 10px; /* Add some space between buttons */
}

#so_edit-btn {
    margin-top: 10px; /* Add some space between buttons */
}

.btn {
    color: #fff;
    background-color: #007bff; /* Blue button color */
    border-color: #007bff;
}

.btn:hover {
    color: #fff;
    background-color: #0056b3; /* Darker blue color on hover */
    border-color: #0056b3;
}
</style>
    
</head>
<body>
    <div class="container mt-5 p-4 border rounded-lg bg-light text-dark confirmation-box">
        <div class="row">
          <div class="col-md-6">
              <h4 class="mb-3 text-left">Sign Up Confirmation</h4>
          </div>
        </div>
        <div class="dropdown-divider"></div>
            <p class="text-sm-left">Please review the information you provided.</p>
        <div class="row">
        <div class="col-md-6">
            <p>Username<br/><strong> <%= request.getAttribute("signup-username") %></strong></p>
            <p>Email<br/><strong> <%= request.getAttribute("signup-email") %></strong></p>
            <p>First Name<br/><strong> <%= request.getAttribute("signup-firstname") %></strong></p>
            <p>Last Name<br/><strong> <%= request.getAttribute("signup-lastname") %></strong></p>
            <p>Contact No<br/><strong> <%= request.getAttribute("signup-contactNo") %></strong></p>
            <p>Date of Birth<br/><strong> <%= request.getAttribute("signup-dateOfBirth") %></strong></p>
            <p>Gender<br/><strong> <%= request.getAttribute("signup-gender") %></strong></p>
        </div>
        <div class="col-md-6">
            <p>Address<br/><strong> <%= request.getAttribute("ship-address") %></strong></p>
            <p>Unit / Apartment<br/><strong> <%= request.getAttribute("address2") %></strong></p>
            <p>City<br/><strong> <%= request.getAttribute("locality") %></strong></p>
            <p>State<br/><strong> <%= request.getAttribute("state") %></strong></p>
            <p>Postal Code<br/><strong> <%= request.getAttribute("postcode") %></strong></p>
            <p>Country<br/><strong> <%= request.getAttribute("country") %></strong></p>
        </div>
        </div>
    </div>
        <!-- Include other form fields here -->
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
        <button type="submit" class="btn btn-outline-success" id="so_confirm-btn">Confirm Sign Up</button>
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
        <button type="submit" class="btn btn-outline-secondary" id="so_edit-btn">Edit Information</button>
    </form>
</body>
</html>
