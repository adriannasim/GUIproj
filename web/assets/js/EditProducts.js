document.addEventListener('DOMContentLoaded', function() 
{
    //FOR KEYWORDS
    //User clicks add keyword button
    document.getElementById('add-keyword').addEventListener('click', function() 
    {
        console.log("ADD KEYWORD IS CLICKED");
        var table = document.getElementById('table-keys');
        var cell = table.rows[0].insertCell(table.rows.length);
        cell.innerHTML = `<input type="text" name="key"/><br/>
                        <button type="button" id="dlt-keyword">Delete</button>`;
    });

    //Remove keyword
    document.addEventListener('click', function(event)
    {
        //If the event source contains the id 'dlt-keyword'
        if (event.target.classList.contains('dlt-keyword'))
        {
            var keywordCol = event.target.parentElement;
            //Remove input box and delete button
            remove(keywordCol);
        }
    });
    
    //FOR IMAGES
    //User clicks add image button
    document.getElementById('add-image').addEventListener('click', function() 
    {
        console.log("ADD IMAGE IS CLICKED");
        var table = document.getElementById('table-images');
        var cell = table.rows[0].insertCell(table.rows.length);
        cell.innerHTML = `<input type="file" accept="image/*" name="addimg" /><br/>
                        <button type="button" id="dlt-image">Delete</button>`;
    });

    //An array of the urls of existing imgs that is going to be dlted
    var dltedImgUrls = [];
    
    //Remove image
    document.addEventListener('click', function(event)
    {
        var dltButton = event.target.classList;
        //If the event source contains the id 'dlt-image'
        if (dltButton.contains('dlt-image'))
        {
            //Check if the previous element is a img tag (means that it is an existing image)
            if (dltButton.previousElementSibliing.tagName.toLowerCase() === "img")
            {
                //Add the src url from the img tag
                dltedImgUrls.push(dltButton.previousElementSibliing.src);
            }

            //Remove input box and delete button
            remove(event.target.parentElement);
        }
    });
    
    document.querySelector('form').addEventListener('submit', function(event)
    {
        //Prevent the form from submitting without going through my AJAX request to servlet
        event.preventDefault();
        
        //Collect form data
        var formData = new FormData(this);

        //Add the deleted image URLs array to the form data
        formData.append('dltedImgUrls', JSON.stringify(dltedImgUrls));

        //Send AJAX request to servlet
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'EditProducts', true);
        xhr.onload = function()
        {
            if (xhr.status === 200)
            {
                alert(xhr.responseText);
            }
            else
            {
                // Request failed
                console.error('Error:', xhr.status);
            }
        };
        xhr.onerror = function()
        {
            // Request failed
            console.error('Error: Network request failed');
        };
        xhr.send(formData);
    });
});

