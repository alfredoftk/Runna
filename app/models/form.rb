class Form < ApplicationRecord

  belongs_to :created_by, foreign_key: :created_by_id, class_name: "PlatformUser"
  belongs_to :updated_by, foreign_key: :updated_by_id, class_name: "PlatformUser"
  has_many :form_sections

  enum form_type: { employee: "employee" }


end
