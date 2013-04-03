class FormControlGroupSection < BaseSection
  element :label, ".control-label"
  element :input, "input"
  element :texarea, "textarea"

  def label_text
    label.text
  end
end
