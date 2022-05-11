class SessionsController <ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if(user.nil?)
      render :new, alert:"Check if email is correct"
    else
      if (user.present? && user.authenticate(params[:password]))
        session[:user_id]=user.id
        redirect_to root_path, notice: "Logged"
      else
        redirect_to sign_in_path, alert: :"Wrong password try again!"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
