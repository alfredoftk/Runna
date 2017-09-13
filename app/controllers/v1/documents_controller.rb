class V1::DocumentsController < ApiV1Controller

  before_action :authenticate_with_token!

  def index
    documents = current_company.available_documents(types)
    if current_company.errors.empty?
      render json: documents
    else
      response_error_json_format ErrorResponse.bad_request(current_company.errors)
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id]) if params[:employee_id].present?
  end

  def types
    @types ||= params[:types].split(',') if params[:types].present?
  end

end
