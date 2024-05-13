//$(document).ready(function() 
//{
//    var timeout;
//    $('#search-input-dropdown').keyup(function() 
//    {
//        var query = $(this).val();
//        
//        //If nothing is inside the search bar
//        if (query === '') 
//        {
//            //Reset
//            clearResults();
//            clearTimeout(timeout);
//        }
//        else
//        {
//            //Reset
//            clearResults();
//            clearTimeout(timeout);
//            
//            loadingResults();
//            //Set a timeout to prevent multiple request sent while the user is still typing a query
//            timeout = setTimeout(function()
//            {
//                //Send AJAX request to servlet
//                $.ajax
//                ({
//                    url: 'SearchBar',
//                    method: 'GET',
//                    data: { query: query },
//                    success: function(response) 
//                    {
//                        //Display the results
//                        displayResults(response);
//                    },
//                    error: function(xhr, status, error) 
//                    {
//                        console.error('Error:', error);
//                    }
//                });
//            }, 1000); //Set a delay of 1 sec
//        }
//    });
//    
//    function displayResults(suggestions) {
//        clearResults();
//        if (suggestions !== "")
//        {
//            //Add the suggestion results to a droplist
//            suggestions.forEach(function(suggestion)
//            {
//                var link = suggestion.replaceAll(" ", "-");
//                $('#searchBar-dropdown-list').append('<li><a class="searchBar-dropdown-list-item" href="'+ link +'">' + suggestion + '</a></li>');
//            });
//        }
//    }
//    
//    function loadingResults() 
//    {
//        $('#searchBar-dropdown-list').html('<li>Loading Results...</li>');
//    }
//    
//    function clearResults() 
//    {
//        $('#searchBar-dropdown-list').empty();
//    }
//});

document.addEventListener('DOMContentLoaded', e =>
{
    $.ajax({
        url: '/SearchBar',
        method: 'GET',
        dataType: 'json',
        success: function(data)
        {
            $('#searchBar').autoComplete({
                resolverSettings: {
                    url: data
                },
            });
        },
        error: function(xhr, status, error)
        {
            console.error('Error fetching data:', error);
        }
    });
}, false);