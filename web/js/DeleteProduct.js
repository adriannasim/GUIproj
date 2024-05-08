function confirmDelete(prodid) 
{
    //Prompt confirmation window
    if (confirm("Are you sure you want to delete this product?")) {
        deleteProduct(prodid);
    }
}

function deleteProduct(prodid) 
{
    //Send AJAX req to servlet
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "DeleteProduct?prodId=" + prodid, true);
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
