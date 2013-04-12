EmberAdmin.ResourcesRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', @resource.plural)

EmberAdmin.ResourcesShowRoute = EmberAdmin.ResourcesRoute.extend
  model: (params) -> @resource.modelClass.find(params["#{@resource.name}_id"])

EmberAdmin.ResourcesEditRoute = EmberAdmin.ResourcesRoute.extend
  model: (params) -> @resource.modelClass.find(params["#{@resource.name}_id"])

EmberAdmin.ResourcesIndexRoute = EmberAdmin.ResourcesRoute.extend
  model: -> @resource.modelClass.find()

EmberAdmin.ResourcesNewRoute = EmberAdmin.ResourcesRoute.extend
  model: -> @resource.modelClass.createRecord()

