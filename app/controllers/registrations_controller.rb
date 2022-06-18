class RegistrationsController < Devise::RegistrationsController

  def create
    # build_resource(sign_up_params)
    # resource.save
    # sign_up(resource_name, resource) if resource.persisted?

    # render_jsonapi_response(resource)
     
    user = User.new(user_params)
    if user.save
      render_jsonapi_response(UserSerializer.new(user))
    else
      render_jsonapi_response(user.errors)
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :email) if params[:user]
  end

end