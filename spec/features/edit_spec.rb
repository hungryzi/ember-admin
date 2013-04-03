require 'spec_helper'

feature "edit page", js: true do
  let(:resource) { :category }
  let(:model) { "#{resource.to_s.singularize.classify}".constantize }
  let(:serializer) { "#{resource.to_s.singularize.classify}Serializer".constantize }
  let(:attributes) { serializer.attributes_for_serialization.reject { |attr| attr == :id } }

  let(:record) { FactoryGirl.create resource }
  let(:page) { EditPage.new resource, record }

  background do
    model.destroy_all

    page.load
  end

  scenario "shows a form with prefilled fields" do
    page.wait_for_form
    form = page.form

    attributes.each do |attr|
      control = form.control_for attr
      control.should be_present
      control.value.should == (record.send(attr) || '').to_s
    end

    form.should have_submit_button
    form.should have_cancel_button
  end

  scenario "clicking cancel goes back to previous page" do
    back_url = "/#/random_url"
    visit back_url

    page.load
    page.form.cancel

    current_url.should match(/#{back_url}$/)
  end

  scenario "clicking delete destroys the record" do
    page.wait_for_delete_button
    page.click_delete

    model.count.should == 0
  end

  describe "submit" do
    scenario "clicking submit updates the record & redirects to `show`" do
      page.wait_for_form
      form = page.form

      new_data = FactoryGirl.build resource
      attributes.each do |attr|
        form.fill_in_for attr, new_data.send(attr)
      end

      show_page = form.submit
      show_page.should be_displayed

      record.reload
      attributes.each do |attr|
        record.send(attr).should == new_data.send(attr)
      end
    end
  end
end

