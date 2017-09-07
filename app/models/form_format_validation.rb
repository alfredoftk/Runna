class FormFormatValidation < FormFieldValidation

  VALIDATION_KEYS = ['with', 'without']

  def options_validations
    errors.add(:base, "The key *#{VALIDATION_KEYS.join(' or ')}* is required") if (self.options.keys & VALIDATION_KEYS).empty?
  end

  def valid_value?(value)
    if options['with']
      regexp = option_call('with')
      return !(value.to_s !~ regexp)
    elsif options['without']
      regexp = option_call('without')
      return !(regexp.match?(value.to_s))
    end
    return false
  end

  private

  def option_call(name)
    Regexp.new(options[name])
  end

end
