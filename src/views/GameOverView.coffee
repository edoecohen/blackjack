class window.GameOverView extends Backbone.View
  # tagName: 'div'
  className: 'game-over modal fade'


  template: _.template '

    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title"><%= playState %> </h4>
        </div>
        <!--div class="modal-body">
        </div-->
        <div class="modal-footer">
          <!-- button type="button" class="btn btn-default" data-dismiss="modal">Close</button -->
          <button type="button" class="add-room btn btn-primary">Play Again</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  '

  initialize: ->
    @model.on 'gameOver', =>
      @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.modal('show')
    console.log @model.get('playState')

