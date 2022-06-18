class SessionsController < Devise::SessionsController
  respond_to :json

  private
  def respond_with(resource, _opts = {})
      render json: resource
  end
 
  def respond_to_on_destroy
    head :ok
  def create 
    super { @token = current_token }
  end

  private

  def current_token
    request.env['warden-jwt_auth.token']
  end

  def respond_with(resource, _opts = {})
    render json: {user: resource, token: @token }
  end

  def respond_to_on_destroy
    head :no_content
  end

end