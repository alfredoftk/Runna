module Process

  class EmployeeFieldValidatorService

    attr_accessor :error_messages

    def initialize(form_field, value)
      @form_field = form_field
      @value = value
      @error_messages = {}
    end

    def valid_value?
      messages = []
      form_field_validations.each do |form_field_validation|
        messages << form_field_validation.message unless form_field_validation.valid_value?(value)
      end
      @error_messages[form_field.name] = messages unless messages.empty?
      return messages.empty?
    end

    private

    attr_reader :form_field, :value

    def form_field_validations
      @form_field_validations ||= form_field.form_field_validations
    end

  end

end
