class EditPage < BasePage
  section :form, FormSection, ".spec-edit-view form"

  element :delete_button, "button.spec-delete-button"

  def initialize resource_name, record
    super resource_name

    EditPage.set_url("/#/#{@resource_name}/#{record.id}/edit")
  end

  def click_delete
    delete_button.click
  end
end
