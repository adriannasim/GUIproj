<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--imports--%>
<%@page import="jpaEntity.Product,java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%--tags--%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--includes--%>
<jsp:include page="/RetrieveProductsAdm"/>
<jsp:include page="/EditProducts"/>

<%
//Get the result from servlet
    Product prod = (Product) request.getAttribute("prod");
    String[] imgs = (String[]) request.getAttribute("imgs");
    String[] keys = (String[]) request.getAttribute("keys");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>

        <!-- Theme -->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <style>
            .editStaff {
                max-width: 800px;
                margin: 50px auto;
                position: relative;

            }
            .editStaff .title {
                text-align: center;
                text-transform: uppercase;
                letter-spacing: 3px;
                font-size: 3.2em;
                line-height: 48px;
                padding-bottom: 48px;
                color: #3b5d50;
                background: #3b5d50;
                -webkit-background-clip: text !important;
                -webkit-text-fill-color: transparent !important;
            }
            .contact-form .form-field {
                position: relative;
                margin: 32px 0;
            }
            .contact-form .input-text {
                display: block;
                width: 100%;
                height: 36px;
                border-width: 0 0 2px 0;
                border-color: #3b5d50;
                font-size: 18px;
                line-height: 26px;
                font-weight: 400;
            }
            .contact-form .inputMain {
                display: block;
                position: relative;
                top:20px;
            }
            .contact-form .input-text:focus {
                outline: none;
            }
            .contact-form .input-text:focus + .label,
            .contact-form .input-text.not-empty + .label {
                -webkit-transform: translateY(-24px);
                transform: translateY(-24px);
            }
            .contact-form .label {
                position: absolute;
                left: 17px;
                bottom: 20px;
                font-size: 18px;
                line-height: 26px;
                font-weight: 400;
                color: #3b5d50;
                cursor: text;
                transition: -webkit-transform .2s ease-in-out;
                transition: transform .2s ease-in-out;
                transition: transform .2s ease-in-out,
                    -webkit-transform .2s ease-in-out;
            }
            .contact-form .genderField {
                font-size: 18px;
                line-height: 26px;
                font-weight: 400;
                color: #3b5d50;
                margin-right: 15px;
            }
            .contact-form .submit-btn {
                display: inline-block;
                background-color: #3b5d50;
                color: #fff;
                text-transform: uppercase;
                letter-spacing: 2px;
                font-size: 16px;
                padding: 8px 16px;
                border: none;
                width:200px;
                cursor: pointer;
            }
        </style>
    </head>
    <body class="g-sidenav-show bg-gray-100">
        <section class="editStaff">
            <h1 class="title">Edit Product</h1>
            <div class="errorMsg row" style="position:relative;top:-20px;">
                <div class="col-sm">
                    <div id="errorNameDiv" style="color:red;font-size:13pt;"></div>
                    <div id="errorDescDiv" style="color:red;font-size:13pt;"></div>
                    <div id="errorPriceDiv" style="color:red;font-size:13pt;"></div>
                    <div id="errorQuantityDiv" style="color:red;font-size:13pt;"></div>
                </div>
                <div class="col-sm">
                    <div id="errorImageDiv" style="color:red;font-size:13pt;"></div>
                    <div id="errorKeywordsDiv" style="color:red;font-size:13pt;"></div>
                    <div id="errorDateDiv" style="color:red;font-size:13pt;"></div>
                </div>
            </div>

            <form class="contact-form row" action="EditProducts" id="editProductForm">
                <div class="form-field col-lg-6">
                    <input id="id" class="input-text js-input" type="text" disabled
                           value="<%= prod.getProdid()%>">
                    <label class="label" for="id">Product ID</label>
                </div>

                <div class="form-field col-lg-6 ">
                    <input id="name" name="name" class="input-text js-input" type="text"
                           value="<%= prod.getProdname()%>">
                    <label class="label" for="name">Product Name</label>
                </div>

                <div class="form-field col-lg-6 ">
                    <input id="description" name="description" class="input-text js-input" type="text"
                           value="<%= prod.getProddesc()%>">
                    <label class="label" for="description">Product Description</label>
                </div>

                <div class="form-field col-lg-6 ">
                    <input id="price" name="price" class="input-text js-input" type="text"
                           value="<%= prod.getProdprice()%>">
                    <label class="label" for="price">Product Price</label>
                </div>

                <div class="form-field col-lg-6 ">
                    <input id="stock" name="stock" class="input-text js-input" type="number"
                           value="<%= prod.getQtyavailable()%>">
                    <label class="label" for="stock">Stock</label>
                </div>

                <div class="form-field col-lg-6 ">
                    <input id="imageInput" name="imageInput" class="input-file js-input" type="file" accept="image/*">
                    <label class="label" for="imageInput">Upload Image</label>
                </div>

                <div class="form-field col-lg-12">
                    <input id="keywords" name="keywords" class="input-text js-input" type="text" required
                           value="<%= prod.getProdkeywords()%>">
                    <label class="label" for="keywords">Keywords</label>
                </div>

                <div class="form-field col-lg-12">
                    <input id="date" name="date" class="input-text js-input" type="date" required
                           value="<%= prod.getProdaddeddate()%>">
                    <label class="label" for="date">Added On</label>
                </div>

                <div class="form-field col-lg-12">
                    <input class="submit-btn" id="editProductSubmit" type="submit" value="Submit">
                </div>
            </form>
        </section>

        <script>
            function validateImage() {
                var fileInput = document.getElementById('imageInput');
                var errorDiv = document.getElementById("errorImageDiv");
                var filePath = fileInput.value;
                // Check if the file input has a value
                if (filePath) {
                    // Get the file extension
                    var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();
                    // Check if the extension is valid
                    if (ext === "gif" || ext === "png" || ext === "jpeg" || ext === "jpg") {
                        // Image file is valid
                        errorDiv.textContent = "";
                    } else {
                        // Alert user that only image files are allowed
                        errorDiv.textContent = "Only image files are allowed";
                    }
                } else {
                    errorDiv.textContent = "Image is required.";
                }
            }

            function validateName() {
                var name = document.getElementById("name").value;
                var nameFormat = /^[a-zA-Z\s]+$/;
                var errorDiv = document.getElementById("errorNameDiv");
                if (!name) {
                    errorDiv.textContent = "Name is required.";
                } else if (firstname.length < 2) {
                    errorDiv.textContent =
                            "Name must be at least 2 characters long.";
                } else if (!firstname.match(nameFormat)) {
                    errorDiv.textContent =
                            "Name should only consists of alphabets and spaces.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateDesc() {
                var description = document.getElementById("description").value;
                var errorDiv = document.getElementById("errorDescDiv");
                if (!description) {
                    errorDiv.textContent = "Description is required.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateQuantity() {
                var quantity = document.getElementById("stock").value;
                var errorDiv = document.getElementById("errorQuantityDiv");

                // Check if the input is empty
                if (!quantity) {
                    errorDiv.textContent = "Quantity is required.";
                } else if (isNaN(quantity) || parseInt(quantity) <= 0) {
                    errorDiv.textContent = "Please enter a valid quantity.";
                }
                errorDiv.textContent = "";
            }

            function validatePrice() {
                var price = document.getElementById('price');
                var priceInput = price.value.trim();
                var errorDiv = document.getElementById("errorPriceDiv");

                // Check if the input is empty
                if (priceInput === "") {
                    errorDiv.textContent = "Price is required.";
                } else if (isNaN(priceInput) || parseFloat(priceInput) <= 0) {
                    errorDiv.textContent = "Invalid price.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateKeywords() {
                var keywords = document.getElementById("keywords").value;
                var errorDiv = document.getElementById("errorKeywordsDiv");

                if (!keywords) {
                    errorDiv.textContent = "Keywords is required.";
                } else {
                    errorDiv.textContent = "";
                }
            }

            function validateDate() {
                var date = document.getElementById("date").value;
                var errorDiv = document.getElementById("errorDateDiv");

                if (!date) {
                    errorDiv.textContent = "Date is required.";
                } else {
                    var today = new Date();
                    var dateInput = new Date(date);

                    if (dateInput <= today) {
                        errorDiv.textContent = "The date must be after today.";
                    } else {
                        errorDiv.textContent = "";
                    }
                }
            }

            // Add event listeners to trigger validation
            document
                    .getElementById("name")
                    .addEventListener("blur", validateName);
            document
                    .getElementById("desc")
                    .addEventListener("blur", validateDesc);
            document
                    .getElementById("stock")
                    .addEventListener("blur", validateQuantity);
            document
                    .getElementById("imageInput")
                    .addEventListener("blur", validateImage);
            document
                    .getElementById("keywords")
                    .addEventListener("blur", validateKeywords);
            document
                    .getElementById("date")
                    .addEventListener("blur", validateDate);

            function validateAllFields() {
                // Trigger validation for all fields
                validateName();
                validateDesc();
                validateDesc();
                validatePrice();
                validateQuantity();
                validateKeywords();
                validateDate();

                // Perform form submission if there are no validation errors
                if (!hasValidationError()) {
                    document.getElementById("editProductForm").submit();
                }
            }

            function hasValidationError() {
                // Validation error flags for each field
                var nameError =
                        document.getElementById(
                                "errorNameDiv"
                                ).textContent;
                var descError = document.getElementById(
                        "errorDescDiv"
                        ).textContent;
                var priceError = document.getElementById(
                        "errorPriceDiv"
                        ).textContent;
                var quantityError = document.getElementById(
                        "errorQuantityDiv"
                        ).textContent;
                var dateError = document.getElementById(
                        "errorDateDiv"
                        ).textContent;
                var imageError = document.getElementById(
                        "errorImageDiv"
                        ).textContent;
                var keywordsError =
                        document.getElementById(
                                "errorKeywordsDiv"
                                ).textContent;
                        
                // Check if any validation error exists
                return (
                        nameError ||
                        descError ||
                        priceError ||
                        quantityError ||
                        imageError ||
                        keywordsError ||
                        dateError
                        );
            }

            document.getElementById("editProductSubmit").addEventListener("click", function (event) {
                event.preventDefault();
                validateAllFields();
                if (hasValidationError()) {
                    alert("Please correct the validation errors before submitting the form.");
                }
            }
            );
        </script>

        <script
            async
            defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjUgiiuQxHnVKzlXWADiT4T9YxjQda4Q0&callback=initAutocomplete&libraries=places&v=weekly"
        ></script>
    </body>
</html>
