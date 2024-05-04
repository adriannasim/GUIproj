function deleteCartItem(productId) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "DeleteCartItem", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                console.log("Cart item deleted successfully");
                updateCartContent(xhr.responseText);
            } else {
                console.error("Error deleting cart item:", xhr.status);
            }
        }
    };
    xhr.send("prodId=" + encodeURIComponent(productId));
}

function updateCartContent(cartItemsHTML) {
    document.body.innerHTML = cartItemsHTML;
}
