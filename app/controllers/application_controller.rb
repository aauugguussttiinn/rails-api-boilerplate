class ApplicationController < ActionController::API
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render jsonapi: resource
    else
      render jsonapi_errors: resource.errors, status: 400
    end
  end

  protected

  def configure_permitted_parameters
    attributes = [:email, :user_id]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

end