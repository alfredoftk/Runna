module Process

  class EmployeeProcessService

    attr_accessor :employee_process, :company, :process_step, :form, :form_fields, :params, :employee, :error_response

    def initialize(company, process_step, params, employee_process=nil)
      @company = company
      @process_step = process_step
      @employee_process = employee_process
      @params = params
      @form = @process_step.form
      @form_fields = @company.form_fields_by_form_id(@form.id)
    end

    def continue_later
      if form_exists?
        build_process unless employee_process_exists?
        assign_employee_process_fields
        if !@employee_process.save
          @error_response = ErrorResponse.record_not_saved(@employee_process)
        end
        return @employee_process.errors.empty?
      else
        @error_response = ErrorResponse.new(title: 'The step has not assigned a form', status_code: :unprocessable_entity)
      end
      return false
    end

    def assign_employee_process_fields
      form_params.each do |key, value|
        form_field = @form_fields.select{ |field| field.name == key }.first
        @employee_process.employee_process_fields.find_create_or_update(@form, company_form_fields.select{ |company_form_field| company_form_field.form_field_id == form_field.id }.first, value)
      end
    end

    private

    def build_process
      @employee_process = @process_step.employee_processes.new(company: @company)
    end

    def form_field_keys
      @form_fields.map{ |form_field| form_field.name.to_sym }
    end

    def form_params
      @params.require(:employee_process_field).permit(form_field_keys)
    end

    def company_form_fields
      @company_form_fields ||= CompanyFormField.where(form_field_id: @form_fields.map(&:id), company_id: @company.id)
    end

    def employee_process_exists?
      return @employee_process.present?
    end

    def form_exists?
      return @form.present?
    end

  end

end
