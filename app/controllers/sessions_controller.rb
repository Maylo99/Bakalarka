class SessionsController <ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])
    session[:user_id]=user.id
    if user.present? && user.authenticate(params[:password])
      redirect_to root_path, notice: "Logged"
    else
      flash[:alert]="Something is wwong"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
