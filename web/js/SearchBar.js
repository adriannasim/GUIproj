//Detect whenever there's changes to the search bar by adding an event listener to the search bar
document.addEventListener('DOMContentLoaded', function() {
    //Add event listener to the search input
    if (document.getElementById('search-input-dropdown')) {
        document.getElementById('search-input-dropdown').addEventListener('input', function() {
            //Submit the form whenever the input changes
            document.getElementById('searchBarForm').submit();
        });
    }
});