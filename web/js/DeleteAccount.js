//EMPLOYEE DELETE
function confirmDelete(empid) 
{
    //Prompt confirmation window
    if (confirm("Are you sure you want to delete this employee account?")) {
        deleteEmployee(empid);
    }
}

function deleteEmployee(empid) 
{
    //Send AJAX req to servlet
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "DeleteAccount?id=" + empid, true);
    xhr.onreadystatechange = function ()
    {
        //Servlet pass back result
        if (xhr.readyState === XMLHttpRequest.DONE)
        {
            //Show result as a prompt
            alert(xhr.responseText); 
        }
    };
    xhr.send();
}

//CUSTOMER DELETE
function confirmDeleteCust(username, email) 
{
    //Prompt confirmation window
    if (confirm("Are you sure you want to delete this customer account?")) {
        deleteCust(username, email);
    }
}

function deleteCust(username, email) 
{
    //Send AJAX req to servlet
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "DeleteCustomer?id=" + username + "&email=" + email, true);
    xhr.onreadystatechange = function ()
    {
        //Servlet pass back result
        if (xhr.readyState === XMLHttpRequest.DONE)
        {
            //Show result as a prompt
            alert(xhr.responseText); 
        }
    };
    xhr.send();
}