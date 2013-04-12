class EmberAdmin.Resource
  constructor: (@name, @options = {}) ->
    @plural = @options.plural || "#{name}s"
    @capitalized_name = Ember.String.capitalize(@name)
    @capitalized_plural = Ember.String.capitalize(@plural)

    @modelClass = EmberAdmin["#{Ember.String.capitalize(name)}"]

    @define_routes()
    @define_controllers()
    @define_views()

  define_routes: ->
    EmberAdmin["#{@capitalized_plural}Route"] = EmberAdmin.ResourcesRoute.extend
      resource: @
    EmberAdmin["#{@capitalized_plural}ShowRoute"] = EmberAdmin.ResourcesShowRoute.extend
      resource: @
    EmberAdmin["#{@capitalized_plural}EditRoute"] = EmberAdmin.ResourcesEditRoute.extend
      resource: @
    EmberAdmin["#{@capitalized_plural}IndexRoute"] = EmberAdmin.ResourcesIndexRoute.extend
      resource: @
    EmberAdmin["#{@capitalized_plural}NewRoute"] = EmberAdmin.ResourcesNewRoute.extend
      resource: @

  define_controllers: ->
    EmberAdmin["#{@capitalized_plural}NewController"] = EmberAdmin.NewController.extend
      resource: @
    EmberAdmin["#{@capitalized_plural}EditController"] = EmberAdmin.EditController.extend
      resource: @

  define_views: ->
    EmberAdmin["#{@capitalized_plural}IndexView"] = EmberAdmin.IndexView.extend()
    EmberAdmin["#{@capitalized_plural}NewView"] = EmberAdmin.NewView.extend()
    EmberAdmin["#{@capitalized_plural}EditView"] = EmberAdmin.EditView.extend()

class EmberAdmin.Resources
  @resources: []

  @register: (name, options = {}) ->
    #if @resources.some((resource) -> resource.name == name)
    @resources.push(new EmberAdmin.Resource(name, options))

