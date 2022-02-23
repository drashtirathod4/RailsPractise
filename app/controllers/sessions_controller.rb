class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create 
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully logged in."
      redirect_to welcome_path
    elsif @user || @user.authenticate(params[:password])
      flash[:notice] = "Invalid email or password"
      redirect_to login_path
    else
      redirect_to 'login'
    end
  end

  def destroy 
    session.delete :user_id
    flash[:notice] = "You have successfully logged out."
    redirect_to users_path
  end
end
