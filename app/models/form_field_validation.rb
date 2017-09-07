class FormFieldValidation < ApplicationRecord

  VALIDATION_KEYS = []

  belongs_to :form_field

  validate :options_validations

  def allow_blank?
    options['allow_blank'] == true
  end

  def allow_nil?
    options['allow_nil'] == true
  end

end
