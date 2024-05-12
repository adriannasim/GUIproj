window.addEventListener("beforeunload", function(event) {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "SaveSessionCartDataServlet", true);
    xhr.send();
});


