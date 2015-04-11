# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'gameOver', gameOver = new GameOver()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'playerScore', 0
    @set 'dealerScore', 0

    # @get('dealerHand').on('goneBust', ->
    #   console.log "you win!"
    # @)

    @get('dealerHand').on('dealerDone', ->

      if @get('dealerHand').scores()[1] <= 21
        @set('dealerScore', @get('dealerHand').scores()[1])
      else
        @set('dealerScore', @get('dealerHand').scores()[0])

      if @get('playerScore') > @get('dealerScore') or @get('dealerScore') > 21
        @get('gameOver').win()

      else if @get('playerScore') == @get('dealerScore')
        @get('gameOver').draw()
      else
        @get('gameOver').lose()
    @)

    @get('playerHand').on('playerStand', ->
      if @get('playerHand').scores()[1] <= 21
        @set('playerScore', @get('playerHand').scores()[1])
      else
        @set('playerScore', @get('playerHand').scores()[0])

    @)

    @get('playerHand').on('goneBust', ->
      @get('gameOver').busted()
    @)

