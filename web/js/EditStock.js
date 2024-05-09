function changeStock(prodId)
{
    var stockCol = document.getElementById('stockCol_' + prodId);
    var currentStock = stockCol.innerText;

    //Change the col to inclu
    stockCol.innerHTML = 
    `
        <input type="number" id="newStock_${prodId}" value="${currentStock}">
        <button onclick="cancelChange(${prodId}, '${currentStock}')">Cancel</button>
        <button onclick="saveChange(${prodId})">Save</button>
    `;
}

function cancelChange(prodId, currentStock)
{
    var stockCol = document.getElementById('stockCol_' + prodId);
    stockCol.innerText = currentStock;
}

function saveChange(prodId)
{
    var newStock = document.getElementById('newStock_' + prodId);
    var qty = newStock.value;
    
    //Send AJAX req to servlet
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "EditStock?prodId=" + prodId + "&qty=" + qty, true);
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