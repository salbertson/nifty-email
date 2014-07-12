class AccountsController < ApplicationController
  def show
    @api_tokens = current_user.api_tokens
  end
end
