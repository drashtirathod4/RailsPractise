class PostsController < ApplicationController
  def index
    @posts = Post.all()
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    if post.valid?
      redirect_to posts_path
    else 
      flash[:errors] = post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update 
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.valid?
      redirect_to post_path
    else 
      flash[:errors] = @post.errors.full_messages
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private 
  def post_params
    params.require(:post).permit(:title, :user_id)
  end
end