class Api::EmailsController < ApplicationController
  before_action :authenticate

  def show
    @email = find_email

    if @email
      render json: {
        html: @email.rendered_html(params),
        text: @email.rendered_text(params)
      }
    else
      head 404
    end
  end

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      ApiToken.find_by(token: token)
    end
  end

  def find_email
    Email.find_by(slug: params[:id]) || Email.find(params[:id])
  end
end
