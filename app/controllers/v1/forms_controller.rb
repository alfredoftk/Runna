class V1::FormsController < ApiV1Controller

  def index
    if params[:entity] == "employee"
      render json: Form.employee
    else
      render json: {"error": "No type has been registered"}
    end
  end

end
