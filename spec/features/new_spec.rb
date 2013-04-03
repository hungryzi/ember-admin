require 'spec_helper'

feature "new page", js: true do
  let(:resource) { :category }
  let(:model) { "#{resource.to_s.singularize.classify}".constantize }
  let(:serializer) { "#{resource.to_s.singularize.classify}Serializer".constantize }
  let(:attributes) { serializer.attributes_for_serialization.reject { |attr| attr == :id } }

  let(:page) { NewPage.new resource }

  background do
    page.load
  end

  scenario "shows a form with correct fields" do
    page.wait_for_form
    form = page.form

    attributes.each do |attr|
      has_control = form.control_groups.any? { |control| control.label.text.downcase == attr.to_s.humanize.downcase }
      has_control.should be_true
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

  describe "submit" do
    background do
      model.destroy_all
    end

    scenario "clicking submit creates a record & redirects to `show`" do
      record = FactoryGirl.build resource

      attributes.each do |attr|
        page.form.fill_in_for attr, with: record.send(attr)
      end

      show_page = page.form.submit
      show_page.should be_displayed

      model.count.should == 1
    end
  end
end

