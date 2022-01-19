class UserController< ApplicationController
  def create
    @user = set_current_user
  end
  def update
    update_profil
  end

  private
  def update_profil
    @user = set_current_user
    if @user.update(edit_params)
      redirect_to root_path, notice: "Udaje boli uspesne zmenene"
    else
      render :edit
    end
  end

  def edit_params
    params.require(:user).permit(:gender, :age, :last_name, :name)
  end

  def role?(role)
    roles.any? { |r| r.name.underscore.to_sym == role }
  end
end
