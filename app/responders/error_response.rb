class ErrorResponse

  attr_accessor :title, :reasons, :description, :error, :error_code, :status_code

  def initialize(args)
    @title = args[:title] || "Error"
    error = args[:error] || ErrorCode::Server::INTERNAL_SERVER_ERROR
    @error = args[:error_code] || error[:code]
    @status_code = args[:status_code] || error[:status]
    @reasons = args[:reasons] || { base: "An error has ocurred" }
    @description = args[:description] || "An error has ocurred"
  end

  def to_json
    {
      error: {
        message: title,
        code: error,
        reasons: reasons,
        description: description
      }
    }
  end

  def self.record_not_found(model)
    self.new(title: "#{model.capitalize} not found", description: "The #{model} does not exist", error: ErrorCode::Server::NOT_FOUND_ERROR)
  end

  def self.record_not_saved(record, reasons=nil)
    self.new(
      title: "#{record.class.to_s} not saved",
      description: "Verify the values of #{record.class.to_s}",
      reasons: reasons || record.errors.messages,
      error: ErrorCode::DataValidation::VALIDATION_ERROR
    )
  end

  def self.unknown_error error
    self.new(
      title: "An unknown error has ocurred",
      reasons: { base: error.message },
      error: ErrorCode::Server::INTERNAL_SERVER_ERROR
    )
  end

  def self.not_found_error error
    self.new(
      title: "Not found",
      reasons: { base: error.message },
      error: ErrorCode::Server::NOT_FOUND_ERROR
    )
  end

  def self.unauthorized
    self.new(title: "You are unauthorized to perform this action", description: "The token is incorrect", error: ErrorCode::Token::INVALID_TOKEN_ERROR)
  end

  def self.unauthorized_expired_access_token
    self.new(title: "You are unauthorized to perform this action", description: "The token has expired", error: ErrorCode::Token::EXPIRED_TOKEN_ERROR)
  end

end
