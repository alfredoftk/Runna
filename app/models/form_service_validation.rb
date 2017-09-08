class FormServiceValidation < FormFieldValidation

  VALIDATION_KEYS = ['url']

  def options_validations
    errors.add(:base, "The key *#{VALIDATION_KEYS.join(' or ')}* is required") if (self.options.keys & VALIDATION_KEYS).empty?
  end

  def valid_value?(value)
    true
  end

end
