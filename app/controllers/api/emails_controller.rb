class Api::EmailsController < ApplicationController
  def show
    @email = find_email

    if @email
      render json: {
        html: @email.rendered_html,
        text: @email.rendered_text
      }
    else
      head 404
    end
  end

  private

  def find_email
    Email.find_by(slug: params[:id]) || Email.find(params[:id])
  end
end
