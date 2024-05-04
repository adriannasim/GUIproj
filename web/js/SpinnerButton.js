function incrementValue(inputId, maxValue) {
    var inputElement = document.getElementById(inputId);
    var value = parseInt(inputElement.value, 10);
    if (value < maxValue) {
        inputElement.value = value + 1;
    }
}

function decrementValue(inputId, minValue) {
    var inputElement = document.getElementById(inputId);
    var value = parseInt(inputElement.value, 10);
    if (value > minValue) {
        inputElement.value = value - 1;
    }
}

