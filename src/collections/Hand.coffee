class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  busted: ->
    console.log "busted!"
    @trigger('goneBust', @)

  checkScore: ->
    if @minScore() > 21 then @busted()

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  stand: ->
    @trigger('playerStand', @)

  dealerPlay: ->
    @.at(0).flip()

    # if no Ace --> regular while under 17

    if !@hasAce()
      @hit() while @minScore() < 17

    else
      @hit() while (@minScore() + 10) <= 17
      if @minScore() + 10 > 21
        @hit() while @minScore() < 17

    if @minScore() > 21
      @busted()
    else
      console.log 'dealer is now done'
      @trigger('dealerDone', @)
