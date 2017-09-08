class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :status
  belongs_to :employee_process
  has_many :employee_fields
end