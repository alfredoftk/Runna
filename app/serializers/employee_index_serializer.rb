class EmployeeIndexSerializer < ActiveModel::Serializer
  attributes :id, :status, :employee_fields, :years_in_company

  def employee_fields
    serialized_employee_fields(object.personal_info)
  end

  def serialized_employee_fields(employee_fields)
    employee_fields.map{ |employee_fields| EmployeeFieldSerializer.new(employee_fields) }
  end

end
