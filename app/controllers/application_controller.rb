class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  helper_method :current_user
  
  def current_user
    User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !current_user.nil?
  end

  private
  def require_login
    unless logged_in?
    flash[:notice] = "You must be logged in to access that section"
    redirect_to '/login' # halts request cycle
    end
  end

  def record_not_found
    render plain: "404 Not Found", status: 404
  end
end
