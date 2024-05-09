document.addEventListener('DOMContentLoaded', function()
{
    document.getElementById('chgRole').addEventListener('click', function()
    {
        if (confirm('Are you sure you want to change the role?'))
        {
            //Get employee username
            var username = '<%= emp.getUsername() %>';
            //Get the new role of the account
            var role = '<%= emp.getEmprole().equals("admin") ? "staff" : "admin" %>';
            var xhr = new XMLHttpRequest();
            
            //Send AJAX request to servlet
            xhr.open('POST', 'ChangeRole', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onload = function()
            {
                if (xhr.status === 200)
                {
                    alert(xhr.responseText);
                    //Refresh the page
                    location.reload(); 
                } 
                else
                {
                    alert('Error occurred while updating role.');
                }
            };
            xhr.send('username=' + encodeURIComponent(username) + '&newRole=' + encodeURIComponent(newRole));
        }
    })
});