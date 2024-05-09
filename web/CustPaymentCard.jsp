<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--imports--%>
<%@page import="jpaEntity.*, java.util.ArrayList"%> 

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

        <!-- Include commonFiles.tag -->
        <custom:commonFiles />

        <style>
            .card-error-message {
                color: red;
            }
        </style>

    </head>

    <body>
        <header class="text-center">
            <%--header--%>
            <jsp:include page="components/header.jsp" />
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


                <!-- ADD Payment Card -->
                <div class="col-md-5" style="padding-left:180px;width:70%;">
                    <div class="p-3"style="padding-top:10px;">

                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">My CREDIT/DEBIT CARDS</h4>
                        </div>

                        <%
                            ArrayList<Paymentcard> paymentCardList = (ArrayList<Paymentcard>) request.getAttribute("paymentCardList");
                            if (paymentCardList == null || paymentCardList.isEmpty()) {
                        %>
                        <!-- WHEN THERE IS NO PAYMENT CARD REGISTERED -->
                        <div class="row mt-2" id="no-paymentcard">

                            <div class="col-md-12">
                                <p>There is no registered credit/debit cards.</p>
                            </div>

                            <div class="mt-5 text-center">
                                <button class="btn btn-primary profile-button" id="btn-addcard" 
                                        type="button" onclick="CardFunction()">Add Payment Card</button>
                            </div>

                        </div>
                        <!-- WHEN THERE IS NO PAYMENT CARD REGISTERED -->
                        <% } else {
                        %>
                        <!-- WHEN THERE IS PAYMENT CARD REGISTERED -->
                        <div class="row mt-2" id="yes-paymentcard">

                            <% for (Paymentcard paymentCard : paymentCardList) { %>
                            <!-- PAYMENT CARD LOOPING HERE -->
                            <div class="card" style="margin-bottom:20px;">
                                <div class="card-body p-0" style="margin-bottom:15px;">
                                    <h5 class="my-3" style="padding-left:15px;">Payment Card 
                                        <i class="bi bi-credit-card"></i></h5>
                                    <ul class="list-group list-group-flush rounded-3">
                                        <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                            <p class="mb-0">
                                                <%
                                                    PaymentcardPK pymcardPK = paymentCard.getPaymentcardPK();
                                                %>
                                                <small>CARD HOLDER NAME:</small> <%=pymcardPK.getCardname()%>
                                            </p>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                            <p class="mb-0">
                                                <% if (paymentCard != null) {%>
                                                <small>CARD EXPIRATION DATE:</small> <%=paymentCard.getDatemonth() + "/" + paymentCard.getDateyear()%>
                                                <% }%>
                                            </p>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                            <p class="mb-0">
                                                <small>CARD NUMBER:</small> <%=pymcardPK.getCardnumber()%>
                                            </p>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                            <p class="mb-0">
                                                <small>CARD CVV:</small> <%=paymentCard.getCvv()%>
                                            </p>
                                        </li>
                                        <button class="removeButton" data-card-number="<%= pymcardPK.getCardnumber()%>" data-card-name="<%= pymcardPK.getCardname()%>">Remove</button>
                                    </ul>
                                </div>
                            </div>
                            <!-- PAYMENT CARD LOOPING END HERE -->
                            <% } %>

                            <div class="mt-1 text-center">
                                <button class="btn btn-primary profile-button" id="btn-addcard" 
                                        type="button" onclick="CardFunction()" style="margin-bottom:10px;">Add Payment Card</button>
                            </div>

                        </div>
                        <!-- WHEN THERE IS PAYMENT CARD REGISTERED -->
                        <% }%>


                        <form action="EditPaymentCard" method="post" id="card-form">
                            <!-- REGISTER PAYMENT CARD -->
                            <div id="AddCardDiv" style="display:none;">
                                <div class="row mt-2">

                                    <div class="col-md-6"><label class="labels">Card Name</label>
                                        <input type="text" class="form-control" placeholder="Holder name"  id="payment-card-name" name="payment-card-name">
                                        <div id="card-name-error" class="card-error-message"></div>
                                    </div>

                                    <div class="col-md-6"><label class="labels">Card Number</label>
                                        <input type="text" class="form-control" placeholder="4242 4242 4242 4242" id="payment-card-number" name="payment-card-number">
                                        <div id="card-cardNumber-error" class="card-error-message"></div>
                                        <div id="card-cardNumber-status" class="card-status-message"></div>
                                    </div>

                                </div>

                                <div class="row mt-2">

                                    <div class="col-md-6"><label class="labels">Date Month / Year</label>
                                        <input type="text" class="form-control" placeholder="MM/YYYY" id="payment-card-expiration" name="payment-card-expiration"/>
                                        <div id="card-expiration-error" class="card-error-message"></div>
                                    </div>

                                    <div class="col-md-6"><label class="labels">CVV</label>
                                        <input type="text" class="form-control" placeholder="***" id="payment-card-cvv" name="payment-card-cvv"/>
                                        <div id="card-cvv-error" class="card-error-message"></div>
                                    </div>

                                </div>

                                <div class="mt-5 text-center">
                                    <button class="btn btn-primary profile-button" 
                                            type="submit" id="card-submit">Save</button>
                                </div>
                            </div>
                            <!-- REGISTER PAYMENT CARD -->
                        </form>


                    </div>
                </div>
                <!-- Add Payment Card -->


            </div>
            <!-- Page content wrapper-->

        </div>

        <script>
            function CardFunction() {
                var x = document.getElementById("AddCardDiv");
                if (x.style.display === "none") {
                    x.style.display = "block";
                } else {
                    x.style.display = "none";
                }

                var y = document.getElementById("yes-paymentcard");
                if (y.style.display === "none") {
                    y.style.display = "block";
                } else {
                    y.style.display = "none";
                }

                var z = document.getElementById("no-paymentcard");
                if (z.style.display === "none") {
                    z.style.display = "block";
                } else {
                    z.style.display = "none";
                }
            }
        </script>

        <script>
            function addEventListeners() {
                // Auto Format the Card Holder Name
                const textInput = document.getElementById("payment-card-name");
                textInput.addEventListener("input", function (event) {
                    let inputValue = event.target.value;
                    inputValue = inputValue.replace(/[^a-zA-Z ]/g, '');
                    let capitalizedValue = inputValue.toLowerCase().replace(/\b\w/g, function (char) {
                        return char.toUpperCase();
                    });
                    event.target.value = capitalizedValue;
                });

                // Auto format the Card Number
                const cardInput = document.getElementById("payment-card-number");
                cardInput.addEventListener("input", function (event) {
                    let inputValue = event.target.value;
                    inputValue = inputValue.replace(/\D/g, '');
                    inputValue = inputValue.slice(0, 16);
                    let formattedValue = inputValue.replace(/(\d{4})/g, '$1 ').trim();
                    event.target.value = formattedValue;
                });

                // Auto Format the Expiry Date
                const dateInput = document.getElementById("payment-card-expiration");
                dateInput.addEventListener("input", function (event) {
                    let inputValue = event.target.value;
                    inputValue = inputValue.replace(/\D/g, ''); 
                    inputValue = inputValue.slice(0, 4); 
                    let formattedValue = inputValue;
                    if (inputValue.length > 2) {
                        formattedValue = inputValue.substring(0, 2) + '/' + inputValue.substring(2);
                    }
                    event.target.value = formattedValue;
                });

                // Auto Format the CVV
                const cvvInput = document.getElementById("payment-card-cvv");
                cvvInput.addEventListener("input", function (event) {
                    let inputValue = event.target.value;
                    inputValue = inputValue.replace(/\D/g, '');
                    inputValue = inputValue.slice(0, 3);
                    event.target.value = inputValue;
                });
            }

            window.onload = function () {
                addEventListeners();
            };

            // Validation for all fields
            function validateName() {
                var cardName = document.getElementById("payment-card-name").value;
                var cardNumber = document.getElementById("payment-card-number").value;
                var errorDiv = document.getElementById("card-name-error");
                if (!cardName) {
                    errorDiv.textContent = "Name is required.";
                } else {
                    errorDiv.textContent = "";
                }

                if (cardName && cardNumber) {
                    checkCardExistence();
                }
            }

            function validateCardNumber() {
                var cardName = document.getElementById("payment-card-name").value;
                var cardNumber = document.getElementById("payment-card-number").value;
                var errorDiv = document.getElementById("card-cardNumber-error");
                let nCheck = 0, bEven = false;
                cardNumber = cardNumber.replace(/\D/g, "");
                for (var n = cardNumber.length - 1; n >= 0; n--) {
                    var cDigit = cardNumber.charAt(n),
                            nDigit = parseInt(cDigit, 10);
                    if (bEven && (nDigit *= 2) > 9)
                        nDigit -= 9;
                    nCheck += nDigit;
                    bEven = !bEven;
                }

                if (!cardNumber) {
                    errorDiv.textContent = "Card Number is required.";
                } else if (cardNumber.length < 16) {
                    errorDiv.textContent =
                            "Invalid card number format.";
                } else if ((nCheck % 10) != 0) {
                    errorDiv.textContent =
                            "Invalid card number.";
                } else {
                    errorDiv.textContent = "";
                }

                if (cardName && cardNumber) {
                    checkCardExistence();
                }
            }

            function checkCardExistence() {
                var cardName = document.getElementById("payment-card-name").value;
                var cardNumber = document.getElementById("payment-card-number").value;
                var errorDiv = document.getElementById("card-cardNumber-error");
                var statusDiv = document.getElementById("card-cardNumber-status");


                if (cardName !== null && cardNumber !== null) {
                    errorDiv.textContent = "";
                    statusDiv.textContent = "Searching...";

                    var xhr = new XMLHttpRequest();
                    xhr.open(
                            "GET",
                            "CheckCardExistence?cardName=" + encodeURIComponent(cardName) + "&cardNumber=" + encodeURIComponent(cardNumber),
                            true
                            );

                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === XMLHttpRequest.DONE) {
                            statusDiv.textContent = "";
                            if (xhr.status === 200) {
                                var response = xhr.responseText;
                                if (response === "exists") {
                                    errorDiv.textContent = "This card has been used.";
                                } else {
                                    errorDiv.textContent = "";
                                }
                            } else {
                                errorDiv.textContent = "Error checking card availability. Please try again later.";
                            }
                        }
                    };
                    xhr.send();
                }
            }

            function validateExpiration() {
                var expirationdate = document.getElementById("payment-card-expiration");
                var expirationdate = expirationdate.value;
                var errorDiv = document.getElementById("card-expiration-error");
                expirationdate = expirationdate.replace(/\D/g, '');

                if (!expirationdate) {
                    errorDiv.textContent = "Expiration Date is required.";
                    return false;
                } else if (expirationdate.length !== 4) {
                    errorDiv.textContent = "Invalid expiration date.";
                    return false;
                } else if (expirationdate.length >= 4) {
                    const month = expirationdate.substring(0, 2);
                    const year = "20" + expirationdate.substring(2, 4);
                    var expirationDateObj = new Date(year, month - 1);
                    var currentDate = new Date();

                    if (month > 12) {
                        errorDiv.textContent = "Invalid Expiration Date.";
                    } else if (expirationDateObj <= currentDate) {
                        errorDiv.textContent = "Card has expired.";
                    } else {
                        errorDiv.textContent = "";
                    }
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateCVV() {
                var cvv = document.getElementById("payment-card-cvv").value;
                var errorDiv = document.getElementById("card-cvv-error");
                if (!cvv) {
                    errorDiv.textContent = "CVV is required.";
                } else if (cvv.length < 3) {
                    errorDiv.textContent = "Invalid CVV.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            // Add event listeners to trigger validation
            document.getElementById("payment-card-name").addEventListener("blur", validateName);
            document.getElementById("payment-card-number").addEventListener("blur", validateCardNumber);
            document.getElementById("payment-card-expiration").addEventListener("blur", validateExpiration);
            document.getElementById("payment-card-cvv").addEventListener("blur", validateCVV);


            function validateAllFields() {
                // Trigger validation for all fields
                validateName();
                validateCardNumber();
                validateCVV();
                validateExpiration();
            }

            function hasValidationError() {
                // Validation error flags for each field
                var nameError = document.getElementById(
                        "card-name-error"
                        ).textContent;
                var cardNumberError = document.getElementById(
                        "card-cardNumber-error"
                        ).textContent;
                var cardNumberStatus = document.getElementById(
                        "card-cardNumber-status"
                        ).textContent;
                var expirationError = document.getElementById(
                        "card-expiration-error"
                        ).textContent;
                var cvvError = document.getElementById(
                        "card-cvv-error"
                        ).textContent;

                // Check if any validation error exists
                return (
                        nameError ||
                        cardNumberError ||
                        expirationError ||
                        cvvError ||
                        cardNumberStatus === "Searching"
                        );
            }

            // Prevent submit without validation
            document.getElementById("card-submit").addEventListener("click", function (event) {
                event.preventDefault();
                validateAllFields();

                if (hasValidationError()) {
                    alert("Please correct the validation errors before proceeding.");
                } else {
                    checkCardExistenceForSubmission();
                }
            });

            function checkCardExistenceForSubmission() {
                var cardName = document.getElementById("payment-card-name").value;
                var cardNumber = document.getElementById("payment-card-number").value;

                var xhr = new XMLHttpRequest();
                xhr.open(
                        "GET",
                        "CheckCardExistence?cardName=" + encodeURIComponent(cardName) + "&cardNumber=" + encodeURIComponent(cardNumber),
                        true
                        );

                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            var response = xhr.responseText;
                            if (response === "exists") {
                                alert("Please clear the errors before submission.");
                            } else {
                                document.getElementById("card-form").submit();
                            }
                        } else {
                            alert("Error checking card availability. Please try again later.");
                        }
                    }
                };
                xhr.send();
            }
        
            var buttons = document.querySelectorAll(".removeButton");

            buttons.forEach(function (button) {
                button.addEventListener("click", function () {
                    var cardNumber = button.dataset.cardNumber;
                    var cardName = button.dataset.cardName;

                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "RemoveCard", true);
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === XMLHttpRequest.DONE) {
                            if (xhr.status === 200) {
                                console.log("Item removed successfully");
                                refreshPaymentCardList();
                            } else {
                                console.error("Error removing item: " + xhr.responseText);
                            }
                        }
                    };
                    xhr.send("cardNumber=" + encodeURIComponent(cardNumber) + "&cardName=" + encodeURIComponent(cardName));
                });
            });

            function refreshPaymentCardList() {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "EditPaymentCard", true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            // Update the payment card list with the new content
                            updateCardContent(xhr.responseText);
                            addEventListeners();
                        } else {
                            console.error("Error refreshing payment card list: " + xhr.responseText);
                        }
                    }
                };
                xhr.send();
            }

            function updateCardContent(cardHTML) {
                document.body.innerHTML = cardHTML;
            }
        </script>
        <!--end of content-->
    </body>
    <%--footer--%>
    <jsp:include page="components/footer.jsp" />
</html>