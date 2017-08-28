class Region < ApplicationRecord
  belongs_to :parent, foreign_key: :parent_id, class_name: "Region"
  has_many :companies
  has_many :form_fields
  belongs_to :created_by, foreign_key: :created_by_id, class_name: "PlatformUser"
  belongs_to :updated_by, foreign_key: :updated_by_id, class_name: "PlatformUser"

end
