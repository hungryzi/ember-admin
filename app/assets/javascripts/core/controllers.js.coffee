EmberAdmin.NewController = Ember.ObjectController.extend
  verb: 'Create'

  save: ->
    # When to remove these?
    @content.addObserver 'id', @, ->
      @transitionToRoute("#{@resource.plural}.show", @content)
    @content.on 'becameError', (content) =>
      @error("Server errors. Please try again.")
    @store.commit()

  error: (errorMessage) ->
    @set 'messages', [errorMessage]

  cancel: ->
    @store.get('defaultTransaction').rollback()
    history.back()

EmberAdmin.EditController = Ember.ObjectController.extend
  verb: 'Update'

  save: ->
    @store.commit()
    @transitionToRoute("#{@resource.plural}.show", @content)

  cancel: ->
    if @content.isDirty
      @content.rollback()
    history.back()

  destroy: ->
    @content.deleteRecord()
    @store.commit()
    @transitionToRoute("#{@resource.plural}.index")

