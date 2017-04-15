require 'professor_sanitizer'
require 'administrator_sanitizer'
class ApplicationController < ActionController::Base
  layout "unal"

  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end

  protect_from_forgery with: :exception

  before_action :authenticate_someone!
  before_filter :configure_permitted_parameters, if: :devise_controller?

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

  def authenticate_someone!
    authenticate_professor! || authenticate_administrator!
  end

end
