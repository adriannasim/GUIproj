////Function to filter orders based on status
//function filterOrders()
//{
//    var status = document.getElementById("filter").value;
//
//    //Switch case based on the filter set
//    switch (status)
//    {
//        case "all":
//            document.getElementById("all").style.display = "block";
//            document.getElementById("packaging").style.display = "none";
//            document.getElementById("shipping").style.display = "none";
//            document.getElementById("delivery").style.display = "none";
//            console.log("SHOWED ALL");
//            break;
//        case "packaging":
//            document.getElementById("all").style.display = "none";
//            document.getElementById("packaging").style.display = "block";
//            document.getElementById("shipping").style.display = "none";
//            document.getElementById("delivery").style.display = "none";
//            console.log("SHOWED PACKAGING");
//            break;
//        case "shipping":
//            document.getElementById("all").style.display = "none";
//            document.getElementById("packaging").style.display = "none";
//            document.getElementById("shipping").style.display = "block";
//            document.getElementById("delivery").style.display = "none";
//            console.log("SHOWED SHIPPING");
//            break;
//        case "delivery":
//            document.getElementById("all").style.display = "none";
//            document.getElementById("packaging").style.display = "none";
//            document.getElementById("shipping").style.display = "none";
//            document.getElementById("delivery").style.display = "block";
//            console.log("SHOWED DELIVERY");
//            break;
//        default:
//            document.getElementById("all").style.display = "block";
//            document.getElementById("packaging").style.display = "none";
//            document.getElementById("shipping").style.display = "none";
//            document.getElementById("delivery").style.display = "none";
//            console.log("SHOWED ALL");
//    }
//}

function filterOrders()
{
    var filter = document.getElementById("filter").value;
    var allOrders = document.getElementById("all");
    var packagingOrders = document.getElementById("packaging");
    var shippingOrders = document.getElementById("shipping");
    var deliveryOrders = document.getElementById("delivery");

    // Hide all tables
    allOrders.style.display = "none";
    packagingOrders.style.display = "none";
    shippingOrders.style.display = "none";
    deliveryOrders.style.display = "none";

    // Show the table corresponding to the selected filter value
    if (filter === "all") {
        allOrders.style.display = "block";
    } else if (filter === "packaging") {
        packagingOrders.style.display = "block";
    } else if (filter === "shipping") {
        shippingOrders.style.display = "block";
    } else if (filter === "delivery") {
        deliveryOrders.style.display = "block";
    }
}

window.addEventListener('load', filterOrders);

document.addEventListener("DOMContentLoaded", function() {
    //Add event listener to the filter dropdown
    document.getElementById("filter").addEventListener("change", filterOrders);
});