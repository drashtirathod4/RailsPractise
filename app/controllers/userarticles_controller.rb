class UserarticlesController < ApplicationController
  before_action :require_login!, except: :index
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  after_action :verify_authorized, except: :index 
  after_action :verify_policy_scoped, only: :index

  def index
    @aticles = policy_scope(Userarticle).reverse
  end

  def show
  end

  def new
    @article = current_user.userarticles.new
    authorize @article
  end

  def create
    article = current_user.userarticles.create(userarticle_params)
    authorize article
    if article.valid?
      redirect_to userarticles_path, notice: 'Article was successfully created!'
    else 
      flash[:errors] = article.errors.full_messages
      redirect_to new_userarticle_path
    end
  end

  def edit
  end

  def update 
    @article = Userarticle.find(params[:id])
    @article.update(magazine_params)
    if @article.valid?
      redirect_to userarticle_path, notice: 'Article was successfully updated!'
    else 
      flash[:errors] = @article.errors.full_messages
      redirect_to edit_userarticle_path(@article)
    end
  end

  def destroy
    @article = Userarticle.find(params[:id])
    @article.destroy
    redirect_to userarticles_path, notice: 'Article was successfully destroyed!'
  end

  private 
  def set_article
    @article = Userarticle.find(params[:id])
    authorize @article
  end

  def userarticle_params
    params.require(:userarticle).permit(:title, :published, :user_id)
  end
end
