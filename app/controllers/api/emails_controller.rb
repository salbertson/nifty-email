class Api::EmailsController < ApplicationController
  def show
    if email
      render json: {
        html: email.rendered_html(params),
        text: email.rendered_text(params)
      }
    else
      head 404
    end
  end

  private

  def authorize
    authenticate_or_request_with_http_token do |token, options|
      @token = ApiToken.find_by(token: token)
    end
  end

  def email
    @email ||= begin
      current_user.emails.find_by(slug: params[:id]) ||
        current_user.emails.find(params[:id])
    end
  end

  def current_user
    @current_user ||= @token.user
  end
end
