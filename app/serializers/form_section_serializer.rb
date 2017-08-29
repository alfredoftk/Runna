class FormSectionSerializer < ActiveModel::Serializer

  attributes :id, :title, :key, :description, :section_order
  has_many :form_fields, serializer: FormFieldSerializer

end
