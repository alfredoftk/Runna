class Form < ApplicationRecord

  belongs_to :created_by, foreign_key: :created_by_id, class_name: "PlatformUser"
  belongs_to :updated_by, foreign_key: :updated_by_id, class_name: "PlatformUser"
  has_many :form_sections
  has_many :employee_process_fields
  has_one :process_step

  enum form_type: { employee: "employee" }

  def to_param
    key
  end

end
