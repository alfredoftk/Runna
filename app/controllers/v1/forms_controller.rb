class V1::FormsController < ApiV1Controller

  before_action :authenticate_with_token!

  def index
    if params[:entity] == "employee"
      render json: Form.employee
    else
      render json: {"error": "No type has been registered"}
    end
  end

  def register
  	form = Form.where key: params[:type]
  	render json: form, each_serializer: DetailFormSerializer, include: 'form_sections,form_sections.form_fields'
  end

end
