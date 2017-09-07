class FormNumericalityValidation < FormFieldValidation

  VALIDATION_HASH = { greater_than: :>, greater_than_or_equal_to: :>=, equal_to: :==, less_than: :<, less_than_or_equal_to: :<=, odd: :odd?, even: :even?, other_than: :!= }

  VALIDATION_KEYS = ['only_integer', 'greater_than', 'greater_than_or_equal_to', 'equal_to', 'less_than', 'less_than_or_equal_to', 'other_than', 'odd', 'even']

  def options_validations
    errors.add(:base, "The key *#{VALIDATION_KEYS.join(' or ')}* is required") if (self.options.keys & VALIDATION_KEYS).empty?
  end

  def valid_value?(value)
    raw_value = value

    unless is_number?(raw_value)
      return false
    end

    if allow_only_integer? && !is_integer?(raw_value)
      return false
    end

    if raw_value.is_a?(Numeric)
      value = raw_value
    else
      value = parse_raw_value_as_a_number(raw_value)
    end

    options.slice(*VALIDATION_HASH.keys.map(&:to_s)).each do |option, option_value|
      case option
      when 'odd', 'even'
        unless value.to_i.send(VALIDATION_HASH[option.to_sym])
          return false
        end
      else
        case option_value
        when Proc
          option_value = option_value.call(record)
        when Symbol
          option_value = record.send(option_value)
        end

        unless value.send(VALIDATION_HASH[option.to_sym], option_value)
          return false
        end
      end
    end
    return true
  end

  private

  def is_number?(raw_value)
    !parse_raw_value_as_a_number(raw_value).nil?
  rescue ArgumentError, TypeError
    false
  end

  def parse_raw_value_as_a_number(raw_value)
    return raw_value.to_i if is_integer?(raw_value)
    Kernel.Float(raw_value) if raw_value !~ /\A0[xX]/
  end

  def is_integer?(raw_value)
    /\A[+-]?\d+\z/ === raw_value.to_s
  end

  def allow_only_integer?
    case options['only_integer']
    when Symbol
      self.send(options['only_integer'])
    when Proc
      options['only_integer'].call(self)
    else
      options['only_integer']
    end
  end

end
