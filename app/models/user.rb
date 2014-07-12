class User < ActiveRecord::Base
  include Clearance::User

  has_many :emails
  has_many :api_tokens

  after_create :create_token

  private

  def create_token
    self.api_tokens.create
  end
end
