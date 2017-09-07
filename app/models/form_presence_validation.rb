class FormPresenceValidation < FormFieldValidation

  def options_validations
  end

  def valid_value?(value)
    !value.blank?
  end

end
