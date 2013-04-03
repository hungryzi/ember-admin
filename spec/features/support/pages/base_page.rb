class BasePage < SitePrism::Page
  attr_reader :resource_name

  def initialize resource_name
    @resource_name = resource_name.to_s.downcase.pluralize
  end
end
