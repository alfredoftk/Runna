class EmployeeProcessField < ApplicationRecord
  belongs_to :employee_process
  belongs_to :form
  belongs_to :company_form_field
  has_one :form_field, through: :company_form_field

  def field_name
    form_field.name
  end

  def self.find_or_initialize_by_and_update_value(args, value)
    record = self.find_or_initialize_by(args)
    record.value = value
    record.save!
  end

end
