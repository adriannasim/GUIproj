<%@page contentType="text/html" pageEncoding="UTF-8"%> <%--tags--%> 
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags"%> 
<%--imports--%> 
<%@page import="entity.Product,entity.CartItem,java.util.ArrayList,model.CartItemDAO,java.text.DecimalFormat"%>
<%--includes--%> 

<%-- Begin: Retrieve Product List From Session (cartItemList)--%> 
<% ArrayList<CartItem> cartItemList = new ArrayList<CartItem>();
    if (session.getAttribute("cartItemList") != null) {
        cartItemList
                = (ArrayList<CartItem>) session.getAttribute("cartItemList");
    }
    int totalQty = 0;
    double subtotal = 0.0;
    double shippingFee = 0.0;
    double salesTax = 0.0;
    double total = 0.0;
    DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
    double charges = 0.0;

    // Prevent caching of the page
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.

    // Check if the user is returning from an external page
    Boolean redirected = (Boolean) session.getAttribute("redirected");
    if (redirected != null && redirected) {
        // User returned from an external page
        // Call the OrderCreation servlet
        session.removeAttribute("redirected");
        RequestDispatcher dispatcher = request.getRequestDispatcher("OrderCreation");
        dispatcher.forward(request, response);
    }
%> 
<%-- End: Retrieve Product List From Session (cartitemList) --%>



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <link rel="shortcut icon" href="favicon.png" />

        <!-- Bootstrap CSS -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
            rel="stylesheet"
            />
        <link href="assets/css/tiny-slider.css" rel="stylesheet" />
        <link href="assets/css/style.css" rel="stylesheet" />
        <title>Bong Bong</title>
        <!-- Add this line to include the Google Autocomplete script -->
        <script
            src="assets/js/GoogleAutocomplete.js"
            type="text/javascript"
        ></script>
        <style>
            .error-message {
                color: red;
                font-size: 12px;
            }

            .payment-option {
                border: 1px solid #ccc;
                padding: 15px;
                margin-bottom: 10px;
                display: flex;
                align-items: center;
                height: 80px;
            }

            .custom-radio {
                display: inline-block;
                position: relative;
                padding-left: 40px;
                margin-bottom: 0;
                cursor: pointer;
                font-size: 16px;
            }

            .checkmark {
                position: absolute;
                top: 0;
                left: 0;
                height: 25px;
                width: 25px;
                background-color: #fff;
                border: 1px solid #000;
                border-radius: 3px;
                display: flex;
                justify-content: center;
                align-items: center;
                box-sizing: border-box;
                font-size: 14px;
                color: #000;
                font-weight: bold;
            }

            .payment-option input[type="radio"] {
                position: absolute;
                opacity: 0;
                cursor: pointer;
            }

            .payment-option input[type="radio"]:checked ~ .custom-radio .checkmark {
                background-color: #000;
                color: #fff;
            }

        </style>
        <script>
            const paymentOptions = document.querySelectorAll('.payment-option');

            paymentOptions.forEach(option => {
                const radio = option.querySelector('input[type="radio"]');
                radio.addEventListener('change', () => {
                    paymentOptions.forEach(opt => opt.style.borderColor = '#ccc');
                    if (radio.checked) {
                        option.style.borderColor = '#000';
                    }
                });
            });
        </script>

    </head>



    <%--header--%>
    <jsp:include page="components/Header.jsp" />

    <body>
        <!-- Start Hero Section -->
        <div class="hero">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-5">
                        <div class="intro-excerpt">
                            <h1>Checkout</h1>
                        </div>
                    </div>
                    <div class="col-lg-7"></div>
                </div>
            </div>
        </div>

        <!-- End Hero Section -->
        <form action="PaymentMethod" method="post" id="shipping-address-form">
            <div class="untree_co-section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 mb-5 mb-md-0">
                            <h2 class="h3 mb-3 text-black">Billing Details</h2>
                            <div class="p-3 p-lg-5 border bg-white">
                                <!-- Customer Details -->
                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <label for="cust-firstname" class="text-black"
                                               >First Name
                                            <span class="text-danger">*</span></label
                                        >
                                        <input class="form-control" name="cust-firstname"
                                               id="cust-firstname" type="text" value="<%=(request.getAttribute("cust-firstname") != null)
                                                       ? request.getAttribute("cust-firstname") : ""%>"/>
                                        <div
                                            id="cust-firstname-error"
                                            class="error-message"
                                            ></div>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="cust-lastname" class="text-black"
                                               >Last Name <span class="text-danger">*</span></label
                                        >
                                        <input class="form-control" name="cust-lastname"
                                               id="cust-lastname" type="text"
                                               value="<%=(request.getAttribute("cust-lastname")
                                                       != null) ? request.getAttribute("cust-lastname")
                                                               : ""%>"/>
                                        <div
                                            id="cust-lastname-error"
                                            class="error-message"
                                            ></div>
                                    </div>
                                </div>

                                <form
                                    id="address-form"
                                    action=""
                                    method="get"
                                    autocomplete="off"
                                    >
                                    <div class="form-group row">
                                        <div class="col-md-12">
                                            <label for="ship-address" class="text-black"
                                                   >Address <span class="text-danger">*</span></label
                                            >
                                            <input type="text" class="form-control"
                                                   id="ship-address" name="ship-address" required
                                                   autocomplete="off"
                                                   value="<%=(request.getAttribute("cust-address-line1")
                                                           != null)
                                                                   ? request.getAttribute("cust-address-line1") : ""%>">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-md-12 mt-3">
                                            <input id="address2" name="address2"
                                                   class="form-control" placeholder="Apartment, suite, unit etc. (optional)
                                                   value="<%=(request.getAttribute("cust-address-line2")
                                                           != null)
                                                                   ? request.getAttribute("cust-address-line2") : ""%>"
                                                   readonly/>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-md-6">
                                            <label for="locality" class="text-black"
                                                   >City <span class="text-danger">*</span></label
                                            >
                                            <input id="locality" name="locality"
                                                   class="form-control"
                                                   value="<%=(request.getAttribute("cust-city")
                                                           != null) ? request.getAttribute("cust-city") : ""%>"
                                                   required readonly />
                                        </div>
                                        <div class="col-md-6">
                                            <label for="state" class="text-black"
                                                   >State <span class="text-danger">*</span></label
                                            >
                                            <input id="state" name="state" required
                                                   class="form-control"
                                                   value="<%=(request.getAttribute("cust-state")
                                                           != null) ? request.getAttribute("cust-state") : ""%>"
                                                   required readonly />
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-md-6">
                                            <label for="country" class="text-black"
                                                   >Country <span class="text-danger">*</span></label
                                            >
                                            <input id="country" name="country"
                                                   class="form-control"
                                                   value="<%=(request.getAttribute("cust-country")
                                                           != null) ? request.getAttribute("cust-country") : ""%>"
                                                   required readonly />
                                        </div>
                                        <div class="col-md-6">
                                            <label for="postcode" class="text-black"
                                                   >Postal Code
                                                <span class="text-danger">*</span></label
                                            >
                                            <input id="postcode" name="postcode" required
                                                   class="form-control"
                                                   value="<%=(request.getAttribute("cust-postcode")
                                                           != null) ? request.getAttribute("cust-postcode")
                                                                   : ""%>" readonly />
                                        </div>
                                    </div>
                                </form>
                                <div id="ship-address-error" class="error-message"></div>

                                <div class="form-group">
                                    <label for="c_order_notes" class="text-black"
                                           >Contact No <span class="text-danger">*</span></label
                                    >
                                    <input name="cust-contactNo" id="cust-contactNo"
                                           type="text" value="<%=(request.getAttribute("cust-contactNo") != null)
                                                   ? request.getAttribute("cust-contactNo") : ""%>"
                                           class="form-control"/>
                                    <div
                                        id="cust-contactNo-error"
                                        class="error-message"
                                        ></div>
                                </div>

                                <div class="form-group mt-3">
                                    <label for="c_order_notes" class="text-black"
                                           >Order Notes</label
                                    >
                                    <textarea
                                        name="cust-remark"
                                        id="cust-remark"
                                        cols="30"
                                        rows="5"
                                        class="form-control"
                                        placeholder="Write your notes here..."
                                        ></textarea>
                                    <div id="cust-remark-error" class="error-message"></div>
                                </div>
                                <!-- Customer Details -->
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="row mb-5" hidden>
                                <div class="col-md-12">
                                    <h2 class="h3 mb-3 text-black">Coupon Code</h2>
                                    <div class="p-3 p-lg-5 border bg-white">
                                        <label for="c_code" class="text-black mb-3"
                                               >Enter your coupon code if you have one</label
                                        >
                                        <div class="input-group w-75 couponcode-wrap">
                                            <input
                                                type="text"
                                                class="form-control me-2"
                                                id="c_code"
                                                placeholder="Coupon Code"
                                                aria-label="Coupon Code"
                                                aria-describedby="button-addon2"
                                                />
                                            <div class="input-group-append">
                                                <button
                                                    class="btn btn-black btn-sm"
                                                    type="button"
                                                    id="button-addon2"
                                                    >
                                                    Apply
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-5">
                                <div class="col-md-12">
                                    <h2 class="h3 mb-3 text-black">Your Order</h2>
                                    <div class="p-3 p-lg-5 border bg-white">
                                        <table class="table site-block-order-table mb-5">
                                            <thead>
                                            <th>Product</th>
                                            <th>Total</th>
                                            </thead>
                                            <tbody>
                                                <% for (CartItem cartItem : cartItemList) {%>
                                                <!-- Order Product Looping -->
                                                <tr>
                                                    <td>
                                                        <%= cartItem.getProd().getProdName()%>
                                                        <strong class="mx-2">x</strong> <%= cartItem.getItemQty()%>
                                                    </td>
                                                    <td><% String formattedAmount
                                                                = decimalFormat.format(cartItem.getProd().getProdPrice()
                                                                        * cartItem.getItemQty());%> 
                                                        <b>RM <%=formattedAmount%></b></td>
                                                </tr>
                                                <!-- Order Product Looping -->
                                                <%
                                                    subtotal += cartItem.getProd().getProdPrice() * cartItem.getItemQty();
                                                %>
                                                <% }%> 
                                                <%
                                                    String formattedSubtotal = decimalFormat.format(subtotal);
                                                %>

                                                <tr>
                                                    <td class="text-black font-weight-bold">
                                                        <strong>Cart Subtotal</strong>
                                                    </td>
                                                    <td class="text-black">RM <%=formattedSubtotal%></td>
                                                </tr>
                                                <% if (subtotal >= 1000) {
                                                        shippingFee = 0.0;
                                                    } else {
                                                        shippingFee = 15.00;
                                                    }
                                                    salesTax = subtotal * 0.10;
                                                    total = subtotal + shippingFee + salesTax;
                                                    charges = total * 0.01;
                                                    String formattedShippingFee
                                                            = decimalFormat.format(shippingFee);
                                                    String formattedSalesTax = decimalFormat.format(salesTax);
                                                    String formattedTotal = decimalFormat.format(total);
                                                    String formattedCharges = decimalFormat.format(charges);%>
                                                <tr>
                                                    <td class="text-black font-weight-bold">
                                                        <strong>Shipping Fee</strong>
                                                    </td>
                                                    <td class="text-black">RM <%=formattedShippingFee%></td>
                                                </tr>

                                                <tr>
                                                    <td class="text-black font-weight-bold">
                                                        <strong>Sales Tax (10%)</strong>
                                                    </td>
                                                    <td class="text-black">RM <%=formattedSalesTax%></td>
                                                </tr>

                                                <tr>
                                                    <td class="text-black font-weight-bold">
                                                        <strong>Order Total</strong>
                                                    </td>
                                                    <td class="text-black font-weight-bold">
                                                        <strong>RM <%=formattedTotal%></strong>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <div class="payment-option">
                                            <input type="radio" name="paymentMethod" id="fpx" value="fpx">
                                            <label for="fpx" class="custom-radio">
                                                Direct Bank Transfer
                                                <span class="checkmark">&#10003;</span>
                                            </label>
                                        </div>



                                        <div class="payment-option">
                                            <input type="radio" name="paymentMethod" id="card" value="card">
                                            <label for="card" class="custom-radio">
                                                Card Payment <br/><span style="font-size:12px;"><i>Note: You will be charged 1% (RM <%=formattedCharges%>) if you use a card to pay.</i></span>
                                                <span class="checkmark">&#10003;</span>
                                            </label>
                                        </div>

                                        <div class="payment-option">
                                            <input type="radio" name="paymentMethod" id="ewallet" value="ewallet">
                                            <label for="ewallet" class="custom-radio">
                                                E-wallet
                                                <span class="checkmark">&#10003;</span>
                                            </label>
                                        </div>

                                        <div
                                            id="payment-method-error"
                                            class="error-message"
                                            ></div>


                                        <div class="form-group mt-4">
                                            <button
                                                class="btn btn-black btn-lg py-3 btn-block"
                                                id="shipping-address-submit-btn"
                                                type="submit"
                                                >
                                                Proceed
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
        <script>
            function validateFirstName() {
                var firstname = document.getElementById("cust-firstname").value;
                var nameFormat = /^[a-zA-Z\s]+$/;
                var errorDiv = document.getElementById("cust-firstname-error");
                if (!firstname) {
                    errorDiv.textContent = "First Name is required.";
                } else if (firstname.length < 2) {
                    errorDiv.textContent =
                            "First Name must be at least 2 characters long.";
                } else if (!firstname.match(nameFormat)) {
                    errorDiv.textContent =
                            "First Name should only consists of alphabets and spaces.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateLastName() {
                var lastname = document.getElementById("cust-lastname").value;
                var nameFormat = /^[a-zA-Z\s]+$/;
                var errorDiv = document.getElementById("cust-lastname-error");
                if (!lastname) {
                    errorDiv.textContent = "Last Name is required.";
                } else if (lastname.length < 2) {
                    errorDiv.textContent =
                            "Last Name must be at least 2 characters long.";
                } else if (!lastname.match(nameFormat)) {
                    errorDiv.textContent =
                            "First Name should only consists of alphabets and spaces.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateContactNo() {
                var contactNo = document.getElementById("cust-contactNo").value;
                var phoneFormat =
                        /^6?(?:01[02346-9]\d{7}|011\d{8}|015\d{8}|03\d{8}|0[4-9]\d{7})$/;
                var errorDiv = document.getElementById("cust-contactNo-error");
                if (!contactNo) {
                    errorDiv.textContent = "Contact No. is required.";
                } else if (!contactNo.match(phoneFormat)) {
                    errorDiv.textContent = "Invalid phone format.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateAddress() {
                var address = address1Field.value.trim();
                var locality = document.querySelector("#locality").value.trim();
                var state = document.querySelector("#state").value.trim();
                var postcode = postalField.value.trim();
                var country = document.querySelector("#country").value.trim();
                var errorDiv = document.getElementById("ship-address-error");
                if (!address && !locality && !state && !postcode && !country) {
                    errorDiv.textContent = "Address is required.";
                } else if (
                        !address ||
                        !locality ||
                        !state ||
                        !postcode ||
                        !country
                        ) {
                    errorDiv.textContent = "Invalid address.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateRemark() {
                var remark = document.getElementById("cust-remark").value;
                var errorDiv = document.getElementById("cust-remark-error");
                if (remark.length > 500) {
                    errorDiv.textContent =
                            "Remark cannot more than 500 characters.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            
            function isPaymentOptionSelected() {
                const paymentRadios = document.querySelectorAll('input[name="paymentMethod"]');
                for (const radio of paymentRadios) {
                    if (radio.checked) {
                        return true;
                    }
                }
                return false;
            }
            
            function validatePaymentMethod() {
                const errorDiv = document.getElementById('payment-method-error');
                
                if (isPaymentOptionSelected()) {
                    errorDiv.textContent = '';
                } else {
                    errorDiv.textContent = 'Please select a payment option.';
                }
            }


            // Add event listeners to trigger validation
            document
                    .getElementById("cust-firstname")
                    .addEventListener("blur", validateFirstName);
            document
                    .getElementById("cust-lastname")
                    .addEventListener("blur", validateLastName);
            document
                    .getElementById("cust-contactNo")
                    .addEventListener("blur", validateContactNo);
            document
                    .getElementById("ship-address")
                    .addEventListener("blur", validateAddress);
            document
                    .getElementById("cust-remark")
                    .addEventListener("blur", validateRemark);

            function validateAllFields() {
                // Trigger validation for all fields
                validateFirstName();
                validateLastName();
                validateContactNo();
                validateAddress();
                validateRemark();
                validatePaymentMethod();

                // Perform form submission if there are no validation errors
                if (!hasValidationError()) {
                    document.getElementById("shipping-address-form").submit();
                }
            }

            function hasValidationError() {
                // Validation error flags for each field
                var firstNameError = document.getElementById(
                        "cust-firstname-error"
                        ).textContent;
                var lastNameError = document.getElementById(
                        "cust-lastname-error"
                        ).textContent;
                var contactNoError = document.getElementById(
                        "cust-contactNo-error"
                        ).textContent;
                var addressError =
                        document.getElementById("ship-address-error").textContent;
                var remarkError =
                        document.getElementById("cust-remark-error").textContent;
                var paymentMethodError =
                        document.getElementById("payment-method-error").textContent;

                // Check if any validation error exists
                return (
                        firstNameError ||
                        lastNameError ||
                        contactNoError ||
                        addressError ||
                        remarkError ||
                        paymentMethodError
                        );
            }

            document
                    .getElementById("shipping-address-submit-btn")
                    .addEventListener("click", function (event) {
                        event.preventDefault();

                        validateAllFields();
                        if (hasValidationError()) {
                            alert("Please correct the validation errors before proceed.");
                        }
                    });
        </script>
        <script
            async
            defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjUgiiuQxHnVKzlXWADiT4T9YxjQda4Q0&callback=initAutocomplete&libraries=places&v=weekly"
        ></script>

        <%--footer--%>
        <jsp:include page="admin-components/footer.jsp" />
    </body>
</html> </CartItem></CartItem
></CartItem>
