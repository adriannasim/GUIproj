function confirmDelete(empid) 
{
    //Prompt confirmation window
    if (confirm("Are you sure you want to delete this employee account?")) {
        deleteProduct(empid);
    }
}

function deleteProduct(empid) 
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
