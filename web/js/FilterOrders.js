//Loads function when the page starts
window.onload = filterOrders;

//Add event listener to the filter dropdown
document.getElementById("filter").addEventListener("change", filterOrders);

//Function to filter orders based on status
function filterOrders()
{
    var status = document.getElementById("filter").value;

    //Switch case based on the filter set
    switch (status)
    {
        case "all":
            document.getElementById("all").style.display = "table-row";
            document.getElementById("packaging").style.display = "none";
            document.getElementById("shipping").style.display = "none";
            document.getElementById("delivery").style.display = "none";
            break;
        case "packaging":
            document.getElementById("all").style.display = "none";
            document.getElementById("packaging").style.display = "table-row";
            document.getElementById("shipping").style.display = "none";
            document.getElementById("delivery").style.display = "none";
            break;
        case "shipping":
            document.getElementById("all").style.display = "none";
            document.getElementById("packaging").style.display = "none";
            document.getElementById("shipping").style.display = "table-row";
            document.getElementById("delivery").style.display = "none";
            break;
        case "delivery":
            document.getElementById("all").style.display = "none";
            document.getElementById("packaging").style.display = "none";
            document.getElementById("shipping").style.display = "none";
            document.getElementById("delivery").style.display = "table-row";
            break;
        default:
            document.getElementById("all").style.display = "table-row";
            document.getElementById("packaging").style.display = "none";
            document.getElementById("shipping").style.display = "none";
            document.getElementById("delivery").style.display = "none";
    }
}