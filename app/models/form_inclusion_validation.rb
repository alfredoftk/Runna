class FormInclusionValidation < FormFieldValidation

  VALIDATION_KEYS = ['in', 'within']

  def options_validations
    errors.add(:base, "The key *#{VALIDATION_KEYS.join(' or ')}* is required") if (self.options.keys & VALIDATION_KEYS).empty?
  end

  def valid_value?(value)
    include?(value)
  end

  private

  def include?(value)
    members = if delimiter.respond_to?(:call)
      delimiter.call(self)
    elsif delimiter.respond_to?(:to_sym)
      self.send(delimiter)
    else
      delimiter
    end

    members.send(inclusion_method(members), value)
  end

  def delimiter
    @delimiter ||= options['in'] || options['within']
  end

  def inclusion_method(enumerable)
    if enumerable.is_a? Range
      case enumerable.first
      when Numeric, Time, DateTime, Date
        :cover?
      else
        :include?
      end
    else
      :include?
    end
  end

end
