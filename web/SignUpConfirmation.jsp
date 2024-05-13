<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up Confirmation</title>
        <link rel="shortcut icon" href="favicon.png">

        <!-- Theme -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="assets/css/tiny-slider.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">



    </head>
    <body>
        <%--header--%>
        <jsp:include page="components/Header.jsp" />

        <!-- Background image -->
        <div class="p-5 bg-image" style="background-color:#3b5d50;
             height: 300px;
             "></div>
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


                <h2 class="fw-bold my-4">Sign Up Confirmation</h2>
                <div class="dropdown-divider"></div>
                <p class="text-sm-left">Please review the information you provided.</p>
                <div class="row justify-content-center"> 
                    <div class="col-md-6 text-left"> 
                        <p>Username:<strong> <%= request.getAttribute("signup-username")%></strong></p>
                        <p>Email:<strong> <%= request.getAttribute("signup-email")%></strong></p>
                        <p>First Name:<strong> <%= request.getAttribute("signup-firstname")%></strong></p>
                        <p>Last Name:<strong> <%= request.getAttribute("signup-lastname")%></strong></p>
                        <p>Contact No:<strong> <%= request.getAttribute("signup-contactNo")%></strong></p>
                        <p>Date of Birth:<strong> <%= request.getAttribute("signup-dateOfBirth")%></strong></p>
                        <%
                            String gender = (String) request.getAttribute("signup-gender");
                            String genderDisplay;

                            // Check the value of gender and assign the appropriate display value
                            if (gender != null) {
                                if (gender.equals("M")) {
                                    genderDisplay = "Male";
                                } else if (gender.equals("F")) {
                                    genderDisplay = "Female";
                                } else {
                                    genderDisplay = "-";
                                }
                            } else {
                                genderDisplay = "-";
                            }
                        %>

                        <p>Gender: <strong><%= genderDisplay%></strong></p>

                    </div>
                    <div class="col-md-6">
                        <p>Address:<strong> <%= request.getAttribute("ship-address")%></strong></p>
                        <p>Unit / Apartment:<strong> <%= (request.getAttribute("address2") != null ? request.getAttribute("address2") : "-")%></strong></p>
                        <p>City:<strong> <%= request.getAttribute("locality")%></strong></p>
                        <p>State:<strong> <%= request.getAttribute("state")%></strong></p>
                        <p>Postal Code:<strong> <%= request.getAttribute("postcode")%></strong></p>
                        <p>Country:<strong> <%= request.getAttribute("country")%></strong></p>
                    </div>
                </div>

                <!-- Include other form fields here -->
                <div class="d-flex flex-row m-4 align-items-center text-center justify-content-center">
                    <form action="SignUp.jsp" method="get">
                        <input type="hidden" name="signup-username" value="<%= request.getAttribute("signup-username")%>">
                        <input type="hidden" name="signup-email" value="<%= request.getAttribute("signup-email")%>">
                        <input type="hidden" name="signup-firstname" value="<%= request.getAttribute("signup-firstname")%>">
                        <input type="hidden" name="signup-lastname" value="<%= request.getAttribute("signup-lastname")%>">
                        <input type="hidden" name="signup-contactNo" value="<%= request.getAttribute("signup-contactNo")%>">
                        <input type="hidden" name="signup-dateOfBirth" value="<%= request.getAttribute("signup-dateOfBirth")%>">
                        <input type="hidden" name="signup-gender" value="<%= request.getAttribute("signup-gender")%>">
                        <input type="hidden" name="ship-address" value="<%= request.getAttribute("ship-address")%>">
                        <input type="hidden" name="address2" value="<%= request.getAttribute("address2")%>">
                        <input type="hidden" name="locality" value="<%= request.getAttribute("locality")%>">
                        <input type="hidden" name="state" value="<%= request.getAttribute("state")%>">
                        <input type="hidden" name="postcode" value="<%= request.getAttribute("postcode")%>">
                        <input type="hidden" name="country" value="<%= request.getAttribute("country")%>">
                        <button type="submit" class="btn btn-outline-secondary bg-light text-dark m-2" id="so_edit-btn">Edit Information</button>
                    </form>

                    <form action="signup" method="get">
                        <!-- Hidden input fields to pass the values -->
                        <input type="hidden" name="signup-username" value="<%= request.getAttribute("signup-username")%>">
                        <input type="hidden" name="signup-email" value="<%= request.getAttribute("signup-email")%>">
                        <input type="hidden" name="signup-userPwd" value="<%= request.getAttribute("signup-userPwd")%>">
                        <input type="hidden" name="signup-firstname" value="<%= request.getAttribute("signup-firstname")%>">
                        <input type="hidden" name="signup-lastname" value="<%= request.getAttribute("signup-lastname")%>">
                        <input type="hidden" name="signup-contactNo" value="<%= request.getAttribute("signup-contactNo")%>">
                        <input type="hidden" name="signup-dateOfBirth" value="<%= request.getAttribute("signup-dateOfBirth")%>">
                        <input type="hidden" name="signup-gender" value="<%= request.getAttribute("signup-gender")%>">
                        <input type="hidden" name="ship-address" value="<%= request.getAttribute("ship-address")%>">
                        <input type="hidden" name="address2" value="<%= request.getAttribute("address2")%>">
                        <input type="hidden" name="locality" value="<%= request.getAttribute("locality")%>">
                        <input type="hidden" name="state" value="<%= request.getAttribute("state")%>">
                        <input type="hidden" name="postcode" value="<%= request.getAttribute("postcode")%>">
                        <input type="hidden" name="country" value="<%= request.getAttribute("country")%>">
                        <!-- Include other hidden input fields for each sign-up field -->

                        <input type="hidden" name="confirmed" value="true">
                        <button type="submit" class="btn btn-outline-success m-2" id="so_confirm-btn">Confirm Sign Up</button>
                    </form>


                </div>

            </div>

        </section>
        <!-- Section: Design Block -->
    </body>
</html>
