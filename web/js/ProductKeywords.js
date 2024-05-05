document.addEventListener('DOMContentLoaded', function() 
{
    //User clicks add keyword button
    document.getElementById('add-keyword').addEventListener('click', function() 
    {
        console.log("ADD IS CLICKED");
        var newKeywordCol = document.createElement('div');
        newKeywordCol.innerHTML = 
        `   <div id="keyword-col">
                <input type="text" name="prodkeyword">
                <button type="button" class="dlt-keyword">-</button><br/>
            </div>
        `;
        document.getElementById('keywords').append(newKeywordCol);
    });

    // Remove keyword
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
});