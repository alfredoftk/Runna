class FormFieldValidation < ApplicationRecord

  VALIDATION_KEYS = []

  belongs_to :form_field

  validate :options_validations

end
