EmberAdmin.UsersRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', 'users')

EmberAdmin.UsersShowRoute = EmberAdmin.UsersRoute.extend
  model: (params) ->
    EmberAdmin.User.find(params.user_id)

EmberAdmin.UsersEditRoute = EmberAdmin.UsersRoute.extend
  model: (params) ->
    EmberAdmin.User.find(params.user_id)

EmberAdmin.UsersIndexRoute = EmberAdmin.UsersRoute.extend
  model: ->
    EmberAdmin.User.find()

EmberAdmin.UsersNewRoute = EmberAdmin.UsersRoute.extend
  model: ->
    EmberAdmin.User.createRecord()
