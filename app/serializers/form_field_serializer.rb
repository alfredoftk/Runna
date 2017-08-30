class FormFieldSerializer < ActiveModel::Serializer

  attributes :id, :display_name, :help_text, :name, :data_type, :widget, :required, :field_order
  has_many :form_field_validations, serializer: FormFieldValidationSerializer

  def id
    "#{object.id}"
  end

  def widget
    widget_attributes = object.widget_attributes
    widget_attributes[:type] = object.widget_type
    begin
      if entity = Object.const_get(object.input_data_source.to_s.capitalize) and entity.is_a?(Class)
        widget_attributes[:options] = entity.all.map{ |obj| { "value": obj.id, "label": obj.name } }
      end
    rescue Exception => e
      Rails.logger.error "#{e}"
    end
    return widget_attributes
  end

end
