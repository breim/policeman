# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private

  before_action :configure_devise_params, if: :devise_controller?
  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %I[first_name last_name email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %I[first_name last_name email password])
  end
end
