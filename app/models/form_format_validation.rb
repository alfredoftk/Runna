class FormFormatValidation < FormFieldValidation
  before_save :verify_options

  def verify_options
    self.options.has_key?("with")
  end
end
