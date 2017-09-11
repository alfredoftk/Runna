class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :status
  has_many :employee_fields
end