<%@page contentType="text/html" pageEncoding="UTF-8"%> <%--tags--%> <%@ taglib
    prefix="custom" tagdir="/WEB-INF/tags" %> <%--imports--%> <%--includes--%>

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
            <h3>Debit/Credit Card Payment</h3>

            <form action="OrderCreation" method="post" id="card-payment-form">
                <div class="form-container">
                    <div class="field-container">
                        <label for="name">Card Holder Name</label>
                        <input id="name" maxlength="20" type="text" />
                    </div>
                    <div id="payment-name-error" class="payment-error-message"></div>
                    <br/>

                    <div class="field-container">
                        <label for="cardnumber">Card Number</label>
                        <input
                            id="cardnumber"
                            type="text"
                            pattern="[0-9]*"
                            inputmode="numeric"
                            />
                    </div>
                    <div id="payment-cardNumber-error" class="payment-error-message"></div>
                    <br/>

                    <div class="field-container">
                        <label for="expirationdate">Expiration (mm/yy)</label>
                        <input
                            id="expirationdate"
                            type="text"
                            pattern="[0-9]*"
                            inputmode="numeric"
                            maxlength="19"
                            />
                    </div>
                    <div id="payment-expiration-error" class="payment-error-message"></div><br/>
                    <div class="field-container">
                        <label for="securitycode">CVV</label>
                        <input
                            id="securitycode"
                            type="text"
                            pattern="[0-9]*"
                            inputmode="numeric"
                            />
                    </div>
                    <div id="payment-cvv-error" class="payment-error-message"></div><br/>

                    <button type="submit" id="card-payment-submit">Confirm with payment.</button>
                </div>
            </form>

            <!--end of content-->
            <script>
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
                    inputValue = inputValue.replace(/\D/g, ''); // Remove non-numeric characters
                    inputValue = inputValue.slice(0, 4); // Limit input to 4 characters
                    let formattedValue = inputValue;
                    if (inputValue.length > 2) {
                        // Insert '/' after the second digit
                        formattedValue = inputValue.substring(0, 2) + '/' + inputValue.substring(2);
                    }
                    event.target.value = formattedValue;
                });

                // Auto Format the CVV
                const cvvInput = document.getElementById("securitycode");
                cvvInput.addEventListener("input", function (event) {
                    let inputValue = event.target.value;
                    inputValue = inputValue.replace(/\D/g, ''); // Remove non-numeric characters
                    inputValue = inputValue.slice(0, 3); // Limit input to 3 characters
                    event.target.value = inputValue;
                });

                // Validation for all fields
                function validateName() {
                    var name = document.getElementById("name").value;
                    var errorDiv = document.getElementById("payment-name-error");
                    if (!name) {
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
                        errorDiv.textContent =
                                "Invalid card number.";
                    } else if ((nCheck % 10) != 0) {
                        errorDiv.textContent =
                                "Sorry. This card number is invalid";
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
                        return false; // Return false indicating missing expiration date
                    } else if (expirationdate.length !== 4) {
                        errorDiv.textContent = "Invalid expiration date.";
                        return false; // Return false indicating invalid format
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
                document
                        .getElementById("name")
                        .addEventListener("blur", validateName);
                document
                        .getElementById("cardnumber")
                        .addEventListener("blur", validateCardNumber);
                document
                        .getElementById("expirationdate")
                        .addEventListener("blur", validateExpiration);
                document
                        .getElementById("securitycode")
                        .addEventListener("blur", validateCVV);

                function validateAllFields() {
                    // Trigger validation for all fields
                    validateName();
                    validateCardNumber();
                    validateExpiration();
                    validateCVV();

                    // Perform form submission if there are no validation errors
                    if (!hasValidationError()) {
                        document.getElementById("card-payment-form").submit();
                    }
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
                    var cvvError =
                            document.getElementById("payment-cvv-error").textContent;

                    // Check if any validation error exists
                    return (
                            nameError ||
                            cardNumberError ||
                            expirationError ||
                            cvvError
                            );
                }

                document
                        .getElementById("card-payment-submit")
                        .addEventListener("click", function (event) {
                            event.preventDefault();
                            validateAllFields();
                            if (hasValidationError()) {
                                alert("Please correct the validation errors before proceed.");
                            }
                        });
            </script>

        </body>
        <%--footer--%>
        <jsp:include page="components/footer.jsp" />
    </html>
