class ApplicationController < ActionController::API

  def render_jsonapi_response(resource, extra_options = {})
    # if resource.errors && resource.errors.empty?
    #   render jsonapi: resource
    # else
    #   render jsonapi_errors: resource.errors, status: 400
    # end
     
		options = { json: resource }.merge(extra_options)

		return render options
  end

end
