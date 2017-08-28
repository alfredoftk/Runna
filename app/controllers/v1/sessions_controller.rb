class V1::SessionsController < ApiV1Controller

  before_action :authenticate_with_token!, only: [:destroy, :current]

  def create
    authenticator = Auth::UserAuthenticatorService.new(session_params[:email], session_params[:password], session_params[:subdomain])
    if authenticator.authenticate
      @session = authenticator.session
      render json: @session
    else
      response_error_json_format(authenticator.error_response)
    end
  end

  def current
    render json: current_company_user
  end

  def refresh_token
    refresher = Auth::RefreshTokenService.new(current_session, params[:refresh_token])
    if refresher.refresh
      @session = refresher.session
      render json: @session
    else
      response_error_json_format(refresher.error_response)
    end
  end

  def destroy
    begin
      current_session.expire!
      render json: { message: "Successfully logged out" }
    rescue Exception => error
      response_error_json_format(ErrorResponse.unknown_error(error))
    end
  end

  private

  def session_params
    params.permit(:email, :password, :subdomain)
  end

end
