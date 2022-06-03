class UserController< ApplicationController
  def create
    if session[:user_id].nil?
      redirect_to root_path, notice: "Pre túto akciu musíš byť prihlásený!"
    end
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
      redirect_to update_user_path, notice: "Nesprávne vyplnené údaje"
    end
  end

  def edit_params
    params.require(:user).permit(:gender, :age, :last_name, :name)
  end

end
