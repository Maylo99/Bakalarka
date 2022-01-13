class RegistrationsController<ApplicationController
  def new
    @user=User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Succesfuly created account"
    else
      render :new, notice: "Not created account"
    end

  end
  private
  def user_params
    params.require(:user).permit(:name, :last_name, :gender, :age, :email, :password, :password_confirmation)
  end
end
