<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%--tags--%> 
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %> 

<%--imports--%> 

<%--includes--%>
<%@page import="jpaEntity.*, java.util.ArrayList"%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Card Payment</title>

        <!-- Include commonFiles.tag -->
        <custom:commonFiles />

        <style>
            .payment-error-message {
                color: red;
            }
        </style>
    </head>

    <body class="text-center">
        <%--header--%>
        <jsp:include page="components/header.jsp" />

        <!--start of content-->

        <!-- Page content wrapper-->
        <div id="page-content-wrapper">
            <!-- Page content-->

            <!-- Existing Payment Card -->
            <div class="col-md-5" style="padding-left:180px;width:70%;">
                <div class="p-3"style="padding-top:10px;">

                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">My CREDIT/DEBIT CARDS</h4>
                    </div>
                    <form action="OrderCreation" method="post" id="">
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
                                        <li class="list-group-item d-flex justify-content-center align-items-center p-3">
                                            <button class="submitButton btn btn-primary profile-button w-50" type="submit" id="">Use this card</button>
                                        </li>
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
                    </form>


                    <form action="OrderCreation" method="post" id="new-card-form">

                        <input type="hidden" name="newly-added-card" id="newly-added-card" value="true"/>
                        <!-- ADD PAYMENT CARD -->
                        <div id="AddCardDiv" style="display:none;">
                            

                                <div class="col-md-6"><label class="labels">Card Name</label>
                                    <input type="text" class="form-control" placeholder="Holder name"  name="name" id="name">
                                    <div id="payment-name-error" class="payment-error-message"></div>
                                </div>

                                <div class="col-md-6"><label class="labels">Card Number</label>
                                    <input type="text" class="form-control" placeholder="4242 4242 4242 4242"  id="cardnumber"
                                           name="cardnumber">
                                    <div id="payment-cardNumber-error" class="payment-error-message"></div>
                                    <div id="payment-cardNumber-status" class="payment-status-message"></div>
                                </div>

                            </div>

                            <div class="row mt-2">

                                <div class="col-md-6"><label class="labels">Expiration Date</label>
                                    <input type="text" class="form-control" placeholder="MM/YY"  id="expirationdate"
                                           name="expirationdate"/>
                                    <div id="payment-expiration-error" class="payment-error-message"></div>
                                </div>

                                <div class="col-md-6"><label class="labels">CVV</label>
                                    <input type="text" class="form-control" placeholder="***"  id="securitycode"
                                           name="securitycode"/>
                                    <div id="payment-cvv-error" class="payment-error-message"></div>
                                </div>

                            </div>

                            <div class="mt-5 text-center">
                                <button class="btn btn-primary profile-button" 
                                        type="submit" id="card-payment-submit">Confirm with Payment</button>
                            </div>
                        </div>
                        <!-- ADD PAYMENT CARD -->
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
            const textInput = document.getElementById("name");
            textInput.addEventListener("input", function (event) {
                let inputValue = event.target.value;
                inputValue = inputValue.replace(/[^a-zA-Z ]/g, '');
                let capitalizedValue = inputValue.toLowerCase().replace(/\b\w/g, function (char) {
                    return char.toUpperCase();
                });
                event.target.value = capitalizedValue;
            });

            // Auto format the Card Number
            const cardInput = document.getElementById("cardnumber");
            cardInput.addEventListener("input", function (event) {
                let inputValue = event.target.value;
                inputValue = inputValue.replace(/\D/g, '');
                inputValue = inputValue.slice(0, 16);
                let formattedValue = inputValue.replace(/(\d{4})/g, '$1 ').trim();
                event.target.value = formattedValue;
            });

            // Auto Format the Expiry Date
            const dateInput = document.getElementById("expirationdate");
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
            const cvvInput = document.getElementById("securitycode");
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
            var cardName = document.getElementById("name").value;
            var errorDiv = document.getElementById("payment-name-error");
            if (!cardName) {
                errorDiv.textContent = "Name is required.";
            } else {
                errorDiv.textContent = "";
            }
        }

        function validateCardNumber() {
            var cardNumber = document.getElementById("cardnumber").value;
            var errorDiv = document.getElementById("payment-cardNumber-error");
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
                errorDiv.textContent = "Invalid card number format.";
            } else if ((nCheck % 10) !== 0) {
                errorDiv.textContent = "Invalid card number.";
            } else {
                errorDiv.textContent = "";
            }
        }

        function validateExpiration() {
            var expirationdate = document.getElementById("expirationdate");
            var expirationdate = expirationdate.value;
            var errorDiv = document.getElementById("payment-expiration-error");
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
            var cvv = document.getElementById("securitycode").value;
            var errorDiv = document.getElementById("payment-cvv-error");
            if (!cvv) {
                errorDiv.textContent = "CVV is required.";
            } else if (cvv.length < 3) {
                errorDiv.textContent = "Invalid CVV.";
            } else {
                errorDiv.textContent = "";
            }
        }

        // Add event listeners to trigger validation
        document.getElementById("name").addEventListener("blur", validateName);
        document.getElementById("cardnumber").addEventListener("blur", validateCardNumber);
        document.getElementById("expirationdate").addEventListener("blur", validateExpiration);
        document.getElementById("securitycode").addEventListener("blur", validateCVV);


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
                    "payment-name-error"
                    ).textContent;
            var cardNumberError = document.getElementById(
                    "payment-cardNumber-error"
                    ).textContent;
            var expirationError = document.getElementById(
                    "payment-expiration-error"
                    ).textContent;
            var cvvError = document.getElementById(
                    "payment-cvv-error"
                    ).textContent;

            // Check if any validation error exists
            return (
                    nameError ||
                    cardNumberError ||
                    expirationError ||
                    cvvError 
                    );
        }

        // Prevent submit without validation
        document.getElementById("card-payment-submit").addEventListener("click", function (event) {
            event.preventDefault();
            validateAllFields();

            if (hasValidationError()) {
                alert("Please correct the validation errors before proceeding.");
            } else {
                checkCardExistenceForSubmission();
            }
        });

        function checkCardExistenceForSubmission() {
            var cardName = document.getElementById("name").value;
            var cardNumber = document.getElementById("cardnumber").value;
            var errorDiv = document.getElementById("payment-cardNumber-error");

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
                            errorDiv.textContent = "This card has been used.";
                        } else {
                            document.getElementById("new-card-form").submit();
                        }
                    } else {
                        alert("Error checking card availability. Please try again later.");
                    }
                }
            };
            xhr.send();
        }
    </script>

    <!--end of content-->

</body>
<%--footer--%>
<jsp:include page="components/footer.jsp" />
</html>
