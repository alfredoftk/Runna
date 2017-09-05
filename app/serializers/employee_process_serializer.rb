class EmployeeProcessSerializer < ActiveModel::Serializer

  attributes :id

  belongs_to :process_step

  has_many :employee_process_fields


end
