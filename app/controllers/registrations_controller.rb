class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to sign_in_path, notice: "Succesfuly created account"
    else
      redirect_to sign_up_path, alert: @user.errors.full_messages.first
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :last_name, :gender, :age, :email, :password, :password_confirmation)
  end
end
