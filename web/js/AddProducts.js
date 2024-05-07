document.addEventListener('DOMContentLoaded', function() 
{
    //FOR KEYWORDS
    //User clicks add keyword button
    document.getElementById('add-keyword').addEventListener('click', function() 
    {
        console.log("ADD KEYWORD IS CLICKED");
        var newKeywordCol = document.createElement('div');
        newKeywordCol.innerHTML = 
        `   <div id="keyword-col">
                <input type="text" name="prodkeyword">
                <button type="button" class="dlt-keyword">-</button><br/>
            </div>
        `;
        document.getElementById('keywords').append(newKeywordCol);
    });

    //Remove keyword
    document.addEventListener('click', function(event)
    {
        //If the event source contains the id 'dlt-keyword'
        if (event.target.classList.contains('dlt-keyword'))
        {
            var keywordCol = event.target.parentElement;
            //Remove input box and delete button
            keywordCol.parentNode.removeChild(keywordCol);
        }
    });
    
    //FOR IMAGES
    //User clicks add image button
    document.getElementById('add-image').addEventListener('click', function() 
    {
        console.log("ADD IMAGE IS CLICKED");
        var newImageCol = document.createElement('div');
        newImageCol.innerHTML = 
        `   <div id="image-col">
                <input type="file" name="prodimg" accept="image/*">
                <button type="button" class="dlt-image">X</button><br/>
            </div>
        `;
        document.getElementById('images').append(newImageCol);
    });

    //Remove image
    document.addEventListener('click', function(event)
    {
        //If the event source contains the id 'dlt-image'
        if (event.target.classList.contains('dlt-image'))
        {
            var imageCol = event.target.parentElement;
            //Remove input box and delete button
            imageCol.parentNode.removeChild(imageCol);
        }
    });
});