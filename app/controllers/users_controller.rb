class UsersController < ApplicationController

  respond_to :json

  # def index
  #   respond_with User.all
  # end

  # def show
  #   respond_with User.find(params[:id])
  # end

  # def new
  #   @user = User.new
  # end

  def create 
    user = User.new(user_params)     
    if user.save
      render json: user, status: :created
    else       
      render json: user.errors.messages , status: :unprocessable_entity
    end
  end

  # private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :email) if params[:user]
  end
end
