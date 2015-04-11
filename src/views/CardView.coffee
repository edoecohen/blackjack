class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<div class="revealedCard" style="background-image: url(./img/cards/<%= rankName %>-<%= suitName %>.png)"></div>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.find('.revealedCard').css('background-image', '').css('background-image', 'url(./img/card-back.png)') unless @model.get 'revealed'

