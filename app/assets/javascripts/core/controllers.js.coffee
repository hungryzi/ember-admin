EmberAdmin.NewController = Ember.ObjectController.extend
  resource: ""
  plural: ""
  verb: 'Create'

  save: ->
    # When to remove these?
    @content.addObserver 'id', @, ->
      @transitionToRoute("#{@plural}.show", @content)
    @content.on 'becameError', (content) =>
      @error("Server errors. Please try again.")
    @store.commit()

  error: (errorMessage) ->
    @set 'messages', [errorMessage]

  cancel: ->
    @store.get('defaultTransaction').rollback()
    history.back()

