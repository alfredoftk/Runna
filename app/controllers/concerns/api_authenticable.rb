module APIAuthenticable

  # Devise methods overwrites

  def current_session
    @current_session ||= Session.find_by(access_token: request.headers['Authorization'])
  end

  def find_company_user_by_session
    @current_company_user ||= (current_session ? (current_session.expired? ? nil : current_session.company_user) : nil)
  end

  def current_company_user
    @current_company_user ? @current_company_user : find_company_user_by_session
  end

  def company_user_signed_in?
    current_company_user.present?
  end

  # Use:
  # - before_action :authenticate_with_token!, only: [:update, :destroy]
  def authenticate_with_token!
    if !company_user_signed_in?
      if current_session and current_session.expired?
        response_error_json_format(ErrorResponse.unauthorized_expired_access_token)
      else
        response_error_json_format(ErrorResponse.unauthorized)
      end
    end
  end

end
