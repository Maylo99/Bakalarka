class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user=User.find_by(email: params[:email])
    if @user.present?
      #deliver_later znamena ze zobrazi stranku a email sa odosle neskor aby user videl odpoved a potom na pozadi bude prebiehat odosielanie
      #reset je methoda z maileru
      #with komu poslat email setupuje parametre v mailery
      PasswordMailer.with(user: @user).reset.deliver_now
      redirect_to root_path, notice: "Nasiel sa email poslali sme email"
    else
      redirect_to password_reset_path, notice: "Nenasiel sa email!"
    end
  end

  def edit
    @user=User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: "Your token has expired. Please try again."
  end

  def update
    @user=User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to sign_in_path, notice: "your password was reset succesfully. Please log in."
    else
      render :edit
    end
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end