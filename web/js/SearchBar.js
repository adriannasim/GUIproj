$(document).ready(function() {
    var loading;
    $('#search-input-dropdown').keyup(function() {
        var query = $(this).val();
        
        //If nothing is inside the search bar
        if (query === '') {
            clearResults();
            var loading = false;
        }
        else
        {
            loading = true;
            loadingResults();
        }
        
        //Send AJAX request to servlet
        $.ajax({
            url: 'SearchBar',
            method: 'GET',
            data: { query: query },
            success: function(response) {
                //Display the results
                displayResults(response);
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });
    });
    
    function displayResults(suggestions) {
        loading = false;
        clearResults();
        if (suggestions !== "")
        {
            //Add the suggestion results to a droplist
            suggestions.forEach(function(suggestion) {
                var link = suggestions.replaceAll(" ", "-");
                $('#searchBar-dropdown-list').append('<li><a class="searchBar-dropdown-list-item" href="'+ link +'">' + suggestion + '</a></li>');
            });
        }
    }
    
    function loadingResults() {
        if (loading != true)
        {
            $('#searchBar-dropdown-list').append('<li>Loading Results...</li>'); 
        }
    }
    
    function clearResults() {
        $('#searchBar-dropdown-list').empty();
    }
});