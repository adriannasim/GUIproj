function refreshCart() {
    // Make an AJAX request to reload cart items
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                // Update the cart content with the response
                document.getElementById("cartContent").innerHTML = xhr.responseText;
            } else {
                console.error("Error refreshing cart items:", xhr.status);
            }
        }
    };
    xhr.open("GET", "RefreshCartServlet", true);
    xhr.send();
}

function deleteCartItem(productId) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "DeleteCartItem", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                console.log("Cart item deleted successfully");
                // Refresh cart items after deletion
                refreshCart();
            } else {
                console.error("Error deleting cart item:", xhr.status);
            }
        }
    };
    xhr.send("prodId=" + encodeURIComponent(productId));
}