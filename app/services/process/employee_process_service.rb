module Process

  class EmployeeProcessService

    attr_accessor :employee_process, :company, :process_step, :form, :form_fields, :params, :employee, :error_response

    def initialize(company, process_step, params, employee_process=nil)
      @company = company
      @process_step = process_step
      @employee_process = employee_process
      @params = params
      @employee_params = params
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

    def create
      if form_exists?
        if @process_step.step_1?
          create_company_user
          build_employee_process
          assign_employee_fields
          #SI LO GUARDA             # PROCESS STEP CAMBIAR EL STEP AL SIGUIENTE

          if !@employee.save
            @error_response = ErrorResponse.record_not_saved(@employee_process)
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

    def assign_employee_process_fields
      form_params.each do |key, value|
        form_field = @form_fields.select{ |field| field.name == key }.first
        @employee_process.employee_process_fields.find_create_or_update(@form, company_form_fields.select{ |company_form_field| company_form_field.form_field_id == form_field.id }.first, value)
      end
    end

    def assign_employee_fields
      employee_field_params.each do |key, value|
        form_field = @form_fields.select{ |field| field.name == key }.first
        @employee.employee_fields.find_create_or_update(company_form_fields.select{ |company_form_field| company_form_field.form_field_id == form_field.id }.first, value)
      end
    end

    private

    def build_process
      @employee_process = @process_step.employee_processes.new(company: @company)
    end

    def build_employee_process
      @employee.employee_process = EmployeeProcess.new(company: @company, process_step: @process_step)
    end

    def create_company_user
      email = @employee_params.dig('employee_field', 'personal_email')
      name = @employee_params.dig('employee_field', 'name')
      family_name = @employee_params.dig('employee_field', 'family_name')
      additional_family_name = @employee_params.dig('employee_field', 'additional_family_name')



      @user = User.create(email: email, name: name, family_name: family_name,
                          additional_family_name: additional_family_name)
      @user.companies << @company
      create_employee
    end

    def form_field_keys
      @form_fields.map{ |form_field| form_field.name.to_sym }
    end

    def form_params
      @params.require(:employee_process_field).permit(form_field_keys)
    end

    def employee_field_params
      @employee_params.require(:employee_field).permit(form_field_keys)
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

    def create_employee
      @employee = Employee.create(company_user: @user.company_users.first)
    end

  end

end
