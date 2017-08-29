class DetailFormSerializer < ActiveModel::Serializer

  attributes :id, :title, :key
  has_many :form_sections, serializer: FormSectionSerializer

end
