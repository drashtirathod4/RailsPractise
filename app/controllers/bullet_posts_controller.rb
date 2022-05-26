class BulletPostsController < ApplicationController
  before_action :set_bullet_post, only: %i[ show edit update destroy ]

  # GET /bullet_posts or /bullet_posts.json
  def index
    @bullet_posts = BulletPost.all

    # @bullet_posts = BulletPost.includes(:comments)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /bullet_posts/1 or /bullet_posts/1.json
  def show
  end

  # GET /bullet_posts/new
  def new
    @bullet_post = BulletPost.new
  end

  # GET /bullet_posts/1/edit
  def edit
  end

  # POST /bullet_posts or /bullet_posts.json
  def create
    @bullet_post = BulletPost.new(bullet_post_params)

    respond_to do |format|
      if @bullet_post.save
        format.html { redirect_to bullet_post_url(@bullet_post), notice: "Bullet post was successfully created." }
        format.json { render :show, status: :created, location: @bullet_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bullet_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bullet_posts/1 or /bullet_posts/1.json
  def update
    respond_to do |format|
      if @bullet_post.update(bullet_post_params)
        format.html { redirect_to bullet_post_url(@bullet_post), notice: "Bullet post was successfully updated." }
        format.json { render :show, status: :ok, location: @bullet_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bullet_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bullet_posts/1 or /bullet_posts/1.json
  def destroy
    @bullet_post.destroy

    respond_to do |format|
      format.html { redirect_to bullet_posts_url, notice: "Bullet post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bullet_post
      @bullet_post = BulletPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bullet_post_params
      params.require(:bullet_post).permit(:name)
    end
end
