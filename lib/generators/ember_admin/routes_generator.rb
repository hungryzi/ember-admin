require File.dirname(__FILE__) + "/helpers"

module EmberAdmin
  class RoutesGenerator < Rails::Generators::NamedBase
    include Helpers

    FOLDER = "app/assets/javascripts/routes"

    def create_ember_routes
      file_path = "#{FOLDER}/#{plural_name}_routes.js.coffee"
      file_content = generate_routes

      create_file file_path, file_content
    end

    private

    def generate_routes
      <<FILE
#{namespaced_plural_class}Route = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', '#{plural_name}')

#{namespaced_plural_class}ShowRoute = #{namespaced_plural_class}Route.extend
  model: (params) ->
    #{namespaced_singular_class}.find(params.#{singular_name}_id)

#{namespaced_plural_class}EditRoute = #{namespaced_plural_class}Route.extend
  model: (params) ->
    #{namespaced_singular_class}.find(params.#{singular_name}_id)

#{namespaced_plural_class}IndexRoute = #{namespaced_plural_class}Route.extend
  model: ->
    #{namespaced_singular_class}.find()

#{namespaced_plural_class}NewRoute = #{namespaced_plural_class}Route.extend
  model: ->
    #{namespaced_singular_class}.createRecord()
FILE
    end
  end
end

