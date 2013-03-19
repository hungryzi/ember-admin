EmberAdmin.CategoriesRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', 'categories')

EmberAdmin.CategoriesShowRoute = EmberAdmin.CategoriesRoute.extend
  model: (params) ->
    EmberAdmin.Category.find(params.category_id)

EmberAdmin.CategoriesEditRoute = EmberAdmin.CategoriesRoute.extend
  model: (params) ->
    EmberAdmin.Category.find(params.category_id)

EmberAdmin.CategoriesIndexRoute = EmberAdmin.CategoriesRoute.extend
  model: ->
    EmberAdmin.Category.find()

EmberAdmin.CategoriesNewRoute = EmberAdmin.CategoriesRoute.extend
  model: ->
    EmberAdmin.Category.createRecord()

