class UserController< ApplicationController
  def create
    @user = current_user
  end
  def update
    update_profil
  end

  private
  def update_profil
    @user = current_user
    if @user.update(edit_params)
      redirect_to root_path, notice: "Udaje boli uspesne zmenene"
    else
      render :create
    end
  end

  def edit_params
    params.require(:user).permit(:gender, :age, :last_name, :name,roles_attributes:[:role_id])
  end



end
