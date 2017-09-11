class V1::EmployeesController < ApiV1Controller

  before_action :authenticate_with_token!
  before_action :set_employee, only: [:show]

  def index
    @employees = paginate Employee.all, page: params[:page], per_page: 15
    render json: @employees, each_serializer: EmployeeIndexSerializer
  end

  def show
    render json: @employee
  end

  def set_employee
    @employee = Employee.find_by_id(params[:id])
  end


end
