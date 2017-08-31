class V1::FormsController < ApiV1Controller

  before_action :authenticate_with_token!
  before_action :set_form, only: [:show]

  def index
    if params[:entity] == "employee"
      render json: Form.employee
    else
      response_error_json_format(ErrorResponse.new(title: 'Unknown entity', status_code: :bad_request, description: ''))
    end
  end

  def show
    @company_form_fields = current_company_user.company.form_fields_by_form_id(@form.id)
    render json: { form: @form, company_form_fields: @company_form_fields }, serializer: CompanyFormFieldsSerializer, scope: current_company_user
  end

  private

  def set_form
    @form = Form.find_by key: params[:key]
    response_error_json_format(ErrorResponse.record_not_found('form')) if @form.nil?
  end

end
