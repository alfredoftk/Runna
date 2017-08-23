class ApiV1Controller < ApplicationController

  before_action :verify_current_user
  helper_method :current_user

  def verify_current_user
    unless request.headers["HTTP_AUTHORIZATION"].blank?
      set_current_session
      if current_session
        unless current_session.expired?
          set_current_user
        else
          response_error_json_format ErrorResponse.record_not_saved(current_session)
        end
      else
        response_error_json_format ErrorResponse.unauthorized(current_session)
      end
    else
      response_error_json_format ErrorResponse.record_not_saved(current_session)
    end
  end

  private

  def set_current_session
    @current_session ||= Session.find_by_access_token request.headers["HTTP_AUTHORIZATION"]
  end

  def current_session
    @current_session
  end

  def set_current_user
    @current_user ||= current_session ? current_session.user : nil
  end

  def current_user
    @current_user
  end

end
