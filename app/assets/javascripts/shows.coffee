# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@category = (category) ->
    console.log(category)
    if category == "bookmark"
        $('#bookmark').show()
        $('#watchlist').hide()
    else if category == "watchlist"
        $('#watchlist').show()
        $('#bookmark').hide()
