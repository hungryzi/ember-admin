class IndexPage < BasePage
  sections :rows, IndexRowSection, ".spec-index-view table tbody tr"

  element :link_to_new, ".spec-index-view .spec-link-to-new"

  def initialize resource_name
    super resource_name

    IndexPage.set_url "/#/#{@resource_name.pluralize}"
  end
end

