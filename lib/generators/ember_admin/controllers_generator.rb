require File.dirname(__FILE__) + "/helpers"

module EmberAdmin
  class ControllersGenerator < Rails::Generators::NamedBase
    include Helpers

    FOLDER = "app/assets/javascripts/controllers"

    def create_ember_controllers
      file_path = "#{FOLDER}/#{plural_name}_controller.js.coffee"
      file_content = generate_controllers

      create_file file_path, file_content
    end

    private

    def generate_controllers
      <<COFFEE
#{namespaced_plural_class}NewController = Ember.ObjectController.extend
  headerTitle: 'Create #{singular_name}'
  buttonTitle: 'Create'

  save: ->
    # When to remove these?
    @content.on 'didCreate', (content) =>
      @transitionToRoute('#{plural_name}.show', content)
    @content.on 'becameError', (content) =>
      @error("Server errors. Please try again.")

    @store.commit()

  error: (errorMessage) ->
    @set 'messages', [errorMessage]

  cancel: ->
    @store.get('defaultTransaction').rollback()
    @transitionToRoute('#{plural_name}.index')

#{namespaced_plural_class}EditController = Ember.ObjectController.extend
  headerTitle: 'Update #{singular_name}'
  buttonTitle: 'Update'

  save: ->
    @store.commit()
    @transitionToRoute('#{plural_name}.show', @content)

  cancel: ->
    if @content.isDirty
      @content.rollback()
    @transitionToRoute('#{plural_name}.show', @content)

  destroy: ->
    @content.deleteRecord()
    @store.commit()
    @transitionToRoute('#{plural_name}.index')
COFFEE
    end
  end
end

