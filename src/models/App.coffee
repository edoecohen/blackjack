# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'playerScore', 0
    @set 'dealerScore', 0

    @get('dealerHand').on('goneBust', ->
      alert "you win!"
    @)

    @get('dealerHand').on('dealerDone', ->
      if @get('dealerHand').scores()[1] <= 21
        @set('dealerScore', @get('dealerHand').scores()[1])
      else
        @set('dealerScore', @get('dealerHand').scores()[0])
      console.log @get('dealerScore')


      if @get('playerScore') > @get('dealerScore')
        alert 'You win!'
      else if @get('playerScore') == @get('dealerScore')
        alert 'You equal'
      else
        alert 'sorry, you lose!'
    @)

    @get('playerHand').on('playerStand', ->
      if @get('playerHand').scores()[1] <= 21
        @set('playerScore', @get('playerHand').scores()[1])
      else
        @set('playerScore', @get('playerHand').scores()[0])

    @)

