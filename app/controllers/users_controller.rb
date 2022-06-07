class UsersController < ApplicationController
  def index
    @search = User.search do
      fulltext params[:search]
      # field facet
      facet(:name)
      with(:name, params[:name]) if params[:name].present?

      # query facet based on score by each user
      facet(:score) do
        row(0..10) do
          with(:score, 0..10)
        end
        row(11..20) do
          with(:score, 11..20)
        end
        row(21..30) do
          with(:score, 21..30)
        end
      end

      # range facet, based on score 
      facet :score, :range => 0..100, :range_interval => 5
    end
    @users = @search.results
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

  private 
  def user_params
    params.require(:user).permit(:name, :email, :score, :phone, :dob, :agreement, :course, :start_date, :end_date)
  end
end
