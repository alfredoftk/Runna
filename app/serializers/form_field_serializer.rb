class FormFieldSerializer < ActiveModel::Serializer

  attributes :id, :display_name, :help_text, :name, :input_data_source, :data_type, :widget_attributes, :widget_type, :required, :field_order, :region_id

end
