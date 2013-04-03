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

  def control_for attr
    attr_group = control_groups.find do |group|
      group.label_text == attr.to_s.humanize.capitalize
    end
    if attr_group
      attr_group.input || attr_group.textarea
    end
  end

  def fill_in_for attr, value
    control = control_for(attr)
    if control
      control.set value
    end
  end
end

