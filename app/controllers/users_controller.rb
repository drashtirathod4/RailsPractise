require "prawn"
class UsersController < ApplicationController
  # before filter
  before_action :require_login, only: [:update, :destroy]

  def index
    @users = User.all()
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        send_data generate_pdf(@user),
              filename: "#{@user.name}.pdf",
              type: "application/pdf"
      end
    end
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
    @user.update(user_params)
    if @user.valid?
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

  def welcome
    @current_user = current_user
  end

  def profile
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :phone, :dob, :agreement, :password, :password_confirmation, :course, :start_date, :end_date)
  end

  def generate_pdf(user)
    Prawn::Document.new do
      text user.name, align: :center
      text "Name: #{user.name}"
      text "Email: #{user.email}"
    end.render
  end
end
