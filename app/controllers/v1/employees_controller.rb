class V1::EmployeesController < ApiV1Controller

  before_action :authenticate_with_token!
  before_action :set_employee, only: [:show, :update ]

  def index
    @employees = paginate Employee.all_active_and_inactive, page: params[:page], per_page: 15
    render json: @employees, each_serializer: EmployeeIndexSerializer
  end

  def show
    render json: @employee
  end

  def update
    if @employee.update_attributes(employee_params)
      render json: @employee
    else
      response_error_json_format(ErrorResponse.record_not_saved(@employee))

    end

  end

  private

  def set_employee
    @employee = Employee.find_by_id(params[:id])
    response_error_json_format(ErrorResponse.record_not_found('employee')) if @employee.nil?
  end

  def employee_params
    params.require(:employee).permit(:status)
  end
end
