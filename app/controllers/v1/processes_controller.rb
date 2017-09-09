class V1::ProcessesController < ApiV1Controller

  before_action :authenticate_with_token!
  before_action :set_process_step, only: [:create, :continue_later]
  before_action :set_process_step_and_employee_process, only: [:update, :continue_later, :show]
  before_action :set_form, only: [:update]

  def create
    process_service = Process::EmployeeProcessService.new(current_company, @process_step, params, @employee_process)
    if process_service.create_employee_process
      render json: process_service.employee_process
    else
      response_error_json_format(process_service.error_response)
    end
  end

  def update
    process_service = Process::EmployeeProcessService.new(current_company, @process_step, params, @employee_process, @form)
    if process_service.update_employee_process
      render json: process_service.employee_process
    else
      response_error_json_format(process_service.error_response)
    end
  end

  def continue_later
    process_service = Process::EmployeeProcessService.new(current_company, @process_step, params, @employee_process)
    if process_service.continue_later
      render json: process_service.employee_process
    else
      response_error_json_format(process_service.error_response)
    end
  end

  def show
    render json: @employee_process
  end

  private

  def set_process_step
    @process_step = ProcessStep.first_step
    response_error_json_format(ErrorResponse.record_not_found('ProcessStep')) if @process_step.nil?
  end

  def set_process_step_and_employee_process
    if params[:id].present?
      set_employee_process
      set_process_step_by_employess_process
    end
  end

  def set_employee_process
    @employee_process = EmployeeProcess.find_by(id: params[:id])
    response_error_json_format(ErrorResponse.record_not_found('EmployeeProcess')) if @employee_process.nil?
  end

  def set_process_step_by_employess_process
    @process_step = @employee_process.process_step
    response_error_json_format(ErrorResponse.record_not_found('ProcessStep')) if @process_step.nil?
  end

  def set_form
    @form = Form.find_by(id: params[:form_id]) if params[:form_id].present?
  end

end
