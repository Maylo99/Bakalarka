class ApplicationController < ActionController::Base 
  include Pundit
  # after_action :verify_authorized
  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    end
  end

  rescue_from Pundit::NotAuthorizedError do
    redirect_to root_path, alert: "K tejto akcií nemáš prístup!"
  end
end