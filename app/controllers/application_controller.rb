class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource

  before_action :devise_permitted_parameters, if: :devise_controller?

  protected

  def layout_by_resource
    devise_controller? ? "auth" : "application"
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || user_adverts_path
  end

  def devise_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:professional, :name,
      :state_id, :address, :phone, :company_description, :terms]
  end

  def authenticate!
    authenticate_or_request_with_http_basic do |username, password|
      username == Figaro.env.admin_user! && password == Figaro.env.admin_password!
    end
  end
end
