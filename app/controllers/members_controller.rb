class MembersController < ApplicationController
  before_action :authenticate_jwt_user!

  def show
    render json: { message: "If you see this, you're in!" }
  end
end
