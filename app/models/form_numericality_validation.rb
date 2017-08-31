class FormNumericalityValidation < FormFieldValidation

  before_save :verify_options

  def verify_options
    return (self.options.has_key?("only_integer") or self.options.has_key?("greater_than") or self.options.has_key?("greater_than_or_equal_to") or self.options.has_key?("equal_to") or self.options.has_key?("less_than") or self.options.has_key?("less_than_or_equal_to") or self.options.has_key?("other_than") or self.options.has_key?("odd") or self.options.has_key?("even"))
  end

end
