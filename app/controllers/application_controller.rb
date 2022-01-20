class ApplicationController < ActionController::Base 
  include Pundit
  # after_action :verify_authorized
  def set_current_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    end
  end
end