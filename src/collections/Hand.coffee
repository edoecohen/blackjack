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
    console.log "busted! with score #{@minScore()} and ace is #{@hasAce()}"

  checkScore: ->
    if @minScore() > 21 then @busted()

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  dealerPlay: ->
    @.at(0).flip()
    # if this score < 17 keep hitting
    console.log "dealer playing #{@minScore()}"
    if @minScore() < 17 then @hit()
      # console.log "dealer hitting"
      # @hit()
    # if this score > 17 stop hitting - done event
    if @minScore() > 17
      console.log "dealer is over 17"
      @checkScore()
      @trigger('dealerDone', @)
