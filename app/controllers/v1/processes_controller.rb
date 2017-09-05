class V1::ProcessesController < ApiV1Controller
  before_action :authenticate_with_token!
  before_action :set_process_step, only: [:create, :continue_later]
  before_action :set_employee_process, only: [:update]


  def create
  end

  def continue_later
    company = current_company_user.company
    process_service = Process::EmployeeProcessService.new(company, @process_step, params)
    if process_service.continue_later
      render json: process_service.employee_process
    else
      response_error_json_format(ErrorResponse.new(title: 'Couldnt save', status_code: :bad_request, description: ''))
    end
  end

  def update
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


end