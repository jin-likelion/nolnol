class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[ :user_name,:user_age,:user_gender,:user_state, :email,:image, :password, :password_confirmation, :remember_me])
  end
end
