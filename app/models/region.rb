class Region < ApplicationRecord

  belongs_to :parent, foreign_key: :parent_id, class_name: "Region"
  belongs_to :created_by, foreign_key: :created_by_id, class_name: "PlatformUser"
  belongs_to :updated_by, foreign_key: :updated_by_id, class_name: "PlatformUser"
  has_many :benefits
  has_many :companies
  has_many :form_fields
  has_many :contract_types
  has_many :employee_types
  has_many :work_shifts
  has_many :documents

  validates :name, :key, presence: true

end
