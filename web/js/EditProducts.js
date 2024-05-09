//Add Image
function addImageInput() 
{
    var table = document.getElementById('table-images');
    var cell = table.rows[0].insertCell(table.rows.length);
    cell.innerHTML = 
            `<input type="file" accept="image/*" onchange="imgPreview(this)" name="addimg" /><br/>
                <button type="button" id="add-image">Delete</button>`;
}

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

    //Remove image
    document.addEventListener('click', function(event)
    {
        //If the event source contains the id 'dlt-image'
        if (event.target.classList.contains('dlt-image'))
        {
            var imageCol = event.target.parentElement;
            //Remove input box and delete button
            remove(imageCol);
        }
    });
});