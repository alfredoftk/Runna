module Process

  class EmployeeProcessService

    attr_accessor :employee_process, :company, :process_step, :form, :form_fields, :params, :employee, :error_response

    def initialize(company, process_step, params, employee_process=nil, form=nil)
      @company = company
      @process_step = process_step
      @employee_process = employee_process
      @params = params
      @form = form.nil? ? @process_step.form : form
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

    def create
      if form_exists?
        if @process_step.step_1?
          build_employee
          build_employee_process
          if assign_employee_fields
            if build_company_user
              if !@employee.save
                @error_response = ErrorResponse.record_not_saved(@employee)
              else
                @employee.employee_process.update_process_step
              end
            else
              return false
            end
          else
            return false
          end
          return @employee.errors.empty?
        else
          @error_response = ErrorResponse.new(title: 'The step is for create', status_code: :unprocessable_entity)
        end
      else
        @error_response = ErrorResponse.new(title: 'The step has not assigned a form', status_code: :unprocessable_entity)
      end
      return false
    end
    
    def update
      if form_exists?
        if @employee_process.nil?
          @error_response = ErrorResponse.new(title: @employee_process.errors.messages, status_code: :unprocessable_entity)
        else
          @employee = @employee_process.employee
          if @employee.nil?
            @error_response = ErrorResponse.new(title: 'Employee must exists', status_code: :unprocessable_entity)
          else
            if update_employee_fields
              return @employee_process.errors.empty?
            end
          end
        end
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

    def assign_employee_fields
      employee_field_params.each do |key, value|
        form_field = @form_fields.select{ |field| field.name == key }.first
        var = Process::EmployeeFieldValidatorService.new(form_field, value)
        if var.valid_value?
          @employee.employee_fields << EmployeeField.new(company_form_field: company_form_fields.select{ |company_form_field| company_form_field.form_field_id == form_field.id }.first, value: value)
        else
          @error_response = ErrorResponse.new(title: var.error_messages, status_code: :unprocessable_entity)
          return false
        end
      end
      return true
    end

    def update_employee_fields
      employee_field_params.each do |key, value|
        form_field = @form_fields.select{ |field| field.name == key }.first
        var = Process::EmployeeFieldValidatorService.new(form_field, value)
        if var.valid_value?
          @employee.employee_fields.find_create_or_update(company_form_fields.select{ |company_form_field| company_form_field.form_field_id == form_field.id }.first, value)
        else
          binding.pry
          @error_response = ErrorResponse.new(title: var.error_messages, status_code: :unprocessable_entity)
          return false
        end
      end
      return true
    end

    private

    def build_process
      @employee_process = @process_step.employee_processes.new(company: @company)
    end

    def build_employee_process
      @employee.employee_process = EmployeeProcess.new(company: @company, process_step: @process_step)
    end

    def build_company_user
      email = @params.dig('employee_field', 'personal_email')
      name = @params.dig('employee_field', 'name')
      family_name = @params.dig('employee_field', 'family_name')
      additional_family_name = @params.dig('employee_field', 'additional_family_name')
      @user = User.new(email: email, name: name, family_name: family_name,
                          additional_family_name: additional_family_name)
      @user.companies << @company
      unless @user.save
        @error_response = ErrorResponse.new(title: @user.errors.messages, status_code: :unprocessable_entity)
        return false
      end
      @employee.company_user = @user.company_users.first
      return true
    end

    def form_field_keys
      @form_fields.map{ |form_field| form_field.name.to_sym }
    end

    def form_params
      @params.require(:employee_process_field).permit(form_field_keys)
    end

    def employee_field_params
      @params.require(:employee_field).permit(form_field_keys)
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

    def build_employee
      @employee = Employee.new()
    end

  end

end
