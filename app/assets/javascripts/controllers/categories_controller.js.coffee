EmberAdmin.CategoriesNewController = Ember.ObjectController.extend
  headerTitle: 'Create'
  buttonTitle: 'Create'

  save: ->
    # When to remove these?
    @content.on 'didCreate', (content) =>
      @transitionToRoute('categories.show', content)
    @content.on 'becameError', (content) =>
      @error("Server errors. Please try again.")

    @store.commit()

  error: (errorMessage) ->
    @set 'messages', [errorMessage]

  cancel: ->
    @content.deleteRecord()
    @transitionToRoute('categories.index')

EmberAdmin.CategoriesEditController = Ember.ObjectController.extend
  headerTitle: 'Update'
  buttonTitle: 'Update'

  save: ->
    @store.commit()
    @transitionToRoute('categories.show', @content)

  cancel: ->
    if @content.isDirty
      @content.rollback()
    @transitionToRoute('categories.show', @content)

  destroy: ->
    @content.deleteRecord()
    @store.commit()
    @transitionToRoute('categories.index')

