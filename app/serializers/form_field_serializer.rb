class FormFieldSerializer < ActiveModel::Serializer

  attributes :id, :display_name, :help_text, :name, :data_type, :widget, :required, :field_order
  has_many :form_field_validations, serializer: FormFieldValidationSerializer

  def widget
    widget_attributes = object.widget_attributes
    widget_attributes[:type] = object.widget_type
    return widget_attributes
  end

end
