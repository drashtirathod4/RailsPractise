class AdsController < ApplicationController
  def index
    @ads = Ad.all()
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def new
    @ad = Ad.new()
  end

  def create
    ad = Ad.create(ad_params)
    if ad.valid?
      redirect_to magazine_ads_path
    else 
      flash[:errors] = ad.errors.full_messages
      redirect_to new_magazine_ad_path
    end
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def update 
    @ad = Ad.find(params[:id])
    @ad.update(ad_params)
    if @ad.valid?
      redirect_to ad_path
    else 
      flash[:errors] = @ad.errors.full_messages
      redirect_to edit_ad_path(@ad)
    end
  end

  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy
    redirect_to magazine_ads_path
  end

  private 
  def ad_params
    params.require(:ad).permit(:ad_name)
  end
end
