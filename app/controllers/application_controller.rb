class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action do
    resource = params[:controller].classify.underscore.gsub "/", "_"#controller_name.singularize.to_sym
    method = [resource, "_params"].join
    params[resource] &&= send method if respond_to? method, true
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, :alert => exception.message
  end
end
