@category = (category) ->
    console.log(category)
    $('#tmdb-form-div').show()
    if category == "bookmark"
        $('#bookmark').show()
        $('#watchlist').hide()
    else if category == "watchlist"
        $('#watchlist').show()
        $('#bookmark').hide()
    
@showSelected = (obj) ->
    # if watchlist show is pressed
    if $(obj).parents('#watchlist').length
        # show keen-scale
        console.log($(obj).attr("data-id") + ' is ' + 'Watchlist')
        $('#priority').show()
        $('#priority').slideDown(350);
        
        # update form with show name
        name = $(obj).attr("data-name")
        ids = $(obj).attr("data-id")
        $('#watchlist-save').siblings().each( ->
            if $(this).attr("name") == "name"
                $(this).attr("value", name)
            if $(this).attr("name") == "show_id"
                $(this).attr("value", ids)
        )
        
    # change HREF of shows accordingly
    $('#bookmark .select-show').each( (i, obj) ->
        id = $(this).attr("data-id")
        $(this).attr("href", "search_id/" + id)
    )
    $('#watchlist .select-show').each( (i, obj) ->
        id = $(this).attr("data-id")
        $(this).attr("href", "watchlist/" + id)
    )
    

@myFunction = (val) ->
    output = $('#keen-scale')
    switch val
        when '1' then output.html "Not fussed"
        when '2' then output.html "Pretty keen"
        when '3' then output.html "Very keen"
        when '4' then output.html "Busting to watch"
        when '5' then output.html "I NEED IT NOW"
    # update form with priority
    $('#watchlist-save').siblings().each( ->
        if $(this).attr("name") == "priority"
            $(this).attr("value", val)
    )
