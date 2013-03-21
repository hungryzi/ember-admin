require File.dirname(__FILE__) + "/helpers"

module EmberAdmin
  class ModelsGenerator < Rails::Generators::NamedBase
    include Helpers

    FOLDER = "app/assets/javascripts/models"

    def create_ember_model
      file_path = "#{FOLDER}/#{plural_name}.js.coffee"
      file_content = generate_model

      create_file file_path, file_content
    end

    private

    def generate_model
      content = "#{namespaced_singular_class} = DS.Model.extend\n"
      columns.each do |column|
        next if column.name == 'id'

        content << "  #{column.name}: DS.attr('#{to_ember_type column.type}')\n"
      end

      content
    end
  end
end

