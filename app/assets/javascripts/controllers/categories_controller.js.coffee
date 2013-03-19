EmberAdmin.CategoriesNewController = Ember.ObjectController.extend
  headerTitle: 'Create'
  buttonTitle: 'Create'

  save: ->
    @store.commit()
    @content.addObserver 'id', @, 'afterSave'

  cancel: ->
    @content.deleteRecord()
    @transitionToRoute('categories.index')

  afterSave: ->
    @content.removeObserver 'id', @, 'afterSave'
    @transitionToRoute('categories.show', @content)

EmberAdmin.CategoriesEditController = Ember.ObjectController.extend
  headerTitle: 'Update'
  buttonTitle: 'Update'

  save: ->
    @store.commit()
    @transitionToRoute('categories.show', @content)

  cancel: ->
    if @content.isDirty
      @content.rollback
    @transitionToRoute('categories.show', @content)

  destroy: ->
    @content.deleteRecord()
    @store.commit()
    @transitionToRoute('categories.index')

