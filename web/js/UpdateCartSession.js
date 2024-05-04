function incrementValueAndUpdate(inputId, maxValue,prodId) {
    var inputElement = document.getElementById(inputId);
    var value = parseInt(inputElement.value, 10);
    if (value < maxValue) {
        inputElement.value = value + 1;
        updateCartItem(prodId, value + 1);
    }
}

function decrementValueAndUpdate(inputId, minValue,prodId) {
    var inputElement = document.getElementById(inputId);
    var value = parseInt(inputElement.value, 10);
    if (value > minValue) {
        inputElement.value = value - 1;
        updateCartItem(prodId, value - 1);
    }
}

function updateCartItem(productId, newQuantity) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "UpdateCart", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                console.log("Cart updated successfully");
            } else {
                console.error("Error updating cart:", xhr.status);
            }
        }
    };
    xhr.send("prodId=" + encodeURIComponent(productId) + "&qty=" + encodeURIComponent(newQuantity));
}

