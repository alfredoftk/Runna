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
      if !object.input_data_source.nil?
        if entity = Object.const_get(object.input_data_source.titleize.delete(' ')) and entity.is_a?(Class)
          if entity.has_attribute?("region_id") and entity.has_attribute?("company_owner_id")
            collection = scope.company.available_entity_fetcher(object.input_data_source.pluralize)
          else
            collection = entity.all
          end
          widget_attributes[:options] = collection.map{ |obj| { "value": obj.id, "label": obj.name } }
        end
      end
    rescue Exception => e
      Rails.logger.error "#{e}"
    end
    return widget_attributes
  end

end
