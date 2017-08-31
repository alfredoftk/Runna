class FormLengthValidation < FormFieldValidation

  before_save :verify_options

  def verify_options
    return ((self.options.has_key?("minimum") and self.options.has_key?("maximum")) or self.options.has_key?("is"))
  end

end
