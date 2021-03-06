class ApiToken < ActiveRecord::Base
  belongs_to :user

  before_create :generate_token

  private

  def generate_token
    self.token = SecureRandom.base64
  end
end
