class TraineesController < ApplicationController
  def index
    @trainees = Trainee.all()
  end

  def show
    @trainee = Trainee.find(params[:id])
  end

  def new
    @trainee = Trainee.new
    1.times { @trainee.addresses.build }
  end

  def create
    trainee = Trainee.create(trainee_params)
    if trainee.valid?
      redirect_to trainees_path
    else 
      flash[:errors] = trainee.errors.full_messages
      redirect_to new_trainee_path
    end
  end

  def edit
    @trainee = Trainee.find(params[:id])
  end

  def update 
    @trainee = Trainee.find(params[:id])
    @trainee.update(trainee_params)
    if @trainee.valid?
      redirect_to trainee_path
    else 
      flash[:errors] = @trainee.errors.full_messages
      redirect_to edit_trainee_path(@trainee)
    end
  end

  def destroy
    @trainee = Trainee.find(params[:id])
    @trainee.destroy
    redirect_to trainees_path
  end

  private 
  def trainee_params
    params.require(:trainee).permit(:name, :email, :address, :gender, {hobbies: []}, :dob, :city_id, :image, addresses_attributes: [:street, :road])
  end
end
