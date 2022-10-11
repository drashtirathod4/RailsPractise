class UsersController < ApplicationController
  def index
    if params[:query].present?
      @users = User.search(params[:query], fields: [{email: :text_middle}, {course: :text_middle}, {name: :text_middle}])
    else
      @users = User.all
    end
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

  def autocomplete
    # render json: User.search(params[:query], {
    #   fields: ["name", "email", "course"],
    #   match: :word_start,
    #   limit: 10,
    #   load: false,
    #   misspellings: {below: 5}
    # }).map(&:name)
    # render json: User.search(params[:query], {
    #   fields: ["name"],
    #   match: :text_middle,
    #   limit: 10,
    #   load: false,
    #   misspellings: {below: 5}
    # }).map(&:name)

    render json: User.search(params[:query], fields: ["name", "email", "course"], match: :text_middle, limit: 10, load: false, misspellings: {below: 5}).map(&:name)
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :phone, :dob, :agreement, :course, :start_date, :end_date, :age)
  end
end
