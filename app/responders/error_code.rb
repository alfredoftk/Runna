module ErrorCode

  class Server
    INTERNAL_SERVER_ERROR = { code: 1, status: :error }
    BAD_REQUEST_ERROR = { code: 2, status: :bad_request }
    NOT_FOUND_ERROR = { code: 3, status: :not_found }
  end

  class AuthenticationAndUser
    AUTHENTICATION_ERROR = { code: 11, status: :unauthorized }
  end

  class Token
    EXPIRED_TOKEN_ERROR = { code: 21, status: :unauthorized }
    INVALID_TOKEN_ERROR = { code: 22, status: :unauthorized }
    ABSENT_TOKEN_ERROR = { code: 23, status: :bad_request }
    INVALID_REFRESH_TOKEN_ERROR = { code: 24, status: :unauthorized }
  end

  class DataValidation
    VALIDATION_ERROR = { code: 31, status: :unprocessable_entity }
  end

  class ExternalIntegration
    SERVICE_TOKEN_ERROR = { code: 41, status: :bad_request }
  end

  class BusinessLogic
    INVALID_KEY_ERROR = { code: 51, status: :unprocessable_entity }
  end

end
