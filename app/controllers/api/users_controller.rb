class Api::UsersController < Api::BaseController

  before_action :find_user, only: %w[show]

  def show
    render_jsonapi_response(@user)
  end

  def create 
    user = User.new(user_params)
    debugger      
    if user.save
      render json: user, status: :created
    else       
      render json: user.errors.messages , status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :email) if params[:user]
  end


  def find_user
    @user = User.find(params[:id])
  end

end