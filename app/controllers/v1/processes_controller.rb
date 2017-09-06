class V1::ProcessesController < ApiV1Controller
  before_action :authenticate_with_token!
  before_action :set_process_step, only: [:create, :continue_later]
  before_action :set_company, only: [:create, :update, :continue_later]
  before_action :set_employee_process, only: [:update]
  before_action :set_employee, only: [:update]


  def create
  end

  def continue_later
    process_service = Process::EmployeeProcessService.new(@company, @process_step, params)
    if process_service.continue_later
      render json: process_service.employee_process
    else
      response_error_json_format(ErrorResponse.new(title: 'Couldnt save', status_code: :bad_request, description: ''))
    end
  end

  def update
    process_service = Process::EmployeeProcessService.new(@company, @process.process_step, params, @process)
    if process_service.update
      render json: process_service.employee_process
    else
      response_error_json_format(ErrorResponse.new(title: 'Couldnt update', status_code: :bad_request, description: ''))
    end
  end

  private
  def set_process_step
    @process_step = ProcessStep.find_by key: params[:key]
    response_error_json_format(ErrorResponse.record_not_found('ProcessStep')) if @process_step.nil?
  end

  def set_employee_process
    @process = EmployeeProcess.find(params[:id])
    response_error_json_format(ErrorResponse.record_not_found('EmployeeProcess')) if @process.nil?
  end

  def set_employee
    @employee = nil
    unless @process.employee.nil?
      @employee = @process.employee
    end
  end

  def set_company
    @company = current_company_user.company
  end


end