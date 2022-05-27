class UsersController < ApplicationController
  def index
    @users = User.all()
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.valid?
      # delayed job
      UserMailer.welcome_email(user).deliver_now
      flash[:notice] = "Mail Delievered"
      redirect_to users_path
    else 
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.valid?
      # delayed job
      UserMailer.delay(run_at: 1.minutes.from_now).welcome_email(@user)
      redirect_to user_path
    else 
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def create_user
    # active job
    CreateUserJob.perform_now()
    # delayed job : works at : rake jobs:work
    CreateUserJob.set(wait: 1.minutes).perform_later()
    redirect_to users_path
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :phone, :dob, :agreement, :course, :start_date, :end_date)
  end
end
