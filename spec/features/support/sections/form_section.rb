require_relative 'form_control_group_section'

class FormSection < BaseSection
  element :submit_button, ".form-actions button.spec-submit-button"
  element :cancel_button, ".form-actions button.spec-cancel-button"

  sections :control_groups, FormControlGroupSection, ".control-group"

  def cancel
    cancel_button.click
  end

  def submit
    submit_button.click

    ShowPage.new(parent_page.resource_name)
  end

  def fill_in_for attr, options
    fill_in attr.to_s.humanize, options
  end
end

