class V1::ProcessesController < ApiV1Controller

  before_action :authenticate_with_token!
  before_action :set_process_step, only: [:create, :continue_later]
  before_action :set_process_step_and_employee_process, only: [:update, :continue_later]

  def create
  end

  def update
  end

  def continue_later
    process_service = Process::EmployeeProcessService.new(current_company, @process_step, params, @employee_process)
    if process_service.continue_later
      render json: process_service.employee_process
    else
      response_error_json_format(process_service.error_response)
    end
  end

  private

  def set_process_step
    unless params[:key].nil?
      @process_step = ProcessStep.find_by(key: params[:key])
      response_error_json_format(ErrorResponse.record_not_found('ProcessStep')) if @process_step.nil?
    end
  end

  def set_process_step_and_employee_process
    unless params[:id].nil?
      set_employee_process
      set_process_step_by_employess_process
    end
  end

  def set_employee_process
    @employee_process = EmployeeProcess.find(params[:id])
    response_error_json_format(ErrorResponse.record_not_found('EmployeeProcess')) if @employee_process.nil?
  end

  def set_process_step_by_employess_process
    @process_step = @employee_process.process_step
    response_error_json_format(ErrorResponse.record_not_found('ProcessStep')) if @process_step.nil?
  end

end
