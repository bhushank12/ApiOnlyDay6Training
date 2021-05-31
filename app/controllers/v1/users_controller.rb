class V1::UsersController < ApplicationController
  def index
    @user = User.all
    render json: @user, adaptor: :json
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 200
    else
      render json: { error: "Unable to create user" }, status: 400
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render json: { data: @user }, status: 200
    else
      render json: { error: "User not found" }, status: 400
    end
  end


  private
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name)
    end
end
