class Api::V1::CommentsController < ApplicationController
  before_action :set_api_v1_comment, only: %i[ show update destroy ]

  # GET /api/v1/comments
  # GET /api/v1/comments.json
  def index
    @api_v1_comments = Comment.all
    render json: @api_v1_comments
  end

  # GET /api/v1/comments/1
  # GET /api/v1/comments/1.json
  def show
    render json: @api_v1_comment
  end

  # POST /api/v1/comments
  # POST /api/v1/comments.json
  def create
    @api_v1_comment = Comment.new(description: params[:description], api_v1_post_id: params[:api_v1_post_id])

    if @api_v1_comment.save
      render json: @api_v1_comment, status: :created, location: @api_v1_comment
    else
      render json: @api_v1_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/comments/1
  # PATCH/PUT /api/v1/comments/1.json
  def update
    if @api_v1_comment.update(description: params[:description], api_v1_post_id: params[:api_v1_post_id])
      render json: @api_v1_comment, status: :ok, location: @api_v1_comment
    else
      render json: @api_v1_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/comments/1
  # DELETE /api/v1/comments/1.json
  def destroy
    @api_v1_comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_comment
      @api_v1_comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_comment_params
      params.fetch(:api_v1_comment, {}).permit(:description, :api_v1_post_id)
    end
end
