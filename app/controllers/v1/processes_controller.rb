class V1::ProcessesController < ApiV1Controller
  before_action :authenticate_with_token!
  before_action :set_process_step, only: [:create, :continue_later]
  before_action :set_company, only: [:create, :continue_later]
  before_action :set_employee_process, only: [:continue_later]


  def create
  end

  def continue_later
    process_service = Process::EmployeeProcessService.new(@company, @process_step, params, @process)
    if process_service.continue_later
      render json: process_service.employee_process
    else
      response_error_json_format(ErrorResponse.new(title: 'Couldnt save', status_code: :bad_request, description: ''))
    end
  end

  private
  def set_process_step
    unless params[:key].nil?
      @process_step = ProcessStep.find_by key: params[:key]
      response_error_json_format(ErrorResponse.record_not_found('ProcessStep')) if @process_step.nil?
    end
  end

  def set_employee_process
    unless params[:id].nil?
      employee_p = EmployeeProcess.find(params[:id])
      @process_step = employee_p.process_step
      @process = employee_p
      response_error_json_format(ErrorResponse.record_not_found('EmployeeProcess')) if @process.nil?
    end
  end

  def set_company
    @company = current_company_user.company
  end


end