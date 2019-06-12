# frozen_string_literal: true

# app/controllers/users/registrations_controller.rb
module Users
  class RegistrationsController < Devise::RegistrationsController
    protected

    def update_resource(resource, params)
      current_user.update(password: params[:password]) unless params[:password].blank?
      resource.update_without_password(params)
    end

    def after_update_path_for(_resource)
      root_path
    end
  end
end
