class Api::UsersController < Api::BaseController

  before_action :find_user, only: %w[show]

  def show 
    render_jsonapi_response(UserSerializer.new(@user))
  end

  def index
    users = User.all
 
    render_jsonapi_response(UserSerializer.new(users))
  end

  def update

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :email) if params[:user]
  end


  def find_user
    @user = User.find(params[:id])
  end

end