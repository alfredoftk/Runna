class EmployeeField < ApplicationRecord
  belongs_to :employee
  belongs_to :company_form_field

  def self.find_or_initialize_by_and_update_value(args, value, form_field)
    record = self.find_or_initialize_by(args)
    record.value = value
    record.field_name = form_field
    record.save!
  end

end
