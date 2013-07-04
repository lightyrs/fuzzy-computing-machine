Fcm.Home =

  initialize: ->
    @initQuery()

  queryEl: -> $('#query')

  initQuery: ->

    @queryEl().on 'focus', (e) ->
      setTimeout (-> $(e.target).text '' ), 100 if $(e.target).text() == 'Query'

    @queryEl().on 'blur', (e) ->
      $(e.target).text 'Query' if $(e.target).text() == ''

    @queryEl().on 'keydown', (e) =>
      if e.keyCode == 13
        @submitQuery( $(e.target).text() )
        return false

    @queryEl().focus()

  submitQuery: (query) ->

    $.ajax
      url: '/queries',
      data:
        query: query,
      type: 'POST',
      beforeSend: ->
        $('#synopsis').hide()
        $('#loader').show()
      success: (data) ->
        $('#loader').hide()
        $('#synopsis').html(data.synopsis).fadeIn()
      error: (data) ->
        $('#loader').hide()
        $('#synopsis').html("Nothing Found").fadeIn()
      complete: ->
        $('#loader').hide()

$ -> Fcm.Home.initialize()
