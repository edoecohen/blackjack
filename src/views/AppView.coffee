class window.AppView extends Backbone.View
  template: _.template '
    <div class="gameOverModal">
    </div>
    <div class="playingTable">
      <div class="dealer-hand-container"></div>
      <div class="player-hand-container"></div>
    </div>
    <div class="buttons">
      <button class="hit-button btn btn-lg play-btn">Hit</button> <button class="stand-button btn btn-lg play-btn">Stand</button>
    </div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': ->
      @model.get('playerHand').stand()
      @model.get('dealerHand').dealerPlay()
      $('.room-modal').modal('show');


  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.gameOverModal').html new GameOverView(model: @model.get 'gameOver').el
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

