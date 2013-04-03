class NewPage < BasePage
  section :form, FormSection, ".spec-new-view form"

  def initialize resource_name
    super resource_name

    NewPage.set_url "/#/#{@resource_name}/new"
  end
end
