class V1::SessionsController < ApiV1Controller

  skip_before_action :verify_current_user, except: :destroy

  def create
    email = session_params[:email].downcase
    password = session_params[:password]
    unless email.blank? or password.blank?
      if TenantUser.valid_email_format? email
        if tenant_user = TenantUser.find_by(email: email)
          if tenant_user.valid_password? password
            session = tenant_user.create_session
            render json: session
          else
            response_error_json_format ErrorResponse.record_not_found("TenantUser")
          end
        else
          response_error_json_format ErrorResponse.record_not_found("TenantUser")
        end
      else
        args = {title: "The session could not be initiated", error_code: 61, reasons: {email: "does not have the right format"}, description: "Email format does not match the intended format", status_code: 422}
        response_error_json_format ErrorResponse.initialize(args)
      end
    else
      args = {title: "The session could not be initiated", error_code: 61, reasons: {email_or_password: "cannot be blank"}, description: "This fields are required to create a session", status_code: 422}
      response_error_json_format ErrorResponse.initialize(args)
    end
  end

  def refresh_token
    # set_current_session
    # old_session = current_session
    # if old_session
    #   if current_session.expired? and old_session.refresh_token == params[:refresh_token]
    #     @session = old_session.user.generate_session
    #     old_session.expire!
    #     render template: "api/v1/sessions/show"
    #   else
    #     response_error(title: "Unauthorized access", reasons: {base: "Access or refresh token is invalid"}, description: "Enter a valid access and refresh token", status_code: 401)
    #   end
    # else
    #   response_error(title: "Unauthorized access", reasons: {base: "Authorization value has an invalid access token"}, description: "Enter a valid access token", status_code: 401)
    # end
  end

  def destroy
    # begin
    #   if device = current_session.device
    #     device.update(keeper_id: nil, consumer_id: nil)
    #   end
    #   current_session.expire!
    #   current_session.user.register_audit "User Logoff", "action"
    #   render json: {message: "Successfully logged out"}
    # rescue Exception => e
    #   response_error
    # end
  end

  private

  def session_params
    params.permit(:email, :password)
  end

end
