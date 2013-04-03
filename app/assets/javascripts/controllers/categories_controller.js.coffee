EmberAdmin.CategoriesNewController = EmberAdmin.NewController.extend
  resource: "category"
  plural: "categories"

EmberAdmin.CategoriesEditController = Ember.ObjectController.extend
  headerTitle: 'Update category'
  buttonTitle: 'Update'

  save: ->
    @store.commit()
    @transitionToRoute('categories.show', @content)

  cancel: ->
    if @content.isDirty
      @content.rollback()
    history.back()

  destroy: ->
    @content.deleteRecord()
    @store.commit()
    @transitionToRoute('categories.index')

