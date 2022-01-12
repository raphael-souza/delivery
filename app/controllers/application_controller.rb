class ApplicationController < ActionController::API

  def render_jsonapi_response(resource)
    # if resource.errors && resource.errors.empty?
    #   render jsonapi: resource
    # else
    #   render jsonapi_errors: resource.errors, status: 400
    # end


    return render json: resource
  end

end
