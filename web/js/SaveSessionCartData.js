window.addEventListener("beforeunload", function(event) {
    // Make AJAX call to your servlet
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "SaveSessionCartDataServlet", true);
    xhr.send();
});


