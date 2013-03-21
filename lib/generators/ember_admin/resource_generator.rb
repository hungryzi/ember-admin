require File.dirname(__FILE__) + "/helpers"

module EmberAdmin
  class ResourceGenerator < Rails::Generators::NamedBase
    include Helpers

    desc "Create a simple Ember CRUD app for a particular resource"
    def create_ember_resource
      generate("ember_admin:routes", file_name)
      generate("ember_admin:models", file_name)
      generate("ember_admin:templates", file_name)

      add_routes
    end

    private

    def add_routes
      #TODO: check if file exists

      append_file "app/assets/javascripts/router.js.coffee", <<COFFEE
  @resource '#{plural_name}', ->
    @route 'new'
    @route 'edit',
      path: ':#{singular_name}_id/edit'
    @route 'show',
      path: ':#{singular_name}_id'
COFFEE
    end
  end
end

