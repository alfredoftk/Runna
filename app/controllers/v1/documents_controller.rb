class V1::DocumentsController < ApiV1Controller

  def index
    current_company = current_session.company_user.company
    types = params[:types].split(',') if params[:types].present?
    if types.include?("EmployeesDocument") or types.include?("CompaniesDocument")
      documents = types.nil? ? current_company.available_entity_fetcher("document") : current_company.available_entity_fetcher("document").select{|x| types.include?(x.type)}
      render json: documents
    else
      response_error_json_format(ErrorResponse.new(title: 'wrong types param', status_code: :bad_request, description: 'try with EmployeesDocument or CompaniesDocument'))
    end
  end

end
