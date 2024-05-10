function updateStatus(id) 
{
    console.log("UPDATE STATUS CLICKED");
    //Prompt confirmation window
    if (confirm("Are you sure you want to update the status of this order?")) {
        update(id);
    }
}

function update(id) 
{
    //Send AJAX req to servlet
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "UpdateStatus?id=" + id, true);
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
