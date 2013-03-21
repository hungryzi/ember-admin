require File.dirname(__FILE__) + "/helpers"

module EmberAdmin
  class TemplatesGenerator < Rails::Generators::NamedBase
    include Helpers

    def create_ember_templates
      generate_new
      generate_edit
      generate_form
      generate_index
      generate_show
    end

    private

    def folder_path
      @folder_path ||= "app/assets/javascripts/templates/#{plural_name}/"
    end

    def generate_new
      path = folder_path + "new.js.emblem"
      create_file path, "== template '#{plural_name}/form'"
    end

    def generate_edit
      path = folder_path + "edit.js.emblem"
      create_file path, "== template '#{plural_name}/form'"
    end

    def generate_form
      header = <<COFFEE
header.span12
  .title.title-page = headerTitle

  if id
    button.btn.btn-small.btn-danger.pull-right{action destroy} Delete

form.form-horizontal.span12
  Ember.ErrorSummary errorsBinding="controller.messages"
COFFEE

      footer = <<COFFEE
  .form-actions
    button.btn.btn-small.btn-primary{action save} = buttonTitle
    button.btn.btn-small{action cancel} Cancel
COFFEE

      body = ""
      columns.each do |column|
        next if column.name == 'id'

        control = bootstrap_control column.type
        body << "  Bootstrap.Forms.#{control} valueBinding=\"#{column.name}\"\n"
      end

      path = folder_path + "form.js.emblem"
      create_file path, header + body + footer
    end

    def bootstrap_control active_record_type
      case active_record_type
      when :text
        "TextArea"
      else #string, boolean, integer, date, datetime
        "TextField"
      end
    end

    def generate_index
      content = <<COFFEE
header.span12
  .title.title-page = headerTitle

  linkTo "#{plural_name}.new" class="pull-right" | Create new

table.table.table-condensed.span12
  thead
    tr
COFFEE
      columns.each do |column|
        content << "      th #{column.human_name.capitalize}\n"
      end
      content << <<COFFEE
      th
  tbody
    each controller
      tr
COFFEE
      columns.each do |column|
        content << "        td = #{column.name}\n"
      end
      content << <<COFFEE
        td
          linkTo "#{plural_name}.edit" this | Edit
COFFEE

      path = folder_path + "index.js.emblem"
      create_file path, content
    end

    def generate_show
      content = <<COFFEE
header.span12
  .title.title-page.pull-left #{file_name.capitalize} Details

  section.pull-right
    ul.nav.nav-pills
      li
        linkTo "#{plural_name}.index" | Back
      li
        linkTo "#{plural_name}.edit" this | Edit

section.span12
COFFEE
      columns.each do |column|
        content << <<COFFEE
  dl
    dt #{column.human_name.capitalize}
    dd = #{column.name}
COFFEE
      end

      path = folder_path + "show.js.emblem"
      create_file path, content
    end
  end
end

