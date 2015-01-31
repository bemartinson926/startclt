class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
  	"/dashboard/user/#{current_user.slug}"
  end

  def access_denied
    flash[:danger] = "You don't have permission to do that."
    redirect_to :user_dashboard
  end
end
