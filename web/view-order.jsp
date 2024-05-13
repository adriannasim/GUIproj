<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 30%;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Order Details</h1>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Order ID: ${order.orderId}</h5>
                <p class="card-text">Order Date: ${order.orderDate}</p>
                <p class="card-text">Status: <span class="badge badge-${order.statusClass}">${order.status}</span></p>
                <h6>Order Items:</h6>
                <ul class="list-group">
                    <c:forEach var="item" items="${order.orderItems}">
                        <li class="list-group-item">
                            <div class="row">
                                <div class="col-md-6">${item.productName}</div>
                                <div class="col-md-2">Quantity: ${item.quantity}</div>
                                <div class="col-md-2">Price: ${item.price}</div>
                                <div class="col-md-2">Total: ${item.total}</div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <h6>Customer Details:</h6>
                <p class="card-text">Name: ${order.customerName}</p>
                <p class="card-text">Address: ${order.customerAddress}</p>
                <c:if test="${not empty order.paymentInfo}">
                    <h6>Payment Information:</h6>
                    <p class="card-text">Payment Type: ${order.paymentInfo.paymentType}</p>
                    <p class="card-text">Payment Amount: ${order.paymentInfo.paymentAmount}</p>
                </c:if>
                <button id="updateStatusBtn" class="btn btn-primary">Update Status</button>
            </div>
        </div>
    </div>

    <!-- Update Status Modal -->
    <div id="updateStatusModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h4>Update Order Status</h4>
            <form>
                <div class="form-group">
                    <label for="newStatus">New Status:</label>
                    <select class="form-control" id="newStatus">
                        <option value="packaging" ${order.status == 'packaging' ? 'selected' : ''}>Packaging</option>
                        <option value="shipping" ${order.status == 'shipping' ? 'selected' : ''}>Shipping</option>
                        <option value="delivered" ${order.status == 'delivered' ? 'selected' : ''}>Delivered</option>
                    </select>
                </div>
                <button type="button" class="btn btn-primary" id="updateBtn">Update</button>
            </form>
        </div>
    </div>

    <script>
        // Get the modal
        var modal = document.getElementById("updateStatusModal");

        // Get the button that opens the modal
        var btn = document.getElementById("updateStatusBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks the button, open the modal
        btn.onclick = function() {
            modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        // Update status button click event
        document.getElementById("updateBtn").onclick = function() {
            var newStatus = document.getElementById("newStatus").value;
            var orderId = "${order.orderId}";

            // Make an AJAX request to update the order status
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "UpdateOrderStatus", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // Request successful, handle response
                        if (xhr.responseText === "success") {
                            alert("Order status updated successfully!");
                            // Refresh the page or update the UI
                            location.reload();
                        } else {
                            alert("Failed to update order status.");
                        }
                    } else {
                        alert("Request failed. Please try again later.");
                    }
                }
            };
            xhr.send("orderId=" + orderId + "&newStatus=" + newStatus);
        }
    </script>
</body>
</html>