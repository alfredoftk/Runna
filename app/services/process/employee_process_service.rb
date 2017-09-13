module Process

  class EmployeeProcessService

    attr_accessor :employee_process, :error_response

    def initialize(company, process_step, params, employee_process=nil, form=nil)
      @company = company
      @process_step = process_step
      @params = params
      @employee_process = employee_process
      @form = form.nil? ? @process_step.form : form
      @form_fields = @company.form_fields_by_form_id(@form.id)
    end

    def continue_later
      if form_exists?
        build_process unless employee_process_exists?
        assign_employee_process_fields
        @error_response = ErrorResponse.record_not_saved(@employee_process) if !@employee_process.save
        return @employee_process.errors.empty?
      end
      return false
    end

    def create_employee_process
      if form_exists?
        build_employee
        build_employee_process
        if assign_and_validate_employee_fields
          if save_employee
            @employee.employee_process.next_step
            return true
          end
        end
      end
      return false
    end

    def update_employee_process
      if form_exists?
        if @employee_process.process_step.step_three?
          ##logica de los documents
          assign_documents
        else
          if @employee = @employee_process.employee
            if update_and_validate_employee_fields
              @employee_process.next_step if @employee_process.process_step.form == @form
              return true
            end
          else
            @error_response = ErrorResponse.record_not_found('Employee')
          end
        end
      end
      return false
    end

    private

    attr_reader :company, :process_step, :params, :form, :form_fields, :employee

    def assign_employee_process_fields
      employee_process_params.each do |key, value|
        form_field = @form_fields.select{ |field| field.name == key }.first
        @employee_process.employee_process_fields.find_or_initialize_by_and_update_value({ form: @form , company_form_field: company_form_fields.select{ |company_form_field| company_form_field.form_field_id == form_field.id }.first }, value, form_field.name)
      end
    end

    def assign_and_validate_employee_fields
      employee_params.each do |key, value|
        form_field = @form_fields.select{ |field| field.name == key }.first
        validator_service = Process::EmployeeFieldValidatorService.new(form_field, value)
        unless validator_service.valid_value?
          @error_response = ErrorResponse.record_not_saved(@employee, validator_service.error_messages)
          return false
        end
        @employee.employee_fields << EmployeeField.new(company_form_field: company_form_fields.select{ |company_form_field| company_form_field.form_field_id == form_field.id }.first, value: value, field_name: form_field.name )
      end
      return true
    end

    def assign_documents
      form_field = @form_fields.select{ |field| field.name == 'suggested_documents_ids' }.first
      values = @params[:employee][:suggested_documents_ids]
      @employee_process.employee.suggested_documents << Document.where(id: values)
      values = values.map { |i| "'" + i.to_s + "'" }.join(",")
      @employee_process.employee.employee_fields.find_or_initialize_by_and_update_value({ company_form_field: company_form_fields.select{ |company_form_field| company_form_field.form_field_id == form_field.id }.first }, values, form_field.name)
    end

    def update_and_validate_employee_fields
      employee_params.each do |key, value|
        form_field = @form_fields.select{ |field| field.name == key }.first
        validator_service = Process::EmployeeFieldValidatorService.new(form_field, value)
        unless validator_service.valid_value?
          @error_response = ErrorResponse.record_not_saved(@employee, validator_service.error_messages)
          return false
        end
        @employee.employee_fields.find_or_initialize_by_and_update_value({ company_form_field: company_form_fields.select{ |company_form_field| company_form_field.form_field_id == form_field.id }.first }, value, form_field.name)
      end
      return true
    end

    def build_process
      @employee_process = @process_step.employee_processes.new(company: @company)
    end

    def build_employee
      @employee = Employee.new
    end

    def build_employee_process
      @employee.employee_process = EmployeeProcess.new(company: @company, process_step: @process_step)
    end

    def save_employee
      company_user = CompanyUser.find_or_initialize_by_employee_params_and_company(employee_params, @company)
      if company_user.new_record?
        if company_user.save
          @employee.company_user = company_user
          if @employee.save
            @employee_process = @employee.employee_process
            return true
          end
          @error_response = ErrorResponse.record_not_saved(@employee)
        else
          @error_response = ErrorResponse.record_not_saved(company_user)
        end
      else
        @error_response = ErrorResponse.record_exists(company_user, { personal_email: ["is already taken"] })
      end
      return false
    end

    def form_field_keys
      @form_fields.map{ |form_field| form_field.name.to_sym }
    end

    def employee_process_params
      @params.require(:employee_process).permit(form_field_keys)
    end

    def employee_params
      @params.require(:employee).permit(form_field_keys)
    end

    def company_form_fields
      @company_form_fields ||= CompanyFormField.where(form_field_id: @form_fields.map(&:id), company_id: @company.id)
    end

    def employee_process_exists?
      return @employee_process.present?
    end

    def form_exists?
      @error_response = ErrorResponse.new(title: 'The step has not been assigned to a form', status_code: :unprocessable_entity) if !@form.present?
      return @form.present?
    end

  end

end
