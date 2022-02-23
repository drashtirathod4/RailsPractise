class MagazinesController < ApplicationController
  def index
    @magazines = Magazine.all()
  end

  def show
    @magazine = Magazine.find(params[:id])
  end

  def new
    @magazine = Magazine.new
  end

  def create
    magazine = Magazine.create(magazine_params)
    if magazine.valid?
      redirect_to magazines_path
    else 
      flash[:errors] = magazine.errors.full_messages
      redirect_to new_magazine_path
    end
  end

  def edit
    @magazine = Magazine.find(params[:id])
  end

  def update 
    @magazine = Magazine.find(params[:id])
    @magazine.update(magazine_params)
    if @magazine.valid?
      redirect_to magazine_path
    else 
      flash[:errors] = @magazine.errors.full_messages
      redirect_to edit_magazine_path(@magazine)
    end
  end

  def destroy
    @magazine = Magazine.find(params[:id])
    @magazine.destroy
    redirect_to magazines_path
  end

  private 
  def magazine_params
    params.require(:magazine).permit(:title)
  end
end
