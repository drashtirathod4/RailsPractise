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
    @user.post.attach(params[:post])
    @user.update(user_params)
    if @user.valid?
      redirect_to user_path
    else 
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path(@user)
    end
  end

  def delete_attachement
    @user = User.find(params[:id])
    @user.document.purge
    redirect_to user_path(@user)
  end

  def delete_post_attachement
    @user = User.find(params[:id])
    @user.post.attachments.where(id: params[:post_id]).purge
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :phone, :dob, :agreement, :course, :start_date, :end_date, :document, post: [])
  end
end
