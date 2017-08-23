module APIAuthenticable

  # Devise methods overwrites

  def current_session
    @current_session ||= Session.find_by(access_token: request.headers['Authorization'])
  end

  def find_tenant_user_by_session
    @current_tenant_user ||= (current_session ? (current_session.expired? ? nil : current_session.tenant_user) : nil)
  end

  def current_tenant_user
    @current_tenant_user ? @current_tenant_user : find_tenant_user_by_session
  end

  def tenant_user_signed_in?
    current_tenant_user.present?
  end

  # Use:
  # - before_action :authenticate_with_token!, only: [:update, :destroy]
  def authenticate_with_token!
    response_error_json_format(ErrorResponse.unauthorized) unless tenant_user_signed_in?
  end

end
