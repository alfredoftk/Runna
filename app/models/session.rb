class Session < ApplicationRecord

  belongs_to :company_user, required: true

  include Tokenable

  before_create :set_values

  def set_values
    self.access_token = generate_token
    self.refresh_token = generate_token
    self.expires_at = Time.now + SESSION_EXPIRES_IN
  end

  def expired?
    self.expires_at <= Time.now
  end

  def expire!
    self.update(expires_at: Time.now) unless expired?
  end

end
