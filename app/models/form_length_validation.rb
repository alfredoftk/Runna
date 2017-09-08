class FormLengthValidation < FormFieldValidation

  VALIDATION_HASH = { is: :==, minimum: :>=, maximum: :<= }

  VALIDATION_KEYS = VALIDATION_HASH.keys.map(&:to_s)

  def options_validations
    errors.add(:base, "The key *#{VALIDATION_KEYS.join(' or ')}* is required") if (self.options.keys & VALIDATION_KEYS).empty?
  end

  def valid_value?(value)
    return true if ((allow_blank? and value.blank?) or (allow_nil? and value.nil?))
    value_length = value.respond_to?(:length) ? value.length : value.to_s.length
    VALIDATION_HASH.each do |key, validity_check|
      next unless check_value = options[key.to_s]
      if !value.nil? || skip_nil_check?(key)
        next if value_length.send(validity_check, check_value)
      end
      return false
    end
    return true
  end

  private

  def skip_nil_check?(key)
    key == :maximum && options[:allow_nil].nil? && options[:allow_blank].nil?
  end

end
