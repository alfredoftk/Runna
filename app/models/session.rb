class Session < ApplicationRecord

  belongs_to :tenant_user

  include Tokenable

  before_create :set_values
  
  validates :tenant_user, presence: true

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
