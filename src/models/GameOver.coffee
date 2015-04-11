class window.GameOver extends Backbone.Model

  initialize: ->
    @set
      playState: ''

  gameOver: ->
    @trigger 'gameOver', @

  win: ->
    @set 'playState', 'You win!'
    @gameOver()

  lose: ->
    @set 'playState', 'You lose!'
    @gameOver()

  draw: ->
    @set 'playState', 'You tied!'
    @gameOver()

  busted: ->
    @set 'playState', 'You busted!'
    @gameOver()
