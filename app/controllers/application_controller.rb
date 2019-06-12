require 'application_responder'

# frozen_string_literal: true

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery
  helper_method :current_user

  before_action :blocked_user

  private

  def blocked_user
    return false if current_user.nil?
    return false unless current_user.blocked?

    sign_out current_user
    redirect_to root_path, flash: { notice: 'Sua conta foi desabilitada.' }
  end

  before_action :configure_devise_params, if: :devise_controller?
  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %I[first_name last_name email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %I[first_name last_name email password])
  end
end
