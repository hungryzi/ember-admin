class ShowPage < BasePage
  def initialize resource_name
    super resource_name

    ShowPage.set_url_matcher(/\/\#\/#{@resource_name}\/\d+/)
  end
end

