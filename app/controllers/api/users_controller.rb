class Api::UsersController < Api::BaseController
  include JsonApiParamsAdapter
  before_action :find_user, only: %w[show update]

  def show 
    options = {}
    includes = params[:include] || []
    options[:include] = includes.split(',')

    render_jsonapi_response(UserSerializer.new(@user, options))
  end

  def index
    users = User.all
 
    render_jsonapi_response(UserSerializer.new(users))
  end

  def update 
    if @user.update(update_user_params)
      render_jsonapi_response(status: 200)
    else
      render_jsonapi_response(@user.errors)
    end
    
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :email) if params[:user]
  end

  def update_user_params
    params.require(:data).permit(
      :email,
      store_attributes: [
        :id,
        :name,
        :cpf,
        :phone
      ]
    )
  end


  def find_user
    @user = User.find(params[:id])

    raise ActiveRecord::RecordNotFound unless @user 
  end

end