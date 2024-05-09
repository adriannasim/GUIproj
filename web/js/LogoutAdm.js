function confirmLogout() {
        if (confirm("Are you sure you want to logout?"))
        {
            //Send AJAX request to servlet
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "LogoutAdm", true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    alert(xhr.responseType);
                    //Redirect to login page after logout
                    window.location.href = "AdminLogin.jsp";
                }
            };
            xhr.send();
        }
    }