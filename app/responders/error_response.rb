class ErrorResponse

  attr_accessor :title, :reasons, :description, :status_code

  def initialize(args)
    @title = args[:title] || I18n.t("error_codes.#{args[:code]}")
    @status_code = args[:status_code]
    @reasons = args[:reasons] || { }
    @description = args[:description] || "An error has ocurred"
  end

  def to_json
    {
      error: {
        message: title,
        reasons: reasons,
        description: description
      }
    }
  end

  def self.record_not_found(model)
    self.new(
      title: "#{model.capitalize} not found",
      description: "The #{model} does not exist",
      status_code: :not_found
    )
  end

  def self.record_not_saved(record, reasons=nil)
    self.new(
      title: "#{record.class.to_s} not saved",
      description: "Verify the values of #{record.class.to_s}",
      reasons: reasons || record.errors.messages,
      status_code: :unprocessable_entity
    )
  end

  def self.record_exists(record, reasons=nil)
    self.new(
      title: "#{record.class.to_s} already exists",
      description: "Verify the values of #{record.class.to_s}",
      reasons: reasons || record.errors.messages,
      status_code: :unprocessable_entity
    )
  end

  def self.unknown_error error
    self.new(
      title: "An unknown error has ocurred",
      reasons: { base: error.message },
      status_code: :error
    )
  end

  def self.not_found_error error
    self.new(
      title: "Not found",
      reasons: { base: error.message },
      status_code: :not_found
    )
  end

  def self.bad_request(error=nil)
    self.new(
      title: "Bad request",
      description: "Verify the parameters and values of the request",
      reasons: error.is_a?(Hash) ? error : error.messages,
      status_code: :bad_request
    )
  end

  def self.unauthorized
    self.new(
      title: "You are unauthorized to perform this action",
      description: "The access token expired or is invalid",
      status_code: :unauthorized
    )
  end

end
