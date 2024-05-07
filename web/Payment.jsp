<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%--tags--%> 
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %> 

<%--imports--%> 

<%@page import="entity.Product,entity.CartItem,java.util.ArrayList,model.CartItemDAO,java.text.DecimalFormat"%> 

<%--includes--%> 

<%-- Begin: Retrieve Product List From Session (cartItemList) --%> 
<% ArrayList<CartItem> cartItemList = new ArrayList<CartItem>();
    if (session.getAttribute("cartItemList") != null) {
        cartItemList
                = (ArrayList<CartItem>) session.getAttribute("cartItemList");
    }
    int totalQty = 0;
    Double subtotal = 0.0;
    Double shippingFee = 0.0;
    Double salesTax = 0.0;
    Double total = 0.0;
    DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
%> 
<%-- End: Retrieve Product List From Session (cartitemList) --%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Checkout</title>

        <!-- Include commonFiles.tag -->
        <custom:commonFiles />
        <style>
            .cust-error-message {
                color: red;
            }
        </style>

    </head>

    <body>
        <%--header--%>
        <jsp:include page="components/header.jsp" />

        <!--start of content-->
        <div id="message-box"></div>

        <div class="p-5">
            1. Enter details.
            <h3>Shipping Address</h3>
            <div class="d-flex flex-row w-100 justify-content-between">
                <form action="PaymentMethod" method="post" id="shipping-address-form">
                    <div class="d-flex flex-column w-100">
                        <label>First Name</label>
                        <input name="cust-firstname" id="cust-firstname" type="text"
                               value="<%= (request.getAttribute("cust-firstname") != null)
                                       ? request.getAttribute("cust-firstname") : ""%>"/>
                        <div
                            id="cust-firstname-error"
                            class="cust-error-message"
                            ></div>
                        <br />

                        <label>Last Name</label>
                        <input name="cust-lastname" id="cust-lastname" type="text"
                               value="<%=(request.getAttribute("cust-lastname") != null)
                                       ? request.getAttribute("cust-lastname") : ""%>"/>
                        <div
                            id="cust-lastname-error"
                            class="cust-error-message"
                            ></div>
                        <br />

                        <form
                            id="address-form"
                            action=""
                            method="get"
                            autocomplete="off"
                            >
                            <label class="full-field">
                                <span class="form-label">Address</span></label
                            >
                            <input id="ship-address" name="ship-address" required
                                   autocomplete="off"
                                   value="<%=(request.getAttribute("cust-address-line1")
                                           != null) ? request.getAttribute("cust-address-line1") : ""%>"
                                   />
                            <br />

                            <label class="full-field">
                                <span class="form-label"
                                      >Apartment, unit, suite, or floor (optional)</span
                                >
                            </label>
                            <input id="address2" name="address2"
                                   value="<%=(request.getAttribute("cust-address-line2")
                                           != null) ? request.getAttribute("cust-address-line2") : ""%>"
                                   readonly/>
                            <br />

                            <label class="full-field">
                                <span class="form-label">City</span>
                            </label>
                            <input id="locality" name="locality"
                                   value="<%=(request.getAttribute("cust-city") != null)
                                           ? request.getAttribute("cust-city") : ""%>" required readonly
                                   />
                            <br />

                            <label class="slim-field-start">
                                <span class="form-label">State</span>
                            </label>
                            <input id="state" name="state" required
                                   value="<%=(request.getAttribute("cust-state") != null)
                                           ? request.getAttribute("cust-state") : ""%>" readonly />
                            <br />

                            <label class="slim-field-end" for="postal_code">
                                <span class="form-label">Postal code</span></label
                            >
                            <input id="postcode" name="postcode" required
                                   value="<%=(request.getAttribute("cust-postcode") != null)
                                           ? request.getAttribute("cust-postcode") : ""%>" readonly />
                            <br />

                            <label class="full-field">
                                <span class="form-label">Country</span>
                            </label>
                            <input id="country" name="country"
                                   value="<%=(request.getAttribute("cust-country") != null)
                                           ? request.getAttribute("cust-country") : ""%>" required
                                   readonly />
                        </form>

                        <div id="ship-address-error" class="cust-error-message"></div>
                        <br />

                        <label>Contact No</label>
                        <input name="cust-contactNo" id="cust-contactNo" type="text"
                               value="<%= (request.getAttribute("cust-contactNo") != null)
                                       ? request.getAttribute("cust-contactNo") : ""%>"/>
                        <div
                            id="cust-contactNo-error"
                            class="cust-error-message"
                            ></div>
                        <br />

                        <label>Remark</label>
                        <textarea
                            name="cust-remark"
                            id="cust-remark"
                            rows="4"
                            cols="50"
                            ></textarea
                        >
                        <div id="cust-remark-error" class="cust-error-message"></div>
                        <br />

                    </div>
                    <div class="w-50">
                        <div id="cartContent">
                            <!-- Display cart items -->
                            <% for (CartItem cartItem : cartItemList) {%>
                            <div
                                class="d-flex flex-row align-items-center w-100 justify-content-between p-5"
                                id="cartItem<%= cartItem.getProd().getProdId()%>"
                                >
                                <!-- Display cart item details -->
                                <img
                                    src="<%= request.getContextPath() + cartItem.getProd().getProdImg()[0]%>"
                                    height="100px"
                                    width="auto"
                                    />
                                <div><%= cartItem.getProd().getProdName()%>&nbsp;</div>
                                <div>
                                    <% String formattedPrice = String.format("%.2f",
                                                cartItem.getProd().getProdPrice());%> RM
                                    <%=formattedPrice%> &nbsp;
                                </div>
                                x &nbsp; <%= cartItem.getItemQty()%>
                                <div class="subtotal">
                                    <% String formattedAmount
                                                = decimalFormat.format(cartItem.getProd().getProdPrice()
                                                        * cartItem.getItemQty());%> :
                                    <b>RM <%=formattedAmount%></b>
                                </div>
                            </div>
                            <% totalQty += cartItem.getItemQty();
                                subtotal
                                        += cartItem.getProd().getProdPrice() * cartItem.getItemQty();
                            %> <% }%> <% if (!cartItemList.isEmpty()) { %>
                            <div class="text-right p-5">
                                <% String formattedSubtotal
                                            = decimalFormat.format(subtotal);%>
                                <b>Total item(s) : <%=totalQty%> pcs</b>&nbsp; &nbsp;
                                <b>Subtotal : RM <%=formattedSubtotal%></b><br />
                                <hr />
                                <% if (subtotal >= 1000) {
                                        shippingFee = 0.0;
                                    } else {
                                        shippingFee = 15.00;
                                    }
                                    salesTax = subtotal * 0.10;
                                    total
                                            = subtotal + shippingFee + salesTax;
                                    String formattedShippingFee
                                            = decimalFormat.format(shippingFee);
                                    String formattedSalesTax = decimalFormat.format(salesTax);
                                    String formattedTotal = decimalFormat.format(total);%>
                                <small>
                                    Shipping Fee : RM <%=formattedShippingFee%>
                                    <br /><span style="font-size: 10px"
                                                >(Free shipping if purchase over RM1,000)</span
                                    ></small
                                ><br />
                                <small>
                                    Sales Tax (10%) : RM <%=formattedSalesTax%> <br
                                        /></small>
                                <b>Total: RM <%=formattedTotal%></b><br />
                                <hr />
                                <button
                                    class="w-25"
                                    id="shipping-address-submit-btn"
                                    type="submit"
                                    >
                                    Proceed
                                </button>
                            </div>
                            <% }%>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--end of content-->

        <%--footer--%>
        <jsp:include page="components/footer.jsp" />

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

                // Check if any validation error exists
                return (
                        firstNameError ||
                        lastNameError ||
                        contactNoError ||
                        addressError ||
                        remarkError
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
    </body>
</html> </CartItem></CartItem
></CartItem>
