require 'spec_helper'

feature "index page", js: true do
  let(:resource) { :category }
  let(:page) { IndexPage.new resource }

  background do
    FactoryGirl.create_list(resource, 3)
    page.load
  end

  scenario "shows a list of things" do
    page.wait_for_rows
    page.rows.should have(3).rows
  end

  scenario "has a link to `new`" do
    page.should have_link_to_new
  end

  describe "row" do
    scenario "links to `show`, `edit` and `delete`" do
      page.wait_for_rows
      page.rows.each do |row|
        row.should have_link_to_show
        row.should have_link_to_edit
      end
    end
  end
end

