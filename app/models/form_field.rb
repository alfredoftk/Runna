class FormField < ApplicationRecord
  belongs_to :form_section
  belongs_to :region
  has_many :form_field_validations
  belongs_to :created_by, foreign_key: :created_by_id, class_name: "PlatformUser"
  belongs_to :updated_by, foreign_key: :updated_by_id, class_name: "PlatformUser"

  accepts_nested_attributes_for :form_field_validations
end
