EmberAdmin.UsersNewController = Ember.ObjectController.extend
  headerTitle: 'Create user'
  buttonTitle: 'Create'

  save: ->
    # When to remove these?
    @content.on 'didCreate', (content) =>
      @transitionToRoute('users.show', content)
    @content.on 'becameError', (content) =>
      @error("Server errors. Please try again.")

    @store.commit()

  error: (errorMessage) ->
    @set 'messages', [errorMessage]

  cancel: ->
    @store.get('defaultTransaction').rollback()
    @transitionToRoute('users.index')

EmberAdmin.UsersEditController = Ember.ObjectController.extend
  headerTitle: 'Update user'
  buttonTitle: 'Update'

  save: ->
    @store.commit()
    @transitionToRoute('users.show', @content)

  cancel: ->
    if @content.isDirty
      @content.rollback()
    @transitionToRoute('users.show', @content)

  destroy: ->
    @content.deleteRecord()
    @store.commit()
    @transitionToRoute('users.index')
