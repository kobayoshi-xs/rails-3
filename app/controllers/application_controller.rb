class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :image, :profile])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image])
  end

  def after_sign_up_path_for(resource)
    basis_path
  end

  def after_sign_in_path_for(resource)
    basis_path(resource)
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
