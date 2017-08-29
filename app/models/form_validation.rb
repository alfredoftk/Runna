class FormValidation < ApplicationRecord
  has_many :form_field_validations
  has_many :form_fields, through: :form_field_validations

end
