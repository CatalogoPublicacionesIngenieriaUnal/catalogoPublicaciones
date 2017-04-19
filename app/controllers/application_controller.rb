require 'professor_sanitizer'
require 'administrator_sanitizer'
class ApplicationController < ActionController::Base
  layout "unal"

  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end

  protect_from_forgery with: :exception

  before_action :require_login
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer
  end

  def devise_parameter_sanitizer
    if resource_class == Administrator
      Administrator::ParameterSanitizer.new(Administrator, :administrator, params)
    elsif resource_class == Professor
      Professor::ParameterSanitizer.new(Professor, :professor, params)
    else
      super # Use the default one
    end
  end

  def require_login
    unless (professor_signed_in? || administrator_signed_in?)
      flash[:error] = "You must be logged in to access this section"
      authenticate_professor!
    end
  end


  def authorized?
    unless (current_professor && current_professor.is_authorized)
      flash[:error] = "You must be logged in to access this section"
      redirect_to not_authorized_path
    end
  end



  def after_sign_in_path_for(resource)
    if resource.sign_in_count == 1
      edit_route
    else
      home_route
    end
  end

  def home_route
    if professor_signed_in?
      professor_home_path
    elsif administrator_signed_in?
      administrator_home_path
    else
      root_path
    end
  end

  def edit_route
    if professor_signed_in?
      edit_current_professor_path
    elsif administrator_signed_in?
      administrator_home_path
    else
      root_path
    end
  end

end
