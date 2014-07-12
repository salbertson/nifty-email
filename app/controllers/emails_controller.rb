class EmailsController < ApplicationController
  def index
    @emails = current_user.emails.all
  end

  def show
    @email = find_email

    respond_to do |format|
      format.html { render text: @email.rendered_html }
      format.text { render text: @email.rendered_text }
    end
  end

  def new
    @email = current_user.emails.new
  end

  def create
    @email = current_user.emails.new(email_params)

    if @email.save
      redirect_to emails_path, notice: 'Email created!'
    else
      render :new
    end
  end

  def edit
    @email = find_email
  end

  def update
    @email = find_email

    if @email.update_attributes(email_params)
      redirect_to emails_path, notice: 'Email updated!'
    else
      render :edit
    end
  end

  def destroy
    @email = find_email

    if @email.destroy
      redirect_to emails_path, notice: 'Email deleted!'
    else
      render :edit
    end
  end

  private

  def email_params
    params.require(:email).permit(:name, :html, :text)
  end

  def find_email
    current_user.emails.find(params[:id])
  end
end
