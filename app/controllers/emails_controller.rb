class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def new
    @email = Email.new
  end

  def create
    @email = Email.new(email_params)

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
    params.require(:email).permit(:title, :content)
  end

  def find_email
    Email.find(params[:id])
  end
end
