class EmployeeField < ApplicationRecord

  belongs_to :employee
  belongs_to :company_form_field

  def self.find_or_initialize_by_and_update_value(args, value)
    record = self.find_or_initialize_by(args)
    record.value = value
    record.save!
  end

  def field_name
    company_form_field.form_field.name
  end

end
